---------------------------------------------------------------------------------
-- SCENE NAME
-- Scene notes go here
---------------------------------------------------------------------------------
 
local storyboard = require( "storyboard" )
local globals = require("classes.globals")
local scene = storyboard.newScene()
local thisLevel 
local world
-- Array to store heroes
hero = {}

-- Lanes y positions
lane1 = 80
lane2 = 160
lane3 = 240

--Enemy varis
allEne = {} 
allEnemHealth = {}

--conveyor belts locals
local sheetSettings
local sheet
local sequenceData
--lever locals
local leversheetSettings
local leversheet
local leversequenceData

-- Hero Attack Variables
local bullet_speed = 50 
--local bullet_array = {}   -- Make an array to hold the bullets

local eneAndBar = {}
local group 

local move = require("classes.move")
require("classes.heroes")
require("classes.enemies")
require("classes.collision")
require("classes.level")
require("classes.combo")
require("classes.items")
require("classes.recipes")
require("classes.basics")

globals.currency = require( "classes.score" )
require("classes.timeLine")

local currencyText
 
--sprite.xScale, sprite.yScale = 3,3 --The image is a little small so we scale it up

-- Clear previous scene
storyboard.removeAll()
 
-- local forward references should go here --
 
---------------------------------------------------------------------------------
-- BEGINNING OF YOUR IMPLEMENTATION
---------------------------------------------------------------------------------

-- function to create conveyor belts
--NEW CONVEYOR BELT CODE
function scene:createConveyorBelts()
  local breakfastsheetSettings =
  	{
  	 width = 410,
  	 height = 60,
 	  numFrames = 12
	}
	local breakfastsheet = graphics.newImageSheet("images/belts03sheet.png",breakfastsheetSettings)
	local breakfastsequenceData = {
	--higher the time, slower it goes
   { name = "breakfast_normal", start = 1, count = 12, time=4000, loopCount=0 },
   { name = "breakfast_slow", start = 1, count = 12, time=5000,   loopCount=0 },   
   { name = "breakfast_fast", start = 1, count = 12, time=2200, loopCount=0 }
}

local dinnersheetSettings =
  	{
  	 width = 410,
  	 height = 60,
 	  numFrames = 12
	}
	local dinnersheet = graphics.newImageSheet("images/belts01sheet.png",dinnersheetSettings)
	local dinnersequenceData = {
	--higher the time, slower it goes
   { name = "dinner_normal", start = 1, count = 12, time=4000, loopCount=0 },
   { name = "dinner_slow", start = 1, count = 12, time=5000,   loopCount=0 },   
   { name = "dinner_fast", start = 1, count = 12, time=2200, loopCount=0 }
}

local dessertsheetSettings =
  	{
  	 width = 410,
  	 height = 60,
 	  numFrames = 12
	}
	local dessertsheet = graphics.newImageSheet("images/belts02sheet.png",dessertsheetSettings)
	local dessertsequenceData = {
	--higher the time, slower it goes
   { name = "dessert_normal", start = 1, count = 12, time=4000, loopCount=0 },
   { name = "dessert_slow", start = 1, count = 12, time=5000,   loopCount=0 },   
   { name = "dessert_fast", start = 1, count = 12, time=2200, loopCount=0 },
}

	for n=0, 2, 1 do
  		--globals.belts[n] = display.newSprite(breakfastsheet,breakfastsequenceData)
  		if (n==0) then
  			globals.belts[n] = display.newSprite(breakfastsheet,breakfastsequenceData)
  			--globals.belts[n].x = 278
			globals.belts[n].y = lane1+20
			globals.belts[n]:setSequence( "breakfast_normal" )
			globals.belts[n]:play()

		end
		if (n==1) then
			globals.belts[n] = display.newSprite(dinnersheet,dinnersequenceData)
			globals.belts[n].y = lane2+20
			globals.belts[n]:setSequence( "dinner_normal" )
			globals.belts[n]:play()
		end
		if (n==2) then
			globals.belts[n] = display.newSprite(dessertsheet,dessertsequenceData)
			globals.belts[n].y = lane3+20
			globals.belts[n]:setSequence( "dessert_normal" )
			globals.belts[n]:play()
		end
		globals.belts[n].x = 278
		group:insert(globals.belts[n])
	end
	-- LEVER SETTINGS --
	leversheetSettings =
  	{
  	 width = 50,
  	 height = 50,
 	  numFrames = 3
	}
	leversheet = graphics.newImageSheet("images/leversheet.png",leversheetSettings)
	leversequenceData = {
	--higher the time, slower it goes
   { name = "normal", start=2,  count=1 },
   { name = "slow", start=3,  count=1 },   
   { name = "fast", start=1,  count=1 }
}

	for n=0, 2, 1 do
  		globals.levers[n] = display.newSprite(leversheet,leversequenceData)
  		globals.levers[n].x = 73
  		if (n==0) then
			globals.levers[n].y = lane1+20
		end
		if (n==1) then
			globals.levers[n].y = lane2+20
		end
		if (n==2) then
			globals.levers[n].y = lane3+20
		end
		globals.levers[n]:setSequence( "normal" )
		globals.levers[n]:play()
		group:insert(globals.levers[n])
	end
	
