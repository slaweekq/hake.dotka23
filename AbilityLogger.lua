local abilityLogger = {}

-- log only once.
abilityLogger.lastHero = nil

function abilityLogger.OnUpdate()
    local myHero = Heroes.GetLocal()
    
    if abilityLogger.lastHero == myHero then return end

    for i = 0, 24 do
        local ability = NPC.GetAbilityByIndex(myHero, i)

        if ability then
            local name = Ability.GetName(ability)

            if name then
                Log.Write(i .. ":" .. name)
            end
        end
    end

    abilityLogger.lastHero = myHero
end

return abilityLogger