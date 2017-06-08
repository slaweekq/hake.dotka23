local CreepMarker =  {}

CreepMarker.optionEnable = Menu.AddOption({ "Awareness", "CreepMarker", "CreepMarker"}, "Enabled", "")
CreepMarker.font = Renderer.LoadFont("Tahoma", 20, Enum.FontWeight.EXTRABOLD)

function CreepMarker.OnDraw()

    if not Menu.IsEnabled(CreepMarker.optionEnable) then return end

    local myHero = Heroes.GetLocal()
        if not myHero then return end

    local myTeam = Entity.GetTeamNum(myHero)

        for i = 1, NPCs.Count() do
        local creep = NPCs.Get(i)
    local sameTeam = Entity.GetTeamNum(creep) == myTeam

        if creep and NPC.IsLaneCreep(creep) and not Entity.IsDormant(creep) and not sameTeam then
                CreepMarker.text(myHero, creep)
        end
    end
end
        

function CreepMarker.text(myHero, creep)

    local physicalDamage = math.floor(NPC.GetDamageMultiplierVersus(myHero, creep) * (NPC.GetTrueDamage(myHero) * NPC.GetArmorDamageMultiplier(creep)))
    local pos = Entity.GetAbsOrigin(creep)
        pos:SetY(pos:GetY() + 65)
           local x, y, visible = Renderer.WorldToScreen(pos)

    if NPC.IsEntityInRange(myHero, creep, 800) and Entity.GetHealth(creep) > 0 and Entity.GetHealth(creep) <= physicalDamage then
                
                    Renderer.SetDrawColor(255, 0, 255, 255)
                       Renderer.DrawTextCenteredY(CreepMarker.font, x, y, "●", 1)
            
        end 
end   
            
return CreepMarker