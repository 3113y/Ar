---@diagnostic disable: undefined-global, lowercase-global
mod = RegisterMod("Ar", 1)
player = Game():GetPlayer(0)
New_Lance = Isaac.GetItemIdByName("King's New Lance")
Legacy = Isaac.GetItemIdByName("King's Legacy")
Armor = Isaac.GetItemIdByName("King's Armor")
Crown = Isaac.GetItemIdByName("King's Crown")
New_Lance_Count = player:GetCollectibleNum(New_Lance)
Legacy_Count = player:GetCollectibleNum(Legacy)
Armor_Count = player:GetCollectibleNum(Armor)
Crown_Count = player:GetCollectibleNum(Crown)
King_Count = New_Lance_Count + Legacy_Count + Armor_Count + Crown_Count
King_i = 1
King_j = 1
