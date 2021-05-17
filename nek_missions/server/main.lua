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
        local bullets = 200
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
        if xPlayer.hasWeapon(weapon) then
            xPlayer.addWeaponAmmo(weapon, bullets)
        else
            xPlayer.addWeapon(weapon, bullets)
        end
        TriggerClientEvent('esx:showNotification', source, 'Has recibido x1 '.. weapon ..' con '.. bullets ..' balas')
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
AddEventHandler('nek_missions:server:helicopter:giveObject', function(type)
    local xPlayer = ESX.GetPlayerFromId(source)
    --local random = math.random(Config.Misiones.Misiones.Object.Min, Config.Misiones.Misiones.Object.Max)
    local object = Config.Misiones.Misiones.Object.name
    local quantity = xPlayer.getInventoryItem(object).count

    if type == 'mission' then
        xPlayer.removeInventoryItem(object, quantity)
    elseif type == 'ped' then
        if quantity >= 1 then
            xPlayer.removeInventoryItem(object, quantity)
            local random = math.random(1 ,2)
            local random2 = math.random(Config.Misiones.Peds.PedVenta.Price.Min, Config.Misiones.Peds.PedVenta.Price.Max)
            print(random2)
            if random == 1 then
                xPlayer.addMoney(random2)
                TriggerClientEvent('esx:showNotification', source, 'Has recibido '.. random2 ..'$')
            elseif random == 2 then
                xPlayer.addAccountMoney('black_money', random2)
                TriggerClientEvent('esx:showNotification', source, 'Has recibido '.. random2 ..'$ en negro')
            end
        else
            TriggerClientEvent('esx:showNotification', source, Config.Misiones.Traducciones.NoObject)
        end
    end
end)