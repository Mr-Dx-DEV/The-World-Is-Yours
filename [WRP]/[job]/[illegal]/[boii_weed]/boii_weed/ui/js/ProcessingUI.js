class ProcessingUI {
    constructor(data) {
        this.table_id = data.id;
        this.table_data = data.table_data || {};
        this.player_xp = data.player_xp || {};
        this.drug_type = 'weed';
        this.recipes = this.parse_recipes(data.recipes || {});
        this.filtered_recipes = this.recipes;
        this.strains = [...new Set(this.recipes.map(r => r.strain))].sort();
        this.selected_recipe = null;
        this.processing = false;
        this.build();
        this.bind_events();
    }

    bind_events() {
        $(document).off('keyup').on('keyup', (e) => this.handle_exit(e));
        $(document).off('click', '.type_button').on('click', '.type_button', (event) => this.filter_recipes(event.currentTarget.dataset.strain));
        $(document).off('click', '.recipe_item').on('click', '.recipe_item', (event) => this.select_recipe(event.currentTarget.dataset.recipe));
        $(document).off('click', '.craft_button').on('click', '.craft_button', () => this.start_processing());
        if (this.table_data.is_owner) {
            $(document).off('click', '.xp_type i').on('click', '.xp_type i', () => this.toggle_xp_type());
        }
    }

    handle_exit(e) {
        if (e.key === 'Escape') this.close();
    }

    toggle_xp_type() {
        $.post(`https://${GetParentResourceName()}/toggle_xp_type`, JSON.stringify({ table_id: this.table_id }), (response) => {
            if (response.success) {
                const xp_ele = $('.xp_type');
                const is_personal = xp_ele.text().includes('PERSONAL');
                xp_ele.html(`${is_personal ? 'PUBLIC' : 'PERSONAL'} <i class="fa-solid fa-arrows-rotate"></i>`);
            }
        });
    }

    parse_recipes(recipes) {
        let parsed_recipes = [];
        for (const [strain, types] of Object.entries(recipes)) {
            const strain_name = this.format_strain_name(strain);
            for (const [type, recipes] of Object.entries(types)) {
                recipes.forEach(recipe => {
                    parsed_recipes.push({
                        id: recipe.id,
                        strain,
                        type,
                        name: `${strain_name} (${type})`,
                        icon: recipe.returns.image || `${strain}_${type}_return.png`,
                        description: `Processing ${strain_name} into ${type}.`,
                        ingredients: recipe.ingredients.map(ing => ({ 
                            id: ing.id, 
                            name: ing.label || ing.id, 
                            icon: ing.image || `${ing.id}.png`, 
                            amount: ing.amount 
                        })),
                        returns: { 
                            id: recipe.returns.id, 
                            name: recipe.returns.label || recipe.returns.id, 
                            icon: recipe.returns.image || `${recipe.returns.id}.png`, 
                            amount: recipe.returns.amount 
                        },
                        duration: recipe.duration || 5000
                    });
                });
            }
        }
        return parsed_recipes.sort((a, b) => a.name.localeCompare(b.name));
    }
    

    format_strain_name(strain) {
        return strain.split('_').map(word => word.charAt(0).toUpperCase() + word.slice(1)).join(' ');
    }

    build() {
        const strain_buttons = this.strains.map(strain => `<button class="type_button" data-strain="${strain}">${this.format_strain_name(strain)}</button>`).join('');
        const xp_type = this.table_data.personal_xp ? 'PERSONAL' : 'PUBLIC';
        const content = `
            <div class="processing_ui">
                <div class="left_panel">
                    <div class="interact_header">
                        <div class="left_header">
                            <img src="./assets/images/${this.drug_type}_icon.png" alt="icon">
                        </div>
                        <div class="right_header">
                            <div class="drug_type">${this.drug_type} <span class="xp_type">${xp_type} ${this.table_data.is_owner ? '<i class="fa-solid fa-arrows-rotate"></i>' : ''}</span></div>
                            <div class="strain_name">PROCESSING <span class="return_amount"></span></div>
                        </div>
                    </div>
                    <div class="recipe_type_bar">${strain_buttons}</div>
                    <div class="recipe_list"></div>
                </div>
                <div class="right_panel" style="display: none;">
                    <div class="recipe_details">
                        <div class="interact_header">
                            <div class="left_header">
                                <img src="./assets/images/${this.drug_type}_icon.png" alt="icon">
                            </div>
                            <div class="right_header">
                                <div class="drug_type">${this.drug_type}</div>
                                <div class="strain_name">PROCESSING <span class="return_amount"></span></div>
                            </div>
                        </div>
                        <div class="recipe_cost"></div>
                        <div class="recipe_returns"></div>
                    </div>
                    <button class="craft_button">CRAFT</button>
                </div>
            </div>
        `;

        $('#main_container').html(content);
        this.update_recipe_list();
    }

    update_recipe_list() {
        const recipe_buttons = this.filtered_recipes.map(recipe =>
            `<div class="recipe_item" data-recipe="${recipe.id}">
                <img src="./assets/images/items/${recipe.icon}" class="recipe_icon">
                <span class="recipe_name">${recipe.name}</span>
            </div>`
        ).join('');
        $('.recipe_list').html(recipe_buttons);
    }

    filter_recipes(strain) {
        this.filtered_recipes = this.recipes.filter(recipe => recipe.strain === strain).sort((a, b) => a.name.localeCompare(b.name));
        this.update_recipe_list();
    }

    select_recipe(recipe_id) {
        const recipe = this.recipes.find(r => r.id === recipe_id);
        if (!recipe) return;
        const strain_name = this.format_strain_name(recipe.strain);
        const drug_type = recipe.type.toUpperCase();
        const return_image = recipe.icon || 'default.png';
        $('.right_panel .left_header img').attr('src', `./assets/images/items/${return_image}`);
        $('.right_panel .right_header .drug_type').text(drug_type);
        $('.right_panel .right_header .strain_name').html(`${strain_name} <span class="return_amount">x${recipe.returns.amount}</span>`);
        this.selected_recipe = recipe;
        $('.recipe_cost').html(`
            <p>Ingredients:</p>
            <div class="cost_items">
                ${recipe.ingredients.map(ing =>
                    `<div class="cost_item">
                        <img src="./assets/images/items/${ing.icon || 'default.png'}" class="cost_icon">
                        <div class="strain_name">${ing.name} <span class="return_amount">x${ing.amount}</span></div>
                    </div>`
                ).join('')}
            </div>
        `);
        $('.craft_button').prop('disabled', false);
        $('.right_panel').show();
    }

    start_processing() {
        if (!this.selected_recipe || this.processing) return;
        this.processing = true;
        $('.craft_button').prop('disabled', true).text('PROCESSING...');
        $('.recipe_item, .type_button').prop('disabled', true);
        console.log("started processing")
        $.post(`https://${GetParentResourceName()}/start_processing`, JSON.stringify({ 
            strain: this.selected_recipe.strain, 
            recipe_id: this.selected_recipe.id, 
            table_id: this.table_id 
        }), (response) => {
            if (response.success) {
                this.start_countdown(this.selected_recipe.duration);
            } else {
                this.processing = false; 
                this.reset_ui();
            }
        });
    }
    

    start_countdown(duration) {
        let remaining_time = duration / 1000;
        $('.craft_button').text(`REMAINING: ${remaining_time}s`);

        const interval = setInterval(() => {
            remaining_time--;
            $('.craft_button').text(`REMAINING: ${remaining_time}s`);

            if (remaining_time <= 0) {
                clearInterval(interval);
                this.finish_processing();
            }
        }, 1000);
    }

    finish_processing() {
        this.processing = false; // Allow new processing actions
        $('.craft_button').prop('disabled', false).text('CRAFT');
        $('.recipe_item, .type_button').prop('disabled', false);
    }

    reset_ui() {
        this.processing = false;
        $('.craft_button').prop('disabled', false).text('CRAFT');
        $('.recipe_item, .type_button').prop('disabled', false);
    }

    close() {
        $('#main_container').empty();
        PROCESSING_UI = null;
        $.post(`https://${GetParentResourceName()}/remove_ui_focus`, JSON.stringify({ table_id: this.table_id }));
    }
}

