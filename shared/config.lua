Config = {
    BlipNumber = 357, -- https://docs.fivem.net/docs/game-references/blips/#blips
    BlipColor = 4, -- https://docs.fivem.net/docs/game-references/blips/#blip-colors
    ShowBlips = true, -- If true, will show blips on the map
    UniqueBlips = true, -- If true, will show seperate names per garage, disabled if ShowBlips is false
}

Config.Garages = {
    legiongarage = {
        blipName = 'Legion Square Garage',
        takeVehicleZone = {
            vec3(199.61, -805.95, 31.0),
            vec3(211.69, -773.15, 31.0),
            vec3(235.57, -781.83, 31.0),
            vec3(222.5, -814.45, 31.0),
            vec3(221.25, -813.96, 31.0),
        },
        spawnPoints = {
            vector4(222.02, -804.19, 30.26, 248.19),
            vector4(223.93, -799.11, 30.25, 248.53),
            vector4(226.46, -794.33, 30.24, 248.29),
            vector4(232.33, -807.97, 30.02, 69.17),
            vector4(234.42, -802.76, 30.04, 67.2),
        },
    },
    motelgarage = {
        blipName = 'Motel Garage',
        takeVehicleZone = {
            vec3(265.94, -343.45, 45.0),
            vec3(267.98, -337.70, 45.0),
            vec3(261.0, -335.0, 45.0),
            vec3(267.79, -315.87, 45.0),
            vec3(305.0, -329.0, 45.0),
            vec3(295.0, -355.0, 45.0),
        },
        spawnPoints = {
            vector4(265.96, -332.3, 44.51, 250.68),
            vector4(267.35, -329.1, 44.92, 248.32),
            vector4(268.42, -325.87, 44.92, 249.03),
            vector4(269.71, -322.45, 44.92, 249.3),
            vector4(270.95, -319.38, 44.92, 247.48)
        },
    },
}