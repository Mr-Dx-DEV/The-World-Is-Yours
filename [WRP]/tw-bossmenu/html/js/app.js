let audioPlayer = null;
const store = Vuex.createStore({
    components: {},

    state: {
        notifications: []
    },
    getters: {},
    mutations: {},
    actions: {},
    searchInput: ""
});

const app = Vue.createApp({
    components: {},
    el: "#app",
    data: () => ({
        mainShow: false,
        creatorMenuShow: false,
        waitingOverlay: false,
        notifyShow: false,
        defaultPermissions: [],
        moneyType: "$",
        serverName: "TWORST",
        locales: {},
        blipsList: [],
        blipColor: [],
        defaultImage: "https://docs.fivem.net/blips/radar_level.png",
        Notification: {},
        tempRankList: [],
        creatorData: {},
        blipsData: {
            blipSize: null,
            blipName: null, // bossmenu or stash
            blipLabel: null,
            blipID: null,
            blipValue: null,
            blipImage: null,
            blipColorID: null,
            blipState: null,
        },
        vModelData: {
            employeeSearch: "",
            playerInviteInput: "",
            rankNameInput: "",
            rankSearchInput: "",
            bankInput: "",
            selectedJobName: "",
            outfitNameInput: "",
            nameInput: "",
            salaryInput: "",
            isRankSaved: true,
            isRankEdit: false,
            blipcheckbox: false,
            jobLabelInput: "",
            jobDescriptionInput: "",
            jobLogoInput: "",
            jobBannerInput: "",
            stashCoordInput: "",
            bossmenuCoordInput: ""
        },
        selectedData: {
            selectedRank: null,
            fakeJobRankList: null,
            selectedEmployee: null,
            selectedOutfit: null
        },
        modalData: {
            modalText: "",
            modalSubText: "",
            modalButtonText: "",
            veri: false
        },
        bossMenuData: {
            jobSettings: {
                jobLabel: "Police Department",
                jobLogo: "https://cdn.discordapp.com/attachments/1304168293292179496/1310362844616720395/title.png?ex=6744f1ff&is=6743a07f&hm=fe6c96da7d6fae3b0a6eed2206e20ec6bb0d226728c8dabed9a423277454f047&",
                jobBanner: "https://cdn.discordapp.com/attachments/1304168293292179496/1310358995961380907/banner.png?ex=6744ee69&is=67439ce9&hm=618d0266398488161add35bf3db2e5195a0215b0e175fa2ee7aa78dd30758dd6&",
                jobDescription: "lorem4 ",
                jobMoney: 500
            },

            jobHistory: [
                {
                    amount: 100,
                    type: "deposit",
                    date: "2024-01-01",
                    name: "Tworst Name"
                },
                {
                    amount: 100,
                    type: "withdraw",
                    date: "2024-01-01",
                    name: "Tworst Name"
                }
            ],
            employees: {
                MYD01975: {
                    profilepicture: false,
                    jobGrade: 4,
                    playerName: "Tworst Shop",
                    jobSalary: 150,
                    name: "police",
                    jobGradeName: "Chief",
                    identifier: "MYD01975",
                    id: 1,
                    jobLabel: "Law Enforcement",
                    boss: true
                }
            },

            jobRankList: {
                0: { totalPlayer: 0, payment: 50, gradeLevel: "0", name: "Recruit" },
                1: { totalPlayer: 0, payment: 75, gradeLevel: "1", name: "Officer" },
                2: { totalPlayer: 0, payment: 100, gradeLevel: "2", name: "Sergeant" },
                3: { totalPlayer: 0, payment: 125, gradeLevel: "3", name: "Lieutenant" },
                4: { payment: 150, name: "Chief", isboss: true, gradeLevel: "4", totalPlayer: 1 }
            },
            outfitList: [
                {
                    name: "Deneme",
                    outfitID: 1,
                    gender: "male",
                    outfitData: [
                        {
                            name: "jacket",
                            value: 1,
                            texture: 1
                        },
                        {
                            name: "shirt",
                            value: 1,
                            texture: 1
                        },
                        {
                            name: "arms",
                            value: 1,
                            texture: 1
                        },
                        {
                            name: "legs",
                            value: 1,
                            texture: 1
                        },
                        {
                            name: "shoes",
                            value: 1,
                            texture: 1
                        },
                        {
                            name: "mask",
                            value: 1,
                            texture: 1
                        },
                        {
                            name: "chain",
                            value: 1,
                            texture: 1
                        },
                        {
                            name: "decals",
                            value: 1,
                            texture: 1
                        },
                        {
                            name: "helmet",
                            value: 1,
                            texture: 1
                        },
                        {
                            name: "glasses",
                            value: 1,
                            texture: 1
                        },
                        {
                            name: "watches",
                            value: 1,
                            texture: 1
                        },
                        {
                            name: "bracelets",
                            value: 1,
                            texture: 1
                        }
                    ]
                }
            ],
            permissions: {
                bankshow: true,
                bankwithdraw: true,
                bankdeposit: true,
                banklog: false,
                inviteemployee: false
            }
        },
        playerData: {
            playerImg: "./img/profileImg",
            playerId: 1,
            playerName: "Tworst Name",
            playerRank: "Chief",
            playerMoney: 313131,
            playerIsBoss: true,
            playerIdentifier: "MYD01975",
            playerJob: "police"
        },
        currentPopup: "blipEditPopup",
        currentPage: "dashboardPage",
        categories: [
            { name: "dashboardPage", img: "dashboard", title: "Dashboard" },
            { name: "employeePage", img: "employees", title: "Employees" },
            { name: "bankPage", img: "money", title: "Money" },
            { name: "rankPage", img: "ranklist", title: "Rank List" },
            { name: "outfitPage", img: "outfit", title: "Outfit" },
            { name: "settingsPage", img: "settings", title: "Settings" }
        ],

        isOpen: false,
        options: ["Option 1", "Option 2", "Option 3", "Option 4"],
        selectedOption: null,
        draggedIndex: null,
        outfitDefaultData: [
            {
                name: "jacket",
                value: 1,
                texture: 1
            },
            {
                name: "shirt",
                value: 1,
                texture: 1
            },
            {
                name: "arms",
                value: 1,
                texture: 1
            },
            {
                name: "legs",
                value: 1,
                texture: 1
            },
            {
                name: "shoes",
                value: 1,
                texture: 1
            },
            {
                name: "mask",
                value: 1,
                texture: 1
            },
            {
                name: "chain",
                value: 1,
                texture: 1
            },
            {
                name: "decals",
                value: 1,
                texture: 1
            },
            {
                name: "helmet",
                value: 1,
                texture: 1
            },
            {
                name: "glasses",
                value: 1,
                texture: 1
            },
            {
                name: "watches",
                value: 1,
                texture: 1
            },
            {
                name: "bracelets",
                value: 1,
                texture: 1
            }
        ],

        notifications: []
    }),

    watch: {},

    beforeDestroy() {},
    mounted() {
        window.addEventListener("keyup", this.keyHandler);
        window.addEventListener("message", this.eventHandler);

        this.checkInterval = setInterval(() => {
            if (this.notifications.length > 0) {
                this.notifyShow = true;

                let delays = [];
                this.notifications.forEach((notification, index) => {
                    let delay = setTimeout(() => {
                        const indexToRemove = this.notifications.indexOf(notification);
                        if (indexToRemove !== -1) {
                            this.notifications.splice(indexToRemove, 1);
                            if (this.notifications.length === 0) {
                                this.notifyShow = false;
                            }
                        }
                        clearTimeout(delays[indexToRemove]);
                    }, 1500 * (index + 1));
                });
            }
        }, 1500);
    },

    methods: {
        openBlipEdit(blipName) {
            this.blipsData.blipName = blipName;
            if (blipName === "bossmenu") {
                this.blipsData.blipLabel = this.Locales['bossmenu'];
            } else {
                this.blipsData.blipLabel = this.Locales['stash'];
            }
            this.blipsData.blipName = this.blipsData.blipName.toLowerCase();
            if (this.bossMenuData.jobSettings.blipList && this.bossMenuData.jobSettings.blipList[this.blipsData.blipName]) {
                const blipData = this.bossMenuData.jobSettings.blipList[this.blipsData.blipName];
            
                this.blipsData.blipLabel = blipData.blipLabel || this.blipsData.blipLabel;
                this.blipsData.blipID = blipData.blipID || 0;
                this.blipsData.blipColorID = blipData.blipColorID || 0;
                this.blipsData.blipSize = blipData.blipSize || 0;
                this.blipsData.blipState = blipData.blipState || 0;
                this.blipsData.blipImage = blipData.blipImage || null;
            } else {
                this.blipsData.blipLabel = this.Locales['bossmenu'];
                this.blipsData.blipID = 0;
                this.blipsData.blipColorID = 0;
                this.blipsData.blipSize = 0;
                this.blipsData.blipState = 0;
                this.blipsData.blipImage = null;
            }
            
            this.currentPopup = "blipEditPopup";
        },
        saveBlip() {
            if (this.creatorMenuShow) {

            } else {
                this.blipsData.blipName = this.blipsData.blipName.toLowerCase();
                this.currentPopup = false;
                if (this.blipsData.blipName === null) {
                    let notification = {
                        text: this.Notification["pleaseselectablip"]
                    };
                    this.addNotification(notification);
                    return;
                }
                postNUI("saveBlip", this.blipsData);
                this.blipsData.blipName = null;
                this.blipsData.blipLabel = null;
                this.blipsData.blipID = null;
                this.blipsData.blipColorID = null;
                this.blipsData.blipSize = null;
                this.blipsData.blipState = null;
            }

        },
        initializeSortable() {
            if (this.vModelData.isRankEdit) {
                this.$nextTick(() => {
                    const el = document.getElementById("rankList");
                    if (el) {
                        const fakeJobRankListCopy = JSON.parse(JSON.stringify(this.selectedData.fakeJobRankList));

                        $("#rankList").sortable({
                            items: ".rankListSlot",
                            placeholder: "sortable-placeholder",
                            revert: false,
                            update: (event, ui) => {
                                const sortedIDs = $("#rankList").sortable("toArray", {
                                    attribute: "data-id"
                                });

                                this.tempRankList = sortedIDs.map(id => {
                                    const rank = Object.values(fakeJobRankListCopy).find(rank => {
                                        return rank.gradeLevel.toString() === id.toString();
                                    });
                                    if (!rank) {
                                        console.error(`Rank not found for gradeLevel: ${id}`);
                                    }
                                    return rank || null;
                                });
                            }
                        });
                    } else {
                        this.addNotification({ text: this.Notification["ranklistnotfound"] });
                    }
                });
            } else {
                this.addNotification({ text: this.Notification["sortable"] });
            }
        },

        addNotification(notification) {
            this.notifications.push(notification);
        },
        toggleDropdown() {
            this.isOpen = !this.isOpen;
        },
        selectOption(option) {
            this.selectedOption = option;
            this.isOpen = false;
            this.selectedData.selectedJobName = option.name;
        },
        bankAction(action) {
            if (this.vModelData.bankInput === "") {
                let notification = {
                    text: this.Notification["pleaseenteranamount"]
                };
                this.addNotification(notification);
                return;
            }
            if (isNaN(this.vModelData.bankInput)) {
                let notification = {
                    text: this.Notification["pleaseenteravalidnumber"]
                };
                this.addNotification(notification);
                return;
            }
            if (this.vModelData.bankInput < 0) {
                let notification = {
                    text: this.Notification["pleaseenterapositive"]
                };
                this.addNotification(notification);
                return;
            }

            if (action === "depositPopup") {
                postNUI("depositMoney", { amount: this.vModelData.bankInput });
            } else {
                postNUI("withdrawMoney", { amount: this.vModelData.bankInput });
            }
            this.vModelData.bankInput = "";
            this.currentPopup = false;
        },
        changePage(page) {
            if (this.currentPage === page) {
                return;
            }
            if (page === "settingsPage" && !this.getPlayerPermission("settings")) {
                return;
            }
            if (page === "rankPage") {
                this.selectedData.fakeJobRankList = JSON.parse(JSON.stringify(this.bossMenuData.jobRankList));
                const updatedRanks = Object.values(this.selectedData.fakeJobRankList)
                    .sort((a, b) => parseInt(a.gradeLevel) - parseInt(b.gradeLevel))
                    .map((rank, index) => {
                        rank.gradeLevel = index.toString();
                        return rank;
                    });
                this.selectedData.fakeJobRankList = updatedRanks;
            } else {
                this.vModelData.isRankSaved = true;

                if (this.vModelData.isRankEdit) {
                    this.disableSortable();
                }
            }
            this.currentPage = page;
        },
        formatNumber(number) {
            if (number == null) return 0;
            return number.toLocaleString("tr-TR");
        },
        savePlayerEdit() {
            if (this.selectedData.selectedJobName === "") {
                let notification = {
                    text: this.Notification["pleaseselectajob"]
                };
                this.addNotification(notification);
                return;
            }
            if (this.selectedData.selectedEmployee.jobGradeName === "") {
                let notification = {
                    text: this.Notification["pleaseselectajob"]
                };
                this.addNotification(notification);
                return;
            }

            let gradeLevel = Object.values(this.bossMenuData.jobRankList).findIndex(rank => rank.name === this.selectedData.selectedJobName);
            let selectedRank = Object.values(this.bossMenuData.jobRankList)[gradeLevel];
            postNUI("saveEmployee", { GradeName: this.selectedData.selectedJobName, GradeLevel: gradeLevel, employee: this.selectedData.selectedEmployee, selectedRank: selectedRank });
            this.waitingOverlay = true;
            setTimeout(() => {
                this.waitingOverlay = false;
            }, 1500);
            this.currentPopup = false;
        },

        disableSortable() {
            const el = document.getElementById("rankList");
            if (el) {
                if ($(el).data("ui-sortable")) {
                    $("#rankList").sortable("destroy");
                    this.vModelData.isRankEdit = false;
                    let notification = {
                        text: this.Notification["sortable"]
                    };
                    this.addNotification(notification);
                } else {
                    let notification = {
                        text: this.Notification["sortable"]
                    };
                    this.addNotification(notification);
                }
            } else {
                let notification = {
                    text: this.Notification["ranklistnotfound"]
                };
                this.addNotification(notification);
            }
        },
        openRankEdit() {
            if (this.vModelData.isRankEdit) {
                if (!Array.isArray(this.tempRankList) || this.tempRankList.length === 0) {
                    let notification = {
                        text: this.Notification["temporarranklistinvalidorempty"]
                    };
                    this.addNotification(notification);
                    this.tempRankList = Object.values(this.selectedData.fakeJobRankList);
                }
                this.selectedData.fakeJobRankList = this.tempRankList.map((rank, index) => ({
                    ...rank,
                    gradeLevel: index.toString(),
                    isboss: index === this.tempRankList.length - 1
                }));

                let jobRankList = [...this.selectedData.fakeJobRankList];

                postNUI("saveRank", { rankList: jobRankList });

                this.vModelData.isRankSaved = true;
                this.disableSortable();
                this.vModelData.isRankEdit = false;
                return;
            } else {
                this.selectedData.fakeJobRankList = JSON.parse(JSON.stringify(this.bossMenuData.jobRankList));
                setTimeout(() => {
                    this.initializeSortable();
                }, 500);
            }
            this.vModelData.isRankEdit = !this.vModelData.isRankEdit;
        },
        popupBtn(popup) {
            if (popup == "withdrawPopup") {
                if (!this.getPlayerPermission("bankwithdraw")) {
                    let notification = {
                        text: this.Notification["youdonothavepermissiontowithdrawmoney"]
                    };
                    this.addNotification(notification);
                    return;
                }
            } else if (popup == "depositPopup") {
                if (!this.getPlayerPermission("bankdeposit")) {
                    let notification = {
                        text: this.Notification["youdonothavepermissiontodepositmoney"]
                    };
                    this.addNotification(notification);
                    return;
                }
            }
            this.currentPopup = popup;
        },
        editBtn(rankData) {
            let myPermissions = this.bossMenuData.employees[this.playerData.playerIdentifier].myPermissions;
            if (!myPermissions.editrank) {
                let notification = {
                    text: this.Notification["youdonothavepermissiontoeditranks"]
                };
                this.addNotification(notification);
                return;
            }

            this.selectedData.selectedRank = rankData;
            this.currentPopup = "rankEditPopup";
        },

        getPlayerPermission(permName) {
            let employees = this.bossMenuData?.employees;

            let identifier = this.playerData.playerIdentifier;
            let isBoss = this.bossMenuData.employees[this.playerData.playerIdentifier].isBoss;
            let permissions = employees?.[identifier]?.myPermissions;
            let access = isBoss || permissions?.[permName] || false;
            return access;
        },
        editRank() {
            let gradeLevel = this.selectedData.selectedRank.gradeLevel;
            let permissions = this.selectedData.selectedRank.permissions;

            if (this.vModelData.nameInput === "") {
                this.vModelData.nameInput = this.selectedData.selectedRank.name;
            }
            if (this.vModelData.salaryInput === "") {
                this.vModelData.salaryInput = this.selectedData.selectedRank.payment;
            }

            if (this.vModelData.nameInput.length < 3) {
                let notification = {
                    text: this.Notification["ranknamemustbeatleast3characters"]
                };
                this.addNotification(notification);
                return;
            }

            if (this.vModelData.salaryInput <= 0) {
                let notification = {
                    text: this.Notification["salarymustbegreaterthan0"]
                };
                this.addNotification(notification);
                return;
            }

            postNUI("editRank", { gradeLevel: gradeLevel, name: this.vModelData.nameInput, payment: this.vModelData.salaryInput, permissions: permissions });
            this.currentPopup = false;
            this.vModelData.nameInput = "";
            this.vModelData.salaryInput = "";
        },
        deleteRank(rankData) {
            if (this.vModelData.isRankEdit) {
                let notification = {
                    text: this.Notification["youcannotdeletearankineditmode"]
                };
                this.addNotification(notification);
                return;
            }

            const rankCount = Object.keys(this.selectedData.fakeJobRankList).length;
            if (rankCount <= 1) {
                let notification = {
                    text: this.Notification["youmusthaveatleastonerank"]
                };
                this.addNotification(notification);
                return;
            }

            if (rankData.isboss) {
                let notification = {
                    text: this.Notification["thisrankcannotbedeletedbecauseitisabossrank"]
                };
                this.addNotification(notification);
                return;
            }

            const rankKey = Object.keys(this.selectedData.fakeJobRankList).find(key => this.selectedData.fakeJobRankList[key].name === rankData.name);
            if (rankKey) {
                if (!this.vModelData.isRankSaved) {
                    const isUnsavedRank = !Object.values(this.bossMenuData.jobRankList || {}).some(rank => rank.name === rankData.name);
                    if (isUnsavedRank) {
                        this.vModelData.isRankSaved = true;
                    }
                }

                postNUI("deleteRank", rankData);
            } else {
                let notification = {
                    text: this.Notification["ranknotfound"] + rankData.name
                };
                this.addNotification(notification);
            }
        },

        inviteEmployee() {
            if (!this.getPlayerPermission("inviteemployee")) {
                let notification = {
                    text: this.Notification["youdonothavepermissiontoinviteemployees"]
                };
                this.addNotification(notification);
                return;
            }

            if (this.vModelData.playerInviteInput === "") {
                let notification = {
                    text: this.Notification["pleaseenteraplayerid"]
                };
                this.addNotification(notification);
                return;
            }

            if (isNaN(this.vModelData.playerInviteInput)) {
                let notification = {
                    text: this.Notification["pleaseenteravalidnumber"]
                };
                this.addNotification(notification);
                return;
            }

            postNUI("inviteEmployee", { playerId: this.vModelData.playerInviteInput });
            this.vModelData.playerInviteInput = "";
        },
        createRank() {
            if (!this.getPlayerPermission("createrank")) {
                let notification = {
                    text: this.Notification["youdonothavepermissiontocreateranks"]
                };
                this.addNotification(notification);
                return;
            }

            if (this.vModelData.isRankEdit) {
                let notification = {
                    text: this.Notification["youcannotcreatearankineditmode"]
                };
                this.addNotification(notification);
                return;
            }

            if (!this.vModelData.isRankSaved) {
                let notification = {
                    text: this.Notification["youcannotcreatearankineditmode"]
                };
                this.addNotification(notification);
                return;
            }

            if (!this.vModelData.rankNameInput || this.vModelData.rankNameInput.length < 3) {
                let notification = {
                    text: this.Notification["ranknamemustbeatleast3characters"]
                };
                this.addNotification(notification);
                return;
            }

            const isDuplicate = Object.values(this.selectedData.fakeJobRankList).some(rank => rank.name.toLowerCase() === this.vModelData.rankNameInput.toLowerCase());
            if (isDuplicate) {
                let notification = {
                    text: this.Notification["thisranknameisalreadytaken"]
                };
                this.addNotification(notification);
                return;
            }

            const newRank = {
                name: this.vModelData.rankNameInput,
                gradeLevel: Object.keys(this.selectedData.fakeJobRankList).length.toString(),
                totalPlayer: 0,
                payment: 0,
                isboss: false
            };
            postNUI("createRank", newRank);
            this.vModelData.isRankSaved = false;
            this.vModelData.rankNameInput = "";
        },
        wearOutfit(outfit) {
            postNUI("wearOutfit", outfit);
        },
        openOutfitMenu(outfit) {
            if (!this.getPlayerPermission("outfit")) {
                let notification = {
                    text: this.Notification["youdonothavepermissiontoopenoutfitmenu"]
                };
                this.addNotification(notification);
                return;
            }
            this.currentPopup = false;
            this.currentPage = false;
            this.mainShow = false;
            postNUI("openOutfitMenu", outfit);
        },
        createOutfit() {
            if (!this.getPlayerPermission("outfit")) {
                let notification = {
                    text: this.Notification["youdonothavepermissiontoopenoutfitmenu"]
                };
                this.addNotification(notification);
                return;
            }

            if (this.vModelData.nameInput === "") {
                let notification = {
                    text: this.Notification["pleaseenteranoutfitname"]
                };
                this.addNotification(notification);
                return;
            }

            if (this.vModelData.nameInput.length < 3) {
                let notification = {
                    text: this.Notification["outfitnamemustbeatleast3characters"]
                };
                this.addNotification(notification);
                return;
            }

            const isDuplicate = Object.values(this.bossMenuData.outfitList).some(outfit => outfit.name.toLowerCase() === this.vModelData.nameInput.toLowerCase());
            if (isDuplicate) {
                let notification = {
                    text: this.Notification["thisnameisalreadytaken"]
                };
                this.addNotification(notification);
                return;
            }

            postNUI("createOutfit", { name: this.vModelData.nameInput, outfitData: this.outfitDefaultData });
        },
        editOutfit(outfitData) {
            this.selectedData.selectedOutfit = outfitData;
            this.currentPopup = "outfitEditPopup";
        },
        saveOutfit() {
            if (!this.getPlayerPermission("outfit")) {
                let notification = {
                    text: this.Notification["youdonothavepermissiontocreateoutfits"]
                };
                this.addNotification(notification);
                return;
            }
            this.currentPopup = false;
            postNUI("saveOutfit", this.selectedData.selectedOutfit);
        },
        deleteOutfit() {
            if (!this.getPlayerPermission("outfit")) {
                let notification = {
                    text: this.Notification["youdonothavepermissiontodeleteoutfits"]
                };
                this.addNotification(notification);
                return;
            }
            this.currentPopup = false;
            postNUI("deleteOutfit", { outfitID: this.selectedData.selectedOutfit.outfitID });
        },
        FireEmployeePopup(employee) {
            if (!this.getPlayerPermission("fireemployee")) {
                let notification = {
                    text: this.Notification["youdonothavepermissiontofireemployees"]
                };
                this.addNotification(notification);
                return;
            }

            if (employee.boss) {
                let notification = {
                    text: this.Notification["youcannotfireanotherboss"]
                };
                this.addNotification(notification);
                return;
            }

            if (employee.identifier === this.playerData.playerIdentifier) {
                let notification = {
                    text: this.Notification["youcannotfireyourself"]
                };
                this.addNotification(notification);
                return;
            }

            this.selectedData.selectedEmployee = employee;
            this.currentPopup = "modalPopup";
            this.modalData.modalText = this.Locales["fireemployee"];
            this.modalData.modalSubText = this.Locales["fireemployeesure"] + employee.playerName;
            this.modalData.modalButtonText = this.Locales["fire"];
            this.modalData.veri = employee;
        },
        modalBtn() {
            if (this.modalData.modalButtonText === "Fire") {
                this.currentPopup = false;
                postNUI("fireEmployee", this.modalData.veri);
            }
            if (this.currentPopup === "inviteEmployeePopup") {
                this.currentPopup = false;
                this.mainShow = false;
                postNUI("acceptInvite", this.modalData.veri);
            }
        },
        saveSettings() {
            if (this.vModelData.jobLabelInput === "") {
                let notification = {
                    text: this.Notification["pleaseenterajobtitle"]
                };
                this.addNotification(notification);
                return;
            }

            if (this.vModelData.stashCoordInput === "") {
                this.vModelData.stashCoordInput = this.bossMenuData.jobSettings.jobStashCoords;
            }

            if (this.vModelData.bossmenuCoordInput === "") {
                this.vModelData.bossmenuCoordInput = this.bossMenuData.jobSettings.jobBossMenuCoords;
            }

            if (this.vModelData.jobBannerInput === "") {
                this.vModelData.jobBannerInput = this.bossMenuData.jobSettings.jobBanner;
            }

            if (this.vModelData.jobLogoInput === "") {
                this.vModelData.jobLogoInput = this.bossMenuData.jobSettings.jobLogo;
            }

            if (this.vModelData.jobDescriptionInput === "") {
                this.vModelData.jobDescriptionInput = this.bossMenuData.jobSettings.jobDescription;
            }

            postNUI("saveSettings", this.vModelData);
        },
        keyHandler(event) {
            if (event.keyCode == 27) {
                if (this.mainShow) {
                    this.closeNUI();
                }
                if (this.creatorMenuShow) {
                    this.closeNUICreator();
                }
            }
        },
        closeNUI() {
            this.mainShow = false;
            this.popupShow = false;
            postNUI("closeNUI");
        },
        closeNUICreator() {
            this.creatorMenuShow = false;
            postNUI("closeNUICreator");
        },
        getCoord(type) {
            this.mainShow = false;
            this.creatorMenuShow = false;
            postNUI("getCoord", { type: type });
        },
        saveCreatorData() {
            if (this.creatorData.jobName === "") {
                let notification = {
                    text: this.Notification["pleaseenterajobname"]
                };
                this.addNotification(notification);
                return;
            }

            if (this.creatorData.jobTitle === "") {
                let notification = {
                    text: this.Notification["pleaseenterajobtitle"]
                };
                this.addNotification(notification);
                return;
            }

            if (this.creatorData.jobDescription === "") {
                let notification = {
                    text: this.Notification["pleaseenterajobdescription"]
                };
                this.addNotification(notification);
                return;
            }

            if (this.creatorData.jobLogo === "") {
                let notification = {
                    text: this.Notification["pleaseenterajoblogo"]
                };
                this.addNotification(notification);
                return;
            }

            if (this.creatorData.jobBanner === "") {
                let notification = {
                    text: this.Notification["pleaseenterajobbanner"]
                };
                this.addNotification(notification);
                return;
            }

            postNUI("saveCreatorData", this.creatorData);
            this.creatorMenuShow = false;
        },
        getBannerImage() {
            const img = new Image();
            img.src = this.bossMenuData.jobSettings.jobBanner;
            if (img.complete && img.naturalWidth !== 0) {
                return this.bossMenuData.jobSettings.jobBanner;
            }
            return "./img/banner.png";
        },
        getLogoImage() {
            const img = new Image();
            img.src = this.bossMenuData.jobSettings.jobLogo;
            if (img.complete && img.naturalWidth !== 0) {
                return this.bossMenuData.jobSettings.jobLogo;
            }
            return "./img/title.png";
        },
        getLogoCreator() {
            const img = new Image();
            img.src = this.creatorData.jobLogo;
            if (img.complete && img.naturalWidth !== 0) {
                return this.creatorData.jobLogo;
            }
            return "./img/title.png";
        },
        getBannerCreator() {
            const img = new Image();
            img.src = this.creatorData.jobBanner;
            if (img.complete && img.naturalWidth !== 0) {
                return this.creatorData.jobBanner;
            }
            return "./img/banner.png";
        },
        eventHandler(event) {
            switch (event.data.action) {
                case "CHECK_NUI":
                    postNUI("checkNUI");
                    break;
                case "SERVER_NAME":
                    this.serverName = event.data.payload;
                    break;
                case "SERVER_MONEY_TYPE":
                    this.moneyType = event.data.payload;
                    break;
                case "LOCALES":
                    this.Locales = event.data.payload;
                    break;
                case "BLIPS":
                    this.blipsList = event.data.payload;
                    break;
                case "BLIP_COLOR":
                    this.blipColor = event.data.payload;
                    break;
                case "NOTIFICATION":
                    this.Notification = event.data.payload;
                    break;
                case "UPDATE_BOSSMENU_DATA":
                    this.bossMenuData = event.data.payload;
                    this.selectedData.fakeJobRankList = JSON.parse(JSON.stringify(this.bossMenuData.jobRankList));
                    if (this.vModelData.isRankEdit) {
                        this.disableSortable();
                        this.vModelData.isRankEdit = false;
                    }
                    break;
                case "OPEN_BOSSMENU":
                    this.mainShow = true;
                    this.popupShow = false;
                    this.currentPopup = false;
                    this.currentPage = "dashboardPage";
                    this.playerData = event.data.payload;
                    break;
                case "CLOSE_FORCE":
                    this.mainShow = false;
                    this.closeNUI();
                    this.popupShow = false;
                    break;
                case "OPEN_CREATOR":
                    this.creatorMenuShow = true;
                    this.playerData = event.data.payload;
                    this.mainShow = false;
                    break;
                case "UPDATE_BOSSMENU_JOBHISTORY":
                    this.bossMenuData.jobHistory.push(event.data.payload);
                    break;
                case "UPDATE_BOSSMENU_MONEY":
                    this.bossMenuData.jobSettings.jobMoney = event.data.payload;
                    break;
                case "UPDATE_BOSSMENU_OUTFIT":
                    this.bossMenuData.outfitList = event.data.payload;
                    break;
                case "OPEN_INVITE_EMPLOYEE":
                    this.currentPage = "";
                    this.currentPopup = "inviteEmployeePopup";
                    this.modalData.modalText = this.Locales["inviteemployee"];
                    this.modalData.modalSubText = this.Locales["inviteemployeesure"] + event.data.payload;
                    this.modalData.modalButtonText = this.Locales["invite"];
                    this.modalData.veri = event.data.payload;
                    break;
                case "PICKED_COORD":
                    let openMenu = event.data.payload.openMenu;
                    let openCreatorMenu = event.data.payload.openCreatorMenu;
                    if (openMenu) {
                        this.mainShow = true;
                        this.vModelData[event.data.payload.type + "CoordInput"] = event.data.payload.coord;
                    }
                    if (openCreatorMenu) {
                        this.creatorMenuShow = true;
                        this.creatorData[event.data.payload.type + "Coord"] = event.data.payload.coord;
                    }

                    break;
                case "UPDATE_BOSSMENU_RANKLIST":
                    this.waitingOverlay = true;
                    this.changePage("dashboardPage");
                    setTimeout(() => {
                        this.changePage("rankPage");
                        this.tempRankList = [];
                        this.bossMenuData = event.data.payload;
                        this.selectedData.fakeJobRankList = JSON.parse(JSON.stringify(this.bossMenuData.jobRankList));
                        if (this.vModelData.isRankEdit) {
                            this.disableSortable();
                            this.vModelData.isRankEdit = false;
                        }
                        this.selectedData.fakeJobRankList = JSON.parse(JSON.stringify(this.bossMenuData.jobRankList));
                        this.waitingOverlay = false;
                    }, 100);
                    break;
                case "SET_BOSSMENU_RANKLIST":
                    this.bossMenuData = event.data.payload;
                    this.waitingOverlay = true;
                    setTimeout(() => {
                        this.changePage("dashboardPage");
                        this.changePage("rankPage");
                        this.selectedData.fakeJobRankList = JSON.parse(JSON.stringify(this.bossMenuData.jobRankList));
                        if (this.vModelData.isRankEdit) {
                            this.disableSortable();
                            this.vModelData.isRankEdit = false;
                        }
                        this.selectedData.fakeJobRankList = JSON.parse(JSON.stringify(this.bossMenuData.jobRankList));
                        this.waitingOverlay = false;
                    }, 3000);
                    break;
                case "ADD_NOTIFICATION":
                    if (this.notifications.length >= 4) {
                        setTimeout(() => {
                            this.notifications.push(event.data.payload);
                            this.notifyShow = true;
                        }, 2000);
                    } else {
                        this.notifications.push(event.data.payload);
                        this.notifyShow = true;
                    }
                    break;
                case "UPLOAD_DEFAULT_PERMISSIONS":
                    this.defaultPermissions = event.data.payload;
                    break;

                default:
                    break;
            }
        }
    },
    computed: {
        getCurrentCategory() {
            return this.categories.find(category => category.name === this.currentPage);
        },
        filterbyEmployee() {
            const dataCopy = JSON.parse(JSON.stringify(this.bossMenuData));
            const employeesArray = Array.isArray(dataCopy.employees) ? dataCopy.employees : Object.values(dataCopy.employees || {});
            if (!this.vModelData.employeeSearch || this.vModelData.employeeSearch.trim() === "") {
                return employeesArray;
            }

            const searchQuery = this.vModelData.employeeSearch.toLowerCase();
            return employeesArray.filter(employee => employee.playerName && employee.playerName.toLowerCase().includes(searchQuery));
        },
        filterbyRank() {
            const rankSearchInput = this.vModelData.rankSearchInput?.toLowerCase() || "";

            if (this.bossMenuData.jobRankList.length === 0) {
                return [];
            }
            let ranks = JSON.parse(JSON.stringify(this.bossMenuData.jobRankList));
            return ranks;
        },
        filterbyOutfit() {
            const dataCopy = JSON.parse(JSON.stringify(this.bossMenuData));

            if (!dataCopy || !dataCopy.outfitList) {
                return [];
            }

            const outfitNameInput = this.vModelData.outfitNameInput?.toLowerCase() || "";

            return dataCopy.outfitList.filter(outfit => outfit.name.toLowerCase() === outfitNameInput || outfit.name.toLowerCase().includes(outfitNameInput));
        },

        getBossMenuCoords() {
            try {
                let settings = JSON.parse(JSON.stringify(this.bossMenuData.jobSettings));
                let coords = JSON.parse(JSON.stringify(settings.jobBossMenuCoords || "{}"));
                return `${coords.x}, ${coords.y}, ${coords.z}`;
            } catch (e) {
                return "";
            }
        },
        getStashCoords() {
            try {
                let settings = JSON.parse(JSON.stringify(this.bossMenuData.jobSettings));
                let coords = JSON.parse(JSON.stringify(settings.jobStashCoords || "{}"));
                return `${coords.x}, ${coords.y}, ${coords.z}`;
            } catch (e) {
                return "";
            }
        }
    }
});

app.use(store).mount("#app");
var resourceName = "tworst-bossmenu";

if (window.GetParentResourceName) {
    resourceName = window.GetParentResourceName();
}

window.postNUI = async (name, data) => {
    try {
        const response = await fetch(`https://${resourceName}/${name}`, {
            method: "POST",
            mode: "cors",
            cache: "no-cache",
            credentials: "same-origin",
            headers: {
                "Content-Type": "application/json"
            },
            redirect: "follow",
            referrerPolicy: "no-referrer",
            body: JSON.stringify(data)
        });
        return !response.ok ? null : response.json();
    } catch (error) {
        // console.log(error)
    }
};

function clicksound(val) {
    let audioPath = `./sound/${val}`;
    audioPlayer = new Howl({
        src: [audioPath]
    });
    audioPlayer.volume(0.4);
    audioPlayer.play();
}

function stopsound() {
    if (audioPlayer) {
        audioPlayer.stop();
    }
}
