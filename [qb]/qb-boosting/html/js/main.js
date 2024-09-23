// --------------- UI ------------------- //

let xp = 0;
let tier = "D";
let balance = 0;
let nickname = "";
let balanceType = "crypto";
let Tiers = []

let queueCooldown = false;
let contractCooldown = false;
let declineCooldown = false;
let canCancel = true;

let completionTime = 0;
let cooldownLength = 0;

let formattedTypes = {["crypto"]: "QBit(s)", ["cash"]: "$", ["bank"]: "$", ["renewed"]: "Crypto"};
let currentTab = "dashboard";
let currentObjective = "";

let messages = [];
let sender = "";
let subject = "";

function createContractCard(id, type, letter, name, car, plate, buyInCost, creationTime, active, tracker) {
    const card = document.createElement('div');
    card.className = 'contract-card';
    card.id = id;

    let formattedHoursLeft = formatRemainingTime(creationTime);

    setInterval(function(){
        formattedHoursLeft = formatRemainingTime(creationTime);
        card.querySelector(".expiration").innerHTML = `Expires In: ${formattedHoursLeft}`;
    }, 10000);

    card.innerHTML = `
    <div class="letter-circle">${letter}</div>
    <div class="details">
        <div class="card-header">${type} Contract</div>
        <div class="details-row">
            <p class="name"><strong>Name:</strong> ${name}</p>
            <p><strong>Buy In:</strong> ${buyInCost}</p>
        </div>
        <div class="details-row">
            <p class="car"><strong>Car:</strong> ${car}</p>
            <p class="expiration"><strong>Expires In:</strong> ${formattedHoursLeft}</p>
        </div>
        <div class="details-row">
            <p class="plate"><strong>Plate:</strong> ${plate}</p>
        </div>
    </div>
    <div class="actions">
        <button class="start-button" onclick="startContract(this.closest('.contract-card'), ${id})">Start Contract</button>
        <button class="decline-button" onclick="declineContract(this.closest('.contract-card'), ${id})">Decline Contract</button>
    </div>
    `;

    const cardsContainer = document.querySelector('.contracts-list');
    cardsContainer.appendChild(card);
}

function removeContractCard(id){
    const card = document.getElementById(id);
    if(card){
        card.remove();
    }
}

function startContract(card, id) {
    if (!contractCooldown) {
        $.post(`https://${GetParentResourceName()}/accept`, id.toString(), function(response) {
            if (response == "ok") {
                card.classList.add('in-progress');
                showNotification("Contract Accepted");
                const startButton = card.querySelector('.start-button');
                startButton.textContent = 'In Progress';
                startButton.disabled = true;
                startButton.classList.add('disabled');
                const declineButton = card.querySelector('.decline-button');
                declineButton.textContent = 'Cancel Contract'
                declineButton.onclick = () => cancelContract(card, id.toString());

                // Move the card to the top of the list
                const cardsContainer = document.querySelector('.contracts-list');
                cardsContainer.prepend(card);

                // Add a special class to indicate it's the accepted contract
                card.classList.add('accepted-contract');

                // Update the current contract details in the dashboard
                updateCurrentContract(card);
                const cancelButton = document.querySelector('.cancel-button');
                cancelButton.textContent = 'Cancel Contract'
                cancelButton.onclick = () => cancelContract(card, id.toString());

                canCancel = false;
            } else if (response == "error.inprogress") {
                showNotification("Contract Already In Progress");
            } else if (response == "error.cost") {
                showNotification("Not Enough QBits");
            } else if (response == "error.nocops") {
                showNotification("Not Enough Police");
            } else {
                showNotification("Error, Try Again");
            }
        });
    } else {
        showNotification("Contracts on Cooldown");
    }
}

function declineContract(card, id) {
    if(!declineCooldown){
        card.remove();
        showNotification("Contract Declined");
        $.post(`https://${GetParentResourceName()}/decline`, id.toString())
        setCooldown("decline", 3000)
    } else{
        showNotification("Please wait before trying again");
    }
}

function cancelContract(card, id) {
    if(canCancel){
        card.remove();
        showNotification("Contract Cancelled");
        $.post(`https://${GetParentResourceName()}/cancel`, id.toString())
        clearCurrentContract();
        setCooldown("cancel", 15000) // 15 second cooldown on cancelling the contract
    }else {
        showNotification("Please wait before cancelling!");
    }
}

