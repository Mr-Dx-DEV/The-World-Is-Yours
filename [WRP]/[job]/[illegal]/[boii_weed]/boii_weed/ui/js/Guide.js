class Guide {
    constructor(data) {
        this.main_container = $('#main_container');
        this.growing_skills = Object.values(data.growing_skills || {});
        this.processing_skills = data.processing_skills || {};
        this.build();
        this.pages = document.getElementsByClassName('page');
        this.init();
        this.bind_events();
    }

    bind_events() {
        $(document).off('keyup').on('keyup', (e) => this.handle_exit(e));
    }

    handle_exit(e) {
        if (e.key === 'Escape') this.close();
    }

    build() {
        const content = `
            <div class="book">
                <div id="pages" class="pages">
                    <div id="front_cover" class="page cover"></div>
                    ${this.generate_planting_page()}
                    ${this.generate_table_page()}
                    ${this.generate_growing_skills_page()}
                    ${this.generate_processing_skills_page()}
                    <div id="rear_cover" class="page cover"></div>
                </div>
            </div>
        `;
        this.main_container.html(content);
    }

    close() {
        $('#main_container').empty();
        GUIDE = null;
        $.post(`https://${GetParentResourceName()}/remove_ui_focus`, JSON.stringify({}));
    }
    
    generate_table_page() {
        const content = [
            "Processing tables allow players to refine raw weed into sellable products.",
            "Tables can placed on the ground, once placed they are ready to be used.",
            "They can also be picked up and moved at any time to relocate operations.",
            "Processors can use tables to trim weed and process it into:",
            "- Joints 🚬",
            "- Bagged weed 🎒",
            "- Ounces for large-scale sales 📦",
            "Every action at the table earns XP, increasing efficiency and yield over time.",
            "Tables have <strong>two XP systems:</strong>",
            "- <strong>Personal XP:</strong> The table uses your XP level for processing results.",
            "- <strong>Public XP:</strong> If enabled by the owner, the table uses its own XP level instead.",
            "Public XP allows groups and gangs to share high-level tables, increasing production for everyone.",
            "🚨 <strong>Police Alert:</strong> If law enforcement finds a table, they can <strong>destroy it permanently!</strong>",
            "- <strong>Destroyed tables lose all XP and progress forever.</strong>"
        ];
        
        return `
            <div class="page">
                <h2>Processing Tables</h2>
                ${content.map(msg => `<p>${msg}</p>`).join('')}
            </div>
        `;
    }
    

    generate_planting_page() {
        const content = [
            "Planting requires the right conditions to grow strong and healthy plants.",
            "Before planting, consider the environment around you:",
            "- Different soils impact growth speed and quality 🌱",
            "- Altitude affects strain resistance 🏔️",
            "- Weather conditions can make or break your harvest 🌦️",
            "Once planted, your plants need attention:",
            "- Keep an eye on water and nutrients 💧",
            "- Watch for pests and diseases 🦠🐛",
            "- Some strains may require extra care than others ⚠️",
            "Males and females have different roles:",
            "- <strong>Male plants</strong> produce seeds, with a chance of yielding <strong>female seeds</strong> 🌿",
            "- <strong>Female plants</strong> produce sweet juicy buds.",
            "⚠️ <strong>Warning:</strong> If males are too close to females, pollination can occur!",
            "- This will turn female plants into seed-producing plants instead of bud producers.",
            "🚨 <strong>Police Alert:</strong> If law enforcement finds your crop, they can burn and destroy it!",
            "- Keep your grows hidden and avoid attracting unwanted attention.",
            "",
            "The best growers learn through experience. Keep growing!"
        ];
    
        return `
            <div class="page">
                <h2>Planting & Growing</h2>
                ${content.map(msg => `<p>${msg}</p>`).join('')}
            </div>
        `;
    }    

    generate_growing_skills_page() {
        const content = [
            "Each strain has its own experience level, allowing you to become more efficient at growing specific strains over time.",
            "The more you cultivate a strain, the more experience you gain, leading to:",
            "- Better yields 🌿",
            "- Faster growth ⏳",
            "- Increased resistance to environmental factors 🌦️",
            "Every action—watering, feeding, and harvesting—contributes to your overall skill progression.",
            "As your level increases, plants become easier to manage, and high-level growers can achieve superior results."
        ];
    
        return `
            <div class="page">
                <h2>Growing Skills</h2>
                ${content.map(msg => `<p>${msg}</p>`).join('')}
                <div class="skills_container">
                    <div class="player_skills">
                        ${this.generate_growing_skill_cards()}
                    </div>
                </div>
            </div>
        `;
    }    

    generate_processing_skills_page() {
        const content = [
            "Processing tables let players refine raw plants into usable products while gaining XP.",
            "Higher XP leads to:",
            "- Increased yield from recipes 📈",
            "- Faster processing speeds ⏳",
            "- More efficient ingredient use 🛠️",
            "Each drug type has its own XP, allowing players to specialize in different production methods.",
            "Tables have two XP modes: Personal and Public, switchable by the owner.",
            "Every action boosts both your personal XP and the XP of the table you're using.",  
            "Personal XP:",
            "- The table’s output is based on your individual experience.",
            "Public XP:",
            "- The table’s XP determines yields, meaning lower-level players can benefit from a high-level table."
        ];
        
    
        return `
            <div class="page">
                <h2>Processing Skills</h2>
                ${content.map(msg => `<p>${msg}</p>`).join('')}
                <div class="skills_container">
                    <div class="player_skills">
                        ${this.generate_processing_skill_card()}
                    </div>
                </div>
            </div>
        `;
    }

    format_strain_name(strain) {
        return strain.split('_').map(word => word.charAt(0).toUpperCase() + word.slice(1)).join(' ');
    }

    generate_growing_skill_cards() {
        return this.growing_skills.map(skill => `
            <div class="skill_card">
                <div class="skill_left">
                    <img src="./assets/images/guide/${skill.strain}_logo.png" class="strain_image" alt="${this.format_strain_name(skill.strain)}">
                </div>

                <div class="skill_middle">
                    <h3><img src="./assets/images/weed_icon.png" class="strain_image" alt="${this.format_strain_name(skill.strain)}">${this.format_strain_name(skill.strain)}</h3>
                    <div class="xp_bar_container">
                        <div class="xp_bar" style="width: ${(skill.xp / skill.xp_required) * 100}%"></div>
                    </div>
                    <p class="xp_text">Level ${skill.level}: <span>${skill.xp} / ${skill.xp_required} XP</span></p>
                </div>

                <div class="skill_right">
                    <div class="resistance_row top_row">
                        ${this.create_resistance_level(`<i class="fa-solid fa-person-hiking"></i>`, skill.altitude_resistance)}
                        ${this.create_resistance_level(`<i class="fa-solid fa-virus"></i>`, skill.disease_resistance)}
                    </div>
                    <div class="resistance_row bottom_row">
                        ${this.create_resistance_level(`<i class="fa-solid fa-bug"></i>`, skill.pest_resistance)}
                        ${this.create_resistance_level(`<i class="fa-solid fa-seedling"></i>`, skill.soil_resistance)}
                        ${this.create_resistance_level(`<i class="fa-solid fa-sun"></i>`, skill.weather_resistance)}
                    </div>
                </div>
            </div>
        `).join('');
    }

    generate_processing_skill_card() {
        const skill = this.processing_skills;
        return `
            <div class="skill_card">
                <div class="skill_left">
                    <img src="./assets/images/items/weed_processing_table.png" class="strain_image">
                </div>
    
                <div class="skill_middle">
                    <h3><img src="./assets/images/guide/weed_icon.png" class="strain_image">WEED</h3>
                    <div class="xp_bar_container">
                        <div class="xp_bar" style="width: ${(skill.xp / skill.xp_required) * 100}%"></div>
                    </div>
                    <p class="xp_text">Level ${skill.level}: <span>${skill.xp} / ${skill.xp_required} XP</span></p>
                </div>
            </div>
        `;
    }
    

    create_resistance_level(label, value) {
        return `
            <div class="resistance_level">${value}${label}</div>
        `;
    }

    init() {
        this.setup_pages();
    }

    setup_pages() {
        for (let i = 0; i < this.pages.length; i++) {
            let page = this.pages[i];
            page.page_num = i + 1;
            if (i % 2 === 0) {
                page.style.zIndex = (this.pages.length - i);
            }
            page.addEventListener('click', () => this.flip_page(page));
        }
    }

    flip_page(page) {
        if (page.page_num % 2 === 0) {
            page.classList.remove('flipped');
            page.previousElementSibling.classList.remove('flipped');
        } else {
            page.classList.add('flipped');
            if (page.nextElementSibling) {
                page.nextElementSibling.classList.add('flipped');
            }
        }
    }
}

