QBShared = QBShared or {}
QBShared.ForceJobDefaultDutyAtLogin = true -- true: Force duty state to jobdefaultDuty | false: set duty state from database last saved
QBShared.Jobs = {
	unemployed = { label = 'Civilian', defaultDuty = true, offDutyPay = false, grades = { ['0'] = { name = 'Freelancer', payment = 10 } } },
	bus = { label = 'Bus', defaultDuty = true, offDutyPay = false, grades = { ['0'] = { name = 'Driver', payment = 50 } } },
	judge = { label = 'Honorary', defaultDuty = true, offDutyPay = false, grades = { ['0'] = { name = 'Judge', payment = 100 } } },
	lawyer = { label = 'Law Firm', defaultDuty = true, offDutyPay = false, grades = { ['0'] = { name = 'Associate', payment = 50 } } },
	reporter = { label = 'Reporter', defaultDuty = true, offDutyPay = false, grades = { ['0'] = { name = 'Journalist', payment = 50 } } },
	trucker = { label = 'Trucker', defaultDuty = true, offDutyPay = false, grades = { ['0'] = { name = 'Driver', payment = 50 } } },
	tow = { label = 'Towing', defaultDuty = true, offDutyPay = false, grades = { ['0'] = { name = 'Driver', payment = 50 } } },
	garbage = { label = 'Garbage', defaultDuty = true, offDutyPay = false, grades = { ['0'] = { name = 'Collector', payment = 50 } } },
	vineyard = { label = 'Vineyard', defaultDuty = true, offDutyPay = false, grades = { ['0'] = { name = 'Picker', payment = 50 } } },
	hotdog = { label = 'Hotdog', defaultDuty = true, offDutyPay = false, grades = { ['0'] = { name = 'Sales', payment = 50 } } },


	['lspd'] = {
		label = 'LSPD',
        type = "leo",
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Recruit',
                payment = 350
            },
            ['1'] = {
                name = 'Officer',
                payment = 500
            },
            ['2'] = {
                name = 'Senior Officer',
                payment = 600
            },
            ['3'] = {
                name = 'Corporal',
                payment = 700
            },
            ['4'] = {
                name = 'Sergeant',
                payment = 800
            },
            ['5'] = {
                name = 'Lieutenant',
                payment = 900
            },
            ['6'] = {
                name = 'Captain',
                payment = 1000
            },
            ['7'] = {
                name = 'Commander',
                payment = 1500
            },
            ['8'] = {
                name = 'Deputy Chief',
                payment = 2000
            },
            ['9'] = {
                name = 'Asst. Chief',
                isboss = true,
                bankAuth = true,
                payment = 2500
            },
            ['10'] = {
                name = 'Chief',
                isboss = true,
                bankAuth = true,
                payment = 3500
            },
            ['11'] = {
                name = 'Deputy Commissioner',
                isboss = false,
                payment = 4000
            },
            ['12'] = {
                name = 'Commissioner',
                isboss = false,
                payment = 5000
            },
        },
	},
        ['bcso'] = {
		label = 'BCSO',
        type = "leo",
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Recruit',
                payment = 350
            },
            ['1'] = {
                name = 'Deputy',
                payment = 500
            },
            ['2'] = {
                name = 'Senior Deputy',
                payment = 600
            },
            ['3'] = {
                name = 'Corporal',
                payment = 700
            },
            ['4'] = {
                name = 'Sergeant',
                payment = 800
            },
            ['5'] = {
                name = 'Lieutenant',
                payment = 900
            },
            ['6'] = {
                name = 'Captain',
                payment = 1000
            },
            ['7'] = {
                name = 'Major',
                payment = 1500
            },
            ['8'] = {
                name = 'Chief Deputy',
                payment = 2000
            },
            ['9'] = {
                name = 'Under Sheriff',
                isboss = true,
                bankAuth = true,
                payment = 2500
            },
            ['10'] = {
                name = 'Sheriff',
                isboss = true,
                bankAuth = true,
                payment = 3500
            },
        },
	},
        ['sahp'] = {
		label = 'SAHP',
        type = "leo",
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Recruit',
                payment = 350
            },
            ['1'] = {
                name = 'Officer',
                payment = 500
            },
            ['2'] = {
                name = 'Senior Officer',
                payment = 600
            },
            ['3'] = {
                name = 'Corporal',
                payment = 700
            },
            ['4'] = {
                name = 'Sergeant',
                payment = 800
            },
            ['5'] = {
                name = 'Lieutenant',
                payment = 900
            },
            ['6'] = {
                name = 'Captain',
                payment = 1000
            },
            ['7'] = {
                name = 'Commander',
                payment = 1500
            },
            ['8'] = {
                name = 'Major',
                payment = 2000
            },
            ['9'] = {
                name = 'Lt Colonel',
                isboss = true,
                bankAuth = true,
                payment = 2500
            },
            ['10'] = {
                name = 'Colonel',
                isboss = true,
                bankAuth = true,
                payment = 3500
            },
        },
	},
        ['lsso'] = {
		label = 'LSSO',
        type = "leo",
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Recruit',
                payment = 350
            },
            ['1'] = {
                name = 'Deputy',
                payment = 500
            },
            ['2'] = {
                name = 'Senior Deputy',
                payment = 600
            },
            ['3'] = {
                name = 'Corporal',
                payment = 700
            },
            ['4'] = {
                name = 'Sergeant',
                payment = 800
            },
            ['5'] = {
                name = 'Lieutenant',
                payment = 900
            },
            ['6'] = {
                name = 'Captain',
                payment = 1000
            },
            ['7'] = {
                name = 'Major',
                payment = 1500
            },
            ['8'] = {
                name = 'Chief Deputy',
                payment = 2000
            },
            ['9'] = {
                name = 'Under Sheriff',
                isboss = true,
                bankAuth = true,
                payment = 2500
            },
            ['10'] = {
                name = 'Sheriff',
                isboss = true,
                bankAuth = true,
                payment = 3500
            },
        },
	},
        ['safw'] = {
		label = 'SAFW',
        type = "leo",
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Recruit',
                payment = 350
            },
            ['1'] = {
                name = 'Officer',
                payment = 500
            },
            ['2'] = {
                name = 'Senior Officer',
                payment = 600
            },
            ['3'] = {
                name = 'Corporal',
                payment = 700
            },
            ['4'] = {
                name = 'Sergeant',
                payment = 800
            },
            ['5'] = {
                name = 'Lieutenant',
                payment = 900
            },
            ['6'] = {
                name = 'Captain',
                payment = 1000
            },
            ['7'] = {
                name = 'Commander',
                payment = 1500
            },
            ['8'] = {
                name = 'Deputy Chief',
                payment = 2000
            },
            ['9'] = {
                name = 'Asst. Chief',
                isboss = true,
                bankAuth = true,
                payment = 2500
            },
            ['10'] = {
                name = 'Chief',
                isboss = true,
                bankAuth = true,
                payment = 3500
            },
        },
	},
        ['sadoc'] = {
		label = 'SADOC',
        type = "leo",
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'CO Recruit',
                payment = 350
            },
            ['1'] = {
                name = 'Correction Officer',
                payment = 500
            },
            ['2'] = {
                name = 'Senior Correction Officer',
                payment = 600
            },
            ['3'] = {
                name = 'Corporal',
                payment = 700
            },
            ['4'] = {
                name = 'Sergeant',
                payment = 800
            },
            ['5'] = {
                name = 'Lieutenant',
                payment = 900
            },
            ['6'] = {
                name = 'Captain',
                payment = 1000
            },
            ['7'] = {
                name = 'Major',
                payment = 1500
            },
            ['8'] = {
                name = 'Colonel',
                payment = 2000
            },
            ['9'] = {
                name = 'Deputy Warden',
                isboss = true,
                bankAuth = true,
                payment = 2500
            },
            ['10'] = {
                name = 'Warden',
                isboss = true,
                bankAuth = true,
                payment = 3500
            },
        },
	},
        ['usms'] = {
		label = 'USMS',
        type = "leo",
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Recruit Marshal',
                payment = 400
            },
            ['1'] = {
                name = 'Marshal',
                payment = 600
            },
            ['2'] = {
                name = 'Senior Marshal',
                payment = 900
            },
            ['3'] = {
                name = 'Marshal In Charge',
                payment = 1000
            },
            ['4'] = {
                name = 'Tactical Opps Div',
                payment = 1200
            },
            ['5'] = {
                name = 'Investigation Div',
                payment = 1200
            },
            ['6'] = {
                name = 'Witness Security Div',
                payment = 1200
            },
            ['7'] = {
                name = 'Judicial Security Div',
                payment = 1500
            },
            ['8'] = {
                name = 'Associate Director',
                payment = 2000
            },
            ['9'] = {
                name = 'Deputy Director',
                isboss = true,
                bankAuth = true,
                payment = 2500
            },
            ['10'] = {
                name = 'Director',
                isboss = true,
                bankAuth = true,
                payment = 3500
            },
        },
	},
        ['fbi'] = {
		label = 'FBI',
        type = "leo",
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Recruit Special Agent',
                payment = 400
            },
            ['1'] = {
                name = 'Special Agent ',
                payment = 600
            },
            ['2'] = {
                name = 'Senior Special Agent',
                payment = 900
            },
            ['3'] = {
                name = 'Supervisory Special Agent',
                payment = 1000
            },
            ['4'] = {
                name = 'Tactical/Training SAIC',
                payment = 1200
            },
            ['5'] = {
                name = 'Criminal Investigation SAIC',
                payment = 1200
            },
            ['6'] = {
                name = 'Labor/Finance SAIC',
                payment = 1200
            },
            ['7'] = {
                name = 'National Security SAIC',
                payment = 1200
            },
            ['8'] = {
                name = 'Associat Deputy Director',
                payment = 2000
            },
            ['9'] = {
                name = 'Deputy Director',
                isboss = true,
                bankAuth = true,
                payment = 2500
            },
            ['10'] = {
                name = 'Director',
                isboss = true,
                bankAuth = true,
                payment = 3500
            },
        },
	},
        ['dhs'] = {
		label = 'DHS',
        type = "leo",
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Recruit BPA',
                payment = 350
            },
            ['1'] = {
                name = 'Senior Agent',
                payment = 500
            },
            ['2'] = {
                name = 'Lead Agent',
                payment = 600
            },
            ['3'] = {
                name = 'Supervisor Agent',
                payment = 700
            },
            ['4'] = {
                name = 'Field Opps Super ',
                payment = 800
            },
            ['5'] = {
                name = 'Special Operations Supervisor',
                payment = 900
            },
            ['6'] = {
                name = 'Special Agent in Charge',
                payment = 1000
            },
            ['7'] = {
                name = 'Deputy Chief',
                payment = 1500
            },
            ['8'] = {
                name = 'Chief',
                payment = 2000
            },
            ['9'] = {
                name = 'Deputy Diector',
                isboss = true,
                bankAuth = true,
                payment = 2500
            },
            ['10'] = {
                name = 'Director',
                isboss = true,
                bankAuth = true,
                payment = 3500
            },
        },
	},
    ['ss'] = {
		label = 'SS',
        type = "leo",
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Recruit',
                payment = 350
            },
            ['1'] = {
                name = 'Officer',
                payment = 500
            },
            ['2'] = {
                name = 'Sergeant',
                payment = 600
            },
            ['3'] = {
                name = 'Lieutenant',
                payment = 700
            },
            ['4'] = {
                name = 'Agent IPO',
                payment = 800
            },
            ['5'] = {
                name = 'Special Agent',
                payment = 900
            },
            ['6'] = {
                name = 'Special special Agent',
                payment = 1000
            },
            ['7'] = {
                name = 'Deputy SAiC',
                payment = 1500
            },
            ['8'] = {
                name = 'Special Agent in Charge',
                payment = 2000
            },
            ['9'] = {
                name = 'Deputy Director',
                isboss = true,
                bankAuth = true,
                payment = 2500
            },
            ['10'] = {
                name = 'Director',
                isboss = true,
                bankAuth = true,
                payment = 3500
            },
        },
	},
	
	police = {
		label = 'Law Enforcement',
		type = 'leo',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
			['0'] = { name = 'Recruit', payment = 50 },
			['1'] = { name = 'Officer', payment = 75 },
			['2'] = { name = 'Sergeant', payment = 100 },
			['3'] = { name = 'Lieutenant', payment = 125 },
			['4'] = { name = 'Chief', isboss = true, bankAuth = true, payment = 150 },
		},
	},
	ambulance = {
		label = 'EMS',
		type = 'ems',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
			['0'] = { name = 'Recruit', payment = 50 },
			['1'] = { name = 'Paramedic', payment = 75 },
			['2'] = { name = 'Doctor', payment = 100 },
			['3'] = { name = 'Surgeon', payment = 125 },
			['4'] = { name = 'Chief', isboss = true, bankAuth = true, payment = 150 },
		},
	},
	firefighter = {
		label = 'Fire Fighter',
		type = 'firefighter',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
			['0'] = { name = 'Recruit', payment = 50 },
			['1'] = { name = 'Paramedic', payment = 75 },
			['2'] = { name = 'Doctor', payment = 100 },
			['3'] = { name = 'Surgeon', payment = 125 },
			['4'] = { name = 'Chief', isboss = true, bankAuth = true, payment = 150 },
		},
	},
	bestbuds = {
		label = 'Best Buds',
		type = 'bestbuds',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
			['0'] = { name = 'Trainee', payment = 50 },
			['1'] = { name = 'Deliveries', payment = 75 },
			['2'] = { name = 'Sales', payment = 100 },
			['3'] = { name = 'Grower', payment = 125 },
			['4'] = { name = 'Assistant Manager', isboss = true, bankAuth = true, payment = 150 },
			['5'] = { name = 'Manager', isboss = true, bankAuth = true, payment = 150 },
			['6'] = { name = 'Owner', isboss = true, bankAuth = true, payment = 150 },
		},
	},
    ['casino'] = {
        label = 'Casino',
        defaultDuty = true,
        grades = {
            ['0'] = { name = 'Novice', payment = 50 },
            ['1'] = { name = 'Experienced', payment = 100 },
            ['2'] = { name = 'Boss', isboss = true, payment = 200 },
        },
    },
	tobacco = {
		label = 'Tobacco Farmer',
		type = 'Tobacco',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
			['0'] = { name = 'Farmhand', payment = 50 },
			['1'] = { name = 'Owner', payment = 75, isboss = true },
		},
	},
	billiards = {
		label = 'billiards',
		type = 'billiards',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
			['0'] = { name = 'Dishwasher', payment = 50 },
			['1'] = { name = 'Wait Staff', payment = 75 },
			['2'] = { name = 'Deliveries', payment = 100 },
			['3'] = { name = 'Bartender', payment = 125 },
			['4'] = { name = 'Floor Manager', isboss = true, bankAuth = true, payment = 150 },
			['5'] = { name = 'General Manager', isboss = true, bankAuth = true, payment = 150 },
			['6'] = { name = 'Owner', isboss = true, bankAuth = true, payment = 150 },
		},
	},
	whitewidow = {
		label = 'White Widow',
		type = 'whitewidow',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
			['0'] = { name = 'Trainee', payment = 50 },
			['1'] = { name = 'Deliveries', payment = 75 },
			['2'] = { name = 'Sales', payment = 100 },
			['3'] = { name = 'Grower', payment = 125 },
			['4'] = { name = 'Assistant Manager', isboss = true, bankAuth = true, payment = 150 },
			['5'] = { name = 'Manager', isboss = true, bankAuth = true, payment = 150 },
			['6'] = { name = 'Owner', isboss = true, bankAuth = true, payment = 150 },
		},
	},
	realestate = {
		label = 'Real Estate',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
			['0'] = { name = 'Recruit', payment = 50 },
			['1'] = { name = 'House Sales', payment = 75 },
			['2'] = { name = 'Business Sales', payment = 100 },
			['3'] = { name = 'Broker', payment = 125 },
			['4'] = { name = 'Manager', isboss = true, bankAuth = true, payment = 150 },
		},
	},
	taxi = {
		label = 'Taxi',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
			['0'] = { name = 'Recruit', payment = 50 },
			['1'] = { name = 'Driver', payment = 75 },
			['2'] = { name = 'Event Driver', payment = 100 },
			['3'] = { name = 'Sales', payment = 125 },
			['4'] = { name = 'Manager', isboss = true, bankAuth = true, payment = 150 },
		},
	},
    truckdealership = {
		label = 'Truck Vehicle Dealer',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
			['0'] = { name = 'Recruit', payment = 50 },
			['1'] = { name = 'Showroom Sales', payment = 75 },
			['2'] = { name = 'Business Sales', payment = 100 },
			['3'] = { name = 'Finance', payment = 125 },
			['4'] = { name = 'Manager', isboss = true, bankAuth = true, payment = 150 },
		},
	},
    airdealership = {
		label = 'Air Vehicle Dealer',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
			['0'] = { name = 'Recruit', payment = 50 },
			['1'] = { name = 'Showroom Sales', payment = 75 },
			['2'] = { name = 'Business Sales', payment = 100 },
			['3'] = { name = 'Finance', payment = 125 },
			['4'] = { name = 'Manager', isboss = true, bankAuth = true, payment = 150 },
		},
	},
    boatdealership = {
		label = 'Boat Vehicle Dealer',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
			['0'] = { name = 'Recruit', payment = 50 },
			['1'] = { name = 'Showroom Sales', payment = 75 },
			['2'] = { name = 'Business Sales', payment = 100 },
			['3'] = { name = 'Finance', payment = 125 },
			['4'] = { name = 'Manager', isboss = true, bankAuth = true, payment = 150 },
		},
	},
    emergencydealership = {
		label = 'Emergency Vehicle Dealer',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
			['0'] = { name = 'Recruit', payment = 50 },
			['1'] = { name = 'Showroom Sales', payment = 75 },
			['2'] = { name = 'Business Sales', payment = 100 },
			['3'] = { name = 'Finance', payment = 125 },
			['4'] = { name = 'Manager', isboss = true, bankAuth = true, payment = 150 },
		},
	},
    wiydealership = {
		label = 'WIY Vehicle Dealer',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
			['0'] = { name = 'Recruit', payment = 50 },
			['1'] = { name = 'Showroom Sales', payment = 75 },
			['2'] = { name = 'Business Sales', payment = 100 },
			['3'] = { name = 'Finance', payment = 125 },
			['4'] = { name = 'Manager', isboss = true, bankAuth = true, payment = 150 },
		},
	},
    pdm = {
		label = 'PDM Vehicle Dealer',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
			['0'] = { name = 'Recruit', payment = 50 },
			['1'] = { name = 'Showroom Sales', payment = 75 },
			['2'] = { name = 'Business Sales', payment = 100 },
			['3'] = { name = 'Finance', payment = 125 },
			['4'] = { name = 'Manager', isboss = true, bankAuth = true, payment = 150 },
		},
	},
	cardealer = {
		label = 'Vehicle Dealer',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
			['0'] = { name = 'Recruit', payment = 50 },
			['1'] = { name = 'Showroom Sales', payment = 75 },
			['2'] = { name = 'Business Sales', payment = 100 },
			['3'] = { name = 'Finance', payment = 125 },
			['4'] = { name = 'Manager', isboss = true, bankAuth = true, payment = 150 },
		},
	},
    dealership = {
		label = 'Vehicle Dealer',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
			['0'] = { name = 'Recruit', payment = 50 },
			['1'] = { name = 'Showroom Sales', payment = 75 },
			['2'] = { name = 'Business Sales', payment = 100 },
			['3'] = { name = 'Finance', payment = 125 },
			['4'] = { name = 'Manager', isboss = true, bankAuth = true, payment = 150 },
		},
	},
	mechanic = {
		label = 'LS Customs',
		type = 'mechanic',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
			['0'] = { name = 'Recruit', payment = 50 },
			['1'] = { name = 'Novice', payment = 75 },
			['2'] = { name = 'Experienced', payment = 100 },
			['3'] = { name = 'Advanced', payment = 125 },
			['4'] = { name = 'Manager', isboss = true, bankAuth = true, payment = 150 },
		},
	},
	mechanic2 = {
		label = 'LS Customs',
		type = 'mechanic',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
			['0'] = { name = 'Recruit', payment = 50 },
			['1'] = { name = 'Novice', payment = 75 },
			['2'] = { name = 'Experienced', payment = 100 },
			['3'] = { name = 'Advanced', payment = 125 },
			['4'] = { name = 'Manager', isboss = true, bankAuth = true, payment = 150 },
		},
	},
	mechanic3 = {
		label = 'LS Customs',
		type = 'mechanic',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
			['0'] = { name = 'Recruit', payment = 50 },
			['1'] = { name = 'Novice', payment = 75 },
			['2'] = { name = 'Experienced', payment = 100 },
			['3'] = { name = 'Advanced', payment = 125 },
			['4'] = { name = 'Manager', isboss = true, bankAuth = true, payment = 150 },
		},
	},
	beeker = {
		label = 'Beeker\'s Garage',
		type = 'mechanic',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
			['0'] = { name = 'Recruit', payment = 50 },
			['1'] = { name = 'Novice', payment = 75 },
			['2'] = { name = 'Experienced', payment = 100 },
			['3'] = { name = 'Advanced', payment = 125 },
			['4'] = { name = 'Manager', isboss = true, bankAuth = true, payment = 150 },
		},
	},
	bennys = {
		label = 'Benny\'s Original Motor Works',
		type = 'mechanic',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
			['0'] = { name = 'Recruit', payment = 50 },
			['1'] = { name = 'Novice', payment = 75 },
			['2'] = { name = 'Experienced', payment = 100 },
			['3'] = { name = 'Advanced', payment = 125 },
			['4'] = { name = 'Manager', isboss = true, bankAuth = true, payment = 150 },
		},
	},
    kittys = {
		label = 'Kittys Motor Works',
		type = 'mechanic',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
			['0'] = { name = 'Recruit', payment = 50 },
			['1'] = { name = 'Novice', payment = 75 },
			['2'] = { name = 'Experienced', payment = 100 },
			['3'] = { name = 'Advanced', payment = 125 },
			['4'] = { name = 'Manager', isboss = true, bankAuth = true, payment = 150 },
            ['5'] = { name = 'Owner', isboss = true, bankAuth = true, payment = 300 },
		},
	},
	['catcafe'] = {
		label = 'Cat Cafe',
		defaultDuty = true,
		grades = {
			['0'] = { name = 'Recruit', payment = 50 },
			['1'] = { name = 'Novice', payment = 75 },
			['2'] = { name = 'Experienced', payment = 100 },
			['3'] = { name = 'Advanced', payment = 125 },
			['4'] = { name = 'Manager', isboss = true, bankAuth = true, payment = 150 },
		},
	},
	['burgershot'] = {
		label = 'BurgerShot',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = { name = 'Recruit', payment = 50 },
			['1'] = { name = 'Novice', payment = 75 },
			['2'] = { name = 'Experienced', payment = 100 },
			['3'] = { name = 'Advanced', payment = 125 },
			['4'] = { name = 'Manager', isboss = true, bankAuth = true, payment = 150 },
        },
	},
}