end  

-- function to 
function scene:createHeroes()
  for n=0, 2, 1 do
    hero[n] = myHeroes[n]
    hero[n] = display.newImage( hero[n].image )
    hero[n] = makeHero ( hero[n], myHeroes[n] )
    hero[n].x =50
    if (n == 0) then hero[n].y = lane1
    elseif (n == 1) then hero[n].y = lane2
    elseif (n == 2) then hero[n].y = lane3
    --elseif (n == 3) then hero[n].y = lane4
    end
    hero[n].height = 70; hero[n].width = 70
	hero[n]:addEventListener( "touch", ability )
  end
end  

-- function to remove the bullet off the array/off screen
function remove_bullet( bullet )
  local index = table.indexOf( globals.bullet_array, bullet )
  transition.cancel( bullet.transition )
  table.remove( globals.bullet_array, index )
  display.remove( bullet )
end 

--[[
-- make bullet function
function make_bullet( hero )
  local x = hero.x
  local y = hero.y
  local attack = hero.attack
  local bullet = display.newCircle( 0, 0, 5 )
  --scene.group:insert(bullet)
  bullet:setFillColor( 0, 0, 0 )
  bullet.x = x
  bullet.y = y
  table.insert( globals.bullet_array, bullet)
  bullet.attack = attack
  local bt = x * bullet_speed
  bullet.transition = transition.to( bullet, {x=500, time=bt, onComplete=remove_bullet, tag="animation"} )
  return bullet
end
]]
-- make bullet function
function make_bullet_pins( hero )
	local x = hero.x
	local y = hero.y
	local attack = hero.attack
	local pinsheetSettings ={
	width = 50,
	height = 50,
	numFrames = 14 }
	local pinsheet = graphics.newImageSheet("images/rollingpicsheet.png",pinsheetSettings)
	local pinsequenceData = {
	--higher the time, slower it goes
	{ name = "normal", start=1, count=14, time=300, loopCount=0 }
}
globals.bullet[0] = display.newSprite(pinsheet,pinsequenceData)
  --scene.group:insert(bullet)
  globals.bullet[0].x = x
  globals.bullet[0].y = y
  table.insert( globals.bullet_array, globals.bullet[0])
  globals.bullet[0].attack = attack
  local bt = x * bullet_speed
  globals.bullet[0]:play()
  globals.bullet[0].transition = transition.to( globals.bullet[0], {x=455, time=bt, onComplete=remove_bullet, tag="animation"} )
  return globals.bullet[0]
end

