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

for i, v in pairs(Config.Garages) do
    if (Config.ShowBlips) then
        CreateBlip(v.takeVehicleZone, v.blipName)
    end
end