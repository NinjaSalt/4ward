---------------------------------------------------------------------------------
-- SCENE NAME
-- Scene notes go here
---------------------------------------------------------------------------------
 
local storyboard = require( "storyboard" )
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

-- Hero Attack Variables
local bullet_speed = 50 
local bullet_array = {}   -- Make an array to hold the bullets

-- Temporary hero health
local heroHealth = 3

local eneAndBar = {}
local group 

local move = require("classes.move")
require("classes.heroes")
require("classes.enemies")
require("classes.collision")
require("classes.level")
require("classes.combo")
require("classes.items")
local globals = require("classes.globals")
globals.currency = require( "classes.score" )

local currencyText
--local scoreText

--[[local currencyText = currency.init({
	fontSize = 20,
	font = "Helvetica",
	x = display.contentCenterX,
	y = display.contentHeight - 32/2,
	maxDigits = 7,
	leadingZeros = false,
	filename = "currencyfile.txt",
	})]]

-- Clear previous scene
storyboard.removeAll()
 
-- local forward references should go here --
 
---------------------------------------------------------------------------------
-- BEGINNING OF YOUR IMPLEMENTATION
---------------------------------------------------------------------------------

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
    elseif (n == 3) then hero[n].y = lane4
    end
    hero[n].height = 50; hero[n].width = 50
	hero[n]:addEventListener( "touch", ability )
	
  end
end  

-- function to remove the bullet off the array/off screen
function remove_bullet( bullet )
  local index = table.indexOf( bullet_array, bullet )
  transition.cancel( bullet.transition )
  table.remove( bullet_array, index )
  display.remove( bullet )
end 

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
  table.insert( bullet_array, bullet)
  bullet.attack = attack
  local bt = x * bullet_speed
  bullet.transition = transition.to( bullet, {x=500, time=bt, onComplete=remove_bullet, tag="animation"} )
  return bullet
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

-- countdown timer for the speed update
function laneTimerDown(hero)
	local laneSpeed
    currentTime = hero.timer
	hero.timer = hero.timer - .5
	if(hero.timer==0)then
    	currentTime = hero.timer
    	hero.abilityUsed = false
    	hero.laneSpeed = 2
	end
	
 end

  -- function to calculate currency based on score
function currencyCalc( score, currCurrency )
	local newCurrency = 0
	counter = 0
	for i = 0, score, 5 do 
		counter = counter + 1
	end
	print("counter:", counter)
	newCurrency = currCurrency + counter
	return newCurrency
end

function itemCombo( item , enemy )
	for j = 0,table.maxn( comboEnemies ) do
		if (comboEnemies[j].type == replaceEnemy(item, enemy)) then
			print ("my new food: " .. comboEnemies[j].type)
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
			item: removeSelf()
		end
	end
end

