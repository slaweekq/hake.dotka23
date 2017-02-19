-- Author: paroxysm
-- Version: 2
-- Updated: 03.02.2017
local Tinker = {}

Tinker.optionEnable = Menu.AddOption({ "Hero Specific","Tinker" }, "Enabled", "")
Tinker.optionKey = Menu.AddKeyOption({ "Hero Specific","Tinker" }, "Key", Enum.ButtonCode.KEY_F)

Tinker.myorder = Menu.AddOption({ "Hero Specific","Tinker", "Order" }, "My custom order", "")

Tinker.orders = {}

for i = 1, 13 do 
	local temp = ""
	if i < 10 then temp = "0" end
	Tinker.orders[i] =  Menu.AddOption({ "Hero Specific","Tinker", "Order" }, 
		"Spell cast " .. temp .. i .. " :", "Default:\r\n1 - Blink Dagger\r\n2 - Soul Ring\r\n3 - Hex\r\n4 - Veil\r\n5 - Ethereal\r\n6 - Orchid" .. 
		"\r\n7 - Blood\r\n8 - Dagon\r\n9 - Shiva\r\n10 - Laser\r\n11 - Rockets\r\n12 - Rearm"
		, 1, 13)
end

local MenuItems = {}
MenuItems[1] =  "Off"
MenuItems[2] =  "Blink"
MenuItems[3] =  "Soul Ring"
MenuItems[4] =  "Hex"
MenuItems[5] =  "Veil"
MenuItems[6] =  "Ethereal"
MenuItems[7] =  "Orchid"
MenuItems[8] =  "Blood"
MenuItems[9] =  "Dagon"
MenuItems[10] =  "Shiva"
MenuItems[11] =  "Laser"
MenuItems[12] =  "Rockets"
MenuItems[13] =  "Rearm"

for k, v in pairs(MenuItems) do
	for i = 1, 13 do 
		Menu.SetValueName(Tinker.orders[i], k, v)
	end
end
	
Tinker.stopcast = Menu.AddOption({ "Hero Specific","Tinker" }, "Stop cast then mana", "")
Tinker.threshold = Menu.AddOption({ "Hero Specific","Tinker" }, "Stop cast threshold", "", 75, 500, 25)

Tinker.calculator = Menu.AddOption({ "Hero Specific","Tinker" }, "DMG Calculator", "")

Tinker.blink = Menu.AddOption({ "Hero Specific","Tinker" }, "Use Item Blink", "")
Tinker.soul = Menu.AddOption({ "Hero Specific","Tinker" }, "Use Item Soul Ring", "")
Tinker.veil = Menu.AddOption({ "Hero Specific","Tinker" }, "Use Item Veil of Discord", "")
Tinker.hex = Menu.AddOption({ "Hero Specific","Tinker" }, "Use Item Hex", "")
Tinker.ethereal = Menu.AddOption({ "Hero Specific","Tinker" }, "Use Item Ethereal Blade", "")
Tinker.orchid = Menu.AddOption({ "Hero Specific","Tinker" }, "Use Item Orchid", "")
Tinker.blood = Menu.AddOption({ "Hero Specific","Tinker" }, "Use Item Bloodthorn", "")
Tinker.dagon = Menu.AddOption({ "Hero Specific","Tinker" }, "Use Item Dagon", "")
Tinker.shiva = Menu.AddOption({ "Hero Specific","Tinker" }, "Use Item Shiva's Guard", "")
Tinker.laser = Menu.AddOption({ "Hero Specific","Tinker" }, "Use Skill Laser", "")
Tinker.rocket = Menu.AddOption({ "Hero Specific","Tinker" }, "Use Skill Rockets", "")
Tinker.rearm = Menu.AddOption({ "Hero Specific","Tinker" }, "Use Skill Rearm", "")

Tinker.font = Renderer.LoadFont("Tahoma", 20, Enum.FontWeight.EXTRABOLD)


time = 0
lastcasttime = 0
ordernow = 0

function Tinker.OnUpdate()
    if not Menu.IsEnabled(Tinker.optionEnable) then return true end
    if not Menu.IsKeyDown(Tinker.optionKey) then return end

    Tinker.ComboWombo()
