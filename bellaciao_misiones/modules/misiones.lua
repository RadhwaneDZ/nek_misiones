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
            local vector = vector3(Config.Misiones.Ped.Position.x, Config.Misiones.Ped.Position.y, Config.Misiones.Ped.Position.z)
            local distance = Vdist(GetEntityCoords(PlayerPedId()), vector.x, vector.y, vector.z)

            if distance <= 3 then
                inMarker = "npc"
                time = 0
                ESX.ShowFloatingHelpNotification(Config.Misiones.Traducciones.PedText, vector3(Config.Misiones.Ped.Position.x, Config.Misiones.Ped.Position.y, Config.Misiones.Ped.Position.z + 1.9))
            end

            if inMarker == "npc" and IsControlJustPressed(0, 38) then
                OpenMissionMenu()
            end
        end
        Citizen.Wait(time)
    end
end)