Config = {
    EnablePrint = true, -- If the resource should print what version you're on or not. (If you dont want to look at the print for some reason)
    PID = '', -- Your tebex payment id, used for error logging & easier support

    CoreObject = exports['qb-core']:GetCoreObject(),

    Database = {
        Tables = {
            Players = 'players',
            Vehicles = 'player_vehicles',
            Houses = 'player_houses'
        },
        Columns = {
            Identifier = 'citizenid',
            Charinfo = 'charinfo'
        }
    },

    Discord = {
        Open = { -- When a person opens the MDW
            Enable = false,
            Webhook = ''
        },
        Incident = {
            Create = {
                Enable = false,
                Webhook = ''
            },
            Save = {
                Enable = false,
                Webhook = ''
            },
            Delete = {
                Enable = false,
                Webhook = ''
            }
        },
        Report = {
            Create = {
                Enable = false,
                Webhook = ''
            },
            Save = {
                Enable = false,
                Webhook = ''
            },
            Delete = {
                Enable = false,
                Webhook = ''
            }
        },
        Evidence = {
            Create = {
                Enable = false,
                Webhook = ''
            },
            Save = {
                Enable = false,
                Webhook = ''
            },
            Delete = {
                Enable = false,
                Webhook = ''
            }
        },
        Staff = {
            Hire = {
                Enable = false,
                Webhook = ''
            },
            Fire = {
                Enable = false,
                Webhook = ''
            },
            Save = {
                Enable = false,
                Webhook = ''
            }
        },
        Config = {
            Message = {
                Enable = false,
                Webhook = ''
            }
        }
    },

    -- Basic
    Command = 'mdw', -- Command used to open the mdw
    Animation = true, -- Animation and tablet when opening it
    Button = 69, -- E / To turn the opacity true/false (Key codes can be found at: https://css-tricks.com/snippets/javascript/javascript-keycodes/)
    Opacity = 0.35, -- Percentage it'll show (0-1)
    
    -- If person is hired & online
    HiredJob = 'police','lspd','safw','bcso','lsso','sahp','sadoc','usms','fbi','dhs','ss', -- Job to assign
    HiredGrade = 0, -- Grade to assign

    -- If person is fired & online
    FiredJob = 'unemployed', -- Job to assign
    FiredGrade = 0, -- Grade to assign

    -- Citizens legislations
    Citizen = {
        Key = 38, -- Open key
        Text = '[E] - Open database system', -- Display text shown if you're near a point
        Locations = { -- Coordinates where it's possible to open
            {291.75, -610.11, 43.37},
            {285.71, -613.38, 43.38}
        },
    },

    -----------------------------
    -- // NUI CONFIGURABLES // --
    LoadingTimer = 100, -- Loading effect in ms + how long it takes to fetch the information
    EnableDuty = true,
    TimeFormat = '%d-%m-%Y %H:%M:%S', -- '%Y-%m-%d %H:%M:%S' for other countries format
    SelectedPage = 0, -- Selected page when you open it (Number value of the page)
    SelectedSubPage = 0, -- If etc "[8] STAFF" is selected, which sub page to be selected
    Pages = {
        [0] = {Page = 'DASHBOARD'},
        [1] = {Page = 'PROFILES'},
        [2] = {Page = 'INCIDENTS'},
        [3] = {Page = 'REPORTS'},
        [4] = {Page = 'EVIDENCE'},
        [5] = {Page = 'VEHICLES'},
        [6] = {Page = 'DISPATCH'},
        [7] = {Page = 'CHARGES'},
        [8] = {Page = 'STAFF',
            Subs = {
                [0] = {Page = 'EMPLOYEES'},
                [1] = {Page = 'ACADEMY SHEET'},
                [2] = {Page = 'DISCIPLINARY DATABASE'},
                [3] = {Page = '10 CODES / CMDS'}
            }},
        [9] = {Page = 'LEGISLATION'}
    },

    -- Cashboard Page
    SaveChat = true, -- Save the chat messages on resource stop
    SaveAnnouncements = true, -- Clear the announcements on each resource stop
    -- Cashboard Page

    -- Profiles page
    LoafHousing = false, -- If you're using loaf_properties, then turn this true
    LBPhone = false, -- If you're using LB Phone ,then turn this true
    Fingerprint = false, -- If fingerprint should be showed or not
    AvailableTags = { -- Available tags to add (id always has to be unique | label)
    {id = 1, label = 'Be Aware'},
    {id = 2, label = 'Armed and Dangerous'},
    {id = 3, label = 'Wanted'},
    {id = 4, label = 'Mentally Unstable'},
    {id = 5, label = 'Suspicious'},
    {id = 6, label = 'Known Runner'},
    {id = 7, label = 'Known Fighter'},
    {id = 8, label = 'BOLO'},
    {id = 9, label = 'Revoked Drivers license'},
    {id = 10, label = 'CI'},
    {id = 11, label = 'FFL'},
    {id = 12, label = 'POLICE'},
    {id = 13, label = 'DOJ'},
    {id = 14, label = 'Distric Attorney Office'},
    {id = 15, label = 'JUDGE'},
    {id = 16, label = 'CITY OFFICIAL'},
    {id = 17, label = 'Caution Double Name'},
    },
    -- Profiles page

    -- Incidents page
    IncidentTags = { -- Available tags to add (id always has to be unique | Label)
    {id = 1, label = 'See Initial Officer Report'},
    {id = 2, label = 'See CSU Report'},
    {id = 3, label = 'See Multiple Reports'},
    {id = 4, label = 'Turn over to Federal'},
    {id = 5, label = 'Confidential Informant'},
    {id = 6, label = 'Detective Investigation'},
    {id = 7, label = 'See Fire Investigation'},
    {id = 8, label = 'DFW Warden Report'},
    {id = 9, label = 'BOLO'},
    {id = 10, label = 'Warrant'},
    {id = 11, label = 'Arrest Report to Follow'},
    },
    -- Incidents page

    -- Report page
    Report = {
        Categories = {'Investigative Report', 'Standard Report', 'Bubbles Report', 'Bubbles'}, -- Available categories to select
        Tags = {
            {id = 1, label = 'Unorganized Crime', color = 'yellow'},
            {id = 2, label = 'Organized Crime Group', color = 'purple'},
            {id = 3, label = 'Gang Crime', color = 'green'},
            {id = 4, label = 'Other', color = 'orange'},
            {id = 5, label = 'Suspicious', color = 'orange'},
            {id = 6, label = 'Unknown Crime Group', color = 'red'},
            {id = 7, label = 'Poacher', color = 'blue'},
        }
    },
    -- Report page

    -- Evidence page
    Evidence = {
        Types = {'Murder Case', 'Other Non-Traffic', 'Traffic', 'Criminal'}, -- Available categories to select
         Tags = { -- Available tags to add (id always has to be unique | label)
             {id = 1, label = 'Other'},
             {id = 2, label = 'Gang Crime'},
             {id = 3, label = 'Unorganized Crime'},
             {id = 4, label = 'Organized Crime Group'},
             {id = 5, label = 'Unknown Crime Group'},
             {id = 6, label = 'Firearm '},
             {id = 7, label = 'DNA'},
             {id = 8, label = 'Harde vidence'},
             {id = 9, label = 'Forensic'},
             {id = 10, label = 'Blunt force'},
             {id = 11, label = 'Bladed weapon'},
             {id = 12, label = 'Fingerprint'},
        }
    },
    -- Evidence page

     -- Vehicles page
     Vehicles = {
        States = {
            {id = 0, label = 'Out'},
            {id = 1, label = 'Parked'},
            {id = 2, label = 'Depot'}
        },
        Tags = {
            {id = 1, label = 'BOLO'},
            {id = 2, label = 'Warrant'},
            {id = 3, label = 'Tuner Chipped'},
            {id = 4, label = 'Habitual speeder'},
            {id = 5, label = 'Trafficker Veh'},
            {id = 6, label = 'Depot Veh'},
            {id = 7, label = 'Police Seized Veh'},
            {id = 8, label = 'Stolen Veh'},
            {id = 9, label = 'FOP tag'},
            {id = 10, label = 'UC'},
        }
    },
    -- Vehicles page

    -- Dispatch page
    DispatchHeaders = {

        -- Change text to what you'd like to be displayed in the nui
        -- Do not change value
        -- Change if the item can be sorted or not (by clicking on it in the nui)
        -- Fixed width on each table in the nui (If you want it to be automated based on content size, then remove the width (Example below))
        -- If a divider should be shown, turn true, false ore remove it

        -- (EXAMPLE) VERY IMPORTANT THAT "text" AND "value" ALWAYS EXISTS! REST CAN BE REMOVED IF YOU WANT THAT
        -- {text = 'Call ID', value = 'callid',},

        {text = 'Call ID',        value = 'callid',   sortable = true,  width = 100, divider = true},
        {text = 'Type',           value = 'type',     sortable = true,  width = 100, divider = true},
        {text = 'Caller',         value = 'caller',   sortable = false, width = 100, divider = true},
        {text = 'Details',        value = 'details',  sortable = false, width = 385, divider = true},
        {text = 'Location',       value = 'location', sortable = false, width = 200, divider = true},
        {text = 'Date',           value = 'date',     sortable = true,  width = 130, divider = true},
        {text = 'Units Attached', value = 'unit',     sortable = true,  width = 150, divider = true},
        {text = 'Actions',        value = 'actions',  sortable = false, width = 120, divider = true}
    },
    -- Dispatch page

    -- Charges page
    Charges = { -- Charges (id always has to be unique | Label | Fine | Jail Time | Points | Color(rgb, rgba, colorcode#) | Description)
    { id = 1, Label = 'Poaching Taking of non-regulated fish-game per', Fine = 1000, Jail = 10, Points = 0, Color = 'green', Desc = 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Praesentium natus doloribus, nam saepe autem fugiat facilis possimus facere voluptatibus consequuntur, eligendi, distinctio quibusdam recusandae quo eius! Cum est eaque veniam.' },
    { id = 2, Label = 'Battery', Fine = 1600, Jail = 20, Points = 0, Color = 'green', Desc = 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Praesentium natus doloribus, nam saepe autem fugiat facilis possimus facere voluptatibus consequuntur, eligendi, distinctio quibusdam recusandae quo eius! Cum est eaque veniam.' },
    { id = 3, Label = 'Unlawful Imprisonment', Fine = 1450, Jail = 15, Points = 0, Color = 'green', Desc = 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Praesentium natus doloribus, nam saepe autem fugiat facilis possimus facere voluptatibus consequuntur, eligendi, distinctio quibusdam recusandae quo eius! Cum est eaque veniam.' },
    { id = 4, Label = 'Failure to obtain an exotic animal licence', Fine = 1500, Jail = 5, Points = 0, Color = 'green', Desc = 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Praesentium natus doloribus, nam saepe autem fugiat facilis possimus facere voluptatibus consequuntur, eligendi, distinctio quibusdam recusandae quo eius! Cum est eaque veniam.' },
    { id = 5, Label = 'Receiving Stolen Property', Fine = 300, Jail = 10, Points = 0, Color = 'green', Desc = 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Praesentium natus doloribus, nam saepe autem fugiat facilis possimus facere voluptatibus consequuntur, eligendi, distinctio quibusdam recusandae quo eius! Cum est eaque veniam.' },
    { id = 6, Label = 'Tampering With Evidence', Fine = 2600, Jail = 20, Points = 0, Color = 'green', Desc = 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Praesentium natus doloribus, nam saepe autem fugiat facilis possimus facere voluptatibus consequuntur, eligendi, distinctio quibusdam recusandae quo eius! Cum est eaque veniam.' },
    { id = 7, Label = 'Theft', Fine = 550, Jail = 5, Points = 0, Color = 'green', Desc = 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Praesentium natus doloribus, nam saepe autem fugiat facilis possimus facere voluptatibus consequuntur, eligendi, distinctio quibusdam recusandae quo eius! Cum est eaque veniam.' },
    { id = 8, Label = 'Possession of a Stolen Identification', Fine = 350, Jail = 15, Points = 0, Color = 'green', Desc = 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Praesentium natus doloribus, nam saepe autem fugiat facilis possimus facere voluptatibus consequuntur, eligendi, distinctio quibusdam recusandae quo eius! Cum est eaque veniam.' },
    { id = 9, Label = 'Illegal Fishing', Fine = 500, Jail = 10, Points = 0, Color = 'green', Desc = 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Praesentium natus doloribus, nam saepe autem fugiat facilis possimus facere voluptatibus consequuntur, eligendi, distinctio quibusdam recusandae quo eius! Cum est eaque veniam.' },
    { id = 10, Label = 'Joyriding', Fine = 1000, Jail = 10, Points = 1, Color = 'green', Desc = 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Praesentium natus doloribus, nam saepe autem fugiat facilis possimus facere voluptatibus consequuntur, eligendi, distinctio quibusdam recusandae quo eius! Cum est eaque veniam.' },
    { id = 11, Label = 'Speeding under 10mph', Fine = 1000, Jail = 0, Points = 0, Color = 'green', Desc = 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Praesentium natus doloribus, nam saepe autem fugiat facilis possimus facere voluptatibus consequuntur, eligendi, distinctio quibusdam recusandae quo eius! Cum est eaque veniam.' },
    { id = 12, Label = 'Speeding 10 to 15mph over', Fine = 1500, Jail = 0, Points = 1, Color = 'green', Desc = 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Praesentium natus doloribus, nam saepe autem fugiat facilis possimus facere voluptatibus consequuntur, eligendi, distinctio quibusdam recusandae quo eius! Cum est eaque veniam.' },
    { id = 13, Label = 'Speeding 16 to 25mph over', Fine = 2500, Jail = 0, Points = 2, Color = 'green', Desc = 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Praesentium natus doloribus, nam saepe autem fugiat facilis possimus facere voluptatibus consequuntur, eligendi, distinctio quibusdam recusandae quo eius! Cum est eaque veniam.' },
    { id = 14, Label = 'Speeding Over 25mph', Fine = 3000, Jail = 10, Points = 3, Color = 'green', Desc = 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Praesentium natus doloribus, nam saepe autem fugiat facilis possimus facere voluptatibus consequuntur, eligendi, distinctio quibusdam recusandae quo eius! Cum est eaque veniam.' },
    { id = 15, Label = 'Illegal U-Turn', Fine = 300, Jail = 0, Points = 1, Color = 'green', Desc = 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Praesentium natus doloribus, nam saepe autem fugiat facilis possimus facere voluptatibus consequuntur, eligendi, distinctio quibusdam recusandae quo eius! Cum est eaque veniam.' },
    { id = 16, Label = 'Illegal Lane change', Fine = 300, Jail = 0, Points = 1, Color = 'green', Desc = 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Praesentium natus doloribus, nam saepe autem fugiat facilis possimus facere voluptatibus consequuntur, eligendi, distinctio quibusdam recusandae quo eius! Cum est eaque veniam.' },
    { id = 17, Label = 'Obstructing The Flow Of Traffic', Fine = 300, Jail = 0, Points = 0, Color = 'green', Desc = 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Praesentium natus doloribus, nam saepe autem fugiat facilis possimus facere voluptatibus consequuntur, eligendi, distinctio quibusdam recusandae quo eius! Cum est eaque veniam.' },
    { id = 18, Label = 'Illegal Parking', Fine = 300, Jail = 0, Points = 0, Color = 'green', Desc = 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Praesentium natus doloribus, nam saepe autem fugiat facilis possimus facere voluptatibus consequuntur, eligendi, distinctio quibusdam recusandae quo eius! Cum est eaque veniam.' },
    { id = 19, Label = 'Failure to Yield To Emergency Vehicle', Fine = 800, Jail = 0, Points = 1, Color = 'green', Desc = 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Praesentium natus doloribus, nam saepe autem fugiat facilis possimus facere voluptatibus consequuntur, eligendi, distinctio quibusdam recusandae quo eius! Cum est eaque veniam.' },
    { id = 20, Label = 'Failure To Regard Stop Sign', Fine = 500, Jail = 0, Points = 2, Color = 'green', Desc = 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Praesentium natus doloribus, nam saepe autem fugiat facilis possimus facere voluptatibus consequuntur, eligendi, distinctio quibusdam recusandae quo eius! Cum est eaque veniam.' },
    { id = 21, Label = 'Failure To Regard Red Light', Fine = 500, Jail = 0, Points = 2, Color = 'green', Desc = 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Praesentium natus doloribus, nam saepe autem fugiat facilis possimus facere voluptatibus consequuntur, eligendi, distinctio quibusdam recusandae quo eius! Cum est eaque veniam.' },
    { id = 22, Label = 'Illegal Passing', Fine = 300, Jail = 0, Points = 1, Color = 'green', Desc = 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Praesentium natus doloribus, nam saepe autem fugiat facilis possimus facere voluptatibus consequuntur, eligendi, distinctio quibusdam recusandae quo eius! Cum est eaque veniam.' },
    { id = 23, Label = 'Improper Use of High Beams', Fine = 300, Jail = 0, Points = 0, Color = 'green', Desc = 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Praesentium natus doloribus, nam saepe autem fugiat facilis possimus facere voluptatibus consequuntur, eligendi, distinctio quibusdam recusandae quo eius! Cum est eaque veniam.' },
    { id = 24, Label = 'Driving with a License under Suspention', Fine = 1500, Jail = 0, Points = 2, Color = 'green', Desc = 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Praesentium natus doloribus, nam saepe autem fugiat facilis possimus facere voluptatibus consequuntur, eligendi, distinctio quibusdam recusandae quo eius! Cum est eaque veniam.' },
    { id = 25, Label = 'Hit and Run MVA', Fine = 1500, Jail = 0, Points = 2, Color = 'green', Desc = 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Praesentium natus doloribus, nam saepe autem fugiat facilis possimus facere voluptatibus consequuntur, eligendi, distinctio quibusdam recusandae quo eius! Cum est eaque veniam.' },
    { id = 26, Label = 'Public Intoxication', Fine = 500, Jail = 10, Points = 0, Color = 'green', Desc = 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Praesentium natus doloribus, nam saepe autem fugiat facilis possimus facere voluptatibus consequuntur, eligendi, distinctio quibusdam recusandae quo eius! Cum est eaque veniam.' },
    { id = 27, Label = 'Disorderly Conduct (disturbing the peace)', Fine = 1500, Jail = 10, Points = 0, Color = 'green', Desc = 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Praesentium natus doloribus, nam saepe autem fugiat facilis possimus facere voluptatibus consequuntur, eligendi, distinctio quibusdam recusandae quo eius! Cum est eaque veniam.' },
    { id = 28, Label = 'Simple Assult', Fine = 1500, Jail = 10, Points = 0, Color = 'green', Desc = 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Praesentium natus doloribus, nam saepe autem fugiat facilis possimus facere voluptatibus consequuntur, eligendi, distinctio quibusdam recusandae quo eius! Cum est eaque veniam.' },
    { id = 29, Label = 'Failure To Identify', Fine = 1500, Jail = 10, Points = 0, Color = 'green', Desc = 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Praesentium natus doloribus, nam saepe autem fugiat facilis possimus facere voluptatibus consequuntur, eligendi, distinctio quibusdam recusandae quo eius! Cum est eaque veniam.' },
    { id = 30, Label = 'Tresspassing', Fine = 1500, Jail = 10, Points = 0, Color = 'green', Desc = 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Praesentium natus doloribus, nam saepe autem fugiat facilis possimus facere voluptatibus consequuntur, eligendi, distinctio quibusdam recusandae quo eius! Cum est eaque veniam.' },
    { id = 31, Label = 'Obstruction of Justice', Fine = 2500, Jail = 10, Points = 0, Color = 'green', Desc = 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Praesentium natus doloribus, nam saepe autem fugiat facilis possimus facere voluptatibus consequuntur, eligendi, distinctio quibusdam recusandae quo eius! Cum est eaque veniam.' },
    { id = 32, Label = 'Lewd Or Lascivious Act', Fine = 2500, Jail = 25, Points = 0, Color = 'green', Desc = 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Praesentium natus doloribus, nam saepe autem fugiat facilis possimus facere voluptatibus consequuntur, eligendi, distinctio quibusdam recusandae quo eius! Cum est eaque veniam.' },
    { id = 33, Label = 'Verbal Threat (Non-Intent)', Fine = 800, Jail = 0, Points = 0, Color = 'green', Desc = 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Praesentium natus doloribus, nam saepe autem fugiat facilis possimus facere voluptatibus consequuntur, eligendi, distinctio quibusdam recusandae quo eius! Cum est eaque veniam.' },
    { id = 34, Label = 'Unlawful Discharge Of A Firearm', Fine = 1500, Jail = 10, Points = 0, Color = 'green', Desc = 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Praesentium natus doloribus, nam saepe autem fugiat facilis possimus facere voluptatibus consequuntur, eligendi, distinctio quibusdam recusandae quo eius! Cum est eaque veniam.' },
    { id = 35, Label = 'Brandishing A Weapon (Non-Firearm)', Fine = 1000, Jail = 10, Points = 0, Color = 'green', Desc = 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Praesentium natus doloribus, nam saepe autem fugiat facilis possimus facere voluptatibus consequuntur, eligendi, distinctio quibusdam recusandae quo eius! Cum est eaque veniam.' },
    { id = 36, Label = 'Brandishing A Weapon (Firearm)', Fine = 1500, Jail = 10, Points = 0, Color = 'green', Desc = 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Praesentium natus doloribus, nam saepe autem fugiat facilis possimus facere voluptatibus consequuntur, eligendi, distinctio quibusdam recusandae quo eius! Cum est eaque veniam.' },
    { id = 37, Label = 'No Firearms License', Fine = 1500, Jail = 10, Points = 0, Color = 'green', Desc = 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Praesentium natus doloribus, nam saepe autem fugiat facilis possimus facere voluptatibus consequuntur, eligendi, distinctio quibusdam recusandae quo eius! Cum est eaque veniam.' },
    { id = 38, Label = 'Unauthorized Use Of Emergency Vehicle', Fine = 2500, Jail = 10, Points = 2, Color = 'green', Desc = 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Praesentium natus doloribus, nam saepe autem fugiat facilis possimus facere voluptatibus consequuntur, eligendi, distinctio quibusdam recusandae quo eius! Cum est eaque veniam.' },
    { id = 39, Label = 'Operating MV w/out License', Fine = 1000, Jail = 0, Points = 1, Color = 'green', Desc = 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Praesentium natus doloribus, nam saepe autem fugiat facilis possimus facere voluptatibus consequuntur, eligendi, distinctio quibusdam recusandae quo eius! Cum est eaque veniam.' },
    { id = 40, Label = 'DUI or DWI', Fine = 2500, Jail = 10, Points = 3, Color = 'green', Desc = 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Praesentium natus doloribus, nam saepe autem fugiat facilis possimus facere voluptatibus consequuntur, eligendi, distinctio quibusdam recusandae quo eius! Cum est eaque veniam.' },
    { id = 41, Label = 'Illegal Burning', Fine = 250, Jail = 0, Points = 0, Color = 'green', Desc = 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Praesentium natus doloribus, nam saepe autem fugiat facilis possimus facere voluptatibus consequuntur, eligendi, distinctio quibusdam recusandae quo eius! Cum est eaque veniam.' },
    { id = 42, Label = 'Unlawful Solicitation', Fine = 1500, Jail = 10, Points = 0, Color = 'green', Desc = 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Praesentium natus doloribus, nam saepe autem fugiat facilis possimus facere voluptatibus consequuntur, eligendi, distinctio quibusdam recusandae quo eius! Cum est eaque veniam.' },
    { id = 43, Label = 'Illegal Hunting', Fine = 1500, Jail = 10, Points = 0, Color = 'green', Desc = 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Praesentium natus doloribus, nam saepe autem fugiat facilis possimus facere voluptatibus consequuntur, eligendi, distinctio quibusdam recusandae quo eius! Cum est eaque veniam.' },
    { id = 44, Label = 'Operating an Unregistered MV', Fine = 500, Jail = 5, Points = 0, Color = 'green', Desc = 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Praesentium natus doloribus, nam saepe autem fugiat facilis possimus facere voluptatibus consequuntur, eligendi, distinctio quibusdam recusandae quo eius! Cum est eaque veniam.' },
    { id = 45, Label = 'Careless Driving', Fine = 500, Jail = 0, Points = 2, Color = 'green', Desc = 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Praesentium natus doloribus, nam saepe autem fugiat facilis possimus facere voluptatibus consequuntur, eligendi, distinctio quibusdam recusandae quo eius! Cum est eaque veniam.' },
    { id = 46, Label = 'Operating a Non Street legal MV ', Fine = 500, Jail = 0, Points = 1, Color = 'green', Desc = 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Praesentium natus doloribus, nam saepe autem fugiat facilis possimus facere voluptatibus consequuntur, eligendi, distinctio quibusdam recusandae quo eius! Cum est eaque veniam.' },
    { id = 47, Label = 'Expired Meter ', Fine = 1600, Jail = 0, Points = 0, Color = 'green', Desc = 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Praesentium natus doloribus, nam saepe autem fugiat facilis possimus facere voluptatibus consequuntur, eligendi, distinctio quibusdam recusandae quo eius! Cum est eaque veniam.' },
    { id = 48, Label = 'Excessive MV Noise', Fine = 250, Jail = 0, Points = 0, Color = 'green', Desc = 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Praesentium natus doloribus, nam saepe autem fugiat facilis possimus facere voluptatibus consequuntur, eligendi, distinctio quibusdam recusandae quo eius! Cum est eaque veniam.' },
    { id = 49, Label = 'Loitering ', Fine = 300, Jail = 0, Points = 0, Color = 'green', Desc = 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Praesentium natus doloribus, nam saepe autem fugiat facilis possimus facere voluptatibus consequuntur, eligendi, distinctio quibusdam recusandae quo eius! Cum est eaque veniam.' },
    { id = 50, Label = 'Damaging Government Property', Fine = 1500, Jail = 20, Points = 0, Color = 'green', Desc = 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Praesentium natus doloribus, nam saepe autem fugiat facilis possimus facere voluptatibus consequuntur, eligendi, distinctio quibusdam recusandae quo eius! Cum est eaque veniam.' },
    { id = 51, Label = 'Prostitution', Fine = 1500, Jail = 20, Points = 0, Color = 'green', Desc = 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Praesentium natus doloribus, nam saepe autem fugiat facilis possimus facere voluptatibus consequuntur, eligendi, distinctio quibusdam recusandae quo eius! Cum est eaque veniam.' },
    { id = 52, Label = 'Criminal Mischief', Fine = 500, Jail = 10, Points = 0, Color = 'green', Desc = 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Praesentium natus doloribus, nam saepe autem fugiat facilis possimus facere voluptatibus consequuntur, eligendi, distinctio quibusdam recusandae quo eius! Cum est eaque veniam.' },
    { id = 53, Label = 'Harassment', Fine = 1500, Jail = 12, Points = 0, Color = 'green', Desc = 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Praesentium natus doloribus, nam saepe autem fugiat facilis possimus facere voluptatibus consequuntur, eligendi, distinctio quibusdam recusandae quo eius! Cum est eaque veniam.' },
    { id = 54, Label = 'Participating in an Illegal Event', Fine = 250, Jail = 20, Points = 0, Color = 'green', Desc = 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Praesentium natus doloribus, nam saepe autem fugiat facilis possimus facere voluptatibus consequuntur, eligendi, distinctio quibusdam recusandae quo eius! Cum est eaque veniam.' },
   
    { id = 55, Label = 'Inciting a Riot', Fine = 5000, Points = 0, Jail = 30, Color = 'orange', Desc = 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Praesentium natus doloribus, nam saepe autem fugiat facilis possimus facere voluptatibus consequuntur, eligendi, distinctio quibusdam recusandae quo eius! Cum est eaque veniam.' },
    { id = 56, Label = 'Operating Aircraft w/out license', Fine = 5000, Points = 0, Jail = 20, Color = 'orange', Desc = 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Praesentium natus doloribus, nam saepe autem fugiat facilis possimus facere voluptatibus consequuntur, eligendi, distinctio quibusdam recusandae quo eius! Cum est eaque veniam.' },
    { id = 57, Label = 'Vehicular Manslaughter', Fine = 2500, Points = 0, Jail = 20, Color = 'orange', Desc = 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Praesentium natus doloribus, nam saepe autem fugiat facilis possimus facere voluptatibus consequuntur, eligendi, distinctio quibusdam recusandae quo eius! Cum est eaque veniam.' },
    { id = 58, Label = 'Involuntary Manslaughter', Fine = 2900, Points = 0, Jail = 10, Color = 'orange', Desc = 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Praesentium natus doloribus, nam saepe autem fugiat facilis possimus facere voluptatibus consequuntur, eligendi, distinctio quibusdam recusandae quo eius! Cum est eaque veniam.' },
    { id = 59, Label = 'Possession of an Illegal Substance', Fine = 1900, Points = 0, Jail = 20, Color = 'orange', Desc = 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Praesentium natus doloribus, nam saepe autem fugiat facilis possimus facere voluptatibus consequuntur, eligendi, distinctio quibusdam recusandae quo eius! Cum est eaque veniam.' },
    { id = 60, Label = 'Terroristic Threats', Fine = 1900, Points = 0, Jail = 10, Color = 'orange', Desc = 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Praesentium natus doloribus, nam saepe autem fugiat facilis possimus facere voluptatibus consequuntur, eligendi, distinctio quibusdam recusandae quo eius! Cum est eaque veniam.' },
    { id = 61, Label = 'Illegal Gambling', Fine = 2500, Points = 0, Jail = 20, Color = 'orange', Desc = 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Praesentium natus doloribus, nam saepe autem fugiat facilis possimus facere voluptatibus consequuntur, eligendi, distinctio quibusdam recusandae quo eius! Cum est eaque veniam.' },
    { id = 62, Label = 'Stalking', Fine = 1900, Points = 0, Jail = 20, Color = 'orange', Desc = 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Praesentium natus doloribus, nam saepe autem fugiat facilis possimus facere voluptatibus consequuntur, eligendi, distinctio quibusdam recusandae quo eius! Cum est eaque veniam.' },
    { id = 63, Label = 'Organization of an Illegal Event', Fine = 1000, Points = 0, Jail = 30, Color = 'orange', Desc = 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Praesentium natus doloribus, nam saepe autem fugiat facilis possimus facere voluptatibus consequuntur, eligendi, distinctio quibusdam recusandae quo eius! Cum est eaque veniam.' },
    { id = 64, Label = 'Verbal Threat (With intent)', Fine = 1900, Points = 0, Jail = 10, Color = 'orange', Desc = 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Praesentium natus doloribus, nam saepe autem fugiat facilis possimus facere voluptatibus consequuntur, eligendi, distinctio quibusdam recusandae quo eius! Cum est eaque veniam.' },
    { id = 65, Label = 'Providing False Information', Fine = 2500, Points = 0, Jail = 10, Color = 'orange', Desc = 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Praesentium natus doloribus, nam saepe autem fugiat facilis possimus facere voluptatibus consequuntur, eligendi, distinctio quibusdam recusandae quo eius! Cum est eaque veniam.' },
    { id = 66, Label = 'Attempted Bribery', Fine = 2000, Points = 0, Jail = 20, Color = 'orange', Desc = 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Praesentium natus doloribus, nam saepe autem fugiat facilis possimus facere voluptatibus consequuntur, eligendi, distinctio quibusdam recusandae quo eius! Cum est eaque veniam.' },
    { id = 67, Label = 'Trespass Notice Violation', Fine = 1000, Points = 0, Jail = 10, Color = 'orange', Desc = 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Praesentium natus doloribus, nam saepe autem fugiat facilis possimus facere voluptatibus consequuntur, eligendi, distinctio quibusdam recusandae quo eius! Cum est eaque veniam.' },
    { id = 68, Label = 'Possession of an Illegal Weapon', Fine = 3000, Points = 0, Jail = 30, Color = 'orange', Desc = 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Praesentium natus doloribus, nam saepe autem fugiat facilis possimus facere voluptatibus consequuntur, eligendi, distinctio quibusdam recusandae quo eius! Cum est eaque veniam.' },
    { id = 69, Label = 'Kidnapping without intent', Fine = 6000, Jail = 20, Points = 0, Color = 'orange', Desc = 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Praesentium natus doloribus, nam saepe autem fugiat facilis possimus facere voluptatibus consequuntur, eligendi, distinctio quibusdam recusandae quo eius! Cum est eaque veniam.' },
    { id = 70, Label = 'Kidnapping with intent', Fine = 12000, Jail = 40, Points = 0, Color = 'orange', Desc = 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Praesentium natus doloribus, nam saepe autem fugiat facilis possimus facere voluptatibus consequuntur, eligendi, distinctio quibusdam recusandae quo eius! Cum est eaque veniam.' },
    { id = 71, Label = 'Attempted Manslaugther', Fine = 5000, Jail = 30, Points = 0, Color = 'orange', Desc = 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Praesentium natus doloribus, nam saepe autem fugiat facilis possimus facere voluptatibus consequuntur, eligendi, distinctio quibusdam recusandae quo eius! Cum est eaque veniam.' },
    { id = 72, Label = 'Grand Theft Auto', Fine = 10000, Jail = 24, Points = 0, Color = 'orange', Desc = 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Praesentium natus doloribus, nam saepe autem fugiat facilis possimus facere voluptatibus consequuntur, eligendi, distinctio quibusdam recusandae quo eius! Cum est eaque veniam.' },
    { id = 73, Label = 'Possession of Stolen Goods Per', Fine = 500, Jail = 5, Points = 0, Color = 'orange', Desc = 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Praesentium natus doloribus, nam saepe autem fugiat facilis possimus facere voluptatibus consequuntur, eligendi, distinctio quibusdam recusandae quo eius! Cum est eaque veniam.' },
    { id = 74, Label = 'Possession Illegal Goods Per', Fine = 250, Jail = 5, Points = 0, Color = 'orange', Desc = 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Praesentium natus doloribus, nam saepe autem fugiat facilis possimus facere voluptatibus consequuntur, eligendi, distinctio quibusdam recusandae quo eius! Cum est eaque veniam.' },
    { id = 75, Label = 'Possession of Burglary Tools', Fine = 3000, Jail = 20, Points = 0, Color = 'orange', Desc = 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Praesentium natus doloribus, nam saepe autem fugiat facilis possimus facere voluptatibus consequuntur, eligendi, distinctio quibusdam recusandae quo eius! Cum est eaque veniam.' },
    { id = 76, Label = 'Burglary', Fine = 5000, Points = 0, Jail = 40, Color = 'orange', Desc = 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Praesentium natus doloribus, nam saepe autem fugiat facilis possimus facere voluptatibus consequuntur, eligendi, distinctio quibusdam recusandae quo eius! Cum est eaque veniam.' },
    { id = 77, Label = 'Accessory to Burglary', Fine = 3500, Jail = 30, Points = 0, Color = 'orange', Desc = 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Praesentium natus doloribus, nam saepe autem fugiat facilis possimus facere voluptatibus consequuntur, eligendi, distinctio quibusdam recusandae quo eius! Cum est eaque veniam.' },
    { id = 78, Label = 'Extortion', Fine = 4600, Jail = 40, Points = 0, Color = 'orange', Desc = 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Praesentium natus doloribus, nam saepe autem fugiat facilis possimus facere voluptatibus consequuntur, eligendi, distinctio quibusdam recusandae quo eius! Cum est eaque veniam.' },
    { id = 79, Label = 'Impersonation', Fine = 600, Jail = 20, Points = 0, Color = 'orange', Desc = 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Praesentium natus doloribus, nam saepe autem fugiat facilis possimus facere voluptatibus consequuntur, eligendi, distinctio quibusdam recusandae quo eius! Cum est eaque veniam.' },
    { id = 80, Label = 'Fraud', Fine = 2600, Jail = 50, Points = 0, Color = 'orange', Desc = 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Praesentium natus doloribus, nam saepe autem fugiat facilis possimus facere voluptatibus consequuntur, eligendi, distinctio quibusdam recusandae quo eius! Cum est eaque veniam.' },
    { id = 81, Label = 'Identity Theft', Fine = 2800, Jail = 60, Points = 0, Color = 'orange', Desc = 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Praesentium natus doloribus, nam saepe autem fugiat facilis possimus facere voluptatibus consequuntur, eligendi, distinctio quibusdam recusandae quo eius! Cum est eaque veniam.' },
    { id = 82, Label = 'Impersonating a Judge', Fine = 3900, Jail = 30, Points = 0, Color = 'orange', Desc = 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Praesentium natus doloribus, nam saepe autem fugiat facilis possimus facere voluptatibus consequuntur, eligendi, distinctio quibusdam recusandae quo eius! Cum est eaque veniam.' },
    { id = 83, Label = 'Vehicle Registration Fraud', Fine = 3600, Jail = 20, Points = 0, Color = 'orange', Desc = 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Praesentium natus doloribus, nam saepe autem fugiat facilis possimus facere voluptatibus consequuntur, eligendi, distinctio quibusdam recusandae quo eius! Cum est eaque veniam.' },
    { id = 84, Label = 'Impersonating a Peace Officer', Fine = 3900, Jail = 30, Points = 0, Color = 'orange', Desc = 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Praesentium natus doloribus, nam saepe autem fugiat facilis possimus facere voluptatibus consequuntur, eligendi, distinctio quibusdam recusandae quo eius! Cum est eaque veniam.' },
    { id = 85, Label = 'Aiding and Abetting', Fine = 3900, Jail = 30, Points = 0, Color = 'orange', Desc = 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Praesentium natus doloribus, nam saepe autem fugiat facilis possimus facere voluptatibus consequuntur, eligendi, distinctio quibusdam recusandae quo eius! Cum est eaque veniam.' },
    { id = 86, Label = 'Felony Habitual ', Fine = 900, Jail = 10, Points = 0, Color = 'orange', Desc = 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Praesentium natus doloribus, nam saepe autem fugiat facilis possimus facere voluptatibus consequuntur, eligendi, distinctio quibusdam recusandae quo eius! Cum est eaque veniam.' },
    { id = 87, Label = 'Larceny', Fine = 1000, Jail = 20, Points = 0, Color = 'orange', Desc = 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Praesentium natus doloribus, nam saepe autem fugiat facilis possimus facere voluptatibus consequuntur, eligendi, distinctio quibusdam recusandae quo eius! Cum est eaque veniam.' },
    { id = 88, Label = 'Possession of Marked Money Per', Fine = 1000, Jail = 5, Points = 0, Color = 'orange', Desc = 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Praesentium natus doloribus, nam saepe autem fugiat facilis possimus facere voluptatibus consequuntur, eligendi, distinctio quibusdam recusandae quo eius! Cum est eaque veniam.' },
    { id = 89, Label = 'Resisting Arrest', Fine = 3000, Jail = 20, Points = 0, Color = 'orange', Desc = 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Praesentium natus doloribus, nam saepe autem fugiat facilis possimus facere voluptatibus consequuntur, eligendi, distinctio quibusdam recusandae quo eius! Cum est eaque veniam.' },
    { id = 90, Label = 'Fleeing to Elude', Fine = 3000, Jail = 20, Points = 0, Color = 'orange', Desc = 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Praesentium natus doloribus, nam saepe autem fugiat facilis possimus facere voluptatibus consequuntur, eligendi, distinctio quibusdam recusandae quo eius! Cum est eaque veniam.' },
    { id = 91, Label = 'Perjury', Fine = 5000, Jail = 20, Points = 0, Color = 'orange', Desc = 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Praesentium natus doloribus, nam saepe autem fugiat facilis possimus facere voluptatibus consequuntur, eligendi, distinctio quibusdam recusandae quo eius! Cum est eaque veniam.' },
    { id = 92, Label = 'Drug Trafficking ', Fine = 3000, Jail = 20, Points = 0, Color = 'orange', Desc = 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Praesentium natus doloribus, nam saepe autem fugiat facilis possimus facere voluptatibus consequuntur, eligendi, distinctio quibusdam recusandae quo eius! Cum est eaque veniam.' },
    { id = 93, Label = 'Possession With Intent To Distribute', Fine = 7000, Jail = 30, Points = 0, Color = 'orange', Desc = 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Praesentium natus doloribus, nam saepe autem fugiat facilis possimus facere voluptatibus consequuntur, eligendi, distinctio quibusdam recusandae quo eius! Cum est eaque veniam.' },
    { id = 94, Label = 'Manufacturing Of An Illegal Substance', Fine = 7000, Jail = 30, Points = 0, Color = 'orange', Desc = 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Praesentium natus doloribus, nam saepe autem fugiat facilis possimus facere voluptatibus consequuntur, eligendi, distinctio quibusdam recusandae quo eius! Cum est eaque veniam.' },
    { id = 95, Label = 'Possession of Schedule 1 per', Fine = 250, Jail = 5, Points = 0, Color = 'orange', Desc = 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Praesentium natus doloribus, nam saepe autem fugiat facilis possimus facere voluptatibus consequuntur, eligendi, distinctio quibusdam recusandae quo eius! Cum est eaque veniam.' },
    { id = 96, Label = 'Possession of Schedule 2 per', Fine = 350, Jail = 5, Points = 0, Color = 'orange', Desc = 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Praesentium natus doloribus, nam saepe autem fugiat facilis possimus facere voluptatibus consequuntur, eligendi, distinctio quibusdam recusandae quo eius! Cum est eaque veniam.' },
    { id = 97, Label = 'Weapons Trafficking', Fine = 2500, Jail = 20, Points = 0, Color = 'orange', Desc = 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Praesentium natus doloribus, nam saepe autem fugiat facilis possimus facere voluptatibus consequuntur, eligendi, distinctio quibusdam recusandae quo eius! Cum est eaque veniam.' },
    { id = 98, Label = 'Weapons Caching', Fine = 2000, Jail = 10, Points = 0, Color = 'orange', Desc = 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Praesentium natus doloribus, nam saepe autem fugiat facilis possimus facere voluptatibus consequuntur, eligendi, distinctio quibusdam recusandae quo eius! Cum est eaque veniam.' },
    { id = 99, Label = 'Possession of Class 1 FA per', Fine = 1500, Jail = 10, Points = 0, Color = 'orange', Desc = 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Praesentium natus doloribus, nam saepe autem fugiat facilis possimus facere voluptatibus consequuntur, eligendi, distinctio quibusdam recusandae quo eius! Cum est eaque veniam.' },
    { id = 100, Label = 'Possession of Class 2 FA per', Fine = 2000, Jail = 20, Points = 0, Color = 'orange', Desc = 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Praesentium natus doloribus, nam saepe autem fugiat facilis possimus facere voluptatibus consequuntur, eligendi, distinctio quibusdam recusandae quo eius! Cum est eaque veniam.' },
    { id = 101, Label = 'Wearing Holloween type mask or full facemask w-o Cause', Fine = 2500, Jail = 20, Points = 0, Color = 'orange', Desc = 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Praesentium natus doloribus, nam saepe autem fugiat facilis possimus facere voluptatibus consequuntur, eligendi, distinctio quibusdam recusandae quo eius! Cum est eaque veniam.' },
    { id = 102, Label = 'Illegal alteration of Motor Vehicle ie tuner chip', Fine = 2500, Jail = 10, Points = 0, Color = 'orange', Desc = 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Praesentium natus doloribus, nam saepe autem fugiat facilis possimus facere voluptatibus consequuntur, eligendi, distinctio quibusdam recusandae quo eius! Cum est eaque veniam.' },

    { id = 103, Label = 'Arson', Fine = 6000, Jail = 30, Points = 0, Color = 'red', Desc = 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Praesentium natus doloribus, nam saepe autem fugiat facilis possimus facere voluptatibus consequuntur, eligendi, distinctio quibusdam recusandae quo eius! Cum est eaque veniam.' },
    { id = 104, Label = 'Contempt of Court', Fine = 10000, Jail = 999, Points = 0, Color = 'red', Desc = 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Praesentium natus doloribus, nam saepe autem fugiat facilis possimus facere voluptatibus consequuntur, eligendi, distinctio quibusdam recusandae quo eius! Cum est eaque veniam.' },
    { id = 105, Label = 'Failure to Obey a Lawful Order', Fine = 10000, Jail = 999, Points = 0, Color = 'red', Desc = 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Praesentium natus doloribus, nam saepe autem fugiat facilis possimus facere voluptatibus consequuntur, eligendi, distinctio quibusdam recusandae quo eius! Cum est eaque veniam.' },
    { id = 106, Label = 'Escaping from Prison', Fine = 30000, Jail = 100, Points = 0, Color = 'red', Desc = 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Praesentium natus doloribus, nam saepe autem fugiat facilis possimus facere voluptatibus consequuntur, eligendi, distinctio quibusdam recusandae quo eius! Cum est eaque veniam.' },
    { id = 107, Label = 'Aggravated Assault', Fine = 5000, Jail = 30, Points = 0, Color = 'red', Desc = 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Praesentium natus doloribus, nam saepe autem fugiat facilis possimus facere voluptatibus consequuntur, eligendi, distinctio quibusdam recusandae quo eius! Cum est eaque veniam.' },
    { id = 108, Label = 'Accessory to Robbery', Fine = 10050, Jail = 35, Points = 0, Color = 'red', Desc = 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Praesentium natus doloribus, nam saepe autem fugiat facilis possimus facere voluptatibus consequuntur, eligendi, distinctio quibusdam recusandae quo eius! Cum est eaque veniam.' },
    { id = 109, Label = 'Manslaugther', Fine = 10200, Jail = 40, Points = 0, Color = 'red', Desc = 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Praesentium natus doloribus, nam saepe autem fugiat facilis possimus facere voluptatibus consequuntur, eligendi, distinctio quibusdam recusandae quo eius! Cum est eaque veniam.' },
    { id = 110, Label = 'Robbery', Fine = 15000, Jail = 45, Points = 0, Color = 'red', Desc = 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Praesentium natus doloribus, nam saepe autem fugiat facilis possimus facere voluptatibus consequuntur, eligendi, distinctio quibusdam recusandae quo eius! Cum est eaque veniam.' },
    { id = 111, Label = 'Armed Robbery', Fine = 20000, Jail = 65, Points = 0, Color = 'red', Desc = 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Praesentium natus doloribus, nam saepe autem fugiat facilis possimus facere voluptatibus consequuntur, eligendi, distinctio quibusdam recusandae quo eius! Cum est eaque veniam.' },
    { id = 112, Label = 'Murder', Fine = 30000, Jail = 100, Points = 0, Color = 'red', Desc = 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Praesentium natus doloribus, nam saepe autem fugiat facilis possimus facere voluptatibus consequuntur, eligendi, distinctio quibusdam recusandae quo eius! Cum est eaque veniam.' },
    { id = 113, Label = 'Attempted Murder of a Public Official', Fine = 15000, Jail = 60, Points = 0, Color = 'red', Desc = 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Praesentium natus doloribus, nam saepe autem fugiat facilis possimus facere voluptatibus consequuntur, eligendi, distinctio quibusdam recusandae quo eius! Cum est eaque veniam.' },
    { id = 114, Label = 'Attempted Murder', Fine = 10000, Jail = 40, Points = 0, Color = 'red', Desc = 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Praesentium natus doloribus, nam saepe autem fugiat facilis possimus facere voluptatibus consequuntur, eligendi, distinctio quibusdam recusandae quo eius! Cum est eaque veniam.' },
    { id = 115, Label = 'Animal Cruelty', Fine = 3000, Jail = 12, Points = 0, Color = 'red', Desc = 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Praesentium natus doloribus, nam saepe autem fugiat facilis possimus facere voluptatibus consequuntur, eligendi, distinctio quibusdam recusandae quo eius! Cum est eaque veniam.' },
},
    -- Charges page

    -- Staff page
    -- Staff page

    -- Staff Employees
        -- Change text to what you'd like to be displayed in the nui
        -- Do not change value
        -- Change if the item can be sorted or not (by clicking on it in the nui)
        -- If a divider should be shown, turn true, false ore remove it

        -- (EXAMPLE) VERY IMPORTANT THAT "text" AND "value" ALWAYS EXISTS! REST CAN BE REMOVED IF YOU WANT THAT
        -- {text = 'Call ID', value = 'callid',},
    StaffEmployees = {
        {text = 'Call Sign',        value = 'callsign',         sortable = true,  divider = true},
        {text = 'Name',             value = 'name',             sortable = false, divider = true},
        {text = 'Rank',             value = 'rank',             sortable = false, divider = true},
        {text = 'Phone number',     value = 'phone',            sortable = false, divider = true},
        {text = 'APU',              value = 'apu',              sortable = false, divider = true},
        {text = 'AIR',              value = 'air',              sortable = false, divider = true},
        {text = 'MC',               value = 'mc',               sortable = false, divider = true},
        {text = 'K9',               value = 'k9',               sortable = false, divider = true},
        {text = 'Strikes',          value = 'strikes',          sortable = false, divider = true},
        {text = 'Responsibilities', value = 'responsibilities', sortable = false, divider = true},
        {text = 'FTO',              value = 'fto',              sortable = false, divider = true},
        {text = 'Actions',          value = 'action',           sortable = false, divider = true}
    },
    -- Staff Employees

    -- Staff academy sheet
    -- Change text to what you'd like to be displayed in the nui
        -- Do not change value
        -- Change if the item can be sorted or not (by clicking on it in the nui)
        -- If a divider should be shown, turn true, false ore remove it

        -- (EXAMPLE) VERY IMPORTANT THAT "text" AND "value" ALWAYS EXISTS! REST CAN BE REMOVED IF YOU WANT THAT
        -- {text = 'Call ID', value = 'callid',},
    AcademySheet = {
        {text = 'Call Sign',        value = 'callsign', sortable = false, divider = true},
        {text = 'Name',             value = 'name',     sortable = false, divider = true},
        {text = 'Driving',          value = 'driving',  sortable = false, divider = true},
        {text = 'Shooting Training',value = 'shooting', sortable = false, divider = true},
        {text = 'Report Writing',   value = 'report',   sortable = false, divider = true},
        {text = 'MDW Access',       value = 'mdw',      sortable = false, divider = true},
        {text = 'Rights',           value = 'rights',   sortable = false, divider = true},
        {text = 'Intro course',     value = 'intro',    sortable = false, divider = true},
        {text = 'Theory Test',      value = 'theory',   sortable = false, divider = true},
        {text = 'Practical Test',   value = 'practical',sortable = false, divider = true},
        {text = 'Actions',          value = 'action',   sortable = false, divider = true}
    },
    -- Staff academy sheet

    -- Staff disciplinary database
    -- Change text to what you'd like to be displayed in the nui
        -- Do not change value
        -- Change if the item can be sorted or not (by clicking on it in the nui)
        -- If a divider should be shown, turn true, false ore remove it

        -- (EXAMPLE) VERY IMPORTANT THAT "text" AND "value" ALWAYS EXISTS! REST CAN BE REMOVED IF YOU WANT THAT
        -- {text = 'Call ID', value = 'callid',},
    Disciplinary = {
        {text = 'Call Sign',            value = 'callsign',     sortable = false, divider = true},
        {text = 'Name',                 value = 'name',         sortable = false, divider = true},
        {text = 'Department',           value = 'department',   sortable = false, divider = true},
        {text = 'Rank',                 value = 'rank',         sortable = false, divider = true},
        {text = 'Punishment',           value = 'punishment',   sortable = false, divider = true},
        {text = 'Date',                 value = 'date',         sortable = false, divider = true},
        {text = 'Given By',             value = 'givenby',      sortable = false, divider = true},
        {text = 'Reason for punishment',value = 'rfp',          sortable = false, divider = true},
        {text = 'Actions',              value = 'action',       sortable = false, divider = true}
    },
    -- Staff disciplinary database

    -- Staff 10 codes
    TenCodes = {
        {text = 'Code',         value = 'code', sortable = false, divider = true},
        {text = 'Description',  value = 'desc', sortable = false, divider = true},
    },
    TenCodesData = {
        {code = '10-0', desc = 'Request Judge'},
        {code = '10-1', desc = '1 on 1 conversation'},
        {code = '10-2', desc = 'Status Check'},
        {code = '10-3', desc = 'NOT OK'},
        {code = '10-4', desc = 'OK or Acknowledge'},
        {code = '10-5', desc = 'Request CSU-Det-ESU-K9-etc'},
        {code = '10-6', desc = 'Busy'},
        {code = '10-7', desc = 'Out of Service'},
        {code = '10-8', desc = 'In Service'},
        {code = '10-9', desc = 'Repeat'},
        {code = '10-10', desc = 'Running Radar'},
        {code = '10-11', desc = 'Traffic Stop'},
        {code = '10-12', desc = 'Person for Ridealong'},
        {code = '10-13', desc = 'Shots Fired Officer Needs Assistance'},
        {code = '10-14', desc = 'Request supervisor on Duty'},
        {code = '10-15', desc = 'Suspect in custody'},
        {code = '10-17', desc = 'Request DA or ADA'},
        {code = '10-20', desc = 'Location'},
        {code = '10-22', desc = 'Cancel-Disregard'},
        {code = '10-23', desc = 'On scene'},
        {code = '10-26', desc = 'ETA'},
        {code = '10-27', desc = 'Name Check'},
        {code = '10-28', desc = 'Plate Check'},
        {code = '10-29', desc = 'Warrant check'},
        {code = '10-32', desc = 'Backup Request additional unit'},
        {code = '10-33', desc = 'EMERGENCY Backup Immediately'},
        {code = '10-41', desc = 'Start Shift'},
        {code = '10-42', desc = 'End Shift'},
        {code = '10-45', desc = 'Request Coroner'},
        {code = '10-50', desc = 'MVA or MVC'},
        {code = '10-51', desc = 'Request a Tow'},
        {code = '10-52', desc = 'Request EMS'},
        {code = '10-53', desc = 'Request FIRE Rescue'},
        {code = '10-54', desc = 'Request Federal Unit'},
        {code = '10-55', desc = 'Request POLICE Air Unit'},
        {code = '10-56', desc = 'Request POLICE Marine Unit'},
        {code = '10-60', desc = 'In Area'},
        {code = '10-70', desc = 'Foot Pursuit'},
        {code = '10-76', desc = 'En Route'},
        {code = '10-80', desc = 'Vehicle Pursuit'},
        {code = '10-90', desc = 'Alarm Call'},
        {code = '10-95', desc = 'Prisoner Transport'},
        {code = '10-96', desc = 'Mental Health Evaluation'},
        {code = '10-97', desc = 'Medical Evaluation'},
        {code = '10-99', desc = 'Officer Down'},

        {code = 'Signal 100', desc = 'Clear All but EMERGENCY Radio Traffic'},

        {code = 'Code 0', desc = 'Server or Game Crash'},
        {code = 'Code 1', desc = 'No Lights No Siren'},
        {code = 'Code 2', desc = 'Lights and Siren burst'},
        {code = 'Code 3', desc = 'Balls Deep Run it all'},
        {code = 'Code 4', desc = 'Clear scene'},
        {code = 'Code 5', desc = 'Felony Vehicle stop'},
        {code = 'Code 6', desc = 'MCI'},
    },

    CMDS = {
        {text = 'Command',      value = 'cmd', sortable = false, divider = true},
        {text = 'Description',  value = 'desc', sortable = false, divider = true},
    },
    CMDSData = {
        {cmd = '/cuff',   desc = 'Hard Cuff Shackle player'},
        {cmd = '/sc',     desc = 'Soft Cuff player'},
        {cmd = '/+grab',     desc = 'Police Grab player'},
        {cmd = '/escort',     desc = 'Esctort player'},
        {cmd = '/pepperspray',     desc = 'Pepperspray canaster'},
        {cmd = '/Antidote',     desc = 'Pepperspray Antidote'},
        {cmd = '/clipboard',     desc = 'clipboard'},
        {cmd = '/notepad',     desc = 'Notepad'},
        {cmd = '/propstuck',     desc = 'Propstuck'},
        {cmd = '/e reaching',     desc = 'Ready Draw weapon'},
        {cmd = '/jail',   desc = 'Jail player'},
        {cmd = '/unjail', desc = 'Unjail player'},
        {cmd = '/comserv',    desc = 'comunity service'},
        {cmd = '/endcomserv',    desc = 'end comunity service'},
        {cmd = '/mdw',    desc = 'Open the MDW'},
        {cmd = '/me',    desc = 'Talk Text'},
        {cmd = '/e mugshot',    desc = 'Pulls up Mugshot Board'},
        {cmd = '/e cpr',    desc = 'CPR or CPR2'},
        {cmd = '/help',    desc = 'calles a AI medic'},
        {cmd = '/911',    desc = 'Calls Emergency Services'},
        {cmd = '/911e',    desc = 'Calls Player EMS'},
        {cmd = '/911a',    desc = 'Calls police Anonymously'},
        {cmd = '/e copbeacon',    desc = 'directing traffic'},
        {cmd = '/cam 1-35',    desc = 'city security cams 1-35'},
        {cmd = '/depot',    desc = 'repoed vehicle for an amount of money'},
        {cmd = '/impound',    desc = 'seized vehicle do not get it back'},
        {cmd = '/Grantlicense',    desc = 'Drivers or Weapons'},
        {cmd = '/Revokelicense',    desc = 'Driver or Weapons'},
        {cmd = '/givekeys',    desc = 'Give keys stand aside car both of u'},
        {cmd = '/flipvehicle',    desc = 'Flip over car '},


    },
    -- Staff 10 codes


    -- Legislation page
    Legislations = {
        Tags = {
            {id = 1, label = 'Example 1'},
            {id = 2, label = 'Example 2'},
            {id = 3, label = 'Example 3'},
            {id = 4, label = 'Example 4'},
            {id = 5, label = 'Example 5'},
        }
    },
    -- Legislation page

    -- Configuration page
    Message = { -- This will be shown if there's no message in the database
        Title = 'NO MESSAGE',
        Text = 'Theres currently no message to display, so how about you actually do some work around here?'
    },
    Announcement = {
        Tags = {
            {id = 1, label = 'Example 1'},
            {id = 2, label = 'Example 2'},
            {id = 3, label = 'Example 3'},
            {id = 4, label = 'Example 4'},
            {id = 5, label = 'Example 5'},
        }
    },
    -- Configuration page

    -- Staff roles
    PoliceRoles = { -- Assignable roles, that gives access to certain functions.
        {id = 0, access = false, role = 'Full Access'}, -- Only edit the "role"

        {id = 1, access = false, role = 'Edit Profiles'},

        {id = 2, access = false, role = 'Edit Incidents'},
        {id = 3, access = false, role = 'Create Incidents'},
        {id = 4, access = false, role = 'Delete Incidents'},
        
        {id = 5, access = false, role = 'Edit Reports'},
        {id = 6, access = false, role = 'Create Reports'},
        {id = 7, access = false, role = 'Delete Reports'},

        {id = 8, access = false, role = 'Edit Evidence'},
        {id = 9, access = false, role = 'Create Evidence'},
        {id = 10, access = false, role = 'Delete Evidence'},

        {id = 11, access = false, role = 'Edit Vehicles'},

        {id = 12, access = false, role = 'Staff Employees'},
        {id = 13, access = false, role = 'Academy Sheet'},
        {id = 14, access = false, role = 'Disciplinary Database'},

        {id = 15, access = false, role = 'Legislation'} -- Required if you want to add/delete/edit legislations, full access doesn't have access to this for roleplay reasons!
    }

    -- // NUI CONFIGURABLES // --
    -----------------------------
}

Notifications = {
    ERROR404 = {'something happend, contact the server owner', 'error'}, -- Something happend that shouldnt

    -- Officer notifications
    FiredTarget = {'Target fired and placed as unemployed', 'success'},
    HiredTarget = {'Target hired and placed as police', 'success'},
    FiredNoResult = {'Citizenid could not be found in the database', 'error'},
    SaveStaff = {'Staff profile was saved', 'success'},
    UnitExists = {'A unit with that name already exists', 'error'},

    -- Police notifications
    ProfileSaved = {'Profile was saved', 'success'},
    TargetFired = {'You were fired from the police', 'error'},
    TargetHired = {'You were hired to the police', 'success'},

    -- Basic notifications
    OnDuty = {'You are now on duty', 'success'},
    OffDuty = {'You are now off duty', 'success'},
    TargetOffline = {'Action can not be done, while the target is offline', 'error'},
}