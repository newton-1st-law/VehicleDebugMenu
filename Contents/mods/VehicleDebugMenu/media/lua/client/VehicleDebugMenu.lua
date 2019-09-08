ISVehicleDebugMenu = {};

ISVehicleDebugMenu.createMenu = function(Player, Context, worldObjects)
	
	local SpawnOption = Context:addOption(getText("Spawn new vehicle"), worldObjects, nil);
	local SpawnMenu = ISContextMenu:getNew(Context);
	local TextureOption = Context:addOption(getText("Reload vehicle texture"), worldObjects, nil);
	local TextureMenu = ISContextMenu:getNew(Context);
	
	Context:addSubMenu(SpawnOption, SpawnMenu);
	Context:addSubMenu(TextureOption, TextureMenu);
	
	allVehicle = {
	"Base.HMMWV",
	"Base.SUV",
	"Base.PickUpVanLights",
	"Base.PickUpVan",
	"Base.PickUpTruckLights",
	"Base.PickUpTruck",
	"Base.PickupBurnt",
	"Base.CarNormal",
	"Base.CarStationWagon",
	"Base.CarStationWagon2",
	"Base.CarLights",
	"Base.CarLightsPolice",
	"Base.CarLightsPolice2",
	"Base.CarDetective",
	"Base.CarTaxi",
	"Base.CarTaxi2",
	"Base.CarTaxi3",
	"Base.CarNormalBurnt",
	"Base.NormalCarBurntPolice",
	"Base.Van",
	"Base.VanSeats",
	"Base.VanAmbulance",
	"Base.VanRadio",
	"Base.StepVan",
	"Base.AmbulanceBurnt",
	"Base.VanRadioBurnt",
	"Base.VanSeatsBurnt",
	"Base.VanBurnt",
	"Base.SportsCar",
	"Base.SportsCarBurnt",
	"Base.SmallCar",
	"Base.SmallCarBurnt",
	"Base.VanSpecial",
	}
	
	for i,v in pairs(allVehicle) do
		SpawnMenu:addOption(getText(v), worldObjects, ISVehicleDebugMenu.SpawnAction, v);
		TextureMenu:addOption(getText(v), worldObjects, ISVehicleDebugMenu.TextureAction, v);
	end
	
	Context:addOption(getText("Reload all vehicles"), worldObjects, ISVehicleDebugMenu.ReloadAction, nil);
	
end

ISVehicleDebugMenu.SpawnAction = function(worldObjects, Vehicle)
	addVehicle(Vehicle);
end
ISVehicleDebugMenu.TextureAction = function(worldObjects, Vehicle)
	reloadVehicleTextures(Vehicle);
end
ISVehicleDebugMenu.ReloadAction = function(worldObjects)
	reloadVehicles();
end

Events.OnPreFillWorldObjectContextMenu.Add(ISVehicleDebugMenu.createMenu);