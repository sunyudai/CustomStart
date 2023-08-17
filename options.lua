local profile = Game.GetProfile()
return UI.New([[
	<VerticalList child_padding=8>
		<Text text="HQ Unit Selection" style=hl textalign=center/>
		<Text text="Designed to be playable with only one selected, but you can select more than one." textalign=center/>
		<VerticalList child_align=right>
			<HorizontalList><Text width=500 text="Mobile Command Center (Default)"/><Button id=HQ_CC_Default on_click={on_HQ_CC_Default} width=32 height=32/></HorizontalList>
			<HorizontalList><Text width=500 text="Mobile Command Center (No Deploy, original by Johan)"/><Button id=HQ_CC_NoDeploy on_click={on_HQ_CC_NoDeploy} width=32 height=32/></HorizontalList>
			<HorizontalList><Text width=500 text="Cub Start (original by Johan)"/><Button id=HQ_CubStart on_click={on_HQ_CubStart} width=32 height=32/></HorizontalList>
		</VerticalList>
		<hr />
		<Text text="Additional Units" style=hl textalign=center/>
		<Text text="Select as many as you like." textalign=center/>
		<VerticalList child_align=right>
			<HorizontalList><Text width=500 text="Default Scouts"/><Button id=AddlUnits_DefaultScouts on_click={on_AddlUnits_DefaultScouts} width=32 height=32/></HorizontalList>
			<HorizontalList><Text width=500 text="Extra Workers"/><Button id=AddlUnits_ExtraWorkers on_click={on_AddlUnits_ExtraWorkers} width=32 height=32/></HorizontalList>
			<HorizontalList><Text width=500 text="Strip Miners"/><Button id=AddlUnits_StripMiners on_click={on_AddlUnits_StripMiners} width=32 height=32/></HorizontalList>
		</VerticalList>
		<hr />
		<Text text="Tech Unlocks" style=hl textalign=center/>
		<Text text="Select as many as you like." textalign=center/>
		<Text text="Signals" style=h2 textalign=center/>
		<VerticalList child_align=right>
			<HorizontalList><Text width=500 text="Basic Signals"/><Button id=Tech_BasicSignals on_click={on_Tech_BasicSignals} width=32 height=32/></HorizontalList>
			<HorizontalList><Text width=500 text="Behaviors"/><Button id=Tech_Behaviors on_click={on_Tech_Behaviors} width=32 height=32/></HorizontalList>			
		</VerticalList>
		<Text text="Structures" style=h2 textalign=center/>
		<VerticalList child_align=right>		
		</VerticalList>
		<Text text="Power" style=h2 textalign=center/>
		<VerticalList child_align=right>
		</VerticalList>
	</VerticalList>
	]], {
	construct = function(menu)

		-- defaults
		if not profile.CustomStartFirstRun then
			profile.HQ_CC_Default = true
			profile.AddlUnits_DefaultScouts = true
			profile.CustomStartFirstRun = true
		end

		-- HQ options
		local hq_CC_Default = profile.HQ_CC_Default
		menu.HQ_CC_Default.icon = hq_CC_Default and "icon_small_confirm" or nil
		menu.HQ_CC_Default.active = hq_CC_Default or false

		local hq_CC_NoDeploy = profile.HQ_CC_NoDeploy
		menu.HQ_CC_NoDeploy.icon = hq_CC_NoDeploy and "icon_small_confirm" or nil
		menu.HQ_CC_NoDeploy.active = hq_CC_NoDeploy or false

		local hq_CubStart = profile.HQ_CubStart
		menu.HQ_CubStart.icon = hq_CubStart and "icon_small_confirm" or nil
		menu.HQ_CubStart.active = hq_CubStart or false


		-- Additional Unit options
		local addlUnits_DefaultScouts = profile.AddlUnits_DefaultScouts
		menu.AddlUnits_DefaultScouts.icon = addlUnits_DefaultScouts and "icon_small_confirm" or nil
		menu.AddlUnits_DefaultScouts.active = addlUnits_DefaultScouts or false

		local addlUnits_ExtraWorkers = profile.AddlUnits_ExtraWorkers
		menu.AddlUnits_ExtraWorkers.icon = addlUnits_ExtraWorkers and "icon_small_confirm" or nil
		menu.AddlUnits_ExtraWorkers.active = addlUnits_ExtraWorkers or false

		local addlUnits_StripMiners = profile.AddlUnits_StripMiners
		menu.AddlUnits_StripMiners.icon = addlUnits_StripMiners and "icon_small_confirm" or nil
		menu.AddlUnits_StripMiners.active = addlUnits_StripMiners or false


		-- Tech Options
		local tech_BasicSignals = profile.Tech_BasicSignals
		menu.Tech_BasicSignals.icon = tech_BasicSignals and "icon_small_confirm" or nil
		menu.Tech_BasicSignals.active = tech_BasicSignals or false

		local tech_Behaviors = profile.Tech_Behaviors
		menu.Tech_Behaviors.icon = tech_Behaviors and "icon_small_confirm" or nil
		menu.Tech_Behaviors.active = tech_Behaviors or false

	end,

	-- HQ options
	on_HQ_CC_Default = function(menu, chk)
		local value = not chk.active
		chk.icon = value and "icon_small_confirm" or nil
		chk.active = value
		profile.HQ_CC_Default = value
	end,
	on_HQ_CC_NoDeploy = function(menu, chk)
		local value = not chk.active
		chk.icon = value and "icon_small_confirm" or nil
		chk.active = value
		profile.HQ_CC_NoDeploy = value
	end,
	on_HQ_CubStart = function(menu, chk)
		local value = not chk.active
		chk.icon = value and "icon_small_confirm" or nil
		chk.active = value
		profile.HQ_CubStart = value
	end,

	-- Additional Unit options
	on_AddlUnits_DefaultScouts = function(menu, chk)
		local value = not chk.active
		chk.icon = value and "icon_small_confirm" or nil
		chk.active = value
		profile.AddlUnits_DefaultScouts = value
	end,
	on_AddlUnits_ExtraWorkers = function(menu, chk)
		local value = not chk.active
		chk.icon = value and "icon_small_confirm" or nil
		chk.active = value
		profile.AddlUnits_ExtraWorkers = value
	end,
	on_AddlUnits_StripMiners = function(menu, chk)
		local value = not chk.active
		chk.icon = value and "icon_small_confirm" or nil
		chk.active = value
		profile.AddlUnits_StripMiners = value
	end,
	
	-- Tech Options	
	on_Tech_BasicSignals = function(menu, chk)
		local value = not chk.active
		chk.icon = value and "icon_small_confirm" or nil
		chk.active = value
		profile.Tech_BasicSignals = value
	end,
	on_Tech_Behaviors = function(menu, chk)
		local value = not chk.active
		chk.icon = value and "icon_small_confirm" or nil
		chk.active = value
		profile.Tech_Behaviors = value
	end,
})
