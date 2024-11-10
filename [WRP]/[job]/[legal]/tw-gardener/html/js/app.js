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
    data: () => ({
        mainShow: false,
        progressShow: true,
        progressbar: 0,
        progressbarLabel: "",
        interval: null,
        playerShow: false,
        finishShow: false,
        scoreBoxShow: false,
        requestMenuShow: false,
        serverName: "TWORST",
        serverMoneyType: "$",
        reqestHostName: "",
        hostIdentifier: "",
        progressData: false,
        Locales: {},
        invitePlayer: {
            1: false,
            2: false,
            3: false,
            4: false
        },
        finishjobData: false,
        inviteModal: "",
        playerData: {
            name: "Samet Kırıcı",
            bank: 56000,
            identifier: "A",
            owner: true,
            image: "https://cdn.discordapp.com/attachments/1096751382435987477/1216107608088383558/Rectangle_8.png?ex=65ff2f77&is=65ecba77&hm=2ee0757dc12ec3bec16ecfa4c6ccd92a0da34530409d0964bbb6b863d5c1ccc3&"
        },
        playerList: [
            {
                level: 1,
                owner: true,
                name: "Yusuf Turk",
                identifier: "KUR10469",
                src: 1,
                image: "https://cdn.discordapp.com/attachments/1096751382435987477/1216815442664886394/Rectangle_8.png?ex=6601c2b0&is=65ef4db0&hm=63be976059d626cd196eb859f1e41b4c8b08cff8d00873e4e2d0a91a27e0c7aa&"
            },
            {
                level: 2,
                owner: false,
                name: "Yusuf Turkmk",
                identifier: "KUR104699",
                src: 2,
                image: "https://cdn.discordapp.com/attachments/1096751382435987477/1216815442664886394/Rectangle_8.png?ex=6601c2b0&is=65ef4db0&hm=63be976059d626cd196eb859f1e41b4c8b08cff8d00873e4e2d0a91a27e0c7aa&"
            }
        ],
        xpData: {
            requiredXp: 500,
            nextLevelXp: 1000,
            currentLevelXp: 500,
            level: 4
        },
        missionData: [
            {
                name: "Watering1",
                description: "Water the plants",
                location: "Los Santos",
                minLevel: 0,
                jobTask: [{ name: "Clear" }, { name: "Water" }],
                awards: {
                    money: 56000,
                    exp: 100
                }
            },
            {
                name: "Watering2",
                description: "Water the plants",
                location: "Los Santos",
                minLevel: 1,
                jobTask: [{ name: "Clear" }, { name: "Water" }],
                awards: {
                    money: 65000,
                    exp: 100
                }
            },
            {
                name: "Watering3",
                description: "Water the plants",
                location: "Los Santos",
                minLevel: 2,
                jobTask: [{ name: "Clear" }, { name: "Water" }],
                awards: {
                    money: 56000,
                    exp: 100
                }
            },
            {
                name: "Watering4",
                description: "Water the plants",
                location: "Los Santos",
                minLevel: 3,
                jobTask: [{ name: "Clear" }, { name: "Water" }],
                awards: {
                    money: 56000,
                    exp: 100
                }
            }
        ],
        jobStart: false,

        selectJobData: false
    }),

    watch: {},

    beforeDestroy() {},
    mounted() {
        window.addEventListener("keyup", this.keyHandler);
        window.addEventListener("message", this.eventHandler);
    },

    methods: {
        startProgress(label, time) {
            clicksound("gardener.ogg");
            this.progressbarLabel = label;
            this.progressbar = 0;
            clearInterval(this.interval);

            const updateInterval = 100;
            const iterations = (time * 1000) / updateInterval;

            let iterationCount = 0;
            this.interval = setInterval(() => {
                iterationCount++;
                this.progressbar += 100 / iterations;

                if (iterationCount >= iterations) {
                    clearInterval(this.interval);
                    setTimeout(() => {
                        stopsound();
                        this.progressbar = 0;
                        this.progressbarLabel = "";
                    }, 1000);
                }
            }, updateInterval);
        },
        firePlayer(identifier, key) {
            if (identifier == null) {
                this.invitePlayer[key] = true;
                return;
            }
            if (identifier == this.playerData.identifier) {
                return;
            }

            const index = this.playerList.findIndex(player => player.identifier === identifier);
            const owner = this.playerList.findIndex(player => player.owner === true);
            if (this.playerList[index].identifier === this.playerList[owner].identifier) {
                return;
            }
            if (index !== -1) {
                if (this.playerList[owner].owner) {
                    clicksound("click.wav");
                    postNUI("firePlayer", { lobbyID: this.playerList[owner].identifier, identifier: identifier, targetID: this.playerList[index].src });
                }
            }
        },
        InvitePlayer(key) {
            if (this.inviteModal.length > 0) {
                postNUI("invitePlayer", { targetID: this.inviteModal, key: key });
                this.invitePlayer[key] = !this.invitePlayer[key];
                this.inviteModal = "";
                clicksound("click.wav");
                return;
            } else {
                this.invitePlayer[key] = !this.invitePlayer[key];
                clicksound("click.wav");
                return;
            }
        },
        declineInvite() {
            clicksound("errorclick.mp3");
            this.requestMenuShow = false;
            // postNUI("declineInvite", {identifier: this.playerData.identifier});
        },
        acceptInvite() {
            clicksound("click.wav");
            this.requestMenuShow = false;
            postNUI("acceptInvite", { hostIdentifier: this.hostIdentifier });
        },
        openInveteModel(identifier, key) {
            clicksound("click.wav");
            const index = this.playerList.findIndex(player => player.identifier === identifier);
            if (this.playerList[index].owner) {
                this.invitePlayer[key] = !this.invitePlayer[key];
            }
        },
        selectMission(data) {
            let identifier = this.playerData.identifier;
            if (identifier == null) {
                return;
            }

            const identifierData = this.playerList.findIndex(player => player.identifier === identifier);
            const owner = this.playerList.findIndex(player => player.owner === true);
            if (this.playerList[identifierData].identifier === this.playerList[owner].identifier) {
                if (this.selectJobData == "NOSELECT" || this.selectJobData == false || this.selectJobData) {
                    if (data.name == this.selectJobData.name) {
 
                        postNUI("selectMission", "NOSELECT");
                        clicksound("click.wav");
                        return;
                    }
                }

                const index = this.missionData.findIndex(mission => mission.name === data.name);
                if (this.missionData[index].minLevel > this.playerData.level) {
                    clicksound("errorclick.mp3");
                    return;
                }

                // this.selectJobData = this.missionData[index];
                postNUI("selectMission", this.missionData[index]);
                clicksound("click.wav");
            }
        },
        formatJobRequeire(value) {
            if (value == null) return 0;
            if (value == 2 || value == 4) {
                return value - 1;
            } else {
                return value;
            }
        },
        formatNumber(number) {
            if (number == null) return 0;
            return number.toLocaleString("tr-TR");
        },
        startJob() {
            if (this.jobStart) {
                clicksound("click.wav");
                postNUI("resetJob");
            } else {
                if (this.selectJobData) {
                    clicksound("click.wav");
                    postNUI("startJob", this.selectJobData);
                }
            }
        },
        keyHandler(event) {
            if (event.keyCode == 27) {
                this.closeNUI();
            }
        },
        closeNUI() {
            this.mainShow = false;
            postNUI("closeNUI");
        },
        eventHandler(event) {
            switch (event.data.action) {
                case "CHECK_NUI":
                    postNUI("checkNUI");
                    break;
                case "openGarden":
                    this.playerData = event.data.payload;
                    this.mainShow = true;
                    break;
                case "CLOSENUI":
                    this.mainShow = false;
                    break;
                case "START_JOB":
                    this.mainShow = false;
                    this.progressData = event.data.payload;
                    this.scoreBoxShow = true;
                    this.playerShow = true;
                    this.jobStart = true;
                    break;
                case "FINISH_JOB":
                    this.progressData = false;
                    this.scoreBoxShow = false;
                    this.playerShow = false;
                    this.selectJobData = false;
                    this.finishShow = true;
                    this.finishjobData = event.data.payload;
                    setTimeout(() => {
                        this.finishShow = false;
                        this.finishjobData = false;
                    }, 5000);
                    this.jobStart = false;
                    break;
                case "RESET_JOB":
                    this.progressData = false;
                    this.scoreBoxShow = false;
                    this.playerShow = false;
                    this.finishShow = false;
                    this.finishjobData = false;
                    this.jobStart = false;
                    this.selectJobData = false;
                    if (this.mainShow) {
                        this.mainShow = false;
                    }

                    break;
                case "REFRESH_JOBTASK":
                    this.progressData = event.data.payload;
                    break;
                case "showProgressBar":
                    this.startProgress(event.data.payload.label, event.data.payload.time);
                    break;
                case "SERVER_NAME":
                    this.serverName = event.data.payload;
                    break;
                case "SERVER_MONEY_TYPE":
                    this.serverMoneyType = event.data.payload;
                    break;
                case "SERVER_MISSIONS":
                    this.missionData = event.data.payload;
                    if (!this.missionData || !Array.isArray(this.missionData)) return;

                    for (let i = 0; i < this.missionData.length; i++) {
                        const entry = this.missionData[i];
                        if (!entry.jobTask || !Array.isArray(entry.jobTask)) continue;

                        for (let j = 0; j < entry.jobTask.length; j++) {
                            const task = entry.jobTask[j];

                            let lowerAreaLength = entry.lowerArea ? Math.floor(entry.lowerArea.length / 2) : 0;
                            let pruningAreaLength = entry.pruningArea ? Math.floor(entry.pruningArea.length / 2) : 0;

                            if (task.name === "grass") {
                                task.singleAmount = lowerAreaLength;
                                task.amount = entry.lowerArea.length;
                            } else if (task.name === "puring") {
                                task.singleAmount = pruningAreaLength;
                                task.amount = entry.pruningArea.length;
                            }
                        }
                    }
                    break;
                case "LOAD_LOBBY":
                    this.playerList = event.data.payload;
                    break;
                case "INVITE_MENU":
                    if (this.mainShow) {
                        this.mainShow = false;
                    }
                    this.requestMenuShow = true;
                    this.reqestHostName = event.data.payload.lobbyOwner;
                    this.hostIdentifier = event.data.payload.identifier;
                    this.playerData = event.data.payload.playerData;
                    break;
                case "REFRESH_LOBBY":

                    if (event.data.payload == "NOSELECT") {
                        this.selectJobData = false;
                    } else {
                        this.selectJobData = event.data.payload;
                    }

                    break;
                case "LOCALES":
                    this.Locales = event.data.payload;
                    break;
                default:
                    break;
            }
        }
    },
    computed: {
        progressPercentage() {
            if (this.playerData.xp == null || this.playerData.nextxp == null) return 0;
            let percentage = (this.playerData.xp / this.playerData.nextxp) * 100;
            if (percentage > 100) {
                return 100;
            }
            return percentage;
        }
    }
});

app.use(store).mount("#app");
var resourceName = "tworst-gardener";

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
    audioPlayer.volume(0.2);
    audioPlayer.play();
}

function stopsound() {
    if (audioPlayer) {
        audioPlayer.stop();
    }
}