/*
const test_data = {
    table_data: {
        is_owner: true,
        personal_xp: true
    },
    recipes: {
        "pink_runtz": {
            "trimmed": [
                {
                    id: 'pink_runtz_trimmed_1',
                    duration: 5000,
                    ingredients: [
                        { id: 'trimming_shears', label: 'Trimming Shears', amount: 1, image: 'trimming_shears.png' },
                        { id: 'pink_runtz_untrimmed', label: 'Pink Runtz (Untrimmed)', amount: 10, image: 'pink_runtz_untrimmed.png' }
                    ],
                    returns: { id: 'pink_runtz_trimmed', label: 'Pink Runtz (Trimmed)', amount: 7, image: 'pink_runtz_trimmed.png' }
                }
            ],
            "ounce": [
                {
                    id: 'pink_runtz_ounce_1',
                    duration: 5000,
                    ingredients: [
                        { id: 'pink_runtz_trimmed', label: 'Pink Runtz (Trimmed)', amount: 28, image: 'pink_runtz_trimmed.png' },
                        { id: 'large_resealable_bag', label: 'Resealable Bag (Large)', amount: 1, image: 'large_resealable_bag.png' }
                    ],
                    returns: { id: 'pink_runtz_ounce', label: 'Pink Runtz (Ounce)', amount: 1, image: 'pink_runtz_ounce.png' }
                }
            ]
        },
        "lemon_skunk": {
            "joint": [
                {
                    id: 'lemon_skunk_joint_1',
                    duration: 5000,
                    ingredients: [
                        { id: 'lemon_skunk_trimmed', label: 'Lemon Skunk (Trimmed)', amount: 1, image: 'lemon_skunk_trimmed.png' },
                        { id: 'rolling_paper', label: 'Rolling Paper', amount: 1, image: 'rolling_paper.png' }
                    ],
                    returns: { id: 'lemon_skunk_joint', label: 'Lemon Skunk (Joint)', amount: 1, image: 'joint.png' }
                }
            ]
        },
        "zkittlez": {
            "joint": [
                {
                    id: 'lemon_skunk_joint_1',
                    duration: 5000,
                    ingredients: [
                        { id: 'lemon_skunk_trimmed', label: 'Lemon Skunk (Trimmed)', amount: 1, image: 'lemon_skunk_trimmed.png' },
                        { id: 'rolling_paper', label: 'Rolling Paper', amount: 1, image: 'rolling_paper.png' }
                    ],
                    returns: { id: 'lemon_skunk_joint', label: 'Lemon Skunk (Joint)', amount: 1, image: 'joint.png' }
                }
            ]
        },
        "white_widow": {
            "joint": [
                {
                    id: 'lemon_skunk_joint_1',
                    duration: 5000,
                    ingredients: [
                        { id: 'lemon_skunk_trimmed', label: 'Lemon Skunk (Trimmed)', amount: 1, image: 'lemon_skunk_trimmed.png' },
                        { id: 'rolling_paper', label: 'Rolling Paper', amount: 1, image: 'rolling_paper.png' }
                    ],
                    returns: { id: 'lemon_skunk_joint', label: 'Lemon Skunk (Joint)', amount: 1, image: 'joint.png' }
                },
                {
                    id: 'lemon_skunk_joint_3',
                    duration: 5000,
                    ingredients: [
                        { id: 'lemon_skunk_trimmed', label: 'Lemon Skunk (Trimmed)', amount: 1, image: 'lemon_skunk_trimmed.png' },
                        { id: 'rolling_paper', label: 'Rolling Paper', amount: 1, image: 'rolling_paper.png' }
                    ],
                    returns: { id: 'lemon_skunk_joint', label: 'Lemon Skunk (Joint)', amount: 1, image: 'joint.png' }
                },
                {
                    id: 'lemon_skunk_joint_3',
                    duration: 5000,
                    ingredients: [
                        { id: 'lemon_skunk_trimmed', label: 'Lemon Skunk (Trimmed)', amount: 1, image: 'lemon_skunk_trimmed.png' },
                        { id: 'rolling_paper', label: 'Rolling Paper', amount: 1, image: 'rolling_paper.png' }
                    ],
                    returns: { id: 'lemon_skunk_joint', label: 'Lemon Skunk (Joint)', amount: 1, image: 'joint.png' }
                },
                {
                    id: 'lemon_skunk_joint_3',
                    duration: 5000,
                    ingredients: [
                        { id: 'lemon_skunk_trimmed', label: 'Lemon Skunk (Trimmed)', amount: 1, image: 'lemon_skunk_trimmed.png' },
                        { id: 'rolling_paper', label: 'Rolling Paper', amount: 1, image: 'rolling_paper.png' }
                    ],
                    returns: { id: 'lemon_skunk_joint', label: 'Lemon Skunk (Joint)', amount: 1, image: 'joint.png' }
                },
                {
                    id: 'lemon_skunk_joint_3',
                    duration: 5000,
                    ingredients: [
                        { id: 'lemon_skunk_trimmed', label: 'Lemon Skunk (Trimmed)', amount: 1, image: 'lemon_skunk_trimmed.png' },
                        { id: 'rolling_paper', label: 'Rolling Paper', amount: 1, image: 'rolling_paper.png' }
                    ],
                    returns: { id: 'lemon_skunk_joint', label: 'Lemon Skunk (Joint)', amount: 1, image: 'joint.png' }
                }
            ]
        }
    }
};

const processing_ui = new ProcessingUI(test_data);

$('body').css({
    'background': 'grey'
});
*/