function updateCurrentContract(card) {
    const currentContractDiv = document.querySelector('.current-contract');
    const type = card.querySelector('.card-header').innerText;
    const name = card.querySelector('.name').innerText;
    const car = card.querySelector('.car').innerText;
    const plate = card.querySelector('.plate').innerText;
    const buyInCost = card.querySelector('.details-row p:nth-child(2)').innerText;
    const expiration = card.querySelector('.expiration').innerText;
    const letter = card.querySelector('.letter-circle').innerText;

    currentContractDiv.innerHTML = `
        <div class="header-container">
            <div class="header-details">
                <div class="header">Current Contract</div>
                <div class="sub-header">${type}</div>
            </div>
            <div class="actions">
                <button class="cancel-button" onclick="cancelContract(${card.id})">Cancel Contract</button>
            </div>
        </div>
        <div class="details">
            <div class="letter-circle">${letter}</div>
            <div class="details-rows">
                <div class="details-row">
                    <p>${name}</p>
                </div>
                <div class="details-row">
                    <p>${car}</p>
                </div>
                <div class="details-row">
                    <p>${plate}</p>
                </div>
                <div class="details-row">
                    <p>${buyInCost}</p>
                </div>
                <div class="details-row">
                    <p>${expiration}</p>
                </div>
            </div>
            <div class="current-objective">
                <p><strong>Current Objective</strong></p>
                <p class="objective-text">Wait for further instruction</p>
            </div>
        </div>
    `;
}

function clearCurrentContract(){
    const currentContractDiv = document.querySelector('.current-contract');
    currentContractDiv.innerHTML = `
        <div class="header-container">
            <div class="header-details">
                <div class="header">Current Contract</div>
            </div>
        </div>
        <div class="no-contract">No Contract Active</div>
    `;
}

function queue() {
    if(!queueCooldown){
        const button = document.getElementById("queue-button");
        const date = new Date();
        setCooldown("queue", 3000);
        if (button.textContent === "Join Queue") {
            button.textContent = "Leave Queue";
            showNotification("Queue Joined");
            $.post(`https://${GetParentResourceName()}/queue`, "true");
        } else {
            button.textContent = "Join Queue";
            showNotification("Queue Left");
            $.post(`https://${GetParentResourceName()}/queue`);
        }
    } else {
        showNotification("Please wait before trying again");
    }
}

function showNotification(message, duration = 3000) {
    // Ensure the notification container exists within the main container
    let container = document.querySelector('.container');
    if (!container) {
        console.error('No container found to append notifications.');
        return;
    }

    let notificationContainer = container.querySelector('.notification-container');
    if (!notificationContainer) {
        notificationContainer = document.createElement('div');
        notificationContainer.className = 'notification-container';
        container.appendChild(notificationContainer);
    }

    // Create the notification element
    const notification = document.createElement('div');
    notification.className = 'notification';
    notification.innerText = message;

    // Add the notification to the notification container
    notificationContainer.appendChild(notification);

    // Remove the notification after the specified duration
    setTimeout(() => {
        notification.classList.add('hide');
        notification.addEventListener('transitionend', () => {
            notification.remove();
        });
    }, duration);
}

function formatRemainingTime(expirationTimestamp) {
    const endTime = new Date(expirationTimestamp * 1000);
    const currentTime = new Date();
    const timeDifferenceInMs = endTime - currentTime;
    const timeDifferenceInHours = timeDifferenceInMs / (1000 * 60 * 60);

    const remainingTime = timeDifferenceInHours;

    return remainingTime > 0 ? `${remainingTime.toFixed(1)} hours` : 'Expired';
}

