require("classes.enemies")
require("classes.level")
local storyboard = require( "storyboard" )
--require("scenes.scene_ingame")
Item = {}
Item.__index = Item

local startX = nil
local startY = nil


function Item.makeItem(name, itemType, image, cost, id, unlocked)
	local item = {}             -- our new object
	setmetatable(item,Item)
	item.name = name
	item.itemType = itemType
	item.image = image
	item.cost = cost
	item.id = id
	item.unlocked = unlocked
	return item
end

items = {}
function makeItemArray ()
	local nextItem
	items[0] = nil
	for i = 1,table.maxn( myEnemies )+1 do
		items[i] = myEnemies[i-1]
		items[i].itemType = "foodType"
		items[i].cost = 500
		items[i].id = i
		items[i].foodId = i-1
		items[i].unlocked = true
		nextItem=i
	end
	nextItem=nextItem+1
	items[nextItem]= Item.makeItem("Commercial Break","break", "images/rightArrow.png", 1000, nextItem, true)
end
makeItemArray()
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

function passValuesToNewItem ( newItem, oldItem )
	if ( oldItem.itemType == "foodType" ) then
		newItem = passValuesToNewEne( newItem, oldItem )
	end
	newItem.name = oldItem.name
	newItem.itemType = oldItem.itemType
	newItem.image = oldItem.image
	newItem.cost = oldItem.cost
	newItem.id = oldItem.id
	newItem.unlocked = oldItem.unlocked
	return newItem
end

function commercialBreak()
	storyboard.showOverlay("scenes.scene_break", {effect = "slideDown", time=500})
    timer.pause(attackTimer)
    timer.pause(spawnEneTimer)
    transition.pause("animation")
end

function itemTap ( event )
	if (event.target.itemType == "break") then
		commercialBreak()
	end
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