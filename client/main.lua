local QBCore = exports['qb-core']:GetCoreObject()

local actif = false
local vitesse = 50
-- gm-limiter:client:limitateur
AddEventHandler('gm-limiter:client:resetlimitateur', function()
    limitateur(0)
end)

RegisterNetEvent('gm-limiter:client:limitateur50', function()
    limitateur(50)
end)

RegisterNetEvent('gm-limiter:client:limitateur90', function()
    limitateur(90)
end)

RegisterNetEvent('gm-limiter:client:limitateur150', function()
    limitateur(150)
end)

function limitateur(Value)
    if (Value>0) then
        actif = true
        vitesse = Value
        QBCore.Functions.Notify("Le limitateur de vitesse est réglé à "..vitesse.." mph.")
    else
        QBCore.Functions.Notify("Desactivation du limitateur de vitesse.")
        actif = false
        vitesse = 10    
    end    
end

RegisterCommand("limitateur", function(source, args, rawCommand)
    local intParam = tonumber(args[1])
    if intParam and type(intParam) == "number" then
        limitateur(intParam)
    else
        print("Parameter non entier.")
    end
end, false)

RegisterCommand("resetlimitateur", function(source, args, rawCommand)
        actif = false
end, false)

Citizen.CreateThread(function()
    local resetSpeedOnEnter = true
    Citizen.Wait(0)
        while true do      
            Citizen.Wait(0)
            local playerPed = GetPlayerPed(-1)
            local vehicle = GetVehiclePedIsIn(playerPed, false)

            if (GetPedInVehicleSeat(vehicle, -1) == playerPed) then
                if resetSpeedOnEnter then
                    maxSpeed = GetVehicleHandlingFloat(vehicle,"CHandlingData","fInitialDriveMaxFlatVel")
                    SetEntityMaxSpeed(vehicle, maxSpeed)
                    resetSpeedOnEnter = false                    
                end
                
                if not actif then
                    maxSpeed = GetVehicleHandlingFloat(vehicle,"CHandlingData","fInitialDriveMaxFlatVel")
                    SetEntityMaxSpeed(vehicle, maxSpeed)
                    
                  -- Limitateur activé
                  else
                    cruise = (vitesse) /3.6 -- conversion nécessaire
                    maxSpeed = GetVehicleHandlingFloat(vehicle,"CHandlingData","fInitialDriveMaxFlatVel")
                    if (maxSpeed > cruise)then
                        SetEntityMaxSpeed(vehicle, cruise)
                    end
                  end


            end

        end
    
end)