local function gameLoop( event )
	for i = 0,table.maxn( allEne ) do
		for n = 0,table.maxn( hero ) do
			if ( hasCollidedCircle( hero[n], allEne[i]) ) then
				allEne[i]:removeSelf()
				table.remove(allEne, i)
				allEnemHealth[i]:removeSelf()
				table.remove(allEnemHealth, i)

				if(globals.hearts[2] ~= nil) then
					globals.hearts[2]:removeSelf()
					globals.hearts[2] = nil
				elseif(globals.hearts[1] ~= nil) then
						globals.hearts[1]:removeSelf()
						globals.hearts[1] = nil
				elseif(globals.hearts[0] ~= nil) then
						globals.hearts[0]:removeSelf()
						globals.hearts[0] = nil				
				end

				heroHealth = heroHealth - 1
				if heroHealth <= 0 then
					endLevel(currentLevel, false)
					storyboard.gotoScene( "scenes.scene_loss",{ effect = "fade", time = 500, params = {level = thisLevel, world = world}})

				end
				decrementEnemy(currentLevel)
				if (currentLevel.totalNumberOfEnemies == 0 and #allEne == 0) then
					if(currentLevel.victoryCondition~=false) then
						if(currentLevel.victoryCondition.conditionMet==true)then
							LevelList.unlockLevel(world, thisLevel+1)
							endLevel(currentLevel, true)
							storyboard.gotoScene( "scenes.scene_victory",{ effect = "fade", time = 500, params = {level = thisLevel, world = world}})
						else 
							LevelList.unlockLevel(world, thisLevel+1)
							endLevel(currentLevel, false)
							storyboard.gotoScene( "scenes.scene_loss",{ effect = "fade", time = 500, params = {level = thisLevel, world = world}})
						end
					else	
						LevelList.unlockLevel(world, thisLevel+1)
						endLevel(currentLevel, true)
						storyboard.gotoScene( "scenes.scene_victory",{ effect = "fade", time = 500, params = {level = thisLevel, world = world}})
					end
				end
			end
		end
	end

	for i = 0,table.maxn( allEne ) do
		for n = 0,table.maxn( bullet_array  ) do
			if ( hasCollidedCircle( bullet_array [n], allEne[i]) ) then
				-- allEne[i].health=allEne[i].health-bullet_array[n].attack old damage system
				-- new damage check
				allEne[i].health= allEne[i].health - calculateDamage(allEne[i], bullet_array[n]) 
				if ( allEne[i].health <= 0 ) then
					--theScore.add(allEne[i].pointValue) 		-- adding the amount to score
					globals.score = globals.score + allEne[i].pointValue
					print("score: ", globals.score)
					scoreText.text = (globals.score)
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
								storyboard.gotoScene( "scenes.scene_victory",{ effect = "fade", time = 500, params = {level = thisLevel, world = world}})
							else 
								endLevel(currentLevel, false)
								storyboard.gotoScene( "scenes.scene_loss",{ effect = "fade", time = 500, params = {level = thisLevel, world = world}})
							end
						else	
							LevelList.unlockLevel(world, thisLevel+1)
							endLevel(currentLevel, true)
							storyboard.gotoScene( "scenes.scene_victory",{ effect = "fade", time = 500, params = {level = thisLevel, world = world}})
						end
					end
				end
				remove_bullet(bullet_array[n])
			end
		end
	end

	--countdown timer for hero speed
	for n = 0,table.maxn( hero ) do
			if ( hero[n].abilityUsed == true ) then
				laneTimerDown(hero[n])
				if (hero[n].abilityUsed == false) then
					updateMoveSpeed(hero[n])
					hero[n].timer = 50
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

	updateEnemyHealth()

   return true
end

-- Called when the scene's view does not exist:
function scene:createScene( event )
	currencyText = globals.currency.init({
		fontSize = 20,
		font = "Helvetica",
		x = 10,
		y = display.contentHeight - 16,
		maxDigits = 7,
		leadingZeros = false,
		filename = "currencyfile.txt",
		})
	currencyText:setFillColor( black )

	scoreText = display.newText( globals.score, display.contentCenterX, 15, native.systemFontBold, 20 )

	scoreText:setFillColor(black )

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
    createBullet(hero[0])
	createBullet(hero[1])
	createBullet(hero[2])
   end
  local bkg = display.newImage( "images/mockback2.png", centerX, centerY, true )
  bkg.height=display.contentHeight; bkg.width=display.contentWidth
  group:insert(bkg)
  
  --create the heroes
  scene.createHeroes()
  for n=0,2,1 do
    group:insert(hero[n])
  end
  currentLevel = Level.load(world, thisLevel)
  --initalize the current level's secondary objectives and print them
  if(currentLevel.victoryCondition~=false)then
	currentLevel.victoryCondition.amount = currentLevel.victoryCondition.memAmount
	currentLevel.victoryCondition.conditionMet = false
	print("Make " .. currentLevel.victoryCondition.amount .. " " .. currentLevel.victoryCondition.enemy.name)
  end
  group:insert(currentLevel)
  startLevel(currentLevel)
  
  local item1 = display.newImage(items[1].image)
  passValuesToNewItem (item1, items[1])
  item1.width = 50
  item1.height = 50
  item1:addEventListener( "touch", itemFoodDrag ) 
  group:insert(item1)
  
  
	-- parameters for ---------------------> make_bullet (x,y, hero attack)
	attackTimer = timer.performWithDelay( 2000, heroNormalAttacks, 0)
	--Runtime:addEventListener( "enterFrame", updateEnemyHealth )
	Runtime:addEventListener( "enterFrame", gameLoop )

	-- scene.overlay hud
	storyboard.showOverlay("scenes.scene_hud")
end
 
-- Called BEFORE scene has moved onscreen:
function scene:willEnterScene( event )
  local group = self.view
  local prevCurrency = globals.currency.load()
  if prevCurrency then
  	globals.currency.set(prevCurrency)
  end
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
  print("currency: ", globals.currency.get())
  currencyText:removeSelf()
  scoreText:removeSelf()
  Runtime:removeEventListener( "enterFrame", updateEnemyHealth )
  Runtime:removeEventListener( "enterFrame", gameLoop )
  timer.cancel(attackTimer)
  timer.cancel(spawnEneTimer)
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