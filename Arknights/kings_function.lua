function mod:EvaluateCache(player, cacheFlags)
    player = Game():GetPlayer(0)
   if player:HasCollectible(New_Lance) then
        New_Lance_Count = player:GetCollectibleNum(New_Lance)
        hearts = player:GetHearts()
        num = 1
        TearsToAdd = num * New_Lance_Count
       if hearts <=1 then
           player.FireDelay = player.FireDelay - TearsToAdd
       end
   end
end
mod:AddCallback(ModCallbacks.MC_POST_UPDATE, mod.EvaluateCache)
function mod:EvaluateCache(player, cacheFlags)
    player = Game():GetPlayer(0)
   if player:HasCollectible(Legacy) then
        hearts = player:GetHearts()
       if hearts<=1 then
           player:AddBloodCharge(1)
           player:AddSoulCharge(1)
       end
   end
end
mod:AddCallback(ModCallbacks.MC_POST_NEW_ROOM, mod.EvaluateCache)
function mod:EvaluateCache(player, cacheFlags)
    player = Game():GetPlayer(0)
   if player:HasCollectible(Armor) then
        hearts = player:GetHearts()
       if hearts>1 then
           player:AddHearts(-1)
           player:AddSoulHearts(1)
       end
   end
end
mod:AddCallback(ModCallbacks.MC_POST_NEW_ROOM, mod.EvaluateCache)
function mod:EvaluateCache(player, cacheFlags)
    player = Game():GetPlayer(0)
   if player:HasCollectible(Crown) then
        hearts = player:GetHearts()
        New_Lance_Count = player:GetCollectibleNum(New_Lance)
        Legacy_Count = player:GetCollectibleNum(Legacy)
        Armor_Count = player:GetCollectibleNum(Armor)
        Crown_Count = player:GetCollectibleNum(Crown)
        King_Count = New_Lance_Count + Legacy_Count + Armor_Count + Crown_Count
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