// Updates the progress bar based on the player's XP and tier
function updateProgressBar() {
    const tierObjects = Object.keys(Tiers)
        .map(key => ({ name: key, xpRequired: Tiers[key].xpRequired, title: Tiers[key].title}))
        .sort((a, b) => a.xpRequired - b.xpRequired);

    const currentTierIndex = tierObjects.findIndex(t => t.name === tier);
    const xpForCurrentTier = tierObjects[currentTierIndex].xpRequired;
    var progressPercentage;

    if (currentTierIndex === tierObjects.length - 1) {
        // If this is the highest tier, progress is 100%
        progressPercentage = 100;
    } else {
        const xpToNextTier = tierObjects[currentTierIndex + 1].xpRequired;
        progressPercentage = ((xp - xpForCurrentTier) / (xpToNextTier - xpForCurrentTier)) * 100;
    }

    const nextTierLabel = currentTierIndex < tierObjects.length - 1 ? tierObjects[currentTierIndex + 1].name : "MAX";
    document.querySelector('.tier').textContent = tier;
    document.querySelector('.experience-needed').textContent = `${Math.ceil(tierObjects[currentTierIndex + 1].xpRequired - xp)} XP Needed`;
    document.querySelector('.booster-class').textContent = tierObjects[currentTierIndex].title;
    document.querySelector('.job').textContent = tierObjects[currentTierIndex].title + " | " + balance + " " + formattedTypes[balanceType];

    // Update the circular progress bar
    const circle = document.querySelector('.meter-1');
    const radius = circle.r.baseVal.value;
    const circumference = 2 * Math.PI * radius;

    circle.style.strokeDasharray = `${circumference} ${circumference}`;
    circle.style.strokeDashoffset = circumference;

    // Trigger reflow
    circle.getBoundingClientRect();

    const offset = circumference - (progressPercentage / 100 * circumference);
    circle.style.transition = 'stroke-dashoffset 0.5s ease';
    circle.style.strokeDashoffset = offset;
}

// Updates the player's name and balance in the UI
function updatePlayerBalance() {
    document.querySelector('.profile_name').textContent = nickname;
}

function syncData(data){
    xp = data.xp;
    tier = data.tier;
    balance = data.balance;
    currentObjective = data.currentObjective;
    updatePlayerBalance();
}

function calculateRemainingCooldownTime(cooldown) {
    const currentTime = new Date().getTime();
    const timeSinceLastCompletion = currentTime - completionTime;
    const remainingCooldown = Math.max(0, cooldown - timeSinceLastCompletion);
    return remainingCooldown;
}

function openTab(tabName){
    if(currentTab !== tabName){
        document.querySelector("." + currentTab).style.display = "none";
        document.querySelector("." + tabName).style.display = "flex";
        currentTab = tabName;
        document.querySelector(".currentPage").textContent = tabName.charAt(0).toUpperCase() + tabName.slice(1);
    }
}

function closeWindow(){
    $.post(`https://${GetParentResourceName()}/closeWindow`);
}

function addMessage(sender, timestamp, content) {
    const messagesList = document.querySelector('.messages-list');

    const messageCard = document.createElement('div');
    messageCard.className = 'message-card';

    messageCard.innerHTML = `
        <div class="message-header">
            <span class="message-sender">Sender: ${sender}</span>
            <span class="message-timestamp">${timestamp}</span>
        </div>
        <div class="message-body">
            <p>${content}</p>
        </div>
    `;

    messagesList.appendChild(messageCard);

    // Ensure the latest message is visible
    messagesList.scrollTop = messagesList.scrollHeight;
}

function populateMessages(messages) {
    const messagesList = document.querySelector('.messages-list');
    messagesList.innerHTML = ''; // Clear existing messages

    // Sort messages by timestamp, newest first
    messages.sort((a, b) => new Date(b.timestamp) - new Date(a.timestamp));

    messages.forEach(message => {
        const timestamp = new Date(message.timestamp).toLocaleString(); // Convert timestamp to readable format
        addMessage(sender, timestamp, message.message);
    });

    messagesList.scrollTop = 0;
}

