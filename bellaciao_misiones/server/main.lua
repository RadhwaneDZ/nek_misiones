ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterNetEvent('nek_misiones:server:darRecompensa')
AddEventHandler('nek_misiones:server:darRecompensa', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    local azar = math.random(1, 3)
    local finalMoney = math.random(Config.Misiones.Misiones.Prices.Min, Config.Misiones.Misiones.Prices.Max)

    if azar == 1 then
        xPlayer.addMoney(finalMoney)
        TriggerClientEvent('esx:showNotification', source, 'Has recibido '.. finalMoney ..'$')
    elseif azar == 2 then
        local random = math.random(1, 6)
        local weapon = nil
        if random == 1 then
            weapon = Config.Misiones.Misiones.Weapons.gun1
        elseif random == 2 then
            weapon = Config.Misiones.Misiones.Weapons.gun2
        elseif random == 3 then
            weapon = Config.Misiones.Misiones.Weapons.gun3
        elseif random == 4 then
            weapon = Config.Misiones.Misiones.Weapons.gun4
        elseif random == 5 then
            weapon = Config.Misiones.Misiones.Weapons.gun5
        elseif random == 6 then
            weapon = Config.Misiones.Misiones.Weapons.gun6
        end
        xPlayer.addWeapon(weapon, 0)
        xPlayer.addWeaponAmmo(weapon, 200)
        TriggerClientEvent('esx:showNotification', source, 'Has recibido x1 '.. weapon)
    elseif azar == 3 then
        xPlayer.addAccountMoney('black_money', finalMoney)
        TriggerClientEvent('esx:showNotification', source, 'Has recibido '.. finalMoney ..'$ en negro')
    end
end)

RegisterNetEvent('nek_missions:server:helicopter:getObject')
AddEventHandler('nek_missions:server:helicopter:getObject', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    local random = math.random(Config.Misiones.Misiones.Object.Min, Config.Misiones.Misiones.Object.Max)
    local object = Config.Misiones.Misiones.Object.name

    xPlayer.addInventoryItem(object, random)
end)

RegisterNetEvent('nek_missions:server:helicopter:giveObject')
AddEventHandler('nek_missions:server:helicopter:giveObject', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    --local random = math.random(Config.Misiones.Misiones.Object.Min, Config.Misiones.Misiones.Object.Max)
    local object = Config.Misiones.Misiones.Object.name
    local quantity = xPlayer.getInventoryItem(object).count

    xPlayer.removeInventoryItem(object, quantity)
end)