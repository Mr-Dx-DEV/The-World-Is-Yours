class TableDUI {
    constructor(options) {
        this.keys = options.keys || [];
        this.personal_xp = options.additional.personal_xp || false;
        this.table_xp = options.additional?.xp || 0;
        this.table_xp_required = options.additional?.xp_required || 1000;
        this.personal_xp = options.additional?.player_skills?.xp || 0;
        this.personal_xp_required = options.additional?.player_skills?.xp_required || 1000;
        this.table_level = options.additional?.level || 1;
        this.personal_level = options.additional?.player_skills?.level || 1;
        this.drug_type = options.additional?.drug || 'unknown';
        this.build();
    }

    get_severity_colour(severity) {
        const colors = {
            low: 'yellow',
            medium: 'orange',
            high: 'red',
        };
        return colors[severity] || '#ffffff';
    }

    build() {
        const xp_type = this.personal_xp ? 'PERSONAL' : 'PUBLIC';
        const key_hints = this.keys.map(key_obj => 
            `<div class="interaction_key">
                <span class="key"><p>${key_obj.key}</p></span> 
                <span class="key_label">${key_obj.label}</span>
            </div>`
        ).join('');

        const progress_bars = `
            <div class="progress_grid">
                <div class="progress_item"><h3>Public Level: ${this.table_level}</h3>
                    <div class="interact_progress_bar">
                        <div class="interact_progress_bar_fill" style="width: ${(this.table_xp / this.table_xp_required) * 100}%; background-color: blue;">
                            <div class="interact_progress_header">${this.table_xp} / ${this.table_xp_required} XP</div>
                        </div>
                    </div>
                </div>
            </div>`;

        const content = `
            <div class="interact_ui">
                <div class="interact_header">
                    <div class="left_header">
                        <img src="./assets/images/${this.drug_type}_icon.png" alt="${this.drug_type} icon">
                    </div>
                    <div class="right_header">
                        <div class="drug_type">${this.drug_type} <span class="xp_type">${xp_type}</div>
                        <div class="strain_name">PROCESSING</div>
                    </div>
                </div>
                ${progress_bars}
                <div class="keys_container">
                    ${key_hints}
                </div>
            </div>`;

        $('#main_container').html(content);
    }

    update_xp(new_data) {
        this.table_xp = new_data.xp || this.table_xp;
        this.table_xp_required = new_data.xp_required || this.table_xp_required;
        this.table_level = new_data.level || this.table_level;
        this.personal_xp = new_data.player_skills?.xp || this.personal_xp;
        this.personal_xp_required = new_data.player_skills?.xp_required || this.personal_xp_required;
        this.personal_level = new_data.player_skills?.level || this.personal_level;
        this.build();
    }

    update_keys(new_keys) {
        this.keys = new_keys;
        this.build();
    }

    close() {
        $('#main_container').empty();
    }
}

/*
const table_ui = new TableDUI({
    keys: [
        { key: 'E', label: 'Access' },
        { key: 'R', label: 'Move' },
        { key: 'X', label: 'Pick Up' },
        { key: 'X', label: 'Destroy' }
    ],
    additional: {
        drug: 'weed',
        xp: 200,
        xp_required: 1000,
        level: 2,
        personal_xp: true,
        player_skills: {
            level: 1,
            xp: 50,
            xp_required: 100
        }
    }
});

$('body').css({
    'background': 'grey'
});
*/