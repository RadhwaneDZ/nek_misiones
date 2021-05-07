Config = {}

Config.Misiones = {
    esxEvent = 'esx:getSharedObject',

    Traducciones = {
        PedText = "¿Quieres hacer algunos trabajillos?",
        PedVentaText = "Dejame tus cositas aqui que yo te doy un precio a cambio por ellas.",
        DeleteNotification = "Pulsa ~y~E ~s~para entregar el vehiculo",
        FinalizarMilitar = "Deja el camion ahi y toma tu recompensa",
        CopCanGetYou = "Recuerda que la policia puede pararte, asi que debes llevar el maximo cuidado posible y que no te paren.",
        TakeTruck = "Coge el camion y engancha el remolque que hay en la carretera de detras, y conduce por donde te marca el GPS.",
        TakeCar = "Ve a por el coche, y ve hacia la base militar",
        MenuTitle = "Misiones",
        GoHelicopter = "Ahora coge tu coche y dirigete al helipuerto, alli te esperara un helicoptero. Este helicoptero va cargado de mercancia, asegurala hasta el destino",
        GoToHelicopterDrug = "Ya tienes marcada la ruta hacia donde ir, ve hacia alli, aterriza y recoge el cargamento. Despues subelo al helicoptero.",
        GoDownHelicopter = "Ve bajando poco a poco y aterriza",
        TakeDrugHelicopter = "Ve a por la droga que esta dentro del hangar y llevatela. Subete al helicoptero de nuevo y pilota hasta el hangar grande de los santos, alli te esperara un hombre, dale toda la droga.",
        TakeDrugPed = "Pulsa ~y~E ~s~para obtener la droga",
        GoDrugHelicopter = "Coge el helicoptero y entrega la drogas en el punto marcado en el mapa, es un contenedor. Al lado del contenedor tendras la recompensa. Deja la droga a un lado y deja de vuelta el helicoptero donde lo cogiste al principio.",
        TakeFinalReward = "Pulsa ~y~E ~s~para coger la recompensa",
        DoHelicopter = "do se veria una nota con una caja y se agacha a cogerla",
        ReturnHelicopter = "Subete al helicoptero y devuelvelo a su punto de origen, ya hemos acabado.",
        ThanksHelicopter = "Gracias por todo, ya me quedo yo el helicoptero",
        EndMission = "Mision Finalizada",
        PlaneGoMilitarBase = "Los militares me han pedido que envie a un piloto para un cargamento secreto. Los militares haran la vista gorda pero la policia puede ordenarte que aterrices para checkeo.",
        TakePlaneAndGo = "Coge el avion y ve al destino marcado, alli baja la mercancia y trae de vuelta el avion. El que te haya mandado te dara la recompensa.",
        DoPlaneAction = "Pulsa ~y~E ~s~para realizar la accion",
        OpenPlaneDoor = "Abriendo compuerta...",
        UnloadingPlane = "Descargando Avion...",
        ClosePlaneDoor = "Cerrando compuerta...",
        BackPlane = "Trae de vuelta el avion",
        PlaneBackPista = "Aterriza el avion en la pista, y llevalo hasta el fondo de la pista, tendras la recompensa",
        NoObject = "No llevas ese objeto encima",
    },

    Peds = {
        PedMisiones = {
            Position = vector4(3310.757, 5176.253, 18.61458, -124.3825),
            Hash = 'u_m_y_antonb'
        },

        PedVenta = {
            Position = vector4(3311.416, 5173.99, 22.52137, 142.1529),
            Hash = 'u_m_y_antonb',
            Price = {
                Max = 1000,
                Min = 200
            }
        }
    },

    Misiones = {
        Weapons = {
            gun1 = 'WEAPON_MICROSMG',
            gun2 = 'WEAPON_PISTOL',
            gun3 = 'WEAPON_CROWBAR',
            gun4 = 'WEAPON_ASSAULTRIFLE',
            gun5 = 'WEAPON_KNUCKLE',
            gun6 = 'WEAPON_PISTOL50',
        },

        Prices = {
            Max = 1000,
            Min = 200
        },

        Object = {
            name = 'missions_rotorHeli', --Objeto propio pero puede cambiarse por la que quieras, recomendamos el objeto propio porque no se puede utilizar para nada, solo para la mision
            Max = 10,
            Min = 1,
        },

        Menu = {
            { label = "Mision al Azar", value = "azar_mission" },
            { label = "Entrega el cargamento militar", value = "militar_mission" },
            { label = "Lleva el helicoptero", value = "helicopter_mission" },
            { label = "Pilota el avion militar", value = "plane_mission" },
            --{ label = "Simplemente conduce...", value = "drive_mission" },
            --{ label = "Entrega el cargamento en el monte chilliad", value = "entregar_mission" },
        },

        Militar = {
            Posiciones = {
                Vehicle = { coords = vector4(3324.918, 5143.188, 17.90, 81.04688), model = 'halftrack' },
                DeleteCar = vector3(-1721.722, 2955.12, 32.42108),
                Truck = { coords = vector4(-1719.959, 2942.613, 32.80631, 62.50151), model = 'barracks2' },
                Trailer = { coords = vector4(-1707.197, 2935.467, 32.80632, 59.1), model = 'armytanker' }
            },
        },

        Helicopter = {
            Posiciones = {
                DeleteCar = vector3(1770.013, 3239.691, 42.12404),
                StopHelicopter = vector3(2134.903, 4816.149, 41.2971),
                Ped = { coords = vector4(2138.186, 4771.957, 40.00336, 19.50552), model = 's_m_y_ammucity_01' },
                Helicopter = { coords = vector4(1770.013, 3239.691, 42.12404, -77.51778), model = 'maverick' },
                Container = vector3(-882.5417, -3051.757, 15.13985)
            },
        },

        Plane = {
            Posiciones = {
                Plane1 = { coords = vector4(-2047.355, 2881.117, 32.31149, 59.45456), model = 'titan' },
                StopPlane = vector3(-1271.391, -3380.47, 15.34016),
            },
        },
    },
}