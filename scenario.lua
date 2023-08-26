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
	if profile.CustomStart_HQ_CubStart then
		local lander = Map.CreateEntity(faction, "f_bot_1m_a")
		lander:AddItem("c_solar_cell", 1)
		lander:AddComponent("c_fabricator")
		lander:AddComponent("c_internal_storage")
		lander:Place(loc.x, loc.y)
		lander.disconnected = false
		faction.home_entity = lander
	end

	if profile.CustomStart_HQ_CC_NoDeploy then
		local lander = Map.CreateEntity(faction, "f_bot_2m_as")
		lander:AddComponent("c_capacitor", "hidden")
		lander:AddComponent("c_power_cell")
		lander:AddComponent("c_fabricator")
		lander:AddComponent("c_portable_turret")
		lander:Place(loc.x, loc.y)
		lander.disconnected = false
		faction.home_entity = lander
	end

	if profile.CustomStart_HQ_CC_Default or not profile.CustomStart_HQ_CC_NoDeploy and not profile.CustomStart_HQ_CubStart then
		local lander = Map.CreateEntity(faction, "f_bot_2m_as")
		lander:AddComponent("c_deployment", "hidden")
		lander:AddComponent("c_power_cell")
		lander:AddComponent("c_fabricator")
		lander:AddComponent("c_portable_turret")
		lander:Place(loc.x, loc.y)
		lander.disconnected = false
		faction.home_entity = lander
	end

	-- Additional units
	if profile.CustomStart_AddlUnits_DefaultScouts then
		local bot1 = Map.CreateEntity(faction, "f_bot_1s_as")
		bot1:Place(loc.x-3, loc.y+1)
		bot1.disconnected = false

		local bot2 = Map.CreateEntity(faction, "f_bot_1s_as")
		bot2:AddComponent("c_adv_miner", 1)
		bot2:Place(loc.x-3, loc.y)
		bot2.disconnected = false

		local bot3 = Map.CreateEntity(faction, "f_bot_1s_as")
		bot3:AddComponent("c_adv_miner", 1)
		bot3:Place(loc.x-3, loc.y-1)
		bot3.disconnected = false
	end

	if profile.CustomStart_AddlUnits_ExtraWorkers > 1 then
		local botsMade = 0

		while botsMade < profile.CustomStart_AddlUnits_ExtraWorkers
		do
			local worker = Map.CreateEntity(faction, "f_bot_1s_a")
			worker:Place(loc.x+3+botsMade, loc.y-3)
			worker.disconnected = false

			local addedSmall = false
			if profile.CustomStart_AddlUnits_ExtraWorkers_AddMiner then
				worker:AddComponent("c_miner")
				addedSmall = true
			end
			if profile.CustomStart_AddlUnits_ExtraWorkers_AddAdvMiner then
				if not addedSmall then
					worker:AddComponent("c_adv_miner")
					addedSmall = true
				else
					worker:AddItem("c_adv_miner", 1)
				end
			end
			if profile.CustomStart_AddlUnits_ExtraWorkers_AddSolarCell then
				if not addedSmall then
					worker:AddComponent("c_solar_cell")
					addedSmall = true
				else
					worker:AddItem("c_solar_cell", 1)
				end
			end
			if profile.CustomStart_AddlUnits_ExtraWorkers_AddTurret then
				if not addedSmall then
					worker:AddComponent("c_portable_turret")
					addedSmall = true
				else
					worker:AddItem("c_portable_turret", 1)
				end
			end

			if profile.CustomStart_AddlUnits_ExtraWorkers_AddBehavior then
				worker:AddComponent("c_behavior")
			end
			if profile.CustomStart_AddlUnits_ExtraWorkers_AddCapacitor then
				worker:AddComponent("c_capacitor")
			end
			if profile.CustomStart_AddlUnits_ExtraWorkers_AddPowerCell then
				worker:AddComponent("c_power_cell")
			end

			botsMade = botsMade + 1
		end
	end

	if profile.CustomStart_AddlUnits_ExtraDashbots > 1 then
		local botsMade = 0

		while botsMade < profile.CustomStart_AddlUnits_ExtraDashbots
		do
			local worker = Map.CreateEntity(faction, "f_bot_1s_b")
			worker:Place(loc.x+3+botsMade, loc.y)
			worker.disconnected = false

			local addedSmall = false
			if profile.CustomStart_AddlUnits_ExtraDashbots_AddMiner then
				worker:AddComponent("c_miner")
				addedSmall = true
			end
			if profile.CustomStart_AddlUnits_ExtraDashbots_AddAdvMiner then
				if not addedSmall then
					worker:AddComponent("c_adv_miner")
					addedSmall = true
				else
					worker:AddItem("c_adv_miner", 1)
				end
			end
			if profile.CustomStart_AddlUnits_ExtraDashbots_AddSolarCell then
				if not addedSmall then
					worker:AddComponent("c_solar_cell")
					addedSmall = true
				else
					worker:AddItem("c_solar_cell", 1)
				end
			end
			if profile.CustomStart_AddlUnits_ExtraDashbots_AddTurret then
				if not addedSmall then
					worker:AddComponent("c_portable_turret")
					addedSmall = true
				else
					worker:AddItem("c_portable_turret", 1)
				end
			end

			if profile.CustomStart_AddlUnits_ExtraDashbots_AddBehavior then
				worker:AddComponent("c_behavior")
			end
			if profile.CustomStart_AddlUnits_ExtraDashbots_AddCapacitor then
				worker:AddComponent("c_capacitor")
			end
			if profile.CustomStart_AddlUnits_ExtraDashbots_AddPowerCell then
				worker:AddComponent("c_power_cell")
			end


			botsMade = botsMade + 1
		end
	end

	if profile.CustomStart_AddlUnits_ExtraTwinbots > 1 then
		local botsMade = 0

		while botsMade < profile.CustomStart_AddlUnits_ExtraTwinbots
		do
			local worker = Map.CreateEntity(faction, "f_bot_2s")
			worker:Place(loc.x+3+botsMade, loc.y+3)
			worker.disconnected = false

			botsMade = botsMade + 1
		end
	end

	if profile.CustomStart_AddlUnits_StripMiners then
		local botsMade = 0

		while botsMade < 6
		do
			local worker = Map.CreateEntity(faction, "f_bot_2s")
			worker:AddComponent("c_adv_miner", 1)
			worker:AddComponent("c_adv_miner", 2)
			worker:AddComponent("c_power_cell", 3)
			worker:AddComponent("c_behavior", 4)
			worker:Place(loc.x-(3+botsMade), loc.y)
			worker.disconnected = false

			botsMade = botsMade + 1
		end
	end



	-- unlock starter tech
	faction:Unlock("t_robot_tech_basic")

	if profile.CustomStart_Tech_BasicSignals then
		faction:Unlock("t_signals1")
	end
	if profile.CustomStart_Tech_Behaviors then
		faction:Unlock("t_signals2")
	end	
	if profile.CustomStart_Tech_Nanobots then
		faction:Unlock("t_signals3")
	end

	if profile.CustomStart_Tech_BasicStructures then
		faction:Unlock("t_structures1")
	end
	if profile.CustomStart_Tech_BasicRobotics then
		faction:Unlock("t_robotics10")
	end	
	if profile.CustomStart_Tech_RoboticsProduction then
		faction:Unlock("t_robotics0")
	end

	if profile.CustomStart_Tech_BasicPower then
		faction:Unlock("t_power0")
	end
	if profile.CustomStart_Tech_PowerTransference then
		faction:Unlock("t_power10")
	end	
	if profile.CustomStart_Tech_ExpandedPower then
		faction:Unlock("t_power1")
	end

	-- show intro
	faction:RunUI("OnFreeplayFactionSpawned")

	faction:Unlock("t_robot_tech_basic")
	Map.Delay("StartOfGame", 10, { faction = faction, })
	if Map.GetSettings().tutorial then
		Map.Delay("TutorialBegin", 16, { faction = faction, })
	end
end