function updateBoostData(total, successes, failures, value, enemies, contracts){
    document.querySelector('#info-total-successes').textContent = successes + " Cars Boosted";
    document.querySelector('#info-total-failed').textContent = failures + " Failed";
    document.querySelector('#info-total-value').textContent = value + " " + formattedTypes[balanceType] + " Earned";
    document.querySelector('#info-total-killed').textContent = enemies + " Killed";

    // Update Recent Contracts
    const contractsTableBody = document.querySelector('.contracts-table tbody');
    contractsTableBody.innerHTML = ''; // Clear existing rows

    // Sort contracts by timestamp in descending order and take the latest 10
    const sortedContracts = contracts.sort((a, b) => new Date(b.timestamp) - new Date(a.timestamp)).slice(0, 10);

    sortedContracts.forEach(contract => {
        const row = document.createElement('tr');

        row.innerHTML = `
            <td>${contract.type}</td>
            <td>${contract.vehicle}</td>
            <td>${contract.value + " " + formattedTypes[balanceType]}</td>
            <td>${contract.success ? 'Yes' : 'No'}</td>
            <td>${contract.enemy_killed}</td>
            <td>${new Date(contract.timestamp).toLocaleString()}</td>
        `;

        contractsTableBody.appendChild(row);
    });

    // Update History
    const historyTableBody = document.querySelector('.history-table tbody');
    historyTableBody.innerHTML = ''; // Clear existing rows

    contracts.forEach(contract => {
        const row = document.createElement('tr');

        row.innerHTML = `
            <td>${contract.type}</td>
            <td>${contract.vehicle}</td>
            <td>${contract.value + " " + formattedTypes[balanceType]}</td>
            <td>${contract.success ? 'Yes' : 'No'}</td>
            <td>${contract.enemy_killed}</td>
            <td>${new Date(contract.timestamp).toLocaleString()}</td>
        `;

        historyTableBody.appendChild(row);
    });

    // Update Weekly Summary
    const dayCounts = [0, 0, 0, 0, 0, 0, 0]; // Sunday to Saturday
    contracts.forEach(contract => {
        const dayOfWeek = new Date(contract.timestamp).getDay();
        dayCounts[dayOfWeek]++;
    });

    const maxCount = Math.max(...dayCounts);

    document.querySelectorAll('.weekly-summary .day-group').forEach((group, index) => {
        const bar = group.querySelector('.bar');
        const percentage = (dayCounts[index] / maxCount) * 100;
        bar.style.height = `${percentage}%`;
    });
}

function setCooldown(button, cooldownTime) {
    switch(button){
        case "queue":
            queueCooldown = true;
            break;
        case "contract":
            contractCooldown = true;
            break;
        case "decline":
            declineCooldown = true;
            break;
        case "cancel":
            canCancel = false;
            break;
    }
    setTimeout(() => {
        switch(button){
            case "queue":
                queueCooldown = false;
                break;
            case "contract":
                contractCooldown = false;
                break;
            case "decline":
                declineCooldown = false;
                break;
            case "cancel":
                canCancel = true;
                break;
        }
    }, cooldownTime);
}

// -------------------- LISTENERS ------------------ //

window.addEventListener('message', (event) => {
    let data = event.data;
    switch(data.action){
        case 'open':
            xp = data.playerXP;
            tier = data.playerTier;
            balance = data.playerBalance;
            balanceType = data.balanceType;
            nickname = data.playerName;
            Tiers = data.tiers;
            sender = data.sender;
            subject = data.subject;

            $('.container').show();

            updatePlayerBalance();
            updateProgressBar();

            if (data.sendComplete){
                showNotification("Contract Completed");
            }

            break;
        case 'hide':
            $('.container').hide();
            break;
        case 'createContractCard':
            createContractCard(data.id, data.type, data.letter, data.name, data.car, data.plate, data.buyInCost, data.creationTime);
            break;
        case 'contractComplete':
            removeContractCard(data.id);
            clearCurrentContract();
            completionTime = data.completionTime;
            cooldownLength = data.cooldownLength;
            const remainingCooldown = calculateRemainingCooldownTime(cooldownLength * 60 * 1000);
            setCooldown("contract", remainingCooldown);
            canCancel = true;
            break;
        case 'syncData':
            syncData(data)
            break
        case 'updateObjective':
            currentObjective = data.currentObjective;
            document.querySelector('.objective-text').textContent = currentObjective;
            canCancel = true;
            break;
        case 'updateMessages':
            messages = data.messages;
            populateMessages(messages);
            break;
        case 'updateBoostData':
            updateBoostData(data.total, data.successes, data.failures, data.value, data.enemiesKilled, data.contracts);
            break;
    }
});

document.addEventListener('keydown', function(event) {
    if (event.key === 'Escape' || event.key === 'Esc') {
        closeWindow();
    }
});

document.addEventListener('DOMContentLoaded', (event) => {
    const searchBox = document.querySelector('.contracts-search .search-box');

    searchBox.addEventListener('input', function() {
        const searchTerm = this.value.toLowerCase();
        const contractCards = document.querySelectorAll('.contract-card');

        contractCards.forEach(card => {
            const header = card.querySelector('.card-header').innerText.toLowerCase();
            const name = card.querySelector('.name').innerText.toLowerCase();
            const car = card.querySelector('.car').innerText.toLowerCase();
            const plate = card.querySelector('.plate').innerText.toLowerCase();

            if (header.includes(searchTerm) || name.includes(searchTerm) || car.includes(searchTerm) || plate.includes(searchTerm)) {
                card.style.display = 'flex'; // Show card
            } else {
                card.style.display = 'none'; // Hide card
            }
        });
    });
});