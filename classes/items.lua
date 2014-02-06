require("classes.enemies")
require("classes.level")
--require("scenes.scene_ingame")
items = {}
items[0] = nil
for i = 1,table.maxn( myEnemies )+1 do
	items[i] = myEnemies[i-1]
	items[i].cost = 500
	items[i].id = i
	items[i].foodId = i-1
	if i < 4 then
		items[i].unlocked = true
	else
		items[i].unlocked = false
	end
end

function useItem(hero)
	local item = hero.item
	if ( item == nil ) then emptyItem()
	elseif ( item.id > 0 ) then foodItem(item, hero)
	end
	
end

function emptyItem()
	print ("You got nothin")
end

function foodItem(item, hero)
	--createEne(item.foodId)
	print(item.name)
	hero.item = nil
end