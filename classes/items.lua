require("classes.enemies")
require("classes.level")
--require("scenes.scene_ingame")
local startX = nil
local startY = nil

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
myItems = {}
myItems[0] = nil
myItems[1] = nil
myItems[2] = nil

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

function passValuesToNewItem ( newF, oldF )
	newF = passValuesToNewEne( newF, oldF )
	newF.cost = oldF.cost
	newF.id = oldF.id
	newF.foodId = oldF.foodId
	newF.unlocked = newF.unlocked
	return newF
end

function itemFoodDrag( event )
	local body = event.target
	local phase = event.phase
	local stage = display.getCurrentStage()
	if( startX == nil ) then
		startX = body.x
		startY = body.y
	end

	if "began" == phase then
		stage:setFocus( body, event.id )
		body.isFocus = true

	elseif body.isFocus then
		if "moved" == phase then
		
			-- Update the joint to track the touch
			body.x = event.x
			body.y = event.y 

		elseif "ended" == phase or "cancelled" == phase then
			local hit = 0
			for n = 0,table.maxn( allEne  ) do
				if ( hasCollidedCircle( body, allEne[n]) ) then
					itemCombo( body, allEne[n] )
					hit = 1
				end
			end
			if ( hit == 0) then
				print (body.x .. " " .. startX)
				transition.to( body, { time=400, x = startX, y = startY} )
			end
			startX = nil
			startY = nil
			stage:setFocus( body, nil )
			body.isFocus = false
			
		end
	end

	-- Stop further propagation of touch event
	return true
end