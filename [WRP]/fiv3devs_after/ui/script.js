let currentPage = 1;
let activeStates = {
    plantsActive: false,
    pianoActive: false,
    flowersActive: false,
    drinksActive: false,
    candlesActive: false,
    screensActive: false,
    coffin1Active: false,
    coffinEcoActive: false,
    coffin2Active: false,
    coffin3Active: false,
    coffin4Active: false,
    coffin5Active: false,
    coffin6Active: false,
    coffin7Active: false,
    coffin8Active: false,
    urn1Active: false,
    urn2Active: false, 
    urn3Active: false, 
};

let locales = {}; // This will store the localized strings

const tabletImage = document.getElementById('tabletImage');
const buttons = {};

// Update button data to use label keys
const firstPageButtons = [
    { id: 'plantsButton', labelKey: 'button_plants', activeVar: 'plantsActive', prop: 'plants' },
    { id: 'pianoButton', labelKey: 'button_piano', activeVar: 'pianoActive', prop: 'piano' },
    { id: 'flowersButton', labelKey: 'button_flowers', activeVar: 'flowersActive', prop: 'flowers' },
    { id: 'drinksButton', labelKey: 'button_drinks', activeVar: 'drinksActive', prop: 'drinks' },
    { id: 'candlesButton', labelKey: 'button_candles', activeVar: 'candlesActive', prop: 'candles' },
    { id: 'screensButton', labelKey: 'button_screens', activeVar: 'screensActive', prop: 'tv' },
    { id: 'actionButton', labelKey: 'button_coffins', activeVar: null, prop: null }, // Coffin page navigation
    { id: 'urnButton', labelKey: 'button_urns', activeVar: null, prop: null },
];

const secondPageButtons = [
    { id: 'secondActionButton', labelKey: 'button_coffin_white', activeVar: 'coffin1Active', prop: 'coffin1' },
    { id: 'coffinEcoButton', labelKey: 'button_eco_friendly', activeVar: 'coffinEcoActive', prop: 'ecocoffin' },
    { id: 'coffin2Button', labelKey: 'button_coffin_black', activeVar: 'coffin2Active', prop: 'coffin2' },
    { id: 'coffin3Button', labelKey: 'button_coffin_gold', activeVar: 'coffin3Active', prop: 'coffin3' },
    { id: 'coffin4Button', labelKey: 'button_coffin_silver', activeVar: 'coffin4Active', prop: 'coffin4' },
    { id: 'coffin5Button', labelKey: 'button_coffin_white', activeVar: 'coffin5Active', prop: 'coffin5' },
    { id: 'coffin6Button', labelKey: 'button_coffin_black', activeVar: 'coffin6Active', prop: 'coffin6' },
    { id: 'coffin7Button', labelKey: 'button_coffin_wood', activeVar: 'coffin7Active', prop: 'coffin7' },
    { id: 'coffin8Button', labelKey: 'button_coffin_open', activeVar: 'coffin8Active', prop: 'coffin8' },
];

const thirdPageButtons = [
    { id: 'urn1Button', labelKey: 'button_urn1', activeVar: 'urn1Active', prop: 'urn1' },
    { id: 'urn2Button', labelKey: 'button_urn2', activeVar: 'urn2Active', prop: 'urn2' },
    { id: 'urn3Button', labelKey: 'button_urn3', activeVar: 'urn3Active', prop: 'urn3' },
];

// Get existing buttons
firstPageButtons.forEach(btnData => {
    buttons[btnData.id] = document.getElementById(btnData.id);
});

// Create second and third page buttons dynamically
function createButton(id, parent) {
    const btn = document.createElement('button');
    btn.id = id;
    btn.style.display = 'none';
    parent.appendChild(btn);
    return btn;
}

secondPageButtons.forEach(btnData => {
    buttons[btnData.id] = createButton(btnData.id, document.getElementById('tablet'));
});

thirdPageButtons.forEach(btnData => {
    buttons[btnData.id] = createButton(btnData.id, document.getElementById('tablet'));
});

// Get new buttons
buttons['closeButton'] = document.getElementById('closeButton');
buttons['backButton'] = document.getElementById('backButton');

// Event listeners for first page buttons
firstPageButtons.forEach(btnData => {
    const btn = buttons[btnData.id];
    if (btnData.id === 'actionButton') {
        // Navigation to coffin page
        btn.addEventListener('click', function () {
            tabletImage.src = 'tablet2d.png';
            showImage1Buttons(false);
            showSecondPageButtons();
            buttons['closeButton'].style.display = 'none'; // Hide close button
            buttons['backButton'].style.display = 'block'; // Show back button
            currentPage = 2;
            updateButtonState();
        });
    } else if (btnData.id === 'urnButton') {
        // Navigation to urn page
        btn.addEventListener('click', function () {
            tabletImage.src = 'tablet3d.png';
            showImage1Buttons(false);
            showThirdPageButtons();
            buttons['closeButton'].style.display = 'none'; // Hide close button
            buttons['backButton'].style.display = 'block'; // Show back button
            currentPage = 3;
            updateButtonState();
        });
    } else {
        btn.addEventListener('click', function () {
            activeStates[btnData.activeVar] = !activeStates[btnData.activeVar];
            toggleInterior(btnData.prop, activeStates[btnData.activeVar]);
            updateButtonState();
        });
    }
});

// Event listeners for second and third page buttons
secondPageButtons.forEach(btnData => {
    const btn = buttons[btnData.id];
    btn.addEventListener('click', function () {
        activeStates[btnData.activeVar] = !activeStates[btnData.activeVar];
        toggleInterior(btnData.prop, activeStates[btnData.activeVar]);
        updateButtonState();
    });
});

