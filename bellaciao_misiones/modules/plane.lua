function plane_mission()
    local activeGeneral = 0
    local activeGeneral2 = false
    local phase = nil
    local spawned = false
    ESX.UI.Menu.CloseAll()
    ESX.ShowNotification(Config.Misiones.Traducciones.PlaneGoMilitarBase)
    Wait(4500)
    ESX.ShowNotification(Config.Misiones.Traducciones.CopCanGetYou)
    Wait(500)
    SetNewWaypoint(Config.Misiones.Misiones.Plane.Posiciones.Plane1.coords.x, Config.Misiones.Misiones.Plane.Posiciones.Plane1.coords.y)

    phase = 2

    Citizen.CreateThread(function()
        while true do
            playerPed = PlayerPedId()
            pedCoords = GetEntityCoords(playerPed)
            isInVeh = IsPedInAnyVehicle(playerPed)
            inVeh = GetVehiclePedIsIn(playerPed, false)
            local distance = nil
            local vector = nil
            local msec = 1000
            if phase ~= 0 then
                if phase == 1 then
                    
                    distance = Vdist(pedCoords, Config.Misiones.Misiones.Plane.Posiciones.Plane1.coords.x, Config.Misiones.Misiones.Plane.Posiciones.Plane1.coords.y, Config.Misiones.Misiones.Plane.Posiciones.Plane1.coords.z)
                    if distance <= 300 and activeGeneral == nil then
                        activeGeneral = 0
                        ESX.ShowNotification(Config.Misiones.Traducciones.TakePlaneAndGo)
                        SetNewWaypoint(Config.Misiones.Misiones.Plane.Posiciones.StopPlane.x, Config.Misiones.Misiones.Plane.Posiciones.StopPlane.y)
                        spawnVehicle(Config.Misiones.Misiones.Plane.Posiciones.Plane1.coords.x, Config.Misiones.Misiones.Plane.Posiciones.Plane1.coords.y, Config.Misiones.Misiones.Plane.Posiciones.Plane1.coords.z, Config.Misiones.Misiones.Plane.Posiciones.Plane1.coords.w, Config.Misiones.Misiones.Plane.Posiciones.Plane1.model)
                        phase = 2
                    end
                elseif phase == 2 then

                    distance = Vdist(pedCoords, Config.Misiones.Misiones.Plane.Posiciones.StopPlane)
                    if distance <= 10 and activeGeneral == 0 then
                        msec = 0
                        vector = vector3(pedCoords.x, pedCoords.y, pedCoords.z + 1.50)
                        ESX.ShowFloatingHelpNotification(Config.Misiones.Traducciones.DoPlaneAction, vector)
                            if IsControlJustPressed(0, 38) then
                                activeGeneral = 1
                            end
                    elseif distance <= 10 and activeGeneral == 1 then
                        msec = 0
                        FreezeEntityPosition(inVeh, true)
                        ESX.ShowNotification(Config.Misiones.Traducciones.OpenPlaneDoor)
                        SetVehicleDoorOpen(inVeh, 5, false, false)
                        Wait(1500)
                        ESX.ShowNotification(Config.Misiones.Traducciones.UnloadingPlane)
                        Wait(5000)
                        ESX.ShowNotification(Config.Misiones.Traducciones.ClosePlaneDoor)
                        SetVehicleDoorsShut(inVeh, false)
                        Wait(2000)
                        FreezeEntityPosition(inVeh, false)
                        Wait(1000)
                        activeGeneral = 2
                        ESX.ShowNotification(Config.Misiones.Traducciones.BackPlane)
                        SetNewWaypoint(Config.Misiones.Misiones.Plane.Posiciones.Plane1.coords.x, Config.Misiones.Misiones.Plane.Posiciones.Plane1.coords.y)
                    end
                end
            elseif phase == 0 then
                break
            end
            Citizen.Wait(msec)
        end
    end)
end