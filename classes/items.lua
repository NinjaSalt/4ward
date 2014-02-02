require("classes.enemies")
items = {}
items[0] = nil
items[1]=egg
items[2]=flour

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