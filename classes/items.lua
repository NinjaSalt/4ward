require("classes.enemies")
require("classes.level")
require("classes.move")
-- require("classes.chop")
--equire("classes.heroes")
local globals = require("classes.globals")
local storyboard = require( "storyboard" )
local loadsave = require("classes.loadsave")
--require("scenes.scene_ingame")
Item = {}
Item.__index = Item

local startX = nil
local startY = nil

gameSettings = loadsave.loadTable("gamesettings.json")


function Item.makeItem(name, itemType, image, cost, id, unlocked, description, toUse, lockLevel)
	local item = {}             -- our new object
	setmetatable(item,Item)
	item.name = name
	item.itemType = itemType
	item.image = image
	item.cost = cost
	item.id = id
	item.unlocked = unlocked
	item.description = description
	item.toUse = toUse
	item.lockLevel = lockLevel
	return item
end

items = {}
function makeItemArray ()
	local nextItem
	items[0] = nil
	for i = 1,table.maxn( myEnemies )+1 do
		items[i] = myEnemies[i-1]
		items[i].itemType = "foodType"
		items[i].cost = 200
		items[i].id = i
		items[i].foodId = i-1
		items[i].unlocked = false
		items[i].unlocked = gameSettings[4][i]
		items[i].description = "A basic ingredient."
		items[i].toUse = "Drag to another food on the belt."
		items[i].lockLevel = "discovered."
		nextItem=i
	end
	--nextItem=nextItem+1
	--items[nextItem+1]= Item.makeItem("Commercial Break","break", "images/rightArrow.png", 1000, nextItem+1, false, "Pauses the game.", "Click to activate.", 4)
	--items[nextItem+2]= Item.makeItem("Producer Swap","swap", "images/swap.png", 700, nextItem+2, false, "Swaps two items.", "Click to activate.",4)
	items[nextItem+1]= Item.makeItem("Compost Bin","trash", "images/trash_item.png", 200, nextItem+1, true, "Removes one item", "Drag to food.",5)
end
makeItemArray()
myItems = {}
myItems[0] = nil
myItems[1] = nil
myItems[2] = nil

function passValuesToNewItem ( newItem, oldItem )
	-- if the new item is an enemy/foodtype, use the enemy's passing valurs function from the enemy class
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

  local function resume()
		for i = 0,table.maxn( allEne ) do
			if (allEne[i] ~= nil) then
				allEne[i]:removeEventListener( "touch", chopping )
    			allEne[i]:addEventListener( "touch", teleport )
   			end
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
					-- in game
					if (body.itemType == "foodType") then
						itemCombo( body, allEne[n], true )
						gameSettings[6][body.myItemRef+1] = false
						print(gameSettings[6][body.myItemRef+1])
						loadsave.saveTable(gameSettings , "gamesettings.json")
						break
					elseif (body.itemType == "trash") then
						allEne[n]: removeSelf()
						table.remove(allEne, n)
						body:removeSelf( )
						myItems[body.myItemRef] = nil
						gameSettings[6][body.myItemRef+1] = false
						print(gameSettings[6][body.myItemRef+1])
						loadsave.saveTable(gameSettings , "gamesettings.json")
						--body = nil
						--decrementEnemy(currentLevel)
						break
					end
					--gameSettings[6][body.myItemRef+1] = nil
					hit = 1
				end
			end
			if ( hit == 0) then
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