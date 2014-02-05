require("classes.enemies")
items = {}
items[0] = nil
for i = 1,table.maxn( myEnemies )+1 do
	items[i] = myEnemies[i-1]
	items[i].cost = 500
	if i < 4 then
		items[i].unlocked = true
	else
		items[i].unlocked = false
	end
end

function useItem(hero)
	local item = hero.item
	if ( item == 0 ) then emptyItem()
	elseif ( item > 0 ) then foodItem(item, hero)
	end
	
end

function emptyItem()
	print ("You got nothin")
end

function foodItem(item, hero)
	print (items[item].name)
	hero.item = 0
end