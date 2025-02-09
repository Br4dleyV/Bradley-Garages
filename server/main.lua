local QBCore = exports['qb-core']:GetCoreObject()

QBCore.Functions.CreateCallback('bradley-garages:server:GetVehicles', function(source, cb)
    local src = source
    local player = QBCore.Functions.GetPlayer(src)
    if not player then return cb(nil) end

    local vehicles = MySQL.query.await('SELECT * FROM player_vehicles WHERE citizenid = @citizenid', {
        ['@citizenid'] = player.PlayerData.citizenid
    })

    cb(vehicles)
end)