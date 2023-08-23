local profile = Game.GetProfile()

return UI.New([[
	<VerticalList child_padding=8>
			<Box>
				<Text text="HQ Unit Selection" style=hl textalign=center/>
			</Box>			
			<Text text="Designed to be playable with only one selected, but you can select more than one." textalign=center/>
			<VerticalList child_align=left>
				<HorizontalList><Button id=HQ_CC_Default on_click={on_HQ_CC_Default} width=32 height=32/><Text width=300 text="Mobile Command Center (Default)"/></HorizontalList>
				<HorizontalList><Button id=HQ_CC_NoDeploy on_click={on_HQ_CC_NoDeploy} width=32 height=32/><Text width=300 text="Mobile Command Center (No Deploy, original by Johan)"/></HorizontalList>
				<HorizontalList><Button id=HQ_CubStart on_click={on_HQ_CubStart} width=32 height=32/><Text width=300 text="Cub Start (original by Johan)"/></HorizontalList>
			</VerticalList>

			<Box>
				<Text text="Additional Units" style=hl textalign=center/>
			</Box>
			<Text text="Select as many as you like." textalign=center/>
			<VerticalList child_align=left>
				<HorizontalList><Button id=AddlUnits_DefaultScouts on_click={on_AddlUnits_DefaultScouts} width=32 height=32/><Text width=200 text="Default Scouts"/></HorizontalList>
				<HorizontalList><Button id=AddlUnits_ExtraWorkers on_click={on_AddlUnits_ExtraWorkers} width=32 height=32/><Text width=200 text="Extra Workers"/></HorizontalList>
				<HorizontalList><Button id=AddlUnits_StripMiners on_click={on_AddlUnits_StripMiners} width=32 height=32/><Text width=200 text="Strip Miners"/></HorizontalList>
			</VerticalList>

			<Box>
				<Text text="Tech Unlocks" style=hl textalign=center/>
			</Box>
			<Text text="Select as many as you like." textalign=center/>
			<HorizontalList>
				<VerticalList child_align=center>				
					<Text text="Signals" style=h2 textalign=center/>
					<HorizontalList child_align=left><Button id=Tech_BasicSignals on_click={on_Tech_BasicSignals} width=30 height=30/><Text width=170 text="Basic Signals"/></HorizontalList>
					<HorizontalList child_align=left><Button id=Tech_Behaviors on_click={on_Tech_Behaviors} width=30 height=30/><Text width=170 text="Behaviors"/></HorizontalList>
					<HorizontalList child_align=left><Button id=Tech_Nanobots on_click={on_Tech_Nanobots} width=30 height=30/><Text width=170 text="Nanobots"/></HorizontalList>
				</VerticalList>		
				<VerticalList child_align=center>
					<Text text="Structures" style=h2 textalign=center/>		
					<HorizontalList child_align=left><Button id=Tech_BasicStructures on_click={on_Tech_BasicStructures} width=30 height=30/><Text width=170 text="Basic Structures"/></HorizontalList>
					<HorizontalList child_align=left><Button id=Tech_BasicRobotics on_click={on_Tech_BasicRobotics} width=30 height=30/><Text width=170 text="Basic Robotics"/></HorizontalList>
					<HorizontalList child_align=left><Button id=Tech_RoboticsProduction on_click={on_Tech_RoboticsProduction} width=30 height=30/><Text width=170 text="Robotics Production"/></HorizontalList>
				</VerticalList>			
				<VerticalList child_align=center>
					<Text text="Power" style=h2 textalign=center/>
					<HorizontalList child_align=left><Button id=Tech_BasicPower on_click={on_Tech_BasicPower} width=30 height=30/><Text width=170 text="Basic Power"/></HorizontalList>
					<HorizontalList child_align=left><Button id=Tech_PowerTransference on_click={on_Tech_PowerTransference} width=30 height=30/><Text width=170 text="Power Transference"/></HorizontalList>
					<HorizontalList child_align=left><Button id=Tech_ExpandedPower on_click={on_Tech_ExpandedPower} width=30 height=30/><Text width=170 text="Expanded Power"/></HorizontalList>
				</VerticalList>
			</HorizontalList>
	</VerticalList>
	]],
	{
	construct = function(menu)

		-- ***************************************************************************************************************
		-- set defaults




		-- profile.CustomStart_HQ_CC_Default = profile.CustomStart_HQ_CC_Default or false
		-- profile.CustomStart_HQ_CC_NoDeploy = profile.CustomStart_HQ_CC_NoDeploy or false
		-- profile.CustomStart_HQ_CubStart = profile.CustomStart_HQ_CubStart or false

		-- profile.CustomStart_AddlUnits_DefaultScouts = profile.CustomStart_AddlUnits_DefaultScouts or false
		-- profile.CustomStart_AddlUnits_ExtraWorkers = profile.CustomStart_AddlUnits_ExtraWorkers or false
		-- profile.CustomStart_AddlUnits_StripMiners = profile.CustomStart_AddlUnits_StripMiners or false

		-- profile.CustomStart_Tech_BasicSignals = profile.CustomStart_Tech_BasicSignals or false --t_signals1
		-- profile.CustomStart_Tech_Behaviors = profile.CustomStart_Tech_Behaviors or false --t_signals2
		-- profile.CustomStart_Tech_Nanobots = profile.CustomStart_Tech_Nanobots or false --t_signals3
	
		-- profile.CustomStart_Tech_BasicStructures = profile.CustomStart_Tech_BasicStructures or false --t_structures1
		-- profile.CustomStart_Tech_BasicRobotics = profile.CustomStart_Tech_BasicRobotics or false --t_robotics10
		-- profile.CustomStart_Tech_RoboticsProduction = profile.CustomStart_Tech_RoboticsProduction or false --t_robotics0
	
		-- profile.CustomStart_Tech_BasicPower = profile.CustomStart_Tech_BasicPower or false --t_power0
		-- profile.CustomStart_Tech_PowerTransference = profile.CustomStart_Tech_PowerTransference or false --t_power10
		-- profile.CustomStart_Tech_ExpandedPower = profile.CustomStart_Tech_ExpandedPower or false --t_power1

        -- ***************************************************************************************************************

		-- HQ options
		menu.HQ_CC_Default.icon = profile.CustomStart_HQ_CC_Default and "icon_small_confirm" or nil
		menu.HQ_CC_Default.active = profile.CustomStart_HQ_CC_Default

		menu.HQ_CC_NoDeploy.icon = profile.CustomStart_HQ_CC_NoDeploy and "icon_small_confirm" or nil
		menu.HQ_CC_NoDeploy.active = profile.CustomStart_HQ_CC_NoDeploy

		menu.HQ_CubStart.icon = profile.CustomStart_HQ_CubStart and "icon_small_confirm" or nil
		menu.HQ_CubStart.active = profile.CustomStart_HQ_CubStart


		-- Additional Unit options
		menu.AddlUnits_DefaultScouts.icon = profile.CustomStart_AddlUnits_DefaultScouts and "icon_small_confirm" or nil
		menu.AddlUnits_DefaultScouts.active = profile.CustomStart_AddlUnits_DefaultScouts

		menu.AddlUnits_ExtraWorkers.icon = profile.CustomStart_AddlUnits_ExtraWorkers and "icon_small_confirm" or nil
		menu.AddlUnits_ExtraWorkers.active = profile.CustomStart_AddlUnits_ExtraWorkers

		menu.AddlUnits_StripMiners.icon = profile.CustomStart_AddlUnits_StripMiners and "icon_small_confirm" or nil
		menu.AddlUnits_StripMiners.active = profile.CustomStart_AddlUnits_StripMiners


		-- Tech Options
		menu.Tech_BasicSignals.icon = profile.CustomStart_Tech_BasicSignals and "icon_small_confirm" or nil
		menu.Tech_BasicSignals.active = profile.CustomStart_Tech_BasicSignals

		menu.Tech_Behaviors.icon = profile.CustomStart_Tech_Behaviors and "icon_small_confirm" or nil
		menu.Tech_Behaviors.active = profile.CustomStart_Tech_Behaviors

		menu.Tech_Nanobots.icon = profile.CustomStart_Tech_Nanobots and "icon_small_confirm" or nil
		menu.Tech_Nanobots.active = profile.CustomStart_Tech_Nanobots


		menu.Tech_BasicStructures.icon = profile.CustomStart_Tech_BasicStructures and "icon_small_confirm" or nil
		menu.Tech_BasicStructures.active = profile.CustomStart_Tech_BasicStructures

		menu.Tech_BasicRobotics.icon = profile.CustomStart_Tech_BasicRobotics and "icon_small_confirm" or nil
		menu.Tech_BasicRobotics.active = profile.CustomStart_Tech_BasicRobotics

		menu.Tech_RoboticsProduction.icon = profile.CustomStart_Tech_RoboticsProduction and "icon_small_confirm" or nil
		menu.Tech_RoboticsProduction.active = profile.CustomStart_Tech_RoboticsProduction


		menu.Tech_BasicPower.icon = profile.CustomStart_Tech_BasicPower and "icon_small_confirm" or nil
		menu.Tech_BasicPower.active = profile.CustomStart_Tech_BasicPower

		menu.Tech_PowerTransference.icon = profile.CustomStart_Tech_PowerTransference and "icon_small_confirm" or nil
		menu.Tech_PowerTransference.active = profile.CustomStart_Tech_PowerTransference

		menu.Tech_ExpandedPower.icon = profile.CustomStart_Tech_ExpandedPower and "icon_small_confirm" or nil
		menu.Tech_ExpandedPower.active = profile.CustomStart_Tech_ExpandedPower

	end,

	-- HQ options
	on_HQ_CC_Default = function(menu, chk)
		local value = not chk.active
		chk.icon = value and "icon_small_confirm" or nil
		chk.active = value
		profile.CustomStart_HQ_CC_Default = value
	end,
	on_HQ_CC_NoDeploy = function(menu, chk)
		local value = not chk.active
		chk.icon = value and "icon_small_confirm" or nil
		chk.active = value
		profile.CustomStart_HQ_CC_NoDeploy = value
	end,
	on_HQ_CubStart = function(menu, chk)
		local value = not chk.active
		chk.icon = value and "icon_small_confirm" or nil
		chk.active = value
		profile.CustomStart_HQ_CubStart = value
	end,

	-- Additional Unit options
	on_AddlUnits_DefaultScouts = function(menu, chk)
		local value = not chk.active
		chk.icon = value and "icon_small_confirm" or nil
		chk.active = value
		profile.CustomStart_AddlUnits_DefaultScouts = value
	end,
	on_AddlUnits_ExtraWorkers = function(menu, chk)
		local value = not chk.active
		chk.icon = value and "icon_small_confirm" or nil
		chk.active = value
		profile.CustomStart_AddlUnits_ExtraWorkers = value
	end,
	on_AddlUnits_StripMiners = function(menu, chk)
		local value = not chk.active
		chk.icon = value and "icon_small_confirm" or nil
		chk.active = value
		profile.CustomStart_AddlUnits_StripMiners = value
	end,
	
	-- Tech Options	
	on_Tech_BasicSignals = function(menu, chk)
		local value = not chk.active
		chk.icon = value and "icon_small_confirm" or nil
		chk.active = value
		profile.CustomStart_Tech_BasicSignals = value
	end,
	on_Tech_Behaviors = function(menu, chk)
		local value = not chk.active
		chk.icon = value and "icon_small_confirm" or nil
		chk.active = value
		profile.CustomStart_Tech_Behaviors = value
	end,
	on_Tech_Nanobots = function(menu, chk)
		local value = not chk.active
		chk.icon = value and "icon_small_confirm" or nil
		chk.active = value
		profile.CustomStart_Tech_Nanobots = value
	end,

	
	on_Tech_BasicStructures = function(menu, chk)
		local value = not chk.active
		chk.icon = value and "icon_small_confirm" or nil
		chk.active = value
		profile.CustomStart_Tech_BasicStructures = value
	end,
	on_Tech_BasicRobotics = function(menu, chk)
		local value = not chk.active
		chk.icon = value and "icon_small_confirm" or nil
		chk.active = value
		profile.CustomStart_Tech_BasicRobotics = value
	end,
	on_Tech_RoboticsProduction = function(menu, chk)
		local value = not chk.active
		chk.icon = value and "icon_small_confirm" or nil
		chk.active = value
		profile.CustomStart_Tech_RoboticsProduction = value
	end,

	
	on_Tech_BasicPower = function(menu, chk)
		local value = not chk.active
		chk.icon = value and "icon_small_confirm" or nil
		chk.active = value
		profile.CustomStart_Tech_BasicPower = value
	end,
	on_Tech_PowerTransference = function(menu, chk)
		local value = not chk.active
		chk.icon = value and "icon_small_confirm" or nil
		chk.active = value
		profile.CustomStart_Tech_PowerTransference = value
	end,
	on_Tech_ExpandedPower = function(menu, chk)
		local value = not chk.active
		chk.icon = value and "icon_small_confirm" or nil
		chk.active = value
		profile.CustomStart_Tech_ExpandedPower = value
	end,
})
