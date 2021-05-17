local playerPed = PlayerPedId()
local playerCoords = nil
local inVeh = nil
local isInVeh = nil

Citizen.CreateThread(function()
    while true do
        local time = 1000
        for k, v in pairs(Config.Misiones) do
            local inMarker = nil 
            playerCoords = GetEntityCoords(playerPed)
            inVeh = GetVehiclePedIsIn(playerPed)
            isInVeh = IsPedSittingInAnyVehicle(playerPed)
            local vector = vector3(Config.Misiones.Peds.PedMisiones.Position.x, Config.Misiones.Peds.PedMisiones.Position.y, Config.Misiones.Peds.PedMisiones.Position.z)
            local vector2 = vector3(Config.Misiones.Peds.PedVenta.Position.x, Config.Misiones.Peds.PedVenta.Position.y, Config.Misiones.Peds.PedVenta.Position.z)
            local distance = Vdist(GetEntityCoords(PlayerPedId()), vector.x, vector.y, vector.z)
            local distance2 = Vdist(GetEntityCoords(PlayerPedId()), vector2.x, vector2.y, vector2.z)

            if distance <= 3 then
                inMarker = "npc1"
                time = 0
                ShowFloatingHelpNotification(Config.Misiones.Traducciones.PedText, vector3(Config.Misiones.Peds.PedMisiones.Position.x, Config.Misiones.Peds.PedMisiones.Position.y, Config.Misiones.Peds.PedMisiones.Position.z + 1.9))
            elseif distance2 <= 3 then
                inMarker = "npc2"
                time = 0
                ShowFloatingHelpNotification(Config.Misiones.Traducciones.PedVentaText, vector3(Config.Misiones.Peds.PedVenta.Position.x, Config.Misiones.Peds.PedVenta.Position.y, Config.Misiones.Peds.PedVenta.Position.z + 1.9))
            end

            if inMarker == "npc1" and IsControlJustPressed(0, 38) then
                OpenMissionMenu()
            elseif inMarker == "npc2" and IsControlJustPressed(0, 38) then
                TriggerServerEvent('nek_missions:server:helicopter:giveObject', 'ped')
            end
        end
        Citizen.Wait(time)
    end
end)