end

function Tinker.OnDraw()
    if not Menu.IsEnabled(Tinker.calculator) then return true end
	
    local myHero = Heroes.GetLocal()
    if NPC.GetUnitName(myHero) ~= "npc_dota_hero_tinker" then return end
	local totaldmg = 0
	local xfactor = 1;

	local ethereal = NPC.GetItem(myHero, "item_ethereal_blade", true)
	if ethereal and Menu.IsEnabled(Tinker.ethereal) then xfactor = xfactor + 0.4 totaldmg = totaldmg + 75 + (Hero.GetIntellectTotal(myHero) * 2) end

	local veil = NPC.GetItem(myHero, "item_veil_of_discord", true)
	if veil and Menu.IsEnabled(Tinker.veil) then xfactor = xfactor + 0.25 end
	
    local shiva = NPC.GetItem(myHero, "item_shivas_guard", true)
	if shiva and Menu.IsEnabled(Tinker.shiva) then totaldmg = totaldmg + ( Ability.GetLevelSpecialValueFor(shiva, "blast_damage") * xfactor ) end
   

	for i = 0, 5 do
		local dagon = NPC.GetItem(myHero, "item_dagon_" .. i, true)
		if i == 0 then dagon = NPC.GetItem(myHero, "item_dagon", true) end
        if dagon and Menu.IsEnabled(Tinker.dagon) then
			totaldmg = totaldmg + ( Ability.GetLevelSpecialValueFor(dagon, "damage") * xfactor)
		end
    end	
	
	local laser = NPC.GetAbilityByIndex(myHero, 0)
    local rocket = NPC.GetAbilityByIndex(myHero, 1)
   
	if Ability.GetLevel(laser) > 0 then totaldmg = totaldmg + Ability.GetLevelSpecialValueFor(laser, "laser_damage") end
	if Ability.GetLevel(rocket) > 0 then totaldmg = totaldmg + (Ability.GetDamage(rocket) * xfactor) end
   

	Renderer.SetDrawColor(0, 0, 0, 255)
	Renderer.DrawFilledRect(0, 180, 160, 40)
	
	Renderer.SetDrawColor(255, 255, 255, 255)
	Renderer.DrawText(Tinker.font, 10, 190, "total dmg~: " .. math.floor(totaldmg), 1)
end

