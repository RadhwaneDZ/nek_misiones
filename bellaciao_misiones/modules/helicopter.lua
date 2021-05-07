function helicopter_mission()
    local activeGeneral = nil
    local activeGeneral2 = false
    local phase = nil
    local spawned = false
    ESX.UI.Menu.CloseAll()


    phase = 1
    ESX.ShowNotification(Config.Misiones.Traducciones.GoHelicopter)
    SetNewWaypoint(Config.Misiones.Misiones.Helicopter.Posiciones.Helicopter.coords.x, Config.Misiones.Misiones.Helicopter.Posiciones.Helicopter.coords.y)
    Wait(4500)
    ESX.ShowNotification(Config.Misiones.Traducciones.CopCanGetYou)
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
                    distance = Vdist(pedCoords, Config.Misiones.Misiones.Helicopter.Posiciones.Helicopter.coords.x, Config.Misiones.Misiones.Helicopter.Posiciones.Helicopter.coords.y, Config.Misiones.Misiones.Helicopter.Posiciones.Helicopter.coords.z)
                    if distance <= 100 and spawned == false then
                        msec = 0
                        ESX.ShowNotification(Config.Misiones.Traducciones.GoToHelicopterDrug)
                        spawnVehicle(Config.Misiones.Misiones.Helicopter.Posiciones.Helicopter.coords.x, Config.Misiones.Misiones.Helicopter.Posiciones.Helicopter.coords.y, Config.Misiones.Misiones.Helicopter.Posiciones.Helicopter.coords.z, Config.Misiones.Misiones.Helicopter.Posiciones.Helicopter.coords.w, Config.Misiones.Misiones.Helicopter.Posiciones.Helicopter.model)
                        SetNewWaypoint(Config.Misiones.Misiones.Helicopter.Posiciones.StopHelicopter.x, Config.Misiones.Misiones.Helicopter.Posiciones.StopHelicopter.y)
                        spawned = true
                        phase = 2 
                        activeGeneral = 0
                    end
                elseif phase == 2 then
                    spawned = false
                    distance = Vdist(pedCoords, Config.Misiones.Misiones.Helicopter.Posiciones.StopHelicopter)
                    if distance < 150 and distance > 10 and activeGeneral == 0 then    
                        msec = 0
                        vector = vector3(pedCoords.x, pedCoords.y, pedCoords.z + 1.00)
                        ESX.ShowFloatingHelpNotification(Config.Misiones.Traducciones.GoDownHelicopter, vector)
                    elseif distance < 10 and activeGeneral == 0 then
                        activeGeneral = 1
                        ESX.ShowNotification(Config.Misiones.Traducciones.TakeDrugHelicopter)
                        --AddPed(Config.Misiones.Misiones.Helicopter.Posiciones.Ped.coords.x, Config.Misiones.Misiones.Helicopter.Posiciones.Ped.coords.y, Config.Misiones.Misiones.Helicopter.Posiciones.Ped.coords.z, Config.Misiones.Misiones.Helicopter.Posiciones.Ped.coords.w, Config.Misiones.Misiones.Helicopter.Posiciones.Ped.model)
                        phase = 3
                        activeGeneral = nil
                    end
                elseif phase == 3 then
                    distance = Vdist(pedCoords, vector3(Config.Misiones.Misiones.Helicopter.Posiciones.Ped.coords.x, Config.Misiones.Misiones.Helicopter.Posiciones.Ped.coords.y, Config.Misiones.Misiones.Helicopter.Posiciones.Ped.coords.z))
    
                    if distance <= 3 then
                        msec = 0
                        ESX.ShowFloatingHelpNotification(Config.Misiones.Traducciones.TakeDrugPed, vector3(Config.Misiones.Misiones.Helicopter.Posiciones.Ped.coords.x, Config.Misiones.Misiones.Helicopter.Posiciones.Ped.coords.y, Config.Misiones.Misiones.Helicopter.Posiciones.Ped.coords.z + 1.00))
                        if IsControlJustPressed(0, 38) then
                            TriggerServerEvent('nek_missions:server:helicopter:getObject')
                            phase = 4
                        end
                    end
                elseif phase == 4 then
                    if activeGeneral == nil then
                        activeGeneral = true
                        ESX.ShowNotification(Config.Misiones.Traducciones.GoDrugHelicopter)
                        SetNewWaypoint(Config.Misiones.Misiones.Helicopter.Posiciones.Container.x, Config.Misiones.Misiones.Helicopter.Posiciones.Container.y)
                    end
                    distance = Vdist(pedCoords, vector3(Config.Misiones.Misiones.Helicopter.Posiciones.Container.x, Config.Misiones.Misiones.Helicopter.Posiciones.Container.y, Config.Misiones.Misiones.Helicopter.Posiciones.Container.z))
                    if distance < 5 then
                        msec = 0
                        vector = vector3(pedCoords.x, pedCoords.y, pedCoords.z + 1.00)
                        ESX.ShowFloatingHelpNotification(Config.Misiones.Traducciones.TakeFinalReward, vector)
                        if IsControlJustPressed(0, 38) then
                            TriggerServerEvent('nek_missions:server:helicopter:giveObject', 'mission')
                            ExecuteCommand(Config.Misiones.Traducciones.DoHelicopter)
                            TaskStartScenarioInPlace(PlayerPedId(), "PROP_HUMAN_BUM_BIN", 0, true)
                            Wait(5000)
                            ClearPedTasks(PlayerPedId())
                            Wait(2000)
                            TriggerServerEvent('nek_misiones:server:darRecompensa')
                            ESX.ShowNotification(Config.Misiones.Traducciones.ReturnHelicopter)
                            SetNewWaypoint(Config.Misiones.Misiones.Helicopter.Posiciones.Helicopter.coords.x, Config.Misiones.Misiones.Helicopter.Posiciones.Helicopter.coords.y)
                            phase = 5
                            activeGeneral = 0
                        end
                    end
                elseif phase == 5 then
                    distance = Vdist(pedCoords, Config.Misiones.Misiones.Helicopter.Posiciones.Helicopter.coords.x, Config.Misiones.Misiones.Helicopter.Posiciones.Helicopter.coords.y)
                    --print(distance)
                    if distance < 150 and distance > 45 and activeGeneral == 0 then    
                        msec = 0
                        vector = vector3(pedCoords.x, pedCoords.y, pedCoords.z + 1.00)
                        ESX.ShowFloatingHelpNotification(Config.Misiones.Traducciones.GoDownHelicopter, vector)
                    elseif distance < 45 and activeGeneral == 0 then
                        activeGeneral = 1
                        DeleteVehicle(inVeh)
                        ESX.ShowNotification(Config.Misiones.Traducciones.ThanksHelicopter)
                        Wait(4500)
                        ESX.ShowNotification(Config.Misiones.Traducciones.EndMission)
                        --AddPed(Config.Misiones.Misiones.Helicopter.Posiciones.Ped.coords.x, Config.Misiones.Misiones.Helicopter.Posiciones.Ped.coords.y, Config.Misiones.Misiones.Helicopter.Posiciones.Ped.coords.z, Config.Misiones.Misiones.Helicopter.Posiciones.Ped.coords.w, Config.Misiones.Misiones.Helicopter.Posiciones.Ped.model)
                        phase = 0
                        activeGeneral = nil
                    end
                end
            elseif phase == 0 then
                break
            end
            Citizen.Wait(msec)
        end
    end)
end