-- Author: paroxysm
-- Version: 1
-- Updated: 03.02.2017
local ItemPanel = {}

ItemPanel.optionEnable = Menu.AddOption({ "Utility" }, "Item Panel", "")
ItemPanel.font = Renderer.LoadFont("Arial", 16, Enum.FontWeight.EXTRABOLD)

ItemPanel.heroes = {}
ItemPanel.heroes["npc_dota_hero_abaddon"] = "Abaddon"
ItemPanel.heroes["npc_dota_hero_alchemist"] = "Alchemist"
ItemPanel.heroes["npc_dota_hero_antimage"] = "Anti-Mage"
ItemPanel.heroes["npc_dota_hero_ancient_apparition"] = "Ancient Apparition"
ItemPanel.heroes["npc_dota_hero_arcwarden"] = "Arc Warden"
ItemPanel.heroes["npc_dota_hero_axe"] = "Axe"
ItemPanel.heroes["npc_dota_hero_bane"] = "Bane"
ItemPanel.heroes["npc_dota_hero_batrider"] = "Batrider"
ItemPanel.heroes["npc_dota_hero_beastmaster"] = "Beastmaster"
ItemPanel.heroes["npc_dota_hero_bloodseeker"] = "Bloodseeker"
ItemPanel.heroes["npc_dota_hero_bounty_hunter"] = "Bounty Hunter"
ItemPanel.heroes["npc_dota_hero_brewmaster"] = "Brewmaster"
ItemPanel.heroes["npc_dota_hero_bristleback"] = "Bristleback"
ItemPanel.heroes["npc_dota_hero_broodmother"] = "Broodmother"
ItemPanel.heroes["npc_dota_hero_centaur"] = "Centaur Warrunner"
ItemPanel.heroes["npc_dota_hero_chaos_knight"] = "Chaos Knight"
ItemPanel.heroes["npc_dota_hero_chen"] = "Chen"
ItemPanel.heroes["npc_dota_hero_clinkz"] = "Clinkz"
ItemPanel.heroes["npc_dota_hero_rattletrap"] = "Clockwerk"
ItemPanel.heroes["npc_dota_hero_crystal_maiden"] = "Crystal Maiden"
ItemPanel.heroes["npc_dota_hero_dark_seer"] = "Dark Seer"
ItemPanel.heroes["npc_dota_hero_dazzle"] = "Dazzle"
ItemPanel.heroes["npc_dota_hero_death_prophet"] = "Death Prophet"
ItemPanel.heroes["npc_dota_hero_disruptor"] = "Disruptor"
ItemPanel.heroes["npc_dota_hero_doom_bringer"] = "Doom"
ItemPanel.heroes["npc_dota_hero_dragon_knight"] = "Dragon Knight"
ItemPanel.heroes["npc_dota_hero_drow_ranger"] = "Drow Ranger"
ItemPanel.heroes["npc_dota_hero_earth_spirit"] = "Earth Spirit"
ItemPanel.heroes["npc_dota_hero_earthshaker"] = "Earthshaker"
ItemPanel.heroes["npc_dota_hero_elder_titan"] = "Elder Titan"
ItemPanel.heroes["npc_dota_hero_ember_spirit"] = "Ember Spirit"
ItemPanel.heroes["npc_dota_hero_enchantress"] = "Enchantress"
ItemPanel.heroes["npc_dota_hero_enigma"] = "Enigma"
ItemPanel.heroes["npc_dota_hero_faceless_void"] = "Faceless Void"
ItemPanel.heroes["npc_dota_hero_gyrocopter"] = "Gyrocopter"
ItemPanel.heroes["npc_dota_hero_huskar"] = "Huskar"
ItemPanel.heroes["npc_dota_hero_invoker"] = "Invoker"
ItemPanel.heroes["npc_dota_hero_wisp"] = "Io"
ItemPanel.heroes["npc_dota_hero_jakiro"] = "Jakiro"
ItemPanel.heroes["npc_dota_hero_juggernaut"] = "Juggernaut"
ItemPanel.heroes["npc_dota_hero_keeper_of_the_light"] = "Keeper of the Light"
ItemPanel.heroes["npc_dota_hero_kunkka"] = "Kunkka"
ItemPanel.heroes["npc_dota_hero_legion_commander"] = "Legion Commander"
ItemPanel.heroes["npc_dota_hero_leshrac"] = "Leshrac"
ItemPanel.heroes["npc_dota_hero_lich"] = "Lich"
ItemPanel.heroes["npc_dota_hero_life_stealer"] = "Lifestealer"
ItemPanel.heroes["npc_dota_hero_lina"] = "Lina"
ItemPanel.heroes["npc_dota_hero_lion"] = "Lion"
ItemPanel.heroes["npc_dota_hero_lone_druid"] = "Lone Druid"
ItemPanel.heroes["npc_dota_hero_luna"] = "Luna"
ItemPanel.heroes["npc_dota_hero_lycan"] = "Lycan"
ItemPanel.heroes["npc_dota_hero_magnataur"] = "Magnus"
ItemPanel.heroes["npc_dota_hero_medusa"] = "Medusa"
ItemPanel.heroes["npc_dota_hero_meepo"] = "Meepo"
ItemPanel.heroes["npc_dota_hero_mirana"] = "Mirana"
ItemPanel.heroes["npc_dota_hero_morphling"] = "Morphling"
ItemPanel.heroes["npc_dota_hero_monkey_king"] = "Monkey King"
ItemPanel.heroes["npc_dota_hero_naga_siren"] = "Naga Siren"
ItemPanel.heroes["npc_dota_hero_furion"] = "Nature's Prophet"
ItemPanel.heroes["npc_dota_hero_necrolyte"] = "Necrophos"
ItemPanel.heroes["npc_dota_hero_night_stalker"] = "Night Stalker"
ItemPanel.heroes["npc_dota_hero_nyx_assassin"] = "Nyx Assassin"
ItemPanel.heroes["npc_dota_hero_ogre_magi"] = "Ogre Magi"
ItemPanel.heroes["npc_dota_hero_omniknight"] = "Omniknight"
ItemPanel.heroes["npc_dota_hero_oracle"] = "Oracle"
ItemPanel.heroes["npc_dota_hero_obsidian_destroyer"] = "Outworld Devourer"
ItemPanel.heroes["npc_dota_hero_phantom_assassin"] = "Phantom Assassin"
ItemPanel.heroes["npc_dota_hero_phantom_lancer"] = "Phantom Lancer"
ItemPanel.heroes["npc_dota_hero_phoenix"] = "Phoenix"
ItemPanel.heroes["npc_dota_hero_puck"] = "Puck"
ItemPanel.heroes["npc_dota_hero_pudge"] = "Pudge"
ItemPanel.heroes["npc_dota_hero_pugna"] = "Pugna"
ItemPanel.heroes["npc_dota_hero_queenofpain"] = "Queen of Pain"
ItemPanel.heroes["npc_dota_hero_razor"] = "Razor"
ItemPanel.heroes["npc_dota_hero_riki"] = "Riki"
ItemPanel.heroes["npc_dota_hero_rubick"] = "Rubick"
ItemPanel.heroes["npc_dota_hero_sand_king"] = "Sand King"
ItemPanel.heroes["npc_dota_hero_shadow_demon"] = "Shadow Demon"
ItemPanel.heroes["npc_dota_hero_nevermore"] = "Shadow Fiend"
ItemPanel.heroes["npc_dota_hero_shadow_shaman"] = "Shadow Shaman"
ItemPanel.heroes["npc_dota_hero_silencer"] = "Silencer"
ItemPanel.heroes["npc_dota_hero_skywrath_mage"] = "Skywrath Mage"
ItemPanel.heroes["npc_dota_hero_slardar"] = "Slardar"
ItemPanel.heroes["npc_dota_hero_slark"] = "Slark"
ItemPanel.heroes["npc_dota_hero_sniper"] = "Sniper"
ItemPanel.heroes["npc_dota_hero_spectre"] = "Spectre"
ItemPanel.heroes["npc_dota_hero_spirit_breaker"] = "Spirit Breaker"
ItemPanel.heroes["npc_dota_hero_storm_spirit"] = "Storm Spirit"
ItemPanel.heroes["npc_dota_hero_sven"] = "Sven"
ItemPanel.heroes["npc_dota_hero_techies"] = "Techies"
ItemPanel.heroes["npc_dota_hero_templar_assassin"] = "Templar Assassin"
ItemPanel.heroes["npc_dota_hero_terrorblade"] = "Terrorblade"
ItemPanel.heroes["npc_dota_hero_tidehunter"] = "Tidehunter"
ItemPanel.heroes["npc_dota_hero_shredder"] = "Timbersaw"
ItemPanel.heroes["npc_dota_hero_tinker"] = "Tinker"
ItemPanel.heroes["npc_dota_hero_tiny"] = "Tiny"
ItemPanel.heroes["npc_dota_hero_treant"] = "Treant Protector"
ItemPanel.heroes["npc_dota_hero_troll_warlord"] = "Troll Warlord"
ItemPanel.heroes["npc_dota_hero_tusk"] = "Tusk"
ItemPanel.heroes["npc_dota_hero_abyssal_underlord"] = "Underlord"
ItemPanel.heroes["npc_dota_hero_undying"] = "Undying"
ItemPanel.heroes["npc_dota_hero_ursa"] = "Ursa"
ItemPanel.heroes["npc_dota_hero_vengefulspirit"] = "Vengeful Spirit"
ItemPanel.heroes["npc_dota_hero_venomancer"] = "Venomancer"
ItemPanel.heroes["npc_dota_hero_viper"] = "Viper"
ItemPanel.heroes["npc_dota_hero_visage"] = "Visage"
ItemPanel.heroes["npc_dota_hero_warlock"] = "Warlock"
ItemPanel.heroes["npc_dota_hero_weaver"] = "Weaver"
ItemPanel.heroes["npc_dota_hero_windrunner"] = "Windranger"
ItemPanel.heroes["npc_dota_hero_winter_wyvern"] = "Winter Wyvern"
ItemPanel.heroes["npc_dota_hero_witch_doctor"] = "Witch Doctor"
ItemPanel.heroes["npc_dota_hero_skeleton_king"] = "Wraith King"
ItemPanel.heroes["npc_dota_hero_zuus"] = "Zeus"

