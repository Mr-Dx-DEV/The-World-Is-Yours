QBShared = QBShared or {}
QBShared.ForceJobDefaultDutyAtLogin = true
QBShared.Jobs = {
    ["emergency"] = {
        label = "Emergency Vehicle Dealer",
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            ["2"] = {
                name = "Business Sales",
                payment = 100,
            },
            ["1"] = {
                name = "Showroom Sales",
                payment = 75,
            },
            ["4"] = {
                name = "Manager",
                payment = 150,
                isboss = true,
            },
            ["3"] = {
                name = "Finance",
                payment = 125,
            },
            ["0"] = {
                name = "Recruit",
                payment = 50,
            },
        }
    },
    ["sahp"] = {
        label = "San Andreas Highway Patrol",
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            ["2"] = {
                name = "Senior Officer",
                payment = 600,
            },
            ["1"] = {
                name = "Officer",
                payment = 500,
            },
            ["4"] = {
                name = "Sergeant",
                payment = 800,
            },
            ["3"] = {
                name = "Corporal",
                payment = 700,
            },
            ["0"] = {
                name = "Recruit",
                payment = 350,
            },
            ["10"] = {
                name = "Colonel",
                payment = 2500,
                isboss = true,
            },
            ["9"] = {
                name = "Lt Colonel",
                payment = 2000,
                isboss = true,
            },
            ["6"] = {
                name = "Captain",
                payment = 1000,
            },
            ["5"] = {
                name = "Lieutenant",
                payment = 900,
            },
            ["8"] = {
                name = "Major",
                payment = 1800,
            },
            ["7"] = {
                name = "Commander",
                payment = 1500,
            },
        }
    },
    ["sadoc"] = {
        label = "San Andreas Department of Corrections",
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            ["2"] = {
                name = "Senior Correction Officer",
                payment = 600,
            },
            ["1"] = {
                name = "Correction Officer",
                payment = 500,
            },
            ["4"] = {
                name = "Sergeant",
                payment = 800,
            },
            ["3"] = {
                name = "Corporal",
                payment = 700,
            },
            ["0"] = {
                name = "CO Recruit",
                payment = 350,
            },
            ["10"] = {
                name = "Warden",
                payment = 2500,
                isboss = true,
            },
            ["9"] = {
                name = "Deputy Warden",
                payment = 2000,
                isboss = true,
            },
            ["6"] = {
                name = "Captain",
                payment = 1000,
            },
            ["5"] = {
                name = "Lieutenant",
                payment = 900,
            },
            ["8"] = {
                name = "Colonel",
                payment = 1800,
            },
            ["7"] = {
                name = "Major",
                payment = 1500,
            },
        }
    },
    ["mechanic"] = {
        label = "LS Customs",
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            ["2"] = {
                name = "Experienced",
                payment = 100,
            },
            ["1"] = {
                name = "Novice",
                payment = 75,
            },
            ["4"] = {
                name = "Manager",
                payment = 150,
                isboss = true,
            },
            ["3"] = {
                name = "Advanced",
                payment = 125,
            },
            ["0"] = {
                name = "Recruit",
                payment = 50,
            },
        }
    },
    ["lawyer"] = {
        label = "Law Firm",
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            ["0"] = {
                name = "Associate",
                payment = 50,
            },
        }
    },
    ["dealership"] = {
        label = "Vehicle Dealer",
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            ["2"] = {
                name = "Business Sales",
                payment = 100,
            },
            ["1"] = {
                name = "Showroom Sales",
                payment = 75,
            },
            ["4"] = {
                name = "Manager",
                payment = 150,
                isboss = true,
            },
            ["3"] = {
                name = "Finance",
                payment = 125,
            },
            ["0"] = {
                name = "Recruit",
                payment = 50,
            },
        }
    },
    ["cardealer"] = {
        label = "Vehicle Dealer",
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            ["2"] = {
                name = "Business Sales",
                payment = 100,
            },
            ["1"] = {
                name = "Showroom Sales",
                payment = 75,
            },
            ["4"] = {
                name = "Manager",
                payment = 150,
                isboss = true,
            },
            ["3"] = {
                name = "Finance",
                payment = 125,
            },
            ["0"] = {
                name = "Recruit",
                payment = 50,
            },
        }
    },
    ["truck"] = {
        label = "Truck Vehicle Dealer",
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            ["2"] = {
                name = "Business Sales",
                payment = 100,
            },
            ["1"] = {
                name = "Showroom Sales",
                payment = 75,
            },
            ["4"] = {
                name = "Manager",
                payment = 150,
                isboss = true,
            },
            ["3"] = {
                name = "Finance",
                payment = 125,
            },
            ["0"] = {
                name = "Recruit",
                payment = 50,
            },
        }
    },
    ["whitewidow"] = {
        label = "White Widow",
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            ["2"] = {
                name = "Sales",
                payment = 100,
            },
            ["1"] = {
                name = "Deliveries",
                payment = 75,
            },
            ["4"] = {
                name = "Assistant Manager",
                payment = 150,
                isboss = true,
            },
            ["3"] = {
                name = "Grower",
                payment = 125,
            },
            ["6"] = {
                name = "Owner",
                payment = 150,
                isboss = true,
            },
            ["5"] = {
                name = "Manager",
                payment = 150,
                isboss = true,
            },
            ["0"] = {
                name = "Trainee",
                payment = 50,
            },
        }
    },
    ["tobacco"] = {
        label = "Tobacco Farmer",
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            ["0"] = {
                name = "Farmhand",
                payment = 50,
            },
            ["1"] = {
                name = "Owner",
                payment = 75,
                isboss = true,
            },
        }
    },
    ["ss"] = {
        label = "U.S. Secret Service",
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            ["2"] = {
                name = "Sergeant",
                payment = 600,
            },
            ["1"] = {
                name = "Officer",
                payment = 500,
            },
            ["4"] = {
                name = "Agent IPO",
                payment = 800,
            },
            ["3"] = {
                name = "Lieutenant",
                payment = 700,
            },
            ["0"] = {
                name = "Recruit",
                payment = 350,
            },
            ["10"] = {
                name = "Director",
                payment = 3500,
                isboss = true,
            },
            ["9"] = {
                name = "Deputy Director",
                payment = 2500,
                isboss = true,
            },
            ["6"] = {
                name = "Special special Agent",
                payment = 1000,
            },
            ["5"] = {
                name = "Special Agent",
                payment = 900,
            },
            ["8"] = {
                name = "Special Agent in Charge",
                payment = 2000,
            },
            ["7"] = {
                name = "Deputy SAiC",
                payment = 1500,
            },
        }
    },
    ["dhs"] = {
        label = "Department of Homeland Security",
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            ["2"] = {
                name = "Lead Agent",
                payment = 600,
            },
            ["1"] = {
                name = "Senior Agent",
                payment = 500,
            },
            ["4"] = {
                name = "Field Opps Super ",
                payment = 800,
            },
            ["3"] = {
                name = "Supervisor Agent",
                payment = 700,
            },
            ["0"] = {
                name = "Recruit BPA",
                payment = 350,
            },
            ["10"] = {
                name = "Director",
                payment = 3500,
                isboss = true,
            },
            ["9"] = {
                name = "Deputy Diector",
                payment = 2500,
                isboss = true,
            },
            ["6"] = {
                name = "Special Agent in Charge",
                payment = 1000,
            },
            ["5"] = {
                name = "Special Operations Supervisor",
                payment = 900,
            },
            ["8"] = {
                name = "Chief",
                payment = 2000,
            },
            ["7"] = {
                name = "Deputy Chief",
                payment = 1500,
            },
        }
    },
    ["usms"] = {
        label = "U.S. Marshal Service",
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            ["2"] = {
                name = "Senior Marshal",
                payment = 900,
            },
            ["1"] = {
                name = "Marshal",
                payment = 600,
            },
            ["4"] = {
                name = "Tactical Opps Div",
                payment = 1200,
            },
            ["3"] = {
                name = "Marshal In Charge",
                payment = 1000,
            },
            ["0"] = {
                name = "Recruit Marshal",
                payment = 400,
            },
            ["10"] = {
                name = "Director",
                payment = 3500,
                isboss = true,
            },
            ["9"] = {
                name = "Deputy Director",
                payment = 2500,
                isboss = true,
            },
            ["6"] = {
                name = "Witness Security Div",
                payment = 1200,
            },
            ["5"] = {
                name = "Investigation Div",
                payment = 1200,
            },
            ["8"] = {
                name = "Associate Director",
                payment = 2000,
            },
            ["7"] = {
                name = "Judicial Security Div",
                payment = 1500,
            },
        }
    },
    ["bestbuds"] = {
        label = "Best Buds",
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            ["2"] = {
                name = "Sales",
                payment = 100,
            },
            ["1"] = {
                name = "Deliveries",
                payment = 75,
            },
            ["4"] = {
                name = "Assistant Manager",
                payment = 150,
                isboss = true,
            },
            ["3"] = {
                name = "Grower",
                payment = 125,
            },
            ["6"] = {
                name = "Owner",
                payment = 150,
                isboss = true,
            },
            ["5"] = {
                name = "Manager",
                payment = 150,
                isboss = true,
            },
            ["0"] = {
                name = "Trainee",
                payment = 50,
            },
        }
    },
    ["kittys"] = {
        label = "Kittys Motor Work",
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            ["2"] = {
                name = "Experienced",
                payment = 100,
            },
            ["1"] = {
                name = "Novice",
                payment = 75,
            },
            ["4"] = {
                name = "Manager",
                payment = 150,
                isboss = true,
            },
            ["3"] = {
                name = "Advanced",
                payment = 125,
            },
            ["5"] = {
                name = "Owner",
                payment = 300,
                isboss = true,
            },
            ["0"] = {
                name = "Recruit",
                payment = 50,
            },
        }
    },
    ["tow"] = {
        label = "Towing",
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            ["0"] = {
                name = "Driver",
                payment = 50,
            },
        }
    },
    ["mechanic3"] = {
        label = "LS Customs",
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            ["2"] = {
                name = "Experienced",
                payment = 100,
            },
            ["1"] = {
                name = "Novice",
                payment = 75,
            },
            ["4"] = {
                name = "Manager",
                payment = 150,
                isboss = true,
            },
            ["3"] = {
                name = "Advanced",
                payment = 125,
            },
            ["0"] = {
                name = "Recruit",
                payment = 50,
            },
        }
    },
    ["boats"] = {
        label = "Boat Vehicle Dealer",
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            ["2"] = {
                name = "Business Sales",
                payment = 100,
            },
            ["1"] = {
                name = "Showroom Sales",
                payment = 75,
            },
            ["4"] = {
                name = "Manager",
                payment = 150,
                isboss = true,
            },
            ["3"] = {
                name = "Finance",
                payment = 125,
            },
            ["0"] = {
                name = "Recruit",
                payment = 50,
            },
        }
    },
    ["firefighter"] = {
        label = "Fire Fighter",
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            ["2"] = {
                name = "Doctor",
                payment = 100,
            },
            ["1"] = {
                name = "Paramedic",
                payment = 75,
            },
            ["4"] = {
                name = "Chief",
                payment = 150,
                isboss = true,
            },
            ["3"] = {
                name = "Surgeon",
                payment = 125,
            },
            ["0"] = {
                name = "Recruit",
                payment = 50,
            },
        }
    },
    ['judge'] = {
        label = 'Honorary',
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            ['0'] = {
                name = 'Judge',
                payment = 100,
            },
        }
    },
    ["doj"] = {
        label = "Department of Justice",
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            ["0"] = {
                name = "Bailiff",
                payment = 500,
            },
            ['1'] = {
                name = 'JC',
                payment = 900,
            },
            ['2'] = {
                name = 'ADA',
                payment = 1500,
            },
            ['3'] = {
                name = 'DA',
                payment = 3000,
            },
            ['4'] = {
                name = 'AssociatJudge',
                payment = 3000,
                isboss = true,
            },
            ['5'] = {
                name = 'SeniorJudge',
                payment = 3200,
                isboss = true,
            },
            ['6'] = {
                name = 'Judge',
                payment = 3500,
                isboss = true,
            },
        }
    },
    ["garbage"] = {
        label = "Garbage",
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            ["0"] = {
                name = "Collector",
                payment = 50,
            },
        }
    },
    ["hotdog"] = {
        label = "Hotdog",
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            ["0"] = {
                name = "Sales",
                payment = 50,
            },
        }
    },
    ["afterlife"] = {
        label = "afterlife",
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            ["0"] = {
                name = "afterlife",
                payment = 50,
            },
        }
    },
    ["air"] = {
        label = "Air Vehicle Dealer",
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            ["2"] = {
                name = "Business Sales",
                payment = 100,
            },
            ["1"] = {
                name = "Showroom Sales",
                payment = 75,
            },
            ["4"] = {
                name = "Manager",
                payment = 150,
                isboss = true,
            },
            ["3"] = {
                name = "Finance",
                payment = 125,
            },
            ["0"] = {
                name = "Recruit",
                payment = 50,
            },
        }
    },
    ["billiards"] = {
        label = "billiards",
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            ["2"] = {
                name = "Deliveries",
                payment = 100,
            },
            ["1"] = {
                name = "Wait Staff",
                payment = 75,
            },
            ["4"] = {
                name = "Floor Manager",
                payment = 150,
                isboss = true,
            },
            ["3"] = {
                name = "Bartender",
                payment = 125,
            },
            ["6"] = {
                name = "Owner",
                payment = 150,
                isboss = true,
            },
            ["5"] = {
                name = "General Manager",
                payment = 150,
                isboss = true,
            },
            ["0"] = {
                name = "Dishwasher",
                payment = 50,
            },
        }
    },
    ["bus"] = {
        label = "Bus",
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            ["0"] = {
                name = "Driver",
                payment = 50,
            },
        }
    },
    ["ambulance"] = {
        label = "EMS",
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            ["2"] = {
                name = "Doctor",
                payment = 100,
            },
            ["1"] = {
                name = "Paramedic",
                payment = 75,
            },
            ["4"] = {
                name = "Chief",
                payment = 150,
                isboss = true,
            },
            ["3"] = {
                name = "Surgeon",
                payment = 125,
            },
            ["0"] = {
                name = "Recruit",
                payment = 50,
            },
        }
    },
    ["beeker"] = {
        label = "Beeker's Garage",
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            ["2"] = {
                name = "Experienced",
                payment = 100,
            },
            ["1"] = {
                name = "Novice",
                payment = 75,
            },
            ["4"] = {
                name = "Manager",
                payment = 150,
                isboss = true,
            },
            ["3"] = {
                name = "Advanced",
                payment = 125,
            },
            ["0"] = {
                name = "Recruit",
                payment = 50,
            },
        }
    },
    ["casino"] = {
        label = "Casino",
        defaultDuty = true,
        offDutyPay = nil,
        grades = {
            ["2"] = {
                name = "Boss",
                payment = 200,
                isboss = true,
            },
            ["1"] = {
                name = "Experienced",
                payment = 100,
            },
            ["0"] = {
                name = "Novice",
                payment = 50,
            },
        }
    },
    ["bennys"] = {
        label = "Benny's Original Motor Works",
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            ["2"] = {
                name = "Experienced",
                payment = 100,
            },
            ["1"] = {
                name = "Novice",
                payment = 75,
            },
            ["4"] = {
                name = "Manager",
                payment = 150,
                isboss = true,
            },
            ["3"] = {
                name = "Advanced",
                payment = 125,
            },
            ["0"] = {
                name = "Recruit",
                payment = 50,
            },
        }
    },
    ["burgershot"] = {
        label = "BurgerShot",
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            ["2"] = {
                name = "Experienced",
                payment = 100,
            },
            ["1"] = {
                name = "Novice",
                payment = 75,
            },
            ["4"] = {
                name = "Manager",
                payment = 150,
                isboss = true,
            },
            ["3"] = {
                name = "Advanced",
                payment = 125,
            },
            ["0"] = {
                name = "Recruit",
                payment = 50,
            },
        }
    },
    ["safw"] = {
        label = "San Andreas Fish and Wildlife",
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            ["2"] = {
                name = "Senior Officer",
                payment = 600,
            },
            ["1"] = {
                name = "Officer",
                payment = 500,
            },
            ["4"] = {
                name = "Sergeant",
                payment = 800,
            },
            ["3"] = {
                name = "Corporal",
                payment = 700,
            },
            ["0"] = {
                name = "Recruit",
                payment = 350,
            },
            ["10"] = {
                name = "Chief",
                payment = 2500,
                isboss = true,
            },
            ["9"] = {
                name = "Asst. Chief",
                payment = 2000,
                isboss = true,
            },
            ["6"] = {
                name = "Captain",
                payment = 1000,
            },
            ["5"] = {
                name = "Lieutenant",
                payment = 900,
            },
            ["8"] = {
                name = "Deputy Chief",
                payment = 1800,
            },
            ["7"] = {
                name = "Commander",
                payment = 1500,
            },
        }
    },
    ["taxi"] = {
        label = "Taxi",
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            ["2"] = {
                name = "Event Driver",
                payment = 100,
            },
            ["1"] = {
                name = "Driver",
                payment = 75,
            },
            ["4"] = {
                name = "Manager",
                payment = 150,
                isboss = true,
            },
            ["3"] = {
                name = "Sales",
                payment = 125,
            },
            ["0"] = {
                name = "Recruit",
                payment = 50,
            },
        }
    },
    ["vineyard"] = {
        label = "Vineyard",
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            ["0"] = {
                name = "Picker",
                payment = 50,
            },
        }
    },
    ["realestate"] = {
        label = "Real Estate",
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            ["2"] = {
                name = "Business Sales",
                payment = 100,
            },
            ["1"] = {
                name = "House Sales",
                payment = 75,
            },
            ["4"] = {
                name = "Manager",
                payment = 150,
                isboss = true,
            },
            ["3"] = {
                name = "Broker",
                payment = 125,
            },
            ["0"] = {
                name = "Recruit",
                payment = 50,
            },
        }
    },
    ["bcso"] = {
        label = "Blaine County Sheriff Office",
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            ["0"] = {
                name = "Recruit",
                payment = 350,
            },
            ["1"] = {
                name = "Deputy",
                payment = 500,
            },
            ["2"] = {
                name = "Senior Deputy",
                payment = 600,
            },
            ["3"] = {
                name = "Corporal",
                payment = 700,
            },
            ["4"] = {
                name = "Sergeant",
                payment = 800,
            },
            ["5"] = {
                name = "Lieutenant",
                payment = 900,
            },
            ["6"] = {
                name = "Captain",
                payment = 1000,
            },
            ["7"] = {
                name = "Major",
                payment = 1500,
            },
            ["8"] = {
                name = "Chief Deputy",
                payment = 1800,
            },
            ["9"] = {
                name = "Under Sheriff",
                payment = 2000,
                isboss = true,
            },
            ["10"] = {
                name = "Sheriff",
                payment = 2500,
                isboss = true,
            },
        }
    },
    ["unemployed"] = {
        label = "Civilian",
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            ["0"] = {
                name = "Freelancer",
                payment = 10,
            },
        }
    },
    ["mosleys"] = {
        label = "Mosley Motor Works",
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            ["2"] = {
                name = "Experienced",
                payment = 100,
            },
            ["1"] = {
                name = "Novice",
                payment = 75,
            },
            ["4"] = {
                name = "Manager",
                payment = 150,
                isboss = true,
            },
            ["3"] = {
                name = "Advanced",
                payment = 125,
            },
            ["5"] = {
                name = "Owner",
                payment = 300,
                isboss = true,
            },
            ["0"] = {
                name = "Recruit",
                payment = 50,
            },
        }
    },
    ["pdm"] = {
        label = "PDM Vehicle Dealer",
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            ["2"] = {
                name = "Business Sales",
                payment = 100,
            },
            ["1"] = {
                name = "Showroom Sales",
                payment = 75,
            },
            ["4"] = {
                name = "Manager",
                payment = 150,
                isboss = true,
            },
            ["3"] = {
                name = "Finance",
                payment = 125,
            },
            ["0"] = {
                name = "Recruit",
                payment = 50,
            },
        }
    },
    ["salsa"] = {
        label = "San Adreas Live Stock Agency",
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            ["2"] = {
                name = "Senior Agent",
                payment = 800,
            },
            ["1"] = {
                name = "Agent",
                payment = 600,
            },
            ["4"] = {
                name = "Deputy Commissioner",
                payment = 2500,
                isboss = true,
            },
            ["3"] = {
                name = "Inspector",
                payment = 1000,
            },
            ["5"] = {
                name = "Commissioner",
                payment = 3500,
                isboss = true,
            },
            ["0"] = {
                name = "Recruit Agent",
                payment = 400,
            },
        }
    },
    ["wiy"] = {
        label = "WIY Vehicle Dealer",
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            ["2"] = {
                name = "Business Sales",
                payment = 100,
            },
            ["1"] = {
                name = "Showroom Sales",
                payment = 75,
            },
            ["4"] = {
                name = "Manager",
                payment = 150,
                isboss = true,
            },
            ["3"] = {
                name = "Finance",
                payment = 125,
            },
            ["0"] = {
                name = "Recruit",
                payment = 50,
            },
        }
    },
    ["trucker"] = {
        label = "Trucker",
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            ["0"] = {
                name = "Driver",
                payment = 50,
            },
        }
    },
    ["reporter"] = {
        label = "Reporter",
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            ["0"] = {
                name = "Journalist",
                payment = 50,
            },
        }
    },
    ["jobresetelectrician"] = {
        label = "etelectrician",
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            ["2"] = {
                name = "Event Driver",
                payment = 100,
            },
            ["1"] = {
                name = "Driver",
                payment = 75,
            },
            ["4"] = {
                name = "Manager",
                payment = 150,
                isboss = true,
            },
            ["3"] = {
                name = "Sales",
                payment = 125,
            },
            ["0"] = {
                name = "Recruit",
                payment = 50,
            },
        }
    },
    ["fbi"] = {
        label = "FBI",
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            ["2"] = {
                name = "Senior Special Agent",
                payment = 900,
            },
            ["1"] = {
                name = "Special Agent ",
                payment = 600,
            },
            ["4"] = {
                name = "Tactical/Training SAIC",
                payment = 1200,
            },
            ["3"] = {
                name = "Supervisory Special Agent",
                payment = 1000,
            },
            ["0"] = {
                name = "Recruit Special Agent",
                payment = 400,
            },
            ["10"] = {
                name = "Director",
                payment = 3500,
                isboss = true,
            },
            ["9"] = {
                name = "Deputy Director",
                payment = 2500,
                isboss = true,
            },
            ["6"] = {
                name = "Labor/Finance SAIC",
                payment = 1200,
            },
            ["5"] = {
                name = "Criminal Investigation SAIC",
                payment = 1200,
            },
            ["8"] = {
                name = "Associat Deputy Director",
                payment = 2000,
            },
            ["7"] = {
                name = "National Security SAIC",
                payment = 1200,
            },
        }
    },
    ["diver"] = {
        label = "Diving",
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            ["2"] = {
                name = "Experienced",
                payment = 100,
            },
            ["1"] = {
                name = "Novice",
                payment = 75,
            },
            ["4"] = {
                name = "Manager",
                payment = 150,
                isboss = true,
            },
            ["3"] = {
                name = "Advanced",
                payment = 125,
            },
            ["0"] = {
                name = "Recruit",
                payment = 50,
            },
        }
    },
    ["lsso"] = {
        label = "Los Santos Sheriff Office",
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            ["2"] = {
                name = "Senior Deputy",
                payment = 600,
            },
            ["1"] = {
                name = "Deputy",
                payment = 500,
            },
            ["4"] = {
                name = "Sergeant",
                payment = 800,
            },
            ["3"] = {
                name = "Corporal",
                payment = 700,
            },
            ["0"] = {
                name = "Recruit",
                payment = 350,
            },
            ["10"] = {
                name = "Sheriff",
                payment = 2500,
                isboss = true,
            },
            ["9"] = {
                name = "Under Sheriff",
                payment = 2000,
                isboss = true,
            },
            ["6"] = {
                name = "Captain",
                payment = 1000,
            },
            ["5"] = {
                name = "Lieutenant",
                payment = 900,
            },
            ["8"] = {
                name = "Chief Deputy",
                payment = 1800,
            },
            ["7"] = {
                name = "Major",
                payment = 1500,
            },
        }
    },
    ["jobresetgardener"] = {
        label = "gardener",
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            ["2"] = {
                name = "Event Driver",
                payment = 100,
            },
            ["1"] = {
                name = "Driver",
                payment = 75,
            },
            ["4"] = {
                name = "Manager",
                payment = 150,
                isboss = true,
            },
            ["3"] = {
                name = "Sales",
                payment = 125,
            },
            ["0"] = {
                name = "Recruit",
                payment = 50,
            },
        }
    },
    ["lspd"] = {
        label = "Los Santos Police Dept",
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            ["2"] = {
                name = "Senior Officer",
                payment = 600,
            },
            ["1"] = {
                name = "Officer",
                payment = 500,
            },
            ["12"] = {
                name = "Commissioner",
                payment = 3500,
                isboss = true,
            },
            ["11"] = {
                name = "Deputy Commissioner",
                payment = 3000,
                isboss = true,
            },
            ["0"] = {
                name = "Recruit",
                payment = 350,
            },
            ["10"] = {
                name = "Chief",
                payment = 2500,
                isboss = true,
            },
            ["9"] = {
                name = "Asst. Chief",
                payment = 2000,
                isboss = true,
            },
            ["3"] = {
                name = "Corporal",
                payment = 700,
            },
            ["4"] = {
                name = "Sergeant",
                payment = 800,
            },
            ["6"] = {
                name = "Captain",
                payment = 1000,
            },
            ["5"] = {
                name = "Lieutenant",
                payment = 900,
            },
            ["8"] = {
                name = "Deputy Chief",
                payment = 1800,
            },
            ["7"] = {
                name = "Commander",
                payment = 1500,
            },
        }
    },
    ["police"] = {
        label = "San Andreas Department of Public Safety Commissioners Office",
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            ["2"] = {
                name = "Senior",
                payment = 1800,
            },
            ["1"] = {
                name = "Agent",
                payment = 1500,
            },
            ["4"] = {
                name = "Commissioner",
                payment = 5000,
                isboss = true,
            },
            ["3"] = {
                name = "Deputy Commisioner",
                payment = 4000,
                isboss = true,
            },
            ["0"] = {
                name = "Canadet",
                payment = 1000,
            },
        }
    },
    ["mechanic2"] = {
        label = "LS Customs",
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            ["2"] = {
                name = "Experienced",
                payment = 100,
            },
            ["1"] = {
                name = "Novice",
                payment = 75,
            },
            ["4"] = {
                name = "Manager",
                payment = 150,
                isboss = true,
            },
            ["3"] = {
                name = "Advanced",
                payment = 125,
            },
            ["0"] = {
                name = "Recruit",
                payment = 50,
            },
        }
    },
    ["catcafe"] = {
        label = "Cat Cafe",
        defaultDuty = true,
        offDutyPay = nil,
        grades = {
            ["2"] = {
                name = "Experienced",
                payment = 100,
            },
            ["1"] = {
                name = "Novice",
                payment = 75,
            },
            ["4"] = {
                name = "Manager",
                payment = 150,
                isboss = true,
            },
            ["3"] = {
                name = "Advanced",
                payment = 125,
            },
            ["0"] = {
                name = "Recruit",
                payment = 50,
            },
        }
    },
    ['cityhall'] = {
        label = 'CityHall',
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            ['0'] = {
                name = 'Government Staff',
				isboss = false,
                payment = 550
            },
			['1'] = {
                name = 'Mayor',
				isboss = true,
                payment = 4000
            },
        },
    },
}
