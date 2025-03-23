---@diagnostic disable: duplicate-set-field, undefined-global
local mod = RegisterMod("Ar", 1)
local New_Lance = Isaac.GetItemIdByName("King's New Lance")
local Legacy = Isaac.GetItemIdByName("King's Legacy")
local Armor = Isaac.GetItemIdByName("King's Armor")
local Crown = Isaac.GetItemIdByName("King's Crown")
local i = 1
local j = 1
-- EID
local ItemEID = {};
function EIDAddItem(id, content) -- EID添加内容
    if id then 
        ItemEID[id] = content
    end
end
--
EIDAddItem(Crown,
{
    Name = "诸王的冠冕";
    Descriptions = "↑{{Damage}} 攻击力+,如果玩家集齐了三件及以上的国王收藏品，则攻击力+++"
})
--

function mod:EvaluateCache(player, cacheFlags)
    local player = Game():GetPlayer(0)
    if player:HasCollectible(New_Lance) then
        local New_Lance_Count = player:GetCollectibleNum(New_Lance)
        local hearts = player:GetHearts()
        local num = 1
        local TearsToAdd = num * New_Lance_Count
        if hearts <=1 then
            player.FireDelay = player.FireDelay - TearsToAdd
        end
    end
end
mod:AddCallback(ModCallbacks.MC_POST_UPDATE, mod.EvaluateCache)
function mod:EvaluateCache(player, cacheFlags)
    local player = Game():GetPlayer(0)
    if player:HasCollectible(Legacy) then
        local hearts = player:GetHearts()
        if hearts<=1 then
            player:AddBloodCharge(1)
            player:AddSoulCharge(1)
        end
    end
end
mod:AddCallback(ModCallbacks.MC_POST_NEW_ROOM, mod.EvaluateCache)
function mod:EvaluateCache(player, cacheFlags)
    local player = Game():GetPlayer(0)
    if player:HasCollectible(Armor) then
        local hearts = player:GetHearts()
        if hearts>1 then
            player:AddHearts(-1)
            player:AddSoulHearts(1)
        end
    end
end
mod:AddCallback(ModCallbacks.MC_POST_NEW_ROOM, mod.EvaluateCache)
function mod:EvaluateCache(player, cacheFlags)
    local player = Game():GetPlayer(0)
    if player:HasCollectible(Crown) then
        local hearts = player:GetHearts()
        local New_Lance_Count = player:GetCollectibleNum(New_Lance)
        local Legacy_Count = player:GetCollectibleNum(Legacy)
        local Armor_Count = player:GetCollectibleNum(Armor)
        local Crown_Count = player:GetCollectibleNum(Crown)
        local King_Count = New_Lance_Count + Legacy_Count + Armor_Count + Crown_Count
        if hearts < 2 and i == 1 then
            if King_Count < 3 and j == 1 then
                player.Damage = player.Damage *1.5
                j = j + 1
            elseif King_Count >= 3 then
                player.Damage = player.Damage *2.5
                i = i + 1
            end
        end
    end
end
mod:AddCallback(ModCallbacks.MC_POST_NEW_ROOM, mod.EvaluateCache)