ItemPanel.items = {}
ItemPanel.items["item_aegis"] = "Aegis of the Immortal"
ItemPanel.items["item_courier"] = "Animal Courier"
ItemPanel.items["item_boots_of_elves"] = "Band of Elvenskin"
ItemPanel.items["item_belt_of_strength"] = "Belt of Strength"
ItemPanel.items["item_blade_of_alacrity"] = "Blade of Alacrity"
ItemPanel.items["item_blades_of_attack"] = "Blades of Attack"
ItemPanel.items["item_blight_stone"] = "Blight Stone"
ItemPanel.items["item_blink"] = "Blink Dagger"
ItemPanel.items["item_boots"] = "Boots of Speed"
ItemPanel.items["item_bottle"] = "Bottle"
ItemPanel.items["item_broadsword"] = "Broadsword"
ItemPanel.items["item_chainmail"] = "Chainmail"
ItemPanel.items["item_cheese"] = "Cheese"
ItemPanel.items["item_circlet"] = "Circlet"
ItemPanel.items["item_clarity"] = "Clarity"
ItemPanel.items["item_claymore"] = "Claymore"
ItemPanel.items["item_cloak"] = "Cloak"
ItemPanel.items["item_demon_edge"] = "Demon Edge"
ItemPanel.items["item_dust"] = "Dust of Appearance"
ItemPanel.items["item_eagle"] = "Eaglesong"
ItemPanel.items["item_enchanted_mango"] = "Enchanted Mango"
ItemPanel.items["item_energy_booster"] = "Energy Booster"
ItemPanel.items["item_faerie_fire"] = "Faerie Fire"
ItemPanel.items["item_flying_courier"] = "Flying Courier"
ItemPanel.items["item_gauntlets"] = "Gauntlets of Strength"
ItemPanel.items["item_gem"] = "Gem of True Sight"
ItemPanel.items["item_ghost"] = "Ghost Scepter"
ItemPanel.items["item_gloves"] = "Gloves of Haste"
ItemPanel.items["item_flask"] = "Healing Salve"
ItemPanel.items["item_helm_of_iron_will"] = "Helm of Iron Will"
ItemPanel.items["item_hyperstone"] = "Hyperstone"
ItemPanel.items["item_infused_raindrop"] = "Infused Raindrop"
ItemPanel.items["item_branches"] = "Iron Branch"
ItemPanel.items["item_javelin"] = "Javelin"
ItemPanel.items["item_magic_stick"] = "Magic Stick"
ItemPanel.items["item_mantle"] = "Mantle of Intelligence"
ItemPanel.items["item_mithril_hammer"] = "Mithril Hammer"
ItemPanel.items["item_lifesteal"] = "Morbid Mask"
ItemPanel.items["item_mystic_staff"] = "Mystic Staff"
ItemPanel.items["item_ward_observer"] = "Observer Ward"
ItemPanel.items["item_ogre_axe"] = "Ogre Club"
ItemPanel.items["item_orb_of_venom"] = "Orb of Venom"
ItemPanel.items["item_platemail"] = "Platemail"
ItemPanel.items["item_point_booster"] = "Point Booster"
ItemPanel.items["item_quarterstaff"] = "Quarterstaff"
ItemPanel.items["item_quelling_blade"] = "Quelling Blade"
ItemPanel.items["item_reaver"] = "Reaver"
ItemPanel.items["item_ring_of_health"] = "Ring of Health"
ItemPanel.items["item_ring_of_protection"] = "Ring of Protection"
ItemPanel.items["item_ring_of_regen"] = "Ring of Regen"
ItemPanel.items["item_robe"] = "Robe of the Magi"
ItemPanel.items["item_relic"] = "Sacred Relic"
ItemPanel.items["item_sobi_mask"] = "Sage's Mask"
ItemPanel.items["item_ward_sentry"] = "Sentry Ward"
ItemPanel.items["item_shadow_amulet"] = "Shadow Amulet"
ItemPanel.items["item_slippers"] = "Slippers of Agility"
ItemPanel.items["item_smoke_of_deceit"] = "Smoke of Deceit"
ItemPanel.items["item_staff_of_wizardry"] = "Staff of Wizardry"
ItemPanel.items["item_stout_shield"] = "Stout Shield"
ItemPanel.items["item_talisman_of_evasion"] = "Talisman of Evasion"
ItemPanel.items["item_tango"] = "Tango"
ItemPanel.items["item_tango_single"] = "Tango (Shared)"
ItemPanel.items["item_tome_of_knowledge"] = "Tome of Knowledge"
ItemPanel.items["item_tpscroll"] = "Town Portal Scroll"
ItemPanel.items["item_ultimate_orb"] = "Ultimate Orb"
ItemPanel.items["item_vitality_booster"] = "Vitality Booster"
ItemPanel.items["item_void_stone"] = "Void Stone"
ItemPanel.items["item_wind_lace"] = "Wind Lace"
ItemPanel.items["item_abyssal_blade"] = "Abyssal Blade"
ItemPanel.items["item_aether_lens"] = "Aether Lens"
ItemPanel.items["item_ultimate_scepter"] = "Aghanim's Scepter"
ItemPanel.items["item_arcane_boots"] = "Arcane Boots"
ItemPanel.items["item_armlet"] = "Armlet of Mordiggian"
ItemPanel.items["item_assault"] = "Assault Cuirass"
ItemPanel.items["item_bfury"] = "Battle Fury"
ItemPanel.items["item_black_king_bar"] = "Black King Bar"
ItemPanel.items["item_blade_mail"] = "Blade Mail"
ItemPanel.items["item_bloodstone"] = "Bloodstone"
ItemPanel.items["item_bloodthorn"] = "Bloodthorn"
ItemPanel.items["item_travel_boots_#"] = "Boots of Travel2"
ItemPanel.items["item_bracer"] = "Bracer"
ItemPanel.items["item_buckler"] = "Buckler"
ItemPanel.items["item_butterfly"] = "Butterfly"
ItemPanel.items["item_crimson_guard"] = "Crimson Guard"
ItemPanel.items["item_lesser_crit"] = "Crystalys"
ItemPanel.items["item_greater_crit"] = "Daedalus"
ItemPanel.items["item_dagon_#"] = "Dagon2"
ItemPanel.items["item_desolator"] = "Desolator"
ItemPanel.items["item_diffusal_blade_#"] = "Diffusal Blade2"
ItemPanel.items["item_dragon_lance"] = "Dragon Lance"
ItemPanel.items["item_ancient_janggo"] = "Drum of Endurance"
ItemPanel.items["item_echo_sabre"] = "Echo Sabre"
ItemPanel.items["item_ethereal_blade"] = "Ethereal Blade"
ItemPanel.items["item_cyclone"] = "Eul's Scepter of Divinity"
ItemPanel.items["item_skadi"] = "Eye of Skadi"
ItemPanel.items["item_force_staff"] = "Force Staff"
ItemPanel.items["item_glimmer_cape"] = "Glimmer Cape"
ItemPanel.items["item_guardian_greaves"] = "Guardian Greaves"
ItemPanel.items["item_hand_of_midas"] = "Hand of Midas"
ItemPanel.items["item_headdress"] = "Headdress"
ItemPanel.items["item_heart"] = "Heart of Tarrasque"
ItemPanel.items["item_heavens_halberd"] = "Heaven's Halberd"
ItemPanel.items["item_helm_of_the_dominator"] = "Helm of the Dominator"
ItemPanel.items["item_hood_of_defiance"] = "Hood of Defiance"
ItemPanel.items["item_hurricane_pike"] = "Hurricane Pike"
ItemPanel.items["item_iron_talon"] = "Iron Talon"
ItemPanel.items["item_sphere"] = "Linken's Sphere"
ItemPanel.items["item_lotus_orb"] = "Lotus Orb"
ItemPanel.items["item_maelstrom"] = "Maelstrom"
ItemPanel.items["item_magic_wand"] = "Magic Wand"
ItemPanel.items["item_manta"] = "Manta Style"
ItemPanel.items["item_mask_of_madness"] = "Mask of Madness"
ItemPanel.items["item_medallion_of_courage"] = "Medallion of Courage"
ItemPanel.items["item_mekansm"] = "Mekansm"
ItemPanel.items["item_mjollnir"] = "Mjollnir"
ItemPanel.items["item_monkey_king_bar"] = "Monkey King Bar"
ItemPanel.items["item_moon_shard"] = "Moon Shard"
ItemPanel.items["item_necronomicon_#"] = "Necronomicon2"
ItemPanel.items["item_null_talisman"] = "Null Talisman"
ItemPanel.items["item_oblivion_staff"] = "Oblivion Staff"
ItemPanel.items["item_ward_dispenser"] = "Observer and Sentry Wards"
ItemPanel.items["item_octarine_core"] = "Octarine Core"
ItemPanel.items["item_orchid"] = "Orchid Malevolence"
ItemPanel.items["item_pers"] = "Perseverance"
ItemPanel.items["item_phase_boots"] = "Phase Boots"
ItemPanel.items["item_pipe"] = "Pipe of Insight"
ItemPanel.items["item_poor_mans_shield"] = "Poor Man's Shield"
ItemPanel.items["item_power_treads"] = "Power Treads"
ItemPanel.items["item_radiance"] = "Radiance"
ItemPanel.items["item_rapier"] = "Divine Rapier"
ItemPanel.items["item_refresher"] = "Refresher Orb"
ItemPanel.items["item_ring_of_aquila"] = "Ring of Aquila"
ItemPanel.items["item_ring_of_basilius"] = "Ring of Basilius"
ItemPanel.items["item_rod_of_atos"] = "Rod of Atos"
ItemPanel.items["item_sange"] = "Sange"
ItemPanel.items["item_sange_and_yasha"] = "Sange and Yasha"
ItemPanel.items["item_satanic"] = "Satanic"
ItemPanel.items["item_sheepstick"] = "Scythe of Vyse"
ItemPanel.items["item_invis_sword"] = "Shadow Blade"
ItemPanel.items["item_shivas_guard"] = "Shiva's Guard"
ItemPanel.items["item_silver_edge"] = "Silver Edge"
ItemPanel.items["item_basher"] = "Skull Basher"
ItemPanel.items["item_solar_crest"] = "Solar Crest"
ItemPanel.items["item_soul_booster"] = "Soul Booster"
ItemPanel.items["item_soul_ring"] = "Soul Ring"
ItemPanel.items["item_tranquil_boots"] = "Tranquil Boots"
ItemPanel.items["item_urn_of_shadows"] = "Urn of Shadows"
ItemPanel.items["item_vanguard"] = "Vanguard"
ItemPanel.items["item_veil_of_discord"] = "Veil of Discord"
ItemPanel.items["item_vladmir"] = "Vladmir's Offering"
ItemPanel.items["item_wraith_band"] = "Wraith Band"
ItemPanel.items["item_yasha"] = "Yasha"



