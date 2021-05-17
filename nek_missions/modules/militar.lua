local activeGeneral = false
local activeGeneral2 = false
local phase = nil
local spawned = false

function militar_mission()
    ESX.UI.Menu.CloseAll()
    spawnVehicle(Config.Misiones.Misiones.Militar.Posiciones.Vehicle.coords.x, Config.Misiones.Misiones.Militar.Posiciones.Vehicle.coords.y, Config.Misiones.Misiones.Militar.Posiciones.Vehicle.coords.z, Config.Misiones.Misiones.Militar.Posiciones.Vehicle.coords.w, Config.Misiones.Misiones.Militar.Posiciones.Vehicle.model)
    ESX.ShowNotification(Config.Misiones.Traducciones.TakeCar)
    Citizen.Wait(4500)
    ESX.ShowNotification(Config.Misiones.Traducciones.CopCanGetYou)
    phase = 1
    Citizen.CreateThread(function()
        while true do
            playerPed = PlayerPedId()
            pedCoords = GetEntityCoords(playerPed)
            isInVeh = IsPedInAnyVehicle(playerPed)
            inVeh = GetVehiclePedIsIn(playerPed, false)
            local msec = 1000
            if phase ~= 0 then
                local distance = nil
                local vector = nil

                if phase == 1 then
                    SetNewWaypoint(Config.Misiones.Misiones.Militar.Posiciones.DeleteCar.x, Config.Misiones.Misiones.Militar.Posiciones.DeleteCar.y)
                    distance = Vdist(pedCoords, Config.Misiones.Misiones.Militar.Posiciones.DeleteCar)
                    if distance <= 3 and isInVeh then
                        msec = 0
                        vector = vector3(Config.Misiones.Misiones.Militar.Posiciones.DeleteCar.x, Config.Misiones.Misiones.Militar.Posiciones.DeleteCar.y, Config.Misiones.Misiones.Militar.Posiciones.DeleteCar.z + 2.00)
                        ShowFloatingHelpNotification(Config.Misiones.Traducciones.DeleteNotification, vector)
                        if IsControlJustPressed(0, 38) then
                            DeleteVehicle(inVeh)
                            phase = 2
                        end
                    end
                elseif phase == 2 then
                    if activeGeneral == false then
                        spawnVehicle(Config.Misiones.Misiones.Militar.Posiciones.Truck.coords.x, Config.Misiones.Misiones.Militar.Posiciones.Truck.coords.y, Config.Misiones.Misiones.Militar.Posiciones.Truck.coords.z, Config.Misiones.Misiones.Militar.Posiciones.Truck.coords.w, Config.Misiones.Misiones.Militar.Posiciones.Truck.model)
                        spawnVehicle(Config.Misiones.Misiones.Militar.Posiciones.Trailer.coords.x, Config.Misiones.Misiones.Militar.Posiciones.Trailer.coords.y, Config.Misiones.Misiones.Militar.Posiciones.Vehicle.coords.z, Config.Misiones.Misiones.Militar.Posiciones.Trailer.coords.w, Config.Misiones.Misiones.Militar.Posiciones.Trailer.model)
                        ESX.ShowNotification(Config.Misiones.Traducciones.TakeTruck)
                        Citizen.Wait(4500)
                        ESX.ShowNotification(Config.Misiones.Traducciones.CopCanGetYou)
                        SetNewWaypoint(Config.Misiones.Misiones.Militar.Posiciones.Vehicle.coords.x, Config.Misiones.Misiones.Militar.Posiciones.Vehicle.coords.y)
                        phase = 3
                        activeGeneral = true
                        activeGeneral2 = false
                    end
                elseif phase == 3 then
                    if activeGeneral2 == false then
                        activeGeneral = false
                        activeGeneral2 = true
                    end
                    distance = Vdist(pedCoords, Config.Misiones.Misiones.Militar.Posiciones.Vehicle.coords.x, Config.Misiones.Misiones.Militar.Posiciones.Vehicle.coords.y, Config.Misiones.Misiones.Militar.Posiciones.Vehicle.coords.z)
                    if distance <= 6 then
                        msec = 0
                        vector = vector3(pedCoords.x, pedCoords.y, pedCoords.z + 1.00)
                        ShowFloatingHelpNotification(Config.Misiones.Traducciones.DeleteNotification, vector)
                        if IsControlJustPressed(0, 38) then
                            DeleteVehicle(inVeh)
                            phase = 0
                            TriggerServerEvent('nek_misiones:server:darRecompensa')
                            Wait(4500)
                            ESX.ShowNotification(Config.Misiones.Traducciones.EndMission)
                        end
                        if activeGeneral == false then
                            ESX.ShowNotification(Config.Misiones.Traducciones.FinalizarMilitar)
                            activeGeneral = true
                        end
                    end
                end
                    
            elseif phase == 0 then
                break
            end
            Wait(msec)
        end
    end)
end
