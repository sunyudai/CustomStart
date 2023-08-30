local profile = Game.GetProfile()

-- Веrnhаrd (Stage): There are 2 types of widgets, built-in and Lua-created.
-- Built in widgets: <Modal>, <VerticalList>, <HorizontalList>, <ScrollList>, <Text>, <Button>, <Spacer>, <Box>, <InputText>, <MultiLineInputText>, <Slider>, <Canvas>, <Image>, <Scale>, <Progress>, <Wrap>, <Video>, <PanView>, <ProgressCircle>, <Minimap>, <Throbber>, <Draw>, <Camera>, <StaticImage>, <Preview>
-- Lua-created widgets are registered in code with UI.Register. There's a bunch of generic ones in Main/ui/Widgets.lua (like <CheckBox> or <Combo>) and many specific ones in all the UI code files.

return UI.New([[
	<ScrollList child_padding=8>
		<Box>
			<Text text="HQ Unit Selection" style=hl textalign=center/>
		</Box>			
		<Text text="Playable with only one selected, but you can select more than one." textalign=center/>
		<VerticalList child_align=left>
			<HorizontalList><Button id=HQ_CC_Default on_click={on_HQ_CC_Default} width=28 height=28/><Text valign=center width=300 text="Mobile Command Center (Default)"/></HorizontalList>
			<HorizontalList><Button id=HQ_CC_NoDeploy on_click={on_HQ_CC_NoDeploy} width=28 height=28/><Text valign=center width=300 text="Mobile Command Center (No Deploy, original by Johan)"/></HorizontalList>
			<HorizontalList><Button id=HQ_CubStart on_click={on_HQ_CubStart} width=28 height=28/><Text valign=center width=300 text="Cub Start (original by Johan)"/></HorizontalList>
		</VerticalList>

		<Box>
			<Text text="Specific Unit Presets" style=hl textalign=center/>
		</Box>		
		<VerticalList child_align=center>
			<Text text="Convenient packages for specific units" textalign=center/>
			<HorizontalList><Button id=AddlUnits_DefaultScouts on_click={on_AddlUnits_DefaultScouts} width=28 height=28/><Text valign=center width=200 text="Default Scouts"/></HorizontalList>
			<HorizontalList><Button id=AddlUnits_StripMiners on_click={on_AddlUnits_StripMiners} width=28 height=28/><Text valign=center width=200 text="Cheaty Strip Miners"/></HorizontalList>
		</VerticalList>

		<Box>
			<Text text="Additional Units" style=hl textalign=center/>
		</Box>
		<Text text="Select as many as you like." textalign=center/>
		<VerticalList child_align=left>
			<HorizontalList>
				<Slider id=AddlUnits_ExtraWorkers_Slider height=36 width=320 min=0 max=20 step=1 on_change={on_AddlUnits_ExtraWorkers_changed}/>
				<Text id=AddlUnits_ExtraWorkers width=30 fill=false text="" valign=center textalign=center/>
				<Text width=200 text="Extra Workers" valign=center textalign=left/>
			</HorizontalList>
			<HorizontalList>
				<Text width=120 text="Small (max 1):" textalign=right/>
				<Button id=AddlUnits_ExtraWorkers_AddMiner on_click={on_AddlUnits_ExtraWorkers_AddMiner} width=24 height=24/><Text width=90 text="+Miner"/>
				<Button id=AddlUnits_ExtraWorkers_AddAdvMiner on_click={on_AddlUnits_ExtraWorkers_AddAdvMiner} width=24 height=24/><Text width=90 text="+AdvMiner"/>
				<Button id=AddlUnits_ExtraWorkers_AddSolarCell on_click={on_AddlUnits_ExtraWorkers_AddSolarCell} width=24 height=24/><Text width=90 text="+SolarCell"/>
				<Button id=AddlUnits_ExtraWorkers_AddTurret on_click={on_AddlUnits_ExtraWorkers_AddTurret} width=24 height=24/><Text width=90 text="+Turret"/>
			</HorizontalList>
			<HorizontalList>
				<Text width=120 text="Internal (max 2):" textalign=right/>
				<Button id=AddlUnits_ExtraWorkers_AddBehavior on_click={on_AddlUnits_ExtraWorkers_AddBehavior} width=24 height=24/><Text width=90 text="+Behavior"/>
				<Button id=AddlUnits_ExtraWorkers_AddCapacitor on_click={on_AddlUnits_ExtraWorkers_AddCapacitor} width=24 height=24/><Text width=90 text="+Capacitor"/>
				<Button id=AddlUnits_ExtraWorkers_AddPowerCell on_click={on_AddlUnits_ExtraWorkers_AddPowerCell} width=24 height=24/><Text width=90 text="+PowerCell"/>
			</HorizontalList>
			<Spacer height=12/>
			<HorizontalList>
				<Slider id=AddlUnits_ExtraDashbots_Slider height=36 width=320 min=0 max=20 step=1 on_change={on_AddlUnits_ExtraDashbots_changed}/>
				<Text id=AddlUnits_ExtraDashbots width=30 fill=false text="" valign=center textalign=center/>
				<Text width=200 text="Extra Dashbots" valign=center textalign=left/>
			</HorizontalList>
			<HorizontalList>
				<Text width=120 text="Small (max 1):" textalign=right/>
				<Button id=AddlUnits_ExtraDashbots_AddMiner on_click={on_AddlUnits_ExtraDashbots_AddMiner} width=24 height=24/><Text width=90 text="+Miner"/>
				<Button id=AddlUnits_ExtraDashbots_AddAdvMiner on_click={on_AddlUnits_ExtraDashbots_AddAdvMiner} width=24 height=24/><Text width=90 text="+AdvMiner"/>
				<Button id=AddlUnits_ExtraDashbots_AddSolarCell on_click={on_AddlUnits_ExtraDashbots_AddSolarCell} width=24 height=24/><Text width=90 text="+SolarCell"/>
				<Button id=AddlUnits_ExtraDashbots_AddTurret on_click={on_AddlUnits_ExtraDashbots_AddTurret} width=24 height=24/><Text width=90 text="+Turret"/>
			</HorizontalList>
			<HorizontalList>
				<Text width=120 text="Internal (max 2):" textalign=right/>
				<Button id=AddlUnits_ExtraDashbots_AddBehavior on_click={on_AddlUnits_ExtraDashbots_AddBehavior} width=24 height=24/><Text width=90 text="+Behavior"/>
				<Button id=AddlUnits_ExtraDashbots_AddCapacitor on_click={on_AddlUnits_ExtraDashbots_AddCapacitor} width=24 height=24/><Text width=90 text="+Capacitor"/>
				<Button id=AddlUnits_ExtraDashbots_AddPowerCell on_click={on_AddlUnits_ExtraDashbots_AddPowerCell} width=24 height=24/><Text width=90 text="+PowerCell"/>
			</HorizontalList>
			<Spacer height=12/>
			<HorizontalList>
				<Slider id=AddlUnits_ExtraTwinbots_Slider height=36 width=320 min=0 max=20 step=1 on_change={on_AddlUnits_ExtraTwinbots_changed}/>
				<Text id=AddlUnits_ExtraTwinbots width=30 fill=false text="" valign=center textalign=center/>
				<Text width=200 text="Extra Twinbots" valign=center textalign=left/>
			</HorizontalList>
			<HorizontalList>
				<Text width=120 text="Small (max 1):" textalign=right/>
				<Button id=AddlUnits_ExtraTwinbots_AddMiner on_click={on_AddlUnits_ExtraTwinbots_AddMiner} width=24 height=24/><Text width=90 text="+Miner"/>
				<Button id=AddlUnits_ExtraTwinbots_AddAdvMiner on_click={on_AddlUnits_ExtraTwinbots_AddAdvMiner} width=24 height=24/><Text width=90 text="+AdvMiner"/>
				<Button id=AddlUnits_ExtraTwinbots_AddSolarCell on_click={on_AddlUnits_ExtraTwinbots_AddSolarCell} width=24 height=24/><Text width=90 text="+SolarCell"/>
				<Button id=AddlUnits_ExtraTwinbots_AddTurret on_click={on_AddlUnits_ExtraTwinbots_AddTurret} width=24 height=24/><Text width=90 text="+Turret"/>
			</HorizontalList>
			<HorizontalList>
				<Text width=120 text="Internal (max 2):" textalign=right/>
				<Button id=AddlUnits_ExtraTwinbots_AddBehavior on_click={on_AddlUnits_ExtraTwinbots_AddBehavior} width=24 height=24/><Text width=90 text="+Behavior"/>
				<Button id=AddlUnits_ExtraTwinbots_AddCapacitor on_click={on_AddlUnits_ExtraTwinbots_AddCapacitor} width=24 height=24/><Text width=90 text="+Capacitor"/>
				<Button id=AddlUnits_ExtraTwinbots_AddPowerCell on_click={on_AddlUnits_ExtraTwinbots_AddPowerCell} width=24 height=24/><Text width=90 text="+PowerCell"/>
			</HorizontalList>
			<Spacer height=12/>
			<HorizontalList>
				<Slider id=AddlUnits_ExtraScouts_Slider height=36 width=320 min=0 max=20 step=1 on_change={on_AddlUnits_ExtraScouts_changed}/>
				<Text id=AddlUnits_ExtraScouts width=30 fill=false text="" valign=center textalign=center/>
				<Text width=200 text="Extra Scouts" valign=center textalign=left/>
			</HorizontalList>
			<HorizontalList>
				<Text width=120 text="Small (max 1):" textalign=right/>
				<Button id=AddlUnits_ExtraScouts_AddMiner on_click={on_AddlUnits_ExtraScouts_AddMiner} width=24 height=24/><Text width=90 text="+Miner"/>
				<Button id=AddlUnits_ExtraScouts_AddAdvMiner on_click={on_AddlUnits_ExtraScouts_AddAdvMiner} width=24 height=24/><Text width=90 text="+AdvMiner"/>
				<Button id=AddlUnits_ExtraScouts_AddSolarCell on_click={on_AddlUnits_ExtraScouts_AddSolarCell} width=24 height=24/><Text width=90 text="+SolarCell"/>
				<Button id=AddlUnits_ExtraScouts_AddTurret on_click={on_AddlUnits_ExtraScouts_AddTurret} width=24 height=24/><Text width=90 text="+Turret"/>
			</HorizontalList>
			<HorizontalList>
				<Text width=120 text="Internal (max 2):" textalign=right/>
				<Button id=AddlUnits_ExtraScouts_AddBehavior on_click={on_AddlUnits_ExtraScouts_AddBehavior} width=24 height=24/><Text width=90 text="+Behavior"/>
				<Button id=AddlUnits_ExtraScouts_AddCapacitor on_click={on_AddlUnits_ExtraScouts_AddCapacitor} width=24 height=24/><Text width=90 text="+Capacitor"/>
				<Button id=AddlUnits_ExtraScouts_AddPowerCell on_click={on_AddlUnits_ExtraScouts_AddPowerCell} width=24 height=24/><Text width=90 text="+PowerCell"/>
			</HorizontalList>
		</VerticalList>

		<Box>
			<Text text="Tech Unlocks" style=hl textalign=center/>
		</Box>
		<Text text="Select as many as you like." textalign=center/>
		<HorizontalList>
			<VerticalList child_align=center>				
				<Text text="Signals" style=h1 textalign=center/>
				<HorizontalList child_align=left><Button id=Tech_BasicSignals on_click={on_Tech_BasicSignals} width=30 height=30/><Text valign=center width=170 text="Basic Signals"/></HorizontalList>
				<HorizontalList child_align=left><Button id=Tech_Behaviors on_click={on_Tech_Behaviors} width=30 height=30/><Text valign=center width=170 text="Behaviors"/></HorizontalList>
				<HorizontalList child_align=left><Button id=Tech_Nanobots on_click={on_Tech_Nanobots} width=30 height=30/><Text valign=center width=170 text="Nanobots"/></HorizontalList>
			</VerticalList>		
			<VerticalList child_align=center>
				<Text text="Structures" style=h1 textalign=center/>		
				<HorizontalList child_align=left><Button id=Tech_BasicStructures on_click={on_Tech_BasicStructures} width=30 height=30/><Text valign=center width=170 text="Basic Structures"/></HorizontalList>
				<HorizontalList child_align=left><Button id=Tech_BasicRobotics on_click={on_Tech_BasicRobotics} width=30 height=30/><Text valign=center width=170 text="Basic Robotics"/></HorizontalList>
				<HorizontalList child_align=left><Button id=Tech_RoboticsProduction on_click={on_Tech_RoboticsProduction} width=30 height=30/><Text valign=center width=170 text="Robotics Production"/></HorizontalList>
			</VerticalList>			
			<VerticalList child_align=center>
				<Text text="Power" style=h1 textalign=center/>
				<HorizontalList child_align=left><Button id=Tech_BasicPower on_click={on_Tech_BasicPower} width=30 height=30/><Text valign=center width=170 text="Basic Power"/></HorizontalList>
				<HorizontalList child_align=left><Button id=Tech_PowerTransference on_click={on_Tech_PowerTransference} width=30 height=30/><Text valign=center width=170 text="Power Transference"/></HorizontalList>
				<HorizontalList child_align=left><Button id=Tech_ExpandedPower on_click={on_Tech_ExpandedPower} width=30 height=30/><Text width=170 valign=center text="Expanded Power"/></HorizontalList>
			</VerticalList>
		</HorizontalList>
	</ScrollList>
	]],
	{
	construct = function(menu)

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

		profile.CustomStart_AddlUnits_ExtraWorkers = profile.CustomStart_AddlUnits_ExtraWorkers or 0
        menu.AddlUnits_ExtraWorkers.text = tostring(profile.CustomStart_AddlUnits_ExtraWorkers)
        menu.AddlUnits_ExtraWorkers_Slider.value = profile.CustomStart_AddlUnits_ExtraWorkers

		menu.AddlUnits_ExtraWorkers_AddMiner.icon = profile.CustomStart_AddlUnits_ExtraWorkers_AddMiner and "icon_small_confirm" or nil
		menu.AddlUnits_ExtraWorkers_AddMiner.active = profile.CustomStart_AddlUnits_ExtraWorkers_AddMiner

		menu.AddlUnits_ExtraWorkers_AddAdvMiner.icon = profile.CustomStart_AddlUnits_ExtraWorkers_AddAdvMiner and "icon_small_confirm" or nil
		menu.AddlUnits_ExtraWorkers_AddAdvMiner.active = profile.CustomStart_AddlUnits_ExtraWorkers_AddAdvMiner

		menu.AddlUnits_ExtraWorkers_AddSolarCell.icon = profile.CustomStart_AddlUnits_ExtraWorkers_AddSolarCell and "icon_small_confirm" or nil
		menu.AddlUnits_ExtraWorkers_AddSolarCell.active = profile.CustomStart_AddlUnits_ExtraWorkers_AddSolarCell

		menu.AddlUnits_ExtraWorkers_AddTurret.icon = profile.CustomStart_AddlUnits_ExtraWorkers_AddTurret and "icon_small_confirm" or nil
		menu.AddlUnits_ExtraWorkers_AddTurret.active = profile.CustomStart_AddlUnits_ExtraWorkers_AddTurret

		menu.AddlUnits_ExtraWorkers_AddBehavior.icon = profile.CustomStart_AddlUnits_ExtraWorkers_AddBehavior and "icon_small_confirm" or nil
		menu.AddlUnits_ExtraWorkers_AddBehavior.active = profile.CustomStart_AddlUnits_ExtraWorkers_AddBehavior

		menu.AddlUnits_ExtraWorkers_AddCapacitor.icon = profile.CustomStart_AddlUnits_ExtraWorkers_AddCapacitor and "icon_small_confirm" or nil
		menu.AddlUnits_ExtraWorkers_AddCapacitor.active = profile.CustomStart_AddlUnits_ExtraWorkers_AddCapacitor

		menu.AddlUnits_ExtraWorkers_AddPowerCell.icon = profile.CustomStart_AddlUnits_ExtraWorkers_AddPowerCell and "icon_small_confirm" or nil
		menu.AddlUnits_ExtraWorkers_AddPowerCell.active = profile.CustomStart_AddlUnits_ExtraWorkers_AddPowerCell


		profile.CustomStart_AddlUnits_ExtraDashbots = profile.CustomStart_AddlUnits_ExtraDashbots or 0
        menu.AddlUnits_ExtraDashbots.text = tostring(profile.CustomStart_AddlUnits_ExtraDashbots)
        menu.AddlUnits_ExtraDashbots_Slider.value = profile.CustomStart_AddlUnits_ExtraDashbots

		menu.AddlUnits_ExtraDashbots_AddMiner.icon = profile.CustomStart_AddlUnits_ExtraDashbots_AddMiner and "icon_small_confirm" or nil
		menu.AddlUnits_ExtraDashbots_AddMiner.active = profile.CustomStart_AddlUnits_ExtraDashbots_AddMiner

		menu.AddlUnits_ExtraDashbots_AddAdvMiner.icon = profile.CustomStart_AddlUnits_ExtraDashbots_AddAdvMiner and "icon_small_confirm" or nil
		menu.AddlUnits_ExtraDashbots_AddAdvMiner.active = profile.CustomStart_AddlUnits_ExtraDashbots_AddAdvMiner

		menu.AddlUnits_ExtraDashbots_AddSolarCell.icon = profile.CustomStart_AddlUnits_ExtraDashbots_AddSolarCell and "icon_small_confirm" or nil
		menu.AddlUnits_ExtraDashbots_AddSolarCell.active = profile.CustomStart_AddlUnits_ExtraDashbots_AddSolarCell

		menu.AddlUnits_ExtraDashbots_AddTurret.icon = profile.CustomStart_AddlUnits_ExtraDashbots_AddTurret and "icon_small_confirm" or nil
		menu.AddlUnits_ExtraDashbots_AddTurret.active = profile.CustomStart_AddlUnits_ExtraDashbots_AddTurret

		menu.AddlUnits_ExtraDashbots_AddBehavior.icon = profile.CustomStart_AddlUnits_ExtraDashbots_AddBehavior and "icon_small_confirm" or nil
		menu.AddlUnits_ExtraDashbots_AddBehavior.active = profile.CustomStart_AddlUnits_ExtraDashbots_AddBehavior

		menu.AddlUnits_ExtraDashbots_AddCapacitor.icon = profile.CustomStart_AddlUnits_ExtraDashbots_AddCapacitor and "icon_small_confirm" or nil
		menu.AddlUnits_ExtraDashbots_AddCapacitor.active = profile.CustomStart_AddlUnits_ExtraDashbots_AddCapacitor

		menu.AddlUnits_ExtraDashbots_AddPowerCell.icon = profile.CustomStart_AddlUnits_ExtraDashbots_AddPowerCell and "icon_small_confirm" or nil
		menu.AddlUnits_ExtraDashbots_AddPowerCell.active = profile.CustomStart_AddlUnits_ExtraDashbots_AddPowerCell


		profile.CustomStart_AddlUnits_ExtraTwinbots = profile.CustomStart_AddlUnits_ExtraTwinbots or 0
        menu.AddlUnits_ExtraTwinbots.text = tostring(profile.CustomStart_AddlUnits_ExtraTwinbots)
        menu.AddlUnits_ExtraTwinbots_Slider.value = profile.CustomStart_AddlUnits_ExtraTwinbots

		menu.AddlUnits_ExtraTwinbots_AddMiner.icon = profile.CustomStart_AddlUnits_ExtraTwinbots_AddMiner and "icon_small_confirm" or nil
		menu.AddlUnits_ExtraTwinbots_AddMiner.active = profile.CustomStart_AddlUnits_ExtraTwinbots_AddMiner

		menu.AddlUnits_ExtraTwinbots_AddAdvMiner.icon = profile.CustomStart_AddlUnits_ExtraTwinbots_AddAdvMiner and "icon_small_confirm" or nil
		menu.AddlUnits_ExtraTwinbots_AddAdvMiner.active = profile.CustomStart_AddlUnits_ExtraTwinbots_AddAdvMiner

		menu.AddlUnits_ExtraTwinbots_AddSolarCell.icon = profile.CustomStart_AddlUnits_ExtraTwinbots_AddSolarCell and "icon_small_confirm" or nil
		menu.AddlUnits_ExtraTwinbots_AddSolarCell.active = profile.CustomStart_AddlUnits_ExtraTwinbots_AddSolarCell

		menu.AddlUnits_ExtraTwinbots_AddTurret.icon = profile.CustomStart_AddlUnits_ExtraTwinbots_AddTurret and "icon_small_confirm" or nil
		menu.AddlUnits_ExtraTwinbots_AddTurret.active = profile.CustomStart_AddlUnits_ExtraTwinbots_AddTurret

		menu.AddlUnits_ExtraTwinbots_AddBehavior.icon = profile.CustomStart_AddlUnits_ExtraTwinbots_AddBehavior and "icon_small_confirm" or nil
		menu.AddlUnits_ExtraTwinbots_AddBehavior.active = profile.CustomStart_AddlUnits_ExtraTwinbots_AddBehavior

		menu.AddlUnits_ExtraTwinbots_AddCapacitor.icon = profile.CustomStart_AddlUnits_ExtraTwinbots_AddCapacitor and "icon_small_confirm" or nil
		menu.AddlUnits_ExtraTwinbots_AddCapacitor.active = profile.CustomStart_AddlUnits_ExtraTwinbots_AddCapacitor

		menu.AddlUnits_ExtraTwinbots_AddPowerCell.icon = profile.CustomStart_AddlUnits_ExtraTwinbots_AddPowerCell and "icon_small_confirm" or nil
		menu.AddlUnits_ExtraTwinbots_AddPowerCell.active = profile.CustomStart_AddlUnits_ExtraTwinbots_AddPowerCell

		profile.CustomStart_AddlUnits_ExtraScouts = profile.CustomStart_AddlUnits_ExtraScouts or 0
        menu.AddlUnits_ExtraScouts.text = tostring(profile.CustomStart_AddlUnits_ExtraScouts)
        menu.AddlUnits_ExtraScouts_Slider.value = profile.CustomStart_AddlUnits_ExtraScouts

		menu.AddlUnits_ExtraScouts_AddMiner.icon = profile.CustomStart_AddlUnits_ExtraScouts_AddMiner and "icon_small_confirm" or nil
		menu.AddlUnits_ExtraScouts_AddMiner.active = profile.CustomStart_AddlUnits_ExtraScouts_AddMiner

		menu.AddlUnits_ExtraScouts_AddAdvMiner.icon = profile.CustomStart_AddlUnits_ExtraScouts_AddAdvMiner and "icon_small_confirm" or nil
		menu.AddlUnits_ExtraScouts_AddAdvMiner.active = profile.CustomStart_AddlUnits_ExtraScouts_AddAdvMiner

		menu.AddlUnits_ExtraScouts_AddSolarCell.icon = profile.CustomStart_AddlUnits_ExtraScouts_AddSolarCell and "icon_small_confirm" or nil
		menu.AddlUnits_ExtraScouts_AddSolarCell.active = profile.CustomStart_AddlUnits_ExtraScouts_AddSolarCell

		menu.AddlUnits_ExtraScouts_AddTurret.icon = profile.CustomStart_AddlUnits_ExtraScouts_AddTurret and "icon_small_confirm" or nil
		menu.AddlUnits_ExtraScouts_AddTurret.active = profile.CustomStart_AddlUnits_ExtraScouts_AddTurret

		menu.AddlUnits_ExtraScouts_AddBehavior.icon = profile.CustomStart_AddlUnits_ExtraScouts_AddBehavior and "icon_small_confirm" or nil
		menu.AddlUnits_ExtraScouts_AddBehavior.active = profile.CustomStart_AddlUnits_ExtraScouts_AddBehavior

		menu.AddlUnits_ExtraScouts_AddCapacitor.icon = profile.CustomStart_AddlUnits_ExtraScouts_AddCapacitor and "icon_small_confirm" or nil
		menu.AddlUnits_ExtraScouts_AddCapacitor.active = profile.CustomStart_AddlUnits_ExtraScouts_AddCapacitor

		menu.AddlUnits_ExtraScouts_AddPowerCell.icon = profile.CustomStart_AddlUnits_ExtraScouts_AddPowerCell and "icon_small_confirm" or nil
		menu.AddlUnits_ExtraScouts_AddPowerCell.active = profile.CustomStart_AddlUnits_ExtraScouts_AddPowerCell



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

	on_AddlUnits_ExtraWorkers_changed = function(menu, slider)
        profile.CustomStart_AddlUnits_ExtraWorkers = slider.value
        menu.AddlUnits_ExtraWorkers.text = tostring(slider.value)
	end,
	on_AddlUnits_ExtraWorkers_AddMiner = function(menu, chk)
		local value = not chk.active
		chk.icon = value and "icon_small_confirm" or nil
		chk.active = value
		profile.CustomStart_AddlUnits_ExtraWorkers_AddMiner = value
	end,
	on_AddlUnits_ExtraWorkers_AddAdvMiner = function(menu, chk)
		local value = not chk.active
		chk.icon = value and "icon_small_confirm" or nil
		chk.active = value
		profile.CustomStart_AddlUnits_ExtraWorkers_AddAdvMiner = value
	end,
	on_AddlUnits_ExtraWorkers_AddSolarCell = function(menu, chk)
		local value = not chk.active
		chk.icon = value and "icon_small_confirm" or nil
		chk.active = value
		profile.CustomStart_AddlUnits_ExtraWorkers_AddSolarCell = value
	end,
	on_AddlUnits_ExtraWorkers_AddTurret = function(menu, chk)
		local value = not chk.active
		chk.icon = value and "icon_small_confirm" or nil
		chk.active = value
		profile.CustomStart_AddlUnits_ExtraWorkers_AddTurret = value
	end,
	on_AddlUnits_ExtraWorkers_AddBehavior = function(menu, chk)
		local value = not chk.active
		chk.icon = value and "icon_small_confirm" or nil
		chk.active = value
		profile.CustomStart_AddlUnits_ExtraWorkers_AddBehavior = value
	end,
	on_AddlUnits_ExtraWorkers_AddCapacitor = function(menu, chk)
		local value = not chk.active
		chk.icon = value and "icon_small_confirm" or nil
		chk.active = value
		profile.CustomStart_AddlUnits_ExtraWorkers_AddCapacitor = value
	end,
	on_AddlUnits_ExtraWorkers_AddPowerCell = function(menu, chk)
		local value = not chk.active
		chk.icon = value and "icon_small_confirm" or nil
		chk.active = value
		profile.CustomStart_AddlUnits_ExtraWorkers_AddPowerCell = value
	end,

	on_AddlUnits_ExtraDashbots_changed = function(menu, slider)
        profile.CustomStart_AddlUnits_ExtraDashbots = slider.value
        menu.AddlUnits_ExtraDashbots.text = tostring(slider.value)
	end,
	on_AddlUnits_ExtraDashbots_AddMiner = function(menu, chk)
		local value = not chk.active
		chk.icon = value and "icon_small_confirm" or nil
		chk.active = value
		profile.CustomStart_AddlUnits_ExtraDashbots_AddMiner = value
	end,
	on_AddlUnits_ExtraDashbots_AddAdvMiner = function(menu, chk)
		local value = not chk.active
		chk.icon = value and "icon_small_confirm" or nil
		chk.active = value
		profile.CustomStart_AddlUnits_ExtraDashbots_AddAdvMiner = value
	end,
	on_AddlUnits_ExtraDashbots_AddSolarCell = function(menu, chk)
		local value = not chk.active
		chk.icon = value and "icon_small_confirm" or nil
		chk.active = value
		profile.CustomStart_AddlUnits_ExtraDashbots_AddSolarCell = value
	end,
	on_AddlUnits_ExtraDashbots_AddTurret = function(menu, chk)
		local value = not chk.active
		chk.icon = value and "icon_small_confirm" or nil
		chk.active = value
		profile.CustomStart_AddlUnits_ExtraDashbots_AddTurret = value
	end,
	on_AddlUnits_ExtraDashbots_AddBehavior = function(menu, chk)
		local value = not chk.active
		chk.icon = value and "icon_small_confirm" or nil
		chk.active = value
		profile.CustomStart_AddlUnits_ExtraDashbots_AddBehavior = value
	end,
	on_AddlUnits_ExtraDashbots_AddCapacitor = function(menu, chk)
		local value = not chk.active
		chk.icon = value and "icon_small_confirm" or nil
		chk.active = value
		profile.CustomStart_AddlUnits_ExtraDashbots_AddCapacitor = value
	end,
	on_AddlUnits_ExtraDashbots_AddPowerCell = function(menu, chk)
		local value = not chk.active
		chk.icon = value and "icon_small_confirm" or nil
		chk.active = value
		profile.CustomStart_AddlUnits_ExtraDashbots_AddPowerCell = value
	end,

	on_AddlUnits_ExtraTwinbots_changed = function(menu, slider)
        profile.CustomStart_AddlUnits_ExtraTwinbots = slider.value
        menu.AddlUnits_ExtraTwinbots.text = tostring(slider.value)
	end,
	on_AddlUnits_ExtraTwinbots_AddMiner = function(menu, chk)
		local value = not chk.active
		chk.icon = value and "icon_small_confirm" or nil
		chk.active = value
		profile.CustomStart_AddlUnits_ExtraTwinbots_AddMiner = value
	end,
	on_AddlUnits_ExtraTwinbots_AddAdvMiner = function(menu, chk)
		local value = not chk.active
		chk.icon = value and "icon_small_confirm" or nil
		chk.active = value
		profile.CustomStart_AddlUnits_ExtraTwinbots_AddAdvMiner = value
	end,
	on_AddlUnits_ExtraTwinbots_AddSolarCell = function(menu, chk)
		local value = not chk.active
		chk.icon = value and "icon_small_confirm" or nil
		chk.active = value
		profile.CustomStart_AddlUnits_ExtraTwinbots_AddSolarCell = value
	end,
	on_AddlUnits_ExtraTwinbots_AddTurret = function(menu, chk)
		local value = not chk.active
		chk.icon = value and "icon_small_confirm" or nil
		chk.active = value
		profile.CustomStart_AddlUnits_ExtraTwinbots_AddTurret = value
	end,
	on_AddlUnits_ExtraTwinbots_AddBehavior = function(menu, chk)
		local value = not chk.active
		chk.icon = value and "icon_small_confirm" or nil
		chk.active = value
		profile.CustomStart_AddlUnits_ExtraTwinbots_AddBehavior = value
	end,
	on_AddlUnits_ExtraTwinbots_AddCapacitor = function(menu, chk)
		local value = not chk.active
		chk.icon = value and "icon_small_confirm" or nil
		chk.active = value
		profile.CustomStart_AddlUnits_ExtraTwinbots_AddCapacitor = value
	end,
	on_AddlUnits_ExtraTwinbots_AddPowerCell = function(menu, chk)
		local value = not chk.active
		chk.icon = value and "icon_small_confirm" or nil
		chk.active = value
		profile.CustomStart_AddlUnits_ExtraTwinbots_AddPowerCell = value
	end,

	on_AddlUnits_ExtraScouts_changed = function(menu, slider)
        profile.CustomStart_AddlUnits_ExtraScouts = slider.value
        menu.AddlUnits_ExtraScouts.text = tostring(slider.value)
	end,
	on_AddlUnits_ExtraScouts_AddMiner = function(menu, chk)
		local value = not chk.active
		chk.icon = value and "icon_small_confirm" or nil
		chk.active = value
		profile.CustomStart_AddlUnits_ExtraScouts_AddMiner = value
	end,
	on_AddlUnits_ExtraScouts_AddAdvMiner = function(menu, chk)
		local value = not chk.active
		chk.icon = value and "icon_small_confirm" or nil
		chk.active = value
		profile.CustomStart_AddlUnits_ExtraScouts_AddAdvMiner = value
	end,
	on_AddlUnits_ExtraScouts_AddSolarCell = function(menu, chk)
		local value = not chk.active
		chk.icon = value and "icon_small_confirm" or nil
		chk.active = value
		profile.CustomStart_AddlUnits_ExtraScouts_AddSolarCell = value
	end,
	on_AddlUnits_ExtraScouts_AddTurret = function(menu, chk)
		local value = not chk.active
		chk.icon = value and "icon_small_confirm" or nil
		chk.active = value
		profile.CustomStart_AddlUnits_ExtraScouts_AddTurret = value
	end,
	on_AddlUnits_ExtraScouts_AddBehavior = function(menu, chk)
		local value = not chk.active
		chk.icon = value and "icon_small_confirm" or nil
		chk.active = value
		profile.CustomStart_AddlUnits_ExtraScouts_AddBehavior = value
	end,
	on_AddlUnits_ExtraScouts_AddCapacitor = function(menu, chk)
		local value = not chk.active
		chk.icon = value and "icon_small_confirm" or nil
		chk.active = value
		profile.CustomStart_AddlUnits_ExtraScouts_AddCapacitor = value
	end,
	on_AddlUnits_ExtraScouts_AddPowerCell = function(menu, chk)
		local value = not chk.active
		chk.icon = value and "icon_small_confirm" or nil
		chk.active = value
		profile.CustomStart_AddlUnits_ExtraScouts_AddPowerCell = value
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