function ItemPanel.OnUpdate()
    if not Menu.IsEnabled(ItemPanel.optionEnable) then return true end

end

function ItemPanel.OnDraw()
    if not Menu.IsEnabled(ItemPanel.optionEnable) then return true end
	
	local myHero = Heroes.GetLocal()
	if myHero == nil then return end
	local myTeam = Entity.GetTeamNum( myHero )

	local drawText = ""
	local size = 20
	
	for i = 1, Heroes.Count() do
		local hero = Heroes.Get(i)
		
		if not NPC.IsIllusion(hero) then
			local sameTeam = Entity.GetTeamNum(hero) == myTeam
			
			if not sameTeam then
				drawText = drawText .. ItemPanel.heroes[NPC.GetUnitName(hero)] .. "\r\n"
				for k, v in pairs(ItemPanel.items) do
					if NPC.HasItem(hero, k, true) then
						drawText = drawText .. "\t - " .. ItemPanel.items[k] .. "\r\n"
						size = size + 16
					end
				end
				size = size + 30
				drawText = drawText .. "\r\n"
			end
			
		end
	end

	Renderer.SetDrawColor(0, 0, 0, 125)
	Renderer.DrawFilledRect(0, 180, 220, size)
	
	Renderer.SetDrawColor(255, 255, 255, 255)
	Renderer.DrawText(ItemPanel.font, 10, 190, drawText, 1)
end

return ItemPanel