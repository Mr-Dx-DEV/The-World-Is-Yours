let PROP_PLACER = null;
let TABLE_DUI = null;
let PLANT_DUI = null;
let PROCESSING_UI = null;
let GUIDE = null;

const handlers = {
    open_prop_placer: (data) => {
        if (!PROP_PLACER) {
            PROP_PLACER = new PropPlacer(data);
            PROP_PLACER.build_control_display(data.controls);
        }
    },
    close_prop_placer: () => {
        if (PROP_PLACER) {
            PROP_PLACER = null;
            $('.prop_placer_container').remove();
        }
    },
    update_can_place: (data) => {
        if (PROP_PLACER) {
            PROP_PLACER.update_placement_status(data.can_place)
        }
    },
    show_table_dui: (data) => {
        if (TABLE_DUI) {
            TABLE_DUI.close();
        }
        TABLE_DUI = new TableDUI(data.options);
    },
    close_table_dui: () => {
        if (TABLE_DUI) {
            TABLE_DUI.close();
        }
    },
    show_plant_dui: (data) => {
        if (PLANT_DUI) {
            PLANT_DUI.close();
        }
        PLANT_DUI = new PlantDUI(data.options);
    },
    close_plant_dui: () => {
        if (PLANT_DUI) {
            PLANT_DUI.close();
        }
    },
    open_processing_ui: (data) => {
        if (!PROCESSING_UI) {
            PROCESSING_UI = new ProcessingUI(data);
        }
    },
    open_guide: (data) => {
        if (!GUIDE) {
            GUIDE = new Guide(data);
        }
    }
};

window.addEventListener('message', function (event) {
    const data = event.data;
    const handler = handlers[data.action];
    if (handler) {
        handler(data);
    }
});