-- make spatula function
function make_bullet_spatula( hero )
	local x = hero.x
	local y = hero.y
	local attack = hero.attack
	local spatulasheetSettings =
	{
	width = 50,
	height = 50,
	numFrames = 8
}
local spatulasheet = graphics.newImageSheet("images/spatulasheet.png",spatulasheetSettings)
local spatulasequenceData = {
	--higher the time, slower it goes
	{ name = "normal", start=1, count=8, time=300, loopCount=0 }
}
globals.bullet[1] = display.newSprite(spatulasheet,spatulasequenceData)
	--scene.group:insert(bullet)
	globals.bullet[1].x = x
	globals.bullet[1].y = y
	table.insert( globals.bullet_array, globals.bullet[1])
	globals.bullet[1].attack = attack
	local bt = x * bullet_speed
	globals.bullet[1]:play()
	globals.bullet[1].transition = transition.to( globals.bullet[1], {x=455, time=bt, onComplete=remove_bullet, tag="animation"} )
	return globals.bullet[1]
end

-- make spatula function
function make_bullet_whisk( hero )
  local x = hero.x
  local y = hero.y
  local attack = hero.attack
    local whisksheetSettings =
  	{
  	 width = 50,
  	 height = 50,
 	  numFrames = 8
	}
	local whisksheet = graphics.newImageSheet("images/whisksheet.png",whisksheetSettings)
	local whisksequenceData = {
	--higher the time, slower it goes
   { name = "normal", start=1, count=8, time=300, loopCount=0 }
}
  globals.bullet[2] = display.newSprite(whisksheet,whisksequenceData)
  --scene.group:insert(bullet)
  globals.bullet[2].x = x
  globals.bullet[2].y = y
  table.insert( globals.bullet_array, globals.bullet[2])
  globals.bullet[2].attack = attack
  local bt = x * bullet_speed
  globals.bullet[2]:play()
  globals.bullet[2].transition = transition.to( globals.bullet[2], {x=455, time=bt, onComplete=remove_bullet, tag="animation"} )
  return globals.bullet[2]
end