thirdPageButtons.forEach(btnData => {
    const btn = buttons[btnData.id];
    btn.addEventListener('click', function () {
        activeStates[btnData.activeVar] = !activeStates[btnData.activeVar];
        toggleInterior(btnData.prop, activeStates[btnData.activeVar]);
        updateButtonState();
    });
});

// Event listener for closeButton
buttons['closeButton'].addEventListener('click', function () {
    // Close the UI
    fetch(`https://${GetParentResourceName()}/closeTablet`, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
        },
        body: JSON.stringify({}),
    });
});

// Event listener for backButton
buttons['backButton'].addEventListener('click', function () {
    // Navigate back to the first page
    tabletImage.src = 'tablet1d.png';
    showImage1Buttons(true);
    hideSecondPageButtons();
    hideThirdPageButtons();
    buttons['backButton'].style.display = 'none'; // Hide back button
    buttons['closeButton'].style.display = 'block'; // Show close button
    currentPage = 1;
    updateButtonState();
});

// Function to update button states
function updateButtonState() {
    // Update first page buttons
    firstPageButtons.forEach(btnData => {
        const btn = buttons[btnData.id];
        if (btnData.activeVar) {
            btn.classList.toggle('active', activeStates[btnData.activeVar]);
        }
    });
    // Update second page buttons if on page 2
    if (currentPage === 2) {
        secondPageButtons.forEach(btnData => {
            const btn = buttons[btnData.id];
            btn.classList.toggle('active', activeStates[btnData.activeVar]);
        });
    }
    // Update third page buttons if on page 3
    if (currentPage === 3) {
        thirdPageButtons.forEach(btnData => {
            const btn = buttons[btnData.id];
            btn.classList.toggle('active', activeStates[btnData.activeVar]);
        });
    }
}

// Show/hide first page buttons
function showImage1Buttons(visible) {
    const displayValue = visible ? 'block' : 'none';
    firstPageButtons.forEach(btnData => {
        buttons[btnData.id].style.display = displayValue;
    });
    buttons['closeButton'].style.display = visible ? 'block' : 'none'; // Show/hide close button
}

// Show/hide second page buttons
function showSecondPageButtons() {
    secondPageButtons.forEach(btnData => {
        buttons[btnData.id].style.display = 'block';
    });
    buttons['backButton'].style.display = 'block'; // Show back button
}

function hideSecondPageButtons() {
    secondPageButtons.forEach(btnData => {
        buttons[btnData.id].style.display = 'none';
    });
}

// Show/hide third page buttons
function showThirdPageButtons() {
    thirdPageButtons.forEach(btnData => {
        buttons[btnData.id].style.display = 'block';
    });
    buttons['backButton'].style.display = 'block'; // Show back button
}

function hideThirdPageButtons() {
    thirdPageButtons.forEach(btnData => {
        buttons[btnData.id].style.display = 'none';
    });
}

// Event listener for Escape key
document.addEventListener('keydown', function (event) {
    if (event.key === 'Escape') {
        if (currentPage !== 1) {
            // Navigate back to the first page
            tabletImage.src = 'tablet1d.png';
            showImage1Buttons(true);
            hideSecondPageButtons();
            hideThirdPageButtons();
            buttons['backButton'].style.display = 'none'; // Hide back button
            buttons['closeButton'].style.display = 'block'; // Show close button
            currentPage = 1;
            updateButtonState();
        } else {
            // Close the UI
            fetch(`https://${GetParentResourceName()}/closeTablet`, {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify({}),
            });
        }
    }
});

function toggleInterior(prop, isActive) {
    fetch(`https://${GetParentResourceName()}/toggleInterior`, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
        },
        body: JSON.stringify({ prop: prop, isActive: isActive }),
    });
}

// Function to update button labels based on locales
function updateButtonLabels() {
    firstPageButtons.forEach(btnData => {
        const btn = buttons[btnData.id];
        if (btnData.labelKey) {
            btn.innerHTML = locales[btnData.labelKey] || btnData.labelKey;
        }
    });

    secondPageButtons.forEach(btnData => {
        const btn = buttons[btnData.id];
        btn.innerHTML = locales[btnData.labelKey] || btnData.labelKey;
    });

    thirdPageButtons.forEach(btnData => {
        const btn = buttons[btnData.id];
        btn.innerHTML = locales[btnData.labelKey] || btnData.labelKey;
    });

    // Set labels for new buttons
    buttons['closeButton'].innerHTML = locales['button_close'] || 'Close';
    buttons['backButton'].innerHTML = locales['button_back'] || 'Back';
}

// Receive messages from client.lua
window.addEventListener('message', function (event) {
    let data = event.data;
    if (data.type === 'toggleTablet') {
        if (data.display) {
            document.body.style.display = 'flex';
            currentPage = 1;
            tabletImage.src = 'tablet1d.png';
            showImage1Buttons(true);
            hideSecondPageButtons();
            hideThirdPageButtons();
            buttons['backButton'].style.display = 'none'; // Ensure back button is hidden
            buttons['closeButton'].style.display = 'block'; // Show close button
            // Update activeStates with data from client.lua
            if (data.activeStates) {
                activeStates = data.activeStates;
            } else {
                // Initialize activeStates if not provided
                for (let key in activeStates) {
                    activeStates[key] = false;
                }
            }
            if (data.locales) {
                locales = data.locales;
            }
            updateButtonLabels();
            updateButtonState();
        } else {
            document.body.style.display = 'none';
            buttons['backButton'].style.display = 'none';
            buttons['closeButton'].style.display = 'none';
        }
    } else if (data.type === 'updateActiveStates') {
        // Aggiorna activeStates e aggiorna lo stato dei pulsanti
        activeStates = data.activeStates;
        updateButtonState();
    }
});
