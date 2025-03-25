---@diagnostic disable: duplicate-set-field, undefined-global
mod = RegisterMod("Ar", 1)
require("headfile")
require("EID")
function mod:New_Lance_Effect(player, cacheFlags)
    local player = Game():GetPlayer(0)
    local hearts = player:GetHearts()
    if player:HasCollectible(New_Lance) then
        local num = 1
        local TearsToAdd = num * New_Lance_Count
        if hearts <=1 then
            player.FireDelay = player.FireDelay - TearsToAdd
        end
    end
end
mod:AddCallback(ModCallbacks.MC_POST_UPDATE, mod.New_Lance_Effect)
function mod:Legacy_Effect(player, cacheFlags)
    local player = Game():GetPlayer(0)
    local hearts = player:GetHearts()
    if player:HasCollectible(Legacy) then
        if hearts<=1 then
            player:AddBloodCharge(1)
            player:AddSoulCharge(1)
        end
    end
end
mod:AddCallback(ModCallbacks.MC_POST_NEW_ROOM, mod.Legacy_Effect)
function mod:Armor_Effect(player, cacheFlags)
    local player = Game():GetPlayer(0)
    local hearts = player:GetHearts()
    if player:HasCollectible(Armor) then
        if hearts>1 then
            player:AddHearts(-1)
            player:AddSoulHearts(1)
        end
    end
end
mod:AddCallback(ModCallbacks.MC_POST_NEW_ROOM, mod.Armor_Effect)
function mod:Crown_Effect(player, cacheFlags)
    local player = Game():GetPlayer(0)
    local hearts = player:GetHearts()
    if player:HasCollectible(Crown) then
        if hearts < 2 and King_i == 1 then
            if King_Count < 3 and King_j == 1 then
                player.Damage = player.Damage *1.5
                King_j = King_j + 1
            elseif King_Count >= 3 then
                player.Damage = player.Damage *2.5
                King_i = King_i + 1
            end
        end
    end
end
mod:AddCallback(ModCallbacks.MC_POST_NEW_ROOM, mod.Hatred_Effect)

