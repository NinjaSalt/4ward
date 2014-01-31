---------------------------------------------------------------------------------
-- SCENE NAME
-- Scene notes go here
---------------------------------------------------------------------------------
 
local storyboard = require( "storyboard" )
local scene = storyboard.newScene()
local thisLevel
-- Array to store heroes
hero = {}

-- Lanes y positions
lane1 = 80
lane2 = 160
lane3 = 240

--Enemy varis
allEne = {} 
allEnemHealth = {}

--Hero health
allHeroHealth = {}

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
	
	-- add health bars to heroes
	--allHeroHealth[n] = #allEne
	allHeroHealth[n] = display.newImage( "images/enemhealth.jpg" )
	allHeroHealth[n].height = 10 
	allHeroHealth[n].width = heroHealth/3 * 50
	allHeroHealth[n].x = 50; allHeroHealth[n].y = n * 80 + 50
	--end health bar.
	
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
  bullet.transition = transition.to( bullet, {x=500, time=bt, onComplete=remove_bullet} )
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
	transition.to( allEne[#allEne], { time=(moveSpeed(allEne[#allEne].x, allEne[#allEne].speed, allEne[#allEne].y)), x=(50) } )
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

local function gameLoop( event )
	for i = 0,table.maxn( allEne ) do
		for n = 0,table.maxn( hero ) do
			if ( hasCollidedCircle( hero[n], allEne[i]) ) then
				allEne[i]:removeSelf()
				table.remove(allEne, i)
				allEnemHealth[i]:removeSelf()
				table.remove(allEnemHealth, i)
				heroHealth = heroHealth - 1
				updateHeroHealth(heroHealth)
				if heroHealth <= 0 then
					currentLevel:endLevel(false)
					storyboard.gotoScene( "scenes.scene_loss",{ effect = "fade", time = 500, params = {level = thisLevel}})

				end
				currentLevel:decrementEnemy()
				if currentLevel.totalNumberOfEnemies == 0 and #allEne == 0 then
					currentLevel:endLevel(true)
					storyboard.gotoScene( "scenes.scene_victory",{ effect = "fade", time = 500, params = {level = thisLevel}})
				end
			end
		end
	end

	for i = 0,table.maxn( allEne ) do
		for n = 0,table.maxn( bullet_array  ) do
			if ( hasCollidedCircle( bullet_array [n], allEne[i]) ) then
				allEne[i].health=allEne[i].health-bullet_array[n].attack
				if ( allEne[i].health <= 0 ) then
					allEne[i]:removeSelf()
					table.remove(allEne, i)
					allEnemHealth[i]:removeSelf()
					table.remove(allEnemHealth, i)
					currentLevel:decrementEnemy()
					if currentLevel.totalNumberOfEnemies == 0 and #allEne == 0 then
						currentLevel:endLevel(true)
						storyboard.gotoScene( "scenes.scene_victory",{ effect = "fade", time = 500, params = {level = thisLevel}})
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

						-- add health bars to enemies.
						allEnemHealth[#allEne] = #allEne
						allEnemHealth[#allEne] = display.newImage( "images/enemhealth.jpg" )
						allEnemHealth[#allEne].height = 10 
						--allEnemHealth[#allEne].width = allEne[#allEne].health/allEne[#allEne].maxHealth * 50
						--need to work on the new health bar for the combo enemy
						allEne[#allEne].health = (allEne[n].health + allEne[i].health)/2
						allEnemHealth[#allEne].width = allEne[#allEne].health/allEne[#allEne].maxHealth * 50
						allEnemHealth[#allEne].x = allEnemHealth[n].x; allEnemHealth[#allEne].y = allEnemHealth[n].y
						--end health bar.

						--define the enemy
						allEne[#allEne].height = 50; allEne[#allEne].width = 50
						allEne[#allEne].x = allEne[n].x; allEne[#allEne].y = allEne[n].y

						--set the move speedallEne
						transition.to( allEne[#allEne], { time=(moveSpeed(allEne[#allEne].x, allEne[#allEne].speed, allEne[#allEne].y)), x=(50) } )
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
							currentLevel:decrementEnemy()
						else
							-- if i is greater than n, need to remove the enemy 1 less than where i orginally was before removing n since the whole list shifted
							allEne[i-1]:removeSelf()
							table.remove(allEne, i-1)
							allEnemHealth[i-1]:removeSelf()
							table.remove(allEnemHealth, i-1)
							currentLevel:decrementEnemy()
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

  --Create the group that hold all the objects in the scene
  group = self.view

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
  local bkg = display.newImage( "images/back.jpg", centerX, centerY, true )
  bkg.height=display.contentHeight; bkg.width=display.contentWidth
  group:insert(bkg)

  local pauseButton = display.newImage("images/Pause.png",25,25 )
  pauseButton.x = 466
  pauseButton.y = 12
  group:insert(pauseButton)
  
  --create the heroes
  scene.createHeroes()
  for n=0,2,1 do
    group:insert(hero[n])
	group:insert(allHeroHealth[n])
  end
  currentLevel = Level.create(1)
  currentLevel:startLevel()

	-- parameters for ---------------------> make_bullet (x,y, hero attack)
	attackTimer = timer.performWithDelay( 2000, heroNormalAttacks, 0)
	--Runtime:addEventListener( "enterFrame", updateEnemyHealth )
	Runtime:addEventListener( "enterFrame", gameLoop )

	local function onTap( event )
	  storyboard.removeScene( scene )
	  storyboard.gotoScene( "scenes.scene_home",options)
	end

    pauseButton:addEventListener( "tap", onTap )
end
 
-- Called BEFORE scene has moved onscreen:
function scene:willEnterScene( event )
  local group = self.view
 
end
 
-- Called immediately after scene has moved onscreen:
function scene:enterScene( event )
  local group = self.view
  local params = event.params
  thisLevel = params.level
end
 
-- Called when scene is about to move offscreen:
function scene:exitScene( event )
  local group = self.view
  Runtime:removeEventListener( "enterFrame", updateEnemyHealth )
  Runtime:removeEventListener( "enterFrame", gameLoop )
  timer.cancel(attackTimer)
  timer.cancel(currentLevel.spawnEneTimer)
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