function Tinker.ComboWombo()
	
    local myHero = Heroes.GetLocal()
    if NPC.GetUnitName(myHero) ~= "npc_dota_hero_tinker" then return end
    local hero = Input.GetNearestHeroToCursor(Entity.GetTeamNum(myHero), Enum.TeamType.TEAM_ENEMY)
    if not hero then return end

	
    if (os.clock() - time) < 0.8 then return end
    if (os.clock() - lastcasttime) > 3 then ordernow = 0 end
    if NPC.HasState(hero, Enum.ModifierState.MODIFIER_STATE_MAGIC_IMMUNE) then return end

	
    local heroPos = NPC.GetAbsOrigin(hero)
    local laser = NPC.GetAbilityByIndex(myHero, 0)
    local rocket = NPC.GetAbilityByIndex(myHero, 1)
    local rearm = NPC.GetAbilityByIndex(myHero, 3)

	if Ability.IsChannelling(rearm) then return end

	
    local blink = NPC.GetItem(myHero, "item_blink", true)
    local shiva = NPC.GetItem(myHero, "item_shivas_guard", true)
    local soul = NPC.GetItem(myHero, "item_soul_ring", true)
    local veil = NPC.GetItem(myHero, "item_veil_of_discord", true)
    local hex = NPC.GetItem(myHero, "item_sheepstick", true)
    local blood = NPC.GetItem(myHero, "item_bloodthorn", true)
    local orchid = NPC.GetItem(myHero, "item_orchid", true)
    local ethereal = NPC.GetItem(myHero, "item_ethereal_blade", true)

	
    local myMana = NPC.GetMana(myHero)
    if Menu.IsEnabled(Tinker.stopcast) and myMana <= Menu.GetValue(Tinker.threshold) then return end
    local mousePos = Input.GetWorldCursorPos()
	local customCastNow = 1
	-- For order
	if Menu.IsEnabled(Tinker.myorder) then 
		ordernow = ordernow + 1
		if ordernow == 14 then ordernow = 1 end	
		customCastNow = Menu.GetValue(Tinker.orders[ordernow])
	end
	lastcasttime = os.clock()
    -- 2. Blink to hero
    if blink and Ability.IsCastable(blink, myMana) and Menu.IsEnabled(Tinker.blink) and (not Menu.IsEnabled(Tinker.myorder) or customCastNow == 2) then Ability.CastPosition(blink, mousePos) return end
 
    -- 3. Soul Ring
    if soul and Ability.IsCastable(soul, myMana) and Menu.IsEnabled(Tinker.soul) and (not Menu.IsEnabled(Tinker.myorder) or customCastNow == 3) then Ability.CastNoTarget(soul) return end
 
    -- 4. Hex
    if hex and Ability.IsCastable(hex, myMana) and Menu.IsEnabled(Tinker.hex) and (not Menu.IsEnabled(Tinker.myorder) or customCastNow == 4) then Ability.CastTarget(hex, hero) return end
 
    -- 5. Veil of discord
    if veil and Ability.IsCastable(veil, myMana) and Menu.IsEnabled(Tinker.veil) and (not Menu.IsEnabled(Tinker.myorder) or customCastNow == 5) then Ability.CastPosition(veil, heroPos) return end

    -- 6. Ethereal
    if ethereal and Ability.IsCastable(ethereal, myMana) and Menu.IsEnabled(Tinker.ethereal) and (not Menu.IsEnabled(Tinker.myorder) or customCastNow == 6) then Ability.CastTarget(ethereal, hero) return end

    -- 7. Orchid
    if orchid and Ability.IsCastable(orchid, myMana) and Menu.IsEnabled(Tinker.orchid) and (not Menu.IsEnabled(Tinker.myorder) or customCastNow == 7) then Ability.CastTarget(orchid, hero) return end

    -- 8. Blood
    if blood and Ability.IsCastable(blood, myMana) and Menu.IsEnabled(Tinker.veil) and (not Menu.IsEnabled(Tinker.myorder) or customCastNow == 8) then Ability.CastTarget(blood, hero) return end

    -- 9. Dagon
    for i = 0, 5 do
        local dagon = NPC.GetItem(myHero, "item_dagon_" .. i, true)
		if i == 0 then dagon = NPC.GetItem(myHero, "item_dagon", true) end
        if dagon and Ability.IsCastable(dagon, myMana) and Menu.IsEnabled(Tinker.dagon) and (not Menu.IsEnabled(Tinker.myorder) or customCastNow == 9) then Ability.CastTarget(dagon, hero) return end
    end
	
    -- 10. Shiva
    if shiva and Ability.IsCastable(shiva, myMana) and Menu.IsEnabled(Tinker.shiva) and (not Menu.IsEnabled(Tinker.myorder) or customCastNow == 10) then Ability.CastNoTarget(shiva) return end

    -- 11. Laser
    if Ability.IsCastable(laser, myMana) and NPC.IsEntityInRange(hero, myHero, Ability.GetCastRange(laser)) and Menu.IsEnabled(Tinker.laser) and (not Menu.IsEnabled(Tinker.myorder) or customCastNow == 11) then Ability.CastTarget(laser, hero) return end
 
    -- 12. Rockets
    if Ability.IsCastable(rocket, myMana) and NPC.IsEntityInRange(hero, myHero, Ability.GetCastRange(rocket)) and Menu.IsEnabled(Tinker.rocket) and (not Menu.IsEnabled(Tinker.myorder) or customCastNow == 12) then Ability.CastNoTarget(rocket) return end

    -- 13. Rearm
    if Ability.IsCastable(rearm, myMana) and Ability.IsReady(rearm) and Menu.IsEnabled(Tinker.rearm) and (not Menu.IsEnabled(Tinker.myorder) or customCastNow == 13) then Ability.CastNoTarget(rearm) time = os.clock() return end

end

return Tinker