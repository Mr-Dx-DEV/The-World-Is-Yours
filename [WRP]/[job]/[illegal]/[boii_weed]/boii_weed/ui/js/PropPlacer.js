class PropPlacer {
    constructor(data) {
        this.controls = Array.isArray(data.controls) ? data.controls : Object.values(data.controls);
        this.build_control_display(this.controls);
    }

    build_control_display(controls) {
        let content = `
            <div class="prop_placer_container">
                <div class="prop_placer_title">
                    Controls 
                    <span id="prop_status"></span>
                </div>
                <div class="prop_placer_controls">
        `;

        controls.forEach(control => {
            content += `
                <div class="prop_placer_control">
                    <span class="control_key">${control.name}</span>
                    <span class="control_label">${control.label}</span>
                </div>
            `;
        });

        content += `</div></div>`;
        $('#main_container').html(content);
    }

    update_placement_status(can_place) {
        const status = $('#prop_status');
        if (can_place) {
            status.text('CAN PLACE').css('color', 'green');
        } else {
            status.text('CANT PLACE').css('color', 'red');
        }
    }
}


/*
const test_prop_placer = new PropPlacer({
    controls: [
        { key: 'Enter', label: 'Confirm', name: 'Enter' },
        { key: 'Backspace', label: 'Cancel', name: 'Backspace' },
        { key: 'W', label: 'Move Forward', name: 'W' },
        { key: 'S', label: 'Move Backward', name: 'S' },
        { key: 'A', label: 'Move Left', name: 'A' },
        { key: 'D', label: 'Move Right', name: 'D' },
        { key: 'Q', label: 'Move Up', name: 'Q' },
        { key: 'E', label: 'Move Down', name: 'E' },
        { key: 'G', label: 'Rotate Left', name: 'G' },
        { key: 'H', label: 'Rotate Right', name: 'H' },
        { key: 'Arrow Up', label: 'Camera Up', name: 'Arrow Up' },
        { key: 'Arrow Down', label: 'Camera Down', name: 'Arrow Down' },
        { key: 'Arrow Left', label: 'Camera Left', name: 'Arrow Left' },
        { key: 'Arrow Right', label: 'Camera Right', name: 'Arrow Right' }
    ]
});

$('body').css({
    'background': 'grey'
});
*/