local package = ...
local profile = Game.GetProfile()

-- called when starting a new game (skipped when loading a save or joining a multiplayer game)
function package:setup_scenario(settings)
end

-- called when mod is initializing
function package:init()
	-- disable the on_player_faction_spawn function on the main package
	Game.GetModPackage("Main/Freeplay").on_player_faction_spawn = nil
end

-- called when starting up a new game
function package:on_world_spawn()
end

-- called when a new player faction is spawned or respawned
function package:on_player_faction_spawn(faction, is_respawn)

	-- select starting location for player faction
	faction.home_location = GetPlayerFactionHomeOnGround()
	local loc = faction.home_location

	-- HQ options
	if profile.HQ_CubStart then
		local lander = Map.CreateEntity(faction, "f_bot_1m_a")
		lander:AddItem("c_solar_cell", 1)
		lander:AddComponent("c_fabricator")
		lander:AddComponent("c_internal_storage")
		lander:Place(loc.x+2, loc.y+2)
		lander.disconnected = false
		faction.home_entity = lander
	end

	if profile.HQ_CC_NoDeploy then
		local lander = Map.CreateEntity(faction, "f_bot_2m_as")
		lander:AddComponent("c_power_cell")
		lander:AddItem("c_fabricator")
		lander:AddItem("c_portable_turret")
		lander:Place(loc.x, loc.y)
		lander.disconnected = false
		faction.home_entity = lander
	end

	if profile.HQ_CC_Default or not profile.HQ_CC_NoDeploy and not profile.HQ_CubStart then
		local lander = Map.CreateEntity(faction, "f_bot_2m_as")
		lander:AddComponent("c_deployment", "hidden")
		lander:AddComponent("c_power_cell")
		lander:AddItem("c_fabricator")
		lander:AddItem("c_portable_turret")
		lander:Place(loc.x, loc.y)
		lander.disconnected = false
		faction.home_entity = lander
	end

	
	-- Additional units
	if profile.AddlUnits_ExtraWorkers then
		local worker1 = Map.CreateEntity(faction, "f_bot_1s_a")
		worker1:AddComponent("c_behavior", 4)
		worker1:Place(loc.x+3, loc.y)
		worker1.disconnected = false
		
		local worker2 = Map.CreateEntity(faction, "f_bot_1s_a")
		worker2:AddComponent("c_behavior", 4)
		worker2:Place(loc.x+3, loc.y)
		worker2.disconnected = false
		
		local worker3 = Map.CreateEntity(faction, "f_bot_1s_a")
		worker3:AddComponent("c_behavior", 4)
		worker3:Place(loc.x+3, loc.y)
		worker3.disconnected = false
		
		local worker4 = Map.CreateEntity(faction, "f_bot_1s_a")
		worker4:AddComponent("c_behavior", 4)
		worker4:Place(loc.x+3, loc.y)
		worker4.disconnected = false
	end


	if profile.AddlUnits_DefaultScouts then
		local bot1 = Map.CreateEntity(faction, "f_bot_1s_as")
		bot1:Place(loc.x-2, loc.y+3)
		bot1.disconnected = false
	
		local bot2 = Map.CreateEntity(faction, "f_bot_1s_as")
		bot2:AddComponent("c_adv_miner", 1)
		bot2:Place(loc.x+3, loc.y+4)
		bot2.disconnected = false
	
		local bot3 = Map.CreateEntity(faction, "f_bot_1s_as")
		bot3:AddComponent("c_adv_miner", 1)
		bot3:Place(loc.x+1, loc.y+2)
		bot3.disconnected = false
	end


	if profile.AddlUnits_StripMiners then
		local stripMiner1 = Map.CreateEntity(faction, "f_bot_2m_as")
		stripMiner1:AddComponent("c_adv_miner", 1)
		stripMiner1:AddComponent("c_adv_miner", 2)
		stripMiner1:AddComponent("c_power_cell", 3)
		stripMiner1:AddComponent("c_behavior", 4)
		stripMiner1:Place(loc.x-1, loc.y-2)
		stripMiner1.disconnected = false	
		
		local stripMiner2 = Map.CreateEntity(faction, "f_bot_2m_as")
		stripMiner2:AddComponent("c_adv_miner", 1)
		stripMiner2:AddComponent("c_adv_miner", 2)
		stripMiner2:AddComponent("c_power_cell", 3)
		stripMiner2:AddComponent("c_behavior", 4)
		stripMiner2:Place(loc.x-2, loc.y-1)
		stripMiner2.disconnected = false
	end

	


	-- unlock starter tech
	faction:Unlock("t_robot_tech_basic")

	if profile.Tech_Behaviors then
		faction:Unlock("t_signals2")
	end
	


	-- show intro
	faction:RunUI("OnFreeplayFactionSpawned")
	
	faction:Unlock("t_robot_tech_basic")
	Map.Delay("StartOfGame", 10, { faction = faction, })
	if Map.GetSettings().tutorial then
		Map.Delay("TutorialBegin", 16, { faction = faction, })
	end
end