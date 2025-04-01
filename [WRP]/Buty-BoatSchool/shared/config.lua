Framework = {
    FrameworkName = 'qb', -- esx or qb
    FileName = 'qb-core', -- es_extended / qb-core
    SQLWrapper = 'oxmysql', --  oxmysql / mysql-async / ghmattimysql
    UseButyLicense = false -- true / false -> https://butycall.tebex.io/package/5743295
}

Prices = {
    PaymentMethod = 'bank', -- bank / cash
    Theoretical = 10000,
    Practical = 15000
}

NPC = {
    Position = vector4(-786.698914, -1385.380249, 0.578735, 45.354328),
    Model = 's_m_m_pilot_01'
}

Blip = {
    Sprite = 427,
    Color = 38,
    Scale = 1.0,
    Label = 'Boat School'
}

TheoreticalExam = {
    MistakeMax = 2,
    ExamTime = 2.5, -- In minutes
    Questions = {
        {
            Question = 'What is the front of the boat called?',
            Answers = {
                { Text = 'Backside', Right = false },
                { Text = 'Bow', Right = true },
                { Text = 'Frontier', Right = false }
            }
        },
        {
            Question = 'How do you measure a boats speed?',
            Answers = {
                { Text = 'Using a stopwatch and counting waves', Right = false },
                { Text = 'With a magic speedometer', Right = false },
                { Text = 'Using a knot meter', Right = true }
            }
        },
        {
            Question = 'Which nautical term refers to the left side of the boat when facing forward?',
            Answers = {
                { Text = 'Starboard', Right = false },
                { Text = 'Port', Right = true },
                { Text = 'Larboard', Right = false }
            }
        },
        {
            Question = 'Why are boats like good friends?',
            Answers = {
                { Text = 'They always tell you great jokes', Right = true },
                { Text = 'They never let you down', Right = true },
                { Text = 'Because they have a good sense of direction', Right = false }
            }
        },
        {
            Question = 'What is the purpose of a bilge pump on a boat?',
            Answers = {
                { Text = 'To remove water that collects in the bilge', Right = true },
                { Text = 'To provide additional power to the engine', Right = false },
                { Text = 'To help navigate through shallow waters', Right = false }
            }
        },
        {
            Question = 'Why couldnt the sailors play cards on the boat?',
            Answers = {
                { Text = 'Because the cards kept flying away', Right = true },
                { Text = 'Because the captain said so', Right = false },
                { Text = 'Because of all the cheetahs', Right = false }
            }
        },
        {
            Question = 'What does the term "draft" refer to in boating?',
            Answers = {
                { Text = 'The act of writing a formal document for the vessel', Right = false },
                { Text = 'The depth of a boats hull below the waterline', Right = true },
                { Text = 'The number of crew members on board', Right = false }
            }
        },
        {
            Question = 'What do you call a funny boat?',
            Answers = {
                { Text = 'SadShip', Right = false },
                { Text = 'Baby Tatch', Right = false },
                { Text = 'Funny Ship', Right = true }
            }
        }
    }
}

PracticalExam = {
    MissionTime = 10, -- In minutes
    Model = 'speeder',
    VehiclePlate = 'Boat School',
    SpawnCoords = {
        vector4(-767.46, -1379.73, 0.12, 51.7)
    },
    CheckpointMarker = { Type = 6, Size = 25.0, Color = { 47, 92, 115, 255 } },
    Texts = {
        -- First mission
        [1] = 'Exit the Port Zone',
        -- Second mission
        [2] = 'Navigate the Circuit, without leaving the course',
        -- Third mission
        [3] = 'Avoid Obstacles',
        -- Fourth mission
        [4] = 'Navigate the Circuit through the channels of Los Santos',
        -- Fifth mission
        [5] = 'Park the boat without crashing'
    },
    Routes = {
        {
            -- First mission
            {
                { Pos = vector3(-835.23, -1529.29, 0.12) }
            },
            -- Second mission
            {
                { Pos = vector3(-907.18, -1600.54, 0.12) },
                { Pos = vector3(-989.66, -1689.09, 0.03) },
                { Pos = vector3(-1077.44, -1772.11, 0.3) },
                { Pos = vector3(-1195.42, -1876.2, 0.28) },
                { Pos = vector3(-1259.57, -1969.62, 0.22) },
                { Pos = vector3(-1346.27, -1997.89, 0.38) },
                { Pos = vector3(-1433.55, -2047.24, -0.07) },
                { Pos = vector3(-1559.25, -2163.55, 0.34) },
                { Pos = vector3(-1687.87, -2261.56, 0.53) }
            },
            -- Third mission
            {
                { Pos = vector3(-1829.74, -2658.66, 0.92) },
                { Pos = vector3(-1915.89, -2803.36, 1.33) },
                { Pos = vector3(-1969.02, -2779.17, 0.53) },
                { Pos = vector3(-1881.45, -2637.39, 0.92) }
            },
            -- Fourth mission
            {
                { Pos = vector3(-1054.7, -1752.16, 0.4) },
                { Pos = vector3(-884.52, -1582.59, 0.03) },
                { Pos = vector3(-843.25, -1457.1, -0.04) },
                { Pos = vector3(-912.36, -1355.74, -0.08) },
                { Pos = vector3(-988.33, -1356.51, -0.05) },
                { Pos = vector3(-1057.62, -1229.95, -0.51) },
                { Pos = vector3(-1106.41, -1150.69, -0.54) },
                { Pos = vector3(-1113.44, -1120.62, -0.37) },
                { Pos = vector3(-1000.25, -1054.48, -0.45) },
                { Pos = vector3(-947.37, -1024.16, -0.45) },
                { Pos = vector3(-914.38, -1073.83, -0.5) },
                { Pos = vector3(-899.48, -1118.03, -0.58) },
                { Pos = vector3(-948.45, -1147.04, -0.56) },
                { Pos = vector3(-1008.26, -1181.01, -0.41) },
                { Pos = vector3(-1058.91, -1235.53, -0.46) },
                { Pos = vector3(-982.39, -1364.26, -0.03) },
                { Pos = vector3(-926.6, -1358.44, -0.08) },
                { Pos = vector3(-835.98, -1464.27, -0.04) }
            },
            -- Fifth mission
            {
                { Pos = vector3(-859.13, -1486.98, -0.09) }
            }
        }
    }
}

Translation = {
    OpenMenu = '~w~PRESS ~ub~[E]~wu~ ~w~to open the boat school',
    NotEnoughMoney = 'You don\'t have enough money'
}