/*
const test_data = {
    growing_skills: [
        { strain: 'pink_runtz', level: 7, xp: 2224, xp_required: 7843, altitude_resistance: 4, disease_resistance: 3, pest_resistance: 3, soil_resistance: 4, weather_resistance: 1 },
        { strain: 'blue_dream', level: 3, xp: 1129, xp_required: 9395, altitude_resistance: 1, disease_resistance: 4, pest_resistance: 3, soil_resistance: 4, weather_resistance: 5 },
        { strain: 'melonade', level: 2, xp: 1661, xp_required: 7268, altitude_resistance: 2, disease_resistance: 3, pest_resistance: 4, soil_resistance: 1, weather_resistance: 5 },
        { strain: 'gelato', level: 1, xp: 1818, xp_required: 7556, altitude_resistance: 2, disease_resistance: 5, pest_resistance: 3, soil_resistance: 2, weather_resistance: 1 },
        { strain: 'zkittlez', level: 2, xp: 3169, xp_required: 6288, altitude_resistance: 4, disease_resistance: 4, pest_resistance: 2, soil_resistance: 4, weather_resistance: 3 }
    ],
    processing_skills: { drug: 'weed', level: 3, xp: 1500, xp_required: 3000 }
}

const guide = new Guide(test_data);
*/