function scene:createEne(enemyID)
	--local eneAndBar = {}
	local lane = lane1
	--set the lane it will spawn in
	local randomPos = math.random(1, 3)
	if (randomPos == 1) then lane = lane1
	elseif (randomPos == 2) then lane = lane2
	elseif (randomPos == 3) then lane = lane3
	end

	-- check to unlock basic enemies:
	unlockBasicCheck(enemyID)
	--local randomEne = math.random(0, 1)
	allEne[#allEne + 1] = myEnemies[enemyID]
	allEne[#allEne] = display.newImage(allEne[#allEne].image)
	allEne[#allEne] = passValuesToNewEne(allEne[#allEne], myEnemies[enemyID])

	-- add health bars to enemies.
	allEnemHealth[#allEne] = #allEne
	allEnemHealth[#allEne] = display.newImage( "images/enemhealth.jpg" )
	allEnemHealth[#allEne].height = 10 
	allEnemHealth[#allEne].width = allEne[#allEne].health/allEne[#allEne].maxHealth * 50
	allEnemHealth[#allEne].x = 430; allEnemHealth[#allEne].y = lane - 25
	--end health bar.

	--define the enemy
	allEne[#allEne].height = 50; allEne[#allEne].width = 50
	allEne[#allEne].x = 430; allEne[#allEne].y = lane

	--set the move speedallEne
	transition.to( allEne[#allEne], { time=(moveSpeed(allEne[#allEne].x, allEne[#allEne].speed, allEne[#allEne].y)), x=(50) ,tag="animation"}  )
	allEne[#allEne]:addEventListener( "touch", teleport ) 
	eneAndBar[0]=allEne[#allEne]
	eneAndBar[1]=allEnemHealth[#allEne]
	return eneAndBar
end

  -- function to calculate currency based on score
function currencyCalc( score, currCurrency )
	local newCurrency = 0
	counter = 0
	for i = 0, score, 5 do 
		counter = counter + 1
	end
	newCurrency = currCurrency + counter
	return newCurrency
end

-- function to calculate score for having the enemy in the correct lane
function calcLaneScore (ene1)
	local scoreInt = 0
        if ((ene1.category == "breakfast" and ene1.y == lane1) or (ene1.category == "dinner" and ene1.y == lane2) or (ene1.category == "dessert" and ene1.y == lane3)) then
        	scoreInt =  20
        else
        	scoreInt = 10
        end
		scoreInt = scoreInt * getMultiplier()
        return scoreInt
end

function itemCombo( item , enemy, fromFoodItem )
	for j = 0,table.maxn( comboEnemies ) do
		if (comboEnemies[j].type == replaceEnemy(item, enemy)) then
		------DO  A BREAK
			print ("item: " .. item.name .. " enemy: " .. enemy.name)
			print ("my new food: " .. comboEnemies[j].type)
			
			if (fromFoodItem) then
				item: removeSelf()
				myItems[item.myItemRef] = nil
			end
			
			allEne[#allEne + 1] = comboEnemies[j]
			allEne[#allEne] = display.newImage(allEne[#allEne].image)

			allEne[#allEne] = passValuesToNewEne(allEne[#allEne], comboEnemies[j])
			-- Check for Secondary Win condition
			if(currentLevel.victoryCondition~=false) then
				if(currentLevel.victoryCondition.enemy.name==allEne[#allEne].name)then
					currentLevel.victoryCondition.amount = currentLevel.victoryCondition.amount-1
					print(currentLevel.victoryCondition.enemy.name .. "left: " .. currentLevel.victoryCondition.amount)
					if (currentLevel.victoryCondition.amount == 0) then
					print("Condition Met")
					currentLevel.victoryCondition.conditionMet = true
					end
				end
			end

			-- add health bars to enemies.
			allEnemHealth[#allEne] = #allEne
			allEnemHealth[#allEne] = display.newImage( "images/enemhealth.jpg" )
			allEnemHealth[#allEne].height = 10 
			-- creates a new health.
			allEnemHealth[#allEne].health = newHealth(n,i)
			allEnemHealth[#allEne].width = allEne[#allEne].health/allEne[#allEne].maxHealth * 50
			allEnemHealth[#allEne].x = enemy.x; allEnemHealth[#allEne].y = enemy.y
			--end health bar.

			--define the enemy
			allEne[#allEne].height = 50; allEne[#allEne].width = 50
			allEne[#allEne].x = enemy.x; allEne[#allEne].y = enemy.y

			--set the move speedallEne
			transition.to( allEne[#allEne], { time=(moveSpeed(allEne[#allEne].x, allEne[#allEne].speed, allEne[#allEne].y)), x=(50), tag="animation" } )
			allEne[#allEne]:addEventListener( "touch", teleport ) 
			eneAndBar[0]=allEne[#allEne]
			eneAndBar[1]=allEnemHealth[#allEne]
			group:insert(eneAndBar[0])
			group:insert(eneAndBar[1])
			
			for n = 0,table.maxn( allEne ) do
				if( allEne[n] == enemy ) then
					allEne[n]: removeSelf()
					table.remove(allEne, n)
					allEnemHealth[n]:removeSelf()
					table.remove(allEnemHealth, n)
				end
			end 
		end
	end
	return eneAndBar[0]
end

--function to call displaying "GOOD" text for enemy damage feedback
local function goodText(enemy) 
	local goodText = display.newImage( "images/good_text.png", enemy.x-10, enemy.y, true )
	if (goodText ~= nil) then
		goodText.width = enemy.width+20
		goodText.height = enemy.width+20
		transition.to( goodText, { time=1000, alpha=0, onComplete=function() goodText:removeSelf() end } )
	end
end

--function to call displaying "CRITICAL" text for enemy damage feedback
local function critText (enemy)
	local critText = display.newImage( "images/critical_text.png", enemy.x-10, enemy.y, true )
	if (critText ~= nil) then
		critText.width = enemy.width+20
		critText.height = enemy.width+20
		transition.to( critText, { time=1000, alpha=0, onComplete=function() critText:removeSelf() end } )
	end
end

--function to call displaying "OKAY" text for enemy damage feedback
local function okayText (enemy)
	local okText = display.newImage( "images/okay_text.png", enemy.x-10, enemy.y, true )
	if (okText ~= nil) then
		okText.width = enemy.width+20
		okText.height = enemy.width+20
		transition.to( okText, { time=1000, alpha=0, onComplete=function() okText:removeSelf() end } )
	end	
end

--function to display the corresponding enemy damage feedback based on lanes and category
local function textCheck(enemy, bullet)
	if (enemy.y == lane1 and bullet.y == lane1) then
		if (enemy.category == "breakfast") then
			critText(enemy)
		elseif (enemy.category == "bad") then
			okayText(enemy)
		elseif (enemy.category ~= "basic") then
			goodText(enemy) 
		end
	elseif (enemy.y == lane2 and bullet.y == lane2) then
		if (enemy.category == "dinner") then
			critText(enemy)
		elseif (enemy.category == "bad") then
			okayText(enemy)
		elseif (enemy.category ~= "basic") then
			goodText(enemy) 
		end
	elseif (enemy.y == lane3 and bullet.y == lane3) then
		if (enemy.category == "dessert") then
			critText(enemy)
		elseif (enemy.category == "bad") then
			okayText(enemy)
		elseif (enemy.category ~= "basic") then
			goodText(enemy) 
		end
	end

end

local function gameLoop( event )
	globals.multiplier = getMultiplier()
	globals.multiplierText.text = (globals.multiplier)
	if ( globals.notDurningAntagonist ) then
		for i = 0,table.maxn( allEne ) do
			for n = 0,table.maxn( hero ) do
				if ( hasCollidedCircle( hero[n], allEne[i]) ) then
					allEne[i]:removeSelf()
					table.remove(allEne, i)
					allEnemHealth[i]:removeSelf()
					table.remove(allEnemHealth, i)

					-- hero damage effect here.
					local screenEffect = display.newRect( display.contentWidth/2, hero[n].y, display.contentWidth, hero[n].height)
					local loseLife= display.newText( "-1 LIFE", hero[n].x+45, hero[n].y-20, globals.IMPRIMA, 18 )
					--local screenEffect = display.newCircle( 40, 0, 80)
					screenEffect:setFillColor(246,235,133)
					loseLife:setFillColor(black)
					transition.to( screenEffect, { time= 400, alpha=0, onComplete=function() screenEffect:removeSelf() end } )
					transition.to( loseLife, { time= 800, alpha=0, onComplete=function() loseLife:removeSelf() end } )


					globals.lives = globals.lives - 1
					globals.numLives.text = (globals.lives)

					if globals.lives <= 0 then
						endLevel(currentLevel, false)
						storyboard.gotoScene( "scenes.scene_loss",{ effect = "fade", time = 500, params = {level = thisLevel, world = world}})

					end
					decrementEnemy(currentLevel)
					if (currentLevel.totalNumberOfEnemies == 0 and #allEne == 0) then
						if(currentLevel.victoryCondition~=false) then
							if(currentLevel.victoryCondition.conditionMet==true)then
								LevelList.unlockLevel(world, thisLevel+1)
								endLevel(currentLevel, true)
								storyboard.showOverlay( "scenes.scene_victory",{ effect = "fade", time = 500, params = {level = thisLevel, world = world}})
							else 
								LevelList.unlockLevel(world, thisLevel+1)
								endLevel(currentLevel, false)
								storyboard.gotoScene( "scenes.scene_loss",{ effect = "fade", time = 500, params = {level = thisLevel, world = world}})
							end
						else	
							LevelList.unlockLevel(world, thisLevel+1)
							endLevel(currentLevel, true)
							storyboard.showOverlay( "scenes.scene_victory",{ effect = "fade", time = 500, params = {level = thisLevel, world = world}})
						end
					end
				end
			end
		end

		for i = 0,table.maxn( allEne ) do
			for n = 0,table.maxn( globals.bullet_array  ) do
				if ( hasCollidedCircle( globals.bullet_array [n], allEne[i]) ) then
					-- allEne[i].health=allEne[i].health-bullet_array[n].attack old damage system
					-- new damage check
					allEne[i].health= allEne[i].health - calculateDamage(allEne[i], globals.bullet_array[n]) 
					--VISUAL EFFECTS WHEN BULLET HITS ENEMIES--
					textCheck(allEne[i], globals.bullet_array[n])
					--VISUAL EFFECTS END--
					if ( allEne[i].health <= 0 ) then
						--theScore.add(allEne[i].pointValue) 		-- adding the amount to score
						globals.score = globals.score + allEne[i].pointValue + calcLaneScore(allEne[i])
						globals.scoreText.text = (globals.score)
						-- add visual poof of death.
						local deathPoof = display.newImage( "images/death.png", allEne[i].x, allEne[i].y, true )
						deathPoof.width = deathPoof.width/9
						deathPoof.height = deathPoof.height/9
						transition.to( deathPoof, { time=1500, alpha=0, onComplete=function() deathPoof:removeSelf() end } )
						--end visual poof of death.
						allEne[i]:removeSelf()
						table.remove(allEne, i)
						allEnemHealth[i]:removeSelf()
						table.remove(allEnemHealth, i)
						decrementEnemy(currentLevel)
						if (currentLevel.totalNumberOfEnemies == 0 and #allEne == 0) then
							if(currentLevel.victoryCondition~=false) then
								if(currentLevel.victoryCondition.conditionMet==true)then
									LevelList.unlockLevel(world, thisLevel+1)
									endLevel(currentLevel, true)
									storyboard.showOverlay( "scenes.scene_victory",{ effect = "fade", time = 500, params = {level = thisLevel, world = world}})
								else 
									endLevel(currentLevel, false)
									storyboard.gotoScene( "scenes.scene_loss",{ effect = "fade", time = 500, params = {level = thisLevel, world = world}})
								end
							else	
								LevelList.unlockLevel(world, thisLevel+1)
								endLevel(currentLevel, true)
								storyboard.showOverlay( "scenes.scene_victory",{ effect = "fade", time = 500, params = {level = thisLevel, world = world}})
							end
						end
					end
					remove_bullet(globals.bullet_array[n])
				end
			end
		end

		-- this is the code for collision checking, and combining to make new enemies
		for i = 1,table.maxn( allEne ) do
			for n = 1,table.maxn( allEne ) do
				if (i == n) then --"colliding with itself, ignore when this happens"
				elseif(combination(allEne[i], allEne[n])) then
					-- create a new emeny at the end of the list
					for j = 0,table.maxn( comboEnemies ) do
						if (comboEnemies[j].type == replaceEnemy(allEne[i], allEne[n])) then

							allEne[#allEne + 1] = comboEnemies[j]

							local comboPoof = display.newImage( "images/comboPoof.png", allEne[i].x, allEne[i].y, true )
							comboPoof.width = comboPoof.width/3
							comboPoof.height = comboPoof.height/3
							transition.to( comboPoof, { time=1500, alpha=0, onComplete=function() comboPoof:removeSelf() end } )

							allEne[#allEne] = display.newImage(allEne[#allEne].image)
							allEne[#allEne] = passValuesToNewEne(allEne[#allEne], comboEnemies[j])
							unlockCheck(j)
							-- Check for Secondary Win condition
							if(currentLevel.victoryCondition~=false) then
								if(currentLevel.victoryCondition.enemy.name==allEne[#allEne].name)then
									currentLevel.victoryCondition.amount = currentLevel.victoryCondition.amount-1
									print(currentLevel.victoryCondition.enemy.name .. "left: " .. currentLevel.victoryCondition.amount)
									if (currentLevel.victoryCondition.amount == 0) then
										print("Condition Met")
										currentLevel.victoryCondition.conditionMet = true
									end
								end
							end
							
							-- add health bars to enemies.
							allEnemHealth[#allEne] = #allEne
							allEnemHealth[#allEne] = display.newImage( "images/enemhealth.jpg" )
							allEnemHealth[#allEne].height = 10 
							-- creates a new health.
							allEnemHealth[#allEne].health = newHealth(n,i)
							allEnemHealth[#allEne].width = allEne[#allEne].health/allEne[#allEne].maxHealth * 50
							allEnemHealth[#allEne].x = allEnemHealth[n].x; allEnemHealth[#allEne].y = allEnemHealth[n].y
							--end health bar.

							--define the enemy
							allEne[#allEne].height = 50; allEne[#allEne].width = 50
							allEne[#allEne].x = allEne[n].x; allEne[#allEne].y = allEne[n].y

							--set the move speedallEne
							transition.to( allEne[#allEne], { time=(moveSpeed(allEne[#allEne].x, allEne[#allEne].speed, allEne[#allEne].y)), x=(50), tag="animation" } )
							allEne[#allEne]:addEventListener( "touch", teleport ) 
							eneAndBar[0]=allEne[#allEne]
							eneAndBar[1]=allEnemHealth[#allEne]
							group:insert(eneAndBar[0])
							group:insert(eneAndBar[1])

							--remove the second enemy we want to replace
							allEne[n]: removeSelf()
							table.remove(allEne, n)
							allEnemHealth[n]:removeSelf()
							table.remove(allEnemHealth, n)

							if (n > i) then -- removes teleported enemy 
								-- if i is less than n in the enemy list, remove i since i is not effect when n was removed
								allEne[i]:removeSelf()
								table.remove(allEne, i)
								allEnemHealth[i]:removeSelf()
								table.remove(allEnemHealth, i)
								decrementEnemy(currentLevel)
							else
								-- if i is greater than n, need to remove the enemy 1 less than where i orginally was before removing n since the whole list shifted
								allEne[i-1]:removeSelf()
								table.remove(allEne, i-1)
								allEnemHealth[i-1]:removeSelf()
								table.remove(allEnemHealth, i-1)
								decrementEnemy(currentLevel)
							end
						end
					end
				end
			end
		end

	end
	updateEnemyHealth()

   return true
end


local function goToIntro(vicCond, id)
	storyboard.showOverlay("scenes.scene_intro", {effect = "slideDown", time=500, params = {vic= vicCond, levelNumber=id}})
    timer.pause(attackTimer)
    timer.pause(spawnEneTimer)
    for n=0, 2, 1 do
    	globals.belts[n]:pause()
	end
	if (globals.bullet ~= nil and globals.bullet_array ~= nil) then
      for i=0, #globals.bullet_array, 1 do
        if (globals.bullet_array[i] ~= nil) then
          globals.bullet_array[i]:pause()
      else
      	break
        end
      end
    end
    transition.pause("animation")
end




-- Called when the scene's view does not exist:
function scene:createScene( event )
  --Create the group that hold all the objects in the scene
  group = self.view
  local params = event.params
  thisLevel = params.level
  world = params.world

  local options = {
    effect = "slideDown",
    time = 500
  }

  --create enemies and add them and their healthbar to the group
  function spawnEne(enemyID)
  	eneAndBar = scene:createEne(enemyID)
    group:insert(eneAndBar[0])
	group:insert(eneAndBar[1])
  end
  
  local function createBullet(hero)
	group:insert(make_bullet(hero))
  end
  local function heroNormalAttacks()
    group:insert(make_bullet_pins(hero[0]))
	group:insert(make_bullet_spatula(hero[1]))
	group:insert(make_bullet_whisk(hero[2]))
   end
  local bkg = display.newImage( "images/mockback2.png", centerX, centerY, true )
  bkg.height=display.contentHeight; bkg.width=display.contentWidth
  group:insert(bkg)
  
  function getxy( event )
	--print("x: "..event.x)
	--print("y: "..event.y)
  end
  
  bkg:addEventListener( "touch", getxy )

  --create the heroes
  scene.createHeroes()
  for n=0,2,1 do
    group:insert(hero[n])
  end
  --adding the conveyor belts to the screen
  scene.createConveyorBelts()

  currentLevel = Level.load(world, thisLevel)
  
  --initialize the current level's secondary objectives and print them
  if(currentLevel.victoryCondition~=false)then
	currentLevel.victoryCondition.amount = currentLevel.victoryCondition.memAmount
	currentLevel.victoryCondition.conditionMet = false
	print("Make " .. currentLevel.victoryCondition.amount .. " " .. currentLevel.victoryCondition.enemy.name)
else
	print ("No Second Condition")
  end
  group:insert(currentLevel)
  
  timeLine = TimeLine.create(currentLevel.enemyIDQueue, currentLevel.timeBetweenEachSpawn)
  for i = 1, #timeLine.enemyQueue, 1 do
	group:insert(timeLine.enemyQueue[i])
	--transition.to( timeLine.enemyQueue[i], {x=((240-timeLineWidth/2)-timeLine.enemyQueue[i].x)/2, time=timeLine.spawnTimes[i] * 2, tag="animation"} )
	transition.to( timeLine.enemyQueue[i], {x=(240-timeLineWidth/2)-enemySize/2, time=timeLine.spawnTimes[i], tag="animation"} )
  end
  
  
  
  bar = TimeLine.createTimeLineBar()
  group:insert(bar[1])
  group:insert(bar[2])
  group:insert(bar[3])
  
  startLevel(currentLevel)
  
	-- parameters for ---------------------> make_bullet (x,y, hero attack)
	attackTimer = timer.performWithDelay( 2000, heroNormalAttacks, 0)
	--Runtime:addEventListener( "enterFrame", updateEnemyHealth )
	Runtime:addEventListener( "enterFrame", gameLoop )

	-- scene.overlay hud
	storyboard.showOverlay("scenes.scene_hud")
	goToIntro(currentLevel.victoryCondition, currentLevel.levelID)
end
 
-- Called BEFORE scene has moved onscreen:
function scene:willEnterScene( event )
  local group = self.view
  globals.score = 0
  globals.lives = 3
  globals.multiplier = resetMultiplier()
end
 
-- Called immediately after scene has moved onscreen:
function scene:enterScene( event )
  local group = self.view 
end
 
-- Called when scene is about to move offscreen:
function scene:exitScene( event )
  local group = self.view
  globals.currency.set(currencyCalc(globals.score, globals.currency.get()))
  globals.currency.save()
  Runtime:removeEventListener( "enterFrame", updateEnemyHealth )
  Runtime:removeEventListener( "enterFrame", gameLoop )
  timer.cancel(attackTimer)
  timer.cancel(spawnEneTimer)
  if ( antagonistTimer ~= nil) then
	timer.cancel(antagonistTimer)
  end
end
 
-- Called AFTER scene has finished moving offscreen:
function scene:didExitScene( event )
  local group = self.view
 
end
 
-- Called prior to the removal of scene's "view" (display view)
function scene:destroyScene( event )
  local group = self.view
 
end
 
-- Called if/when overlay scene is displayed via storyboard.showOverlay()
function scene:overlayBegan( event )
  local group = self.view
  local overlay_name = event.sceneName  -- name of the overlay scene
 
end
 
-- Called if/when overlay scene is hidden/removed via storyboard.hideOverlay()
function scene:overlayEnded( event )
  local group = self.view
  local overlay_name = event.sceneName  -- name of the overlay scene
 
end
 
---------------------------------------------------------------------------------
-- END OF YOUR IMPLEMENTATION
---------------------------------------------------------------------------------
 
-- "createScene" event is dispatched if scene's view does not exist
scene:addEventListener( "createScene", scene )
 
-- "willEnterScene" event is dispatched before scene transition begins
scene:addEventListener( "willEnterScene", scene )
 
-- "enterScene" event is dispatched whenever scene transition has finished
scene:addEventListener( "enterScene", scene )
 
-- "exitScene" event is dispatched before next scene's transition begins
scene:addEventListener( "exitScene", scene )
 
-- "didExitScene" event is dispatched after scene has finished transitioning out
scene:addEventListener( "didExitScene", scene )
 
-- "destroyScene" event is dispatched before view is unloaded, which can be
-- automatically unloaded in low memory situations, or explicitly via a call to
-- storyboard.purgeScene() or storyboard.removeScene().
scene:addEventListener( "destroyScene", scene )
 
-- "overlayBegan" event is dispatched when an overlay scene is shown
scene:addEventListener( "overlayBegan", scene )
 
-- "overlayEnded" event is dispatched when an overlay scene is hidden/removed
scene:addEventListener( "overlayEnded", scene )
 
---------------------------------------------------------------------------------
 
return scene