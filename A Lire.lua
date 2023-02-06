/*
A ajouter dans qb-radialmenu/client/main.lua  :SetupVehicleMenu()
if ((GetPedInVehicleSeat(Vehicle, -1) == ped) ) then
            VehicleMenu.items[#VehicleMenu.items+1] = Config.VehicleLimiter
        end

A ajouter dans qb-radialmenu/config.lua  :
Config.VehicleLimiter = {
    id = 'vehiclelimiter',
    title = 'Vehicle Limiter',
    icon = 'car-side',
    items = {
        {
            id = 'reset',
            title = 'Reset',
            icon = 'car-side',
            type = 'client',
            event = 'gm-limiter:client:resetlimitateur',
            shouldClose = true
        },{
            id = 'limit50',
            title = '50 mph',
            icon = 'car-side',
            type = 'client',
            event = 'gm-limiter:client:limitateur50',
            shouldClose = true
        },{
            id = 'limit90',
            title = '90 mph',
            icon = 'car-side',
            type = 'client',
            event = 'gm-limiter:client:limitateur90',
            shouldClose = true
        },{
            id = 'limit150',
            title = '150 mph',
            icon = 'car-side',
            type = 'client',
            event = 'gm-limiter:client:limitateur150',
            shouldClose = true
        },
    }
}  

*/