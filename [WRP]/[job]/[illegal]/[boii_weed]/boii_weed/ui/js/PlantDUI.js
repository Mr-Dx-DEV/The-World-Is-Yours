class PlantDUI {
    constructor(options) {
        this.keys = options.keys || [];
        this.gender = options.additional?.gender || 'f';
        this.drug_type = options.additional?.drug || 'weed';
        this.strain = options.additional?.strain || 'pink_runtz'
        this.growth = options.additional?.growth || 0;
        this.health = options.additional?.health || 0;
        this.food = options.additional?.food || 0;
        this.water = options.additional?.water || 0;
        this.has_pests = options.additional?.has_pests || false;
        this.has_disease = options.additional?.has_disease || false;
        this.pests = options.additional?.pests
            ? Object.entries(options.additional.pests).map(([key, value]) => ({
                id: key,
                label: value.label || key,
                severity: value.severity || 'low', 
            }))
            : [];
        this.diseases = options.additional?.diseases
            ? Object.entries(options.additional.diseases).map(([key, value]) => ({
                id: key,
                label: value.label || key,
                severity: value.severity || 'low',
            }))
            : [];

        this.build();
    }

    get_severity_colour(severity) {
        const colors = {
            low: 'yellow',
            medium: 'orange',
            high: 'red'
        };
        return colors[severity] || '#ffffff';
    }

    build() {
        const plant_gender = this.gender === 'm' ? 'M' : 'F';
        const formatted_strain = this.strain.replace(/_/g, ' ');
        const key_hints = this.keys.map(key_obj => 
            `<div class="interaction_key">
                <span class="key"><p>${key_obj.key}</p></span> 
                <span class="key_label">${key_obj.label}</span>
            </div>`).join('');

        const pests_section = this.has_pests
            ? `<ul class="status_list">
                    ${this.pests.map(p => `
                        <li><i class="fa-solid fa-bug" style="color:${this.get_severity_colour(p.severity)};"></i> ${p.label} - ${p.severity.charAt(0).toUpperCase() + p.severity.slice(1)}</li>
                    `).join('')}
                </ul>`
            : '';
    
        const diseases_section = this.has_disease
            ? `<ul class="status_list">
                    ${this.diseases.map(d => `
                        <li><i class="fa-solid fa-virus" style="color:${this.get_severity_colour(d.severity)};"></i> ${d.label} - ${d.severity.charAt(0).toUpperCase() + d.severity.slice(1)}</li>
                    `).join('')}
                </ul>`
            : '';
    
        const progress_bars = `
            <div class="progress_grid grid">
                <div class="progress_item"><h3>Growth</h3>
                    <div class="interact_progress_bar"><div class="interact_progress_bar_fill" style="width: ${this.growth}%;"><div class="interact_progress_header">${this.growth}%</div></div></div>
                </div>
                <div class="progress_item"><h3>Health</h3>
                    <div class="interact_progress_bar"><div class="interact_progress_bar_fill" style="width: ${this.health}%;"><div class="interact_progress_header">${this.health}%</div></div></div>
                </div>
                <div class="progress_item"><h3>Food</h3>
                    <div class="interact_progress_bar"><div class="interact_progress_bar_fill" style="width: ${this.food}%;"><div class="interact_progress_header">${this.food}%</div></div></div>
                </div>
                <div class="progress_item"><h3>Water</h3>
                    <div class="interact_progress_bar"><div class="interact_progress_bar_fill" style="width: ${this.water}%;"><div class="interact_progress_header">${this.water}%</div></div></div>
                </div>
            </div>`;
    
        const content = `
            <div class="interact_ui">
                <div class="interact_header">
                    <div class="left_header">
                        <img src="./assets/images/${this.drug_type}_icon.png" alt="${this.drug} icon">
                    </div>
                    <div class="right_header">
                        <div class="drug_type">${this.drug_type} <span class="xp_type">${plant_gender}</div>
                        <div class="strain_name">${formatted_strain}</div>
                    </div>
                </div>
                ${progress_bars}
                ${pests_section}
                ${diseases_section}
                <div class="keys_container">
                    ${key_hints}
                </div>
            </div>`;
    
        $('#main_container').html(content);
    }
    
    update_growth(new_growth) {
        this.growth = new_growth;
        this.build();
    }

    update_keys(new_keys) {
        this.keys = new_keys;
        this.build();
    }

    update_status(new_pests, new_diseases) {
        this.pests = new_pests;
        this.has_pests = new_pests.length > 0;
        this.diseases = new_diseases;
        this.has_disease = new_diseases.length > 0;
        this.build();
    }

    close() {
        $('#main_container').empty();
    }
}

/*
const plant_ui = new PlantDUI({
    growth: 10,
    health: 100,
    water: 10,
    food: 10,
    keys: [
        { key: 'Y', label: 'Give Water' },
        { key: 'Y', label: 'Give Water' },
        { key: 'Y', label: 'Give Water' },
        { key: 'Y', label: 'Give Water' },
    ],
    additional: {
        gender: 'm',
        drug: 'weed',
        strain: 'pink_runts',
        has_pests: true,
        has_disease: true,
        pests: {
            aphid: {
                label: 'Aphid',
                severity: 'low'
            }
        },
        diseases: {
            mildew: {
                label: 'Powdery Mildew',
                severity: 'medium'
            }
        }
    }
});

$('body').css({
    'background': 'grey'
})
*/