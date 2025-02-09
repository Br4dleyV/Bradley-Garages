local QBCore = exports['qb-core']:GetCoreObject()

-- Finds the middle of the zone and creates a blip there
local function FindMiddleOfZone(zone)
    local x, y, z = 0.0, 0.0, 0.0
    for i, v in pairs(zone) do
        x = x + v.x
        y = y + v.y
        z = z + v.z
    end
    return vector3(x / #zone, y / #zone, z / #zone)
end

-- Creates a blip for the zone with a specific name
local function CreateBlip(zone, blipName)
    local blipCoords = FindMiddleOfZone(zone)
    local blip = AddBlipForCoord(blipCoords.x, blipCoords.y, blipCoords.z)
    SetBlipSprite(blip, Config.BlipNumber)
    SetBlipDisplay(blip, 4)
    SetBlipScale(blip, 0.6)
    SetBlipColour(blip, Config.BlipColor)
    SetBlipAsShortRange(blip, true)

    BeginTextCommandSetBlipName("STRING")
    if (Config.UniqueBlips) then
        AddTextComponentString(blipName)
    else
        AddTextComponentString("Public Parking")
    end
    EndTextCommandSetBlipName(blip)
end

local function OpenGarage(garageData)
    QBCore.Functions.TriggerCallback('bradley-garages:server:GetVehicles', function(vehicles)
        if vehicles then
            print(json.encode(GetAllVehicleModels()))
            local menuOptions = {}

            for i, v in pairs(vehicles) do
                local option = {}
                option.title = v.vehicle
                option.description = v.plate
                option.metadata = {
                    ["Garage"] = garageData.blipName,
                    ["Plate"] = v.plate,
                    ["Fuel"] = v.fuel .. "%",
                    ["Engine"] = v.engine/10 .. "%",
                    ["Body"] = v.body/10 .. "%",
                    ["Vehicle"] = v.vehicle,
                }
                option.image = "vehicle_images/"..v.vehicle..".webp"
                option.onSelect = function()
                    print("Selected vehicle: " .. v.vehicle)
                end

                table.insert(menuOptions, option)
            end

            lib.registerContext({
                id = 'garage',
                title = garageData.blipName,
                canClose = true,
                options = menuOptions,
            })
            lib.showContext('garage')
        else
            print("No vehicles found or player not found.")
        end
    end)
end

for i, v in pairs(Config.Garages) do
    if (Config.ShowBlips) then
        CreateBlip(v.takeVehicleZone, v.blipName)
    end

    local insideZone = false
    lib.zones.poly({
        points = v.takeVehicleZone,
        onEnter = function ()
            lib.showTextUI('Press [E] to take a vehicle')
            insideZone = true
            CreateThread(function ()
                while insideZone do
                    if IsControlJustPressed(0, 38) then
                        OpenGarage(v)
                    end
                    Wait(0)
                end
            end)
        end,
        onExit = function ()
            lib.hideTextUI()
            insideZone = false
        end,
    })
end