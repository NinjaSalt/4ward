-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

local centerX = display.contentCenterX
local centerY = display.contentCenterY
local _W = display.contentWidth
local _H = display.contentHeight

allEne = {} -- empty table for storing objects
allEnemHealth = {}


--The y location of the three lanes
lane1 = 80
lane2 = 160
lane3 = 240

--The load the other files
local gameUI = require("move")
require("heroes")
require("enemies")
local collision = require("collision")
--Start the physics engine without any gravity

--load the backgroudn image into bkg and set the size of it to the size of the playable area which is defined in the build file
local bkg = display.newImage( "back.jpg", centerX, centerY, true )
bkg.height=display.contentHeight; bkg.width=display.contentWidth

--variables to keep track of enemies
local enemiesOnScreen = 0
local enemiesInQueue = 0

--calls the teleportation function located in move.lua
local function teleport( event )
	return move.teleport( event )
end

-- Heroes, you can see the class heroes.lua
local hero = {}
for n=0, 2, 1 do
	hero[n] = myHeroes[n]
	hero[n] = display.newImage( hero[n].image )
	hero[n] = makeHero ( hero[n], myHeroes[0] )
	hero[n].name = myHeroes[n].name
	hero[n].health = myHeroes[n].health
	hero[n].abilityUsed = myHeroes[n].abilityUsed
	hero[n].x =50
	if (n == 0) then hero[n].y = lane1
	elseif (n == 1) then hero[n].y = lane2
	elseif (n == 2) then hero[n].y = lane3
	--elseif (n == 3) then hero[n].y = lane4
	end
	hero[n].height = 50; hero[n].width = 50
	hero[n]:addEventListener( "touch", ability )
end

local function moveSpeed( x, speed, lane )
	local laneSpeed
	for i = 0,table.maxn( hero ) do
		if ( hero[i].y == lane ) then
			if (hero[i].laneSpeed == 1) then speedMod = .5
			elseif (hero[i].laneSpeed == 2) then speedMod = 1
			elseif (hero[i].laneSpeed == 3) then speedMod = 2
			end
		end
	end
	local timeComplete = ((7000*((x-50)/380))*speed)/speedMod
	return timeComplete
end

--creates an enemy
--John's code
local function spawnEne( )
	local lane = lane1
	--set teh lane it will spawn in
	local randomPos = math.random(1, 3)
	if (randomPos == 1) then lane = lane1
	elseif (randomPos == 2) then lane = lane2
	elseif (randomPos == 3) then lane = lane3
	--elseif (randomPos == 4) then lane = lane4
	end
	local randomEne = math.random(0, 3)
	allEne[#allEne + 1] = myEnemies[randomEne]
	allEne[#allEne] = display.newImage(allEne[#allEne].image)
	allEne[#allEne] = makeEnemy(allEne[#allEne], myEnemies[randomEne])

	-- add health bars to enemies.
	allEnemHealth[#allEne] = #allEne
	allEnemHealth[#allEne] = display.newImage( "enemhealth.jpg" )
	--print ( #allEne )
	--print ( #allEnemHealth )
	allEnemHealth[#allEne].height = 10 
	print (allEne[#allEne].health)
	print (allEne[#allEne].maxHealth)
	allEnemHealth[#allEne].width = allEne[#allEne].health/allEne[#allEne].maxHealth * 50
	allEnemHealth[#allEne].x = 430; allEnemHealth[#allEne].y = lane - 25
	--allEnemHealth[#allEne].
	--end health bar.

	--define the enemy
	allEne[#allEne].height = 50; allEne[#allEne].width = 50
	allEne[#allEne].x = 430; allEne[#allEne].y = lane

	--set the move speedallEne
	transition.to( allEne[#allEne], { time=(moveSpeed(allEne[#allEne].x, allEne[#allEne].speed, allEne[#allEne].y)), x=(50) } )
	
	--move health bars along with enemies
	transition.to( allEnemHealth[#allEne], { time=(moveSpeed(allEne[#allEne].x, allEne[#allEne].speed, allEne[#allEne].y)), x=(50) } )
	--listen for a draging action
	allEne[#allEne]:addEventListener( "touch", teleport ) 
	enemiesOnScreen = enemiesOnScreen + 1  --added to test for victory condition -Ryan
	return true
end


--super janky but just stops veleocity on collision
local function onCollision( event )
        if ( event.phase == "began" ) then
				if ( event.object1.class=="shot" ) then
					event.object1:removeSelf()
				end
				if ( event.object2.class=="shot" ) then
					event.object2:removeSelf()
				end
				if ( event.object1.class=="enemy" ) then
					--event.object1.health=event.object1.health-2
					if ( event.object1.health <= 0 ) then
						event.object1:removeSelf()
						enemiesOnScreen = enemiesOnScreen - 1  --added to detect victory -Ryan
						if enemiesOnScreen == 0 and enemiesInQueue == 0 then
							print("You win!")
						end	
					end
				end
				if ( event.object2.class=="enemy" ) then
					--event.object2.health=event.object2.health-2
					if ( event.object2.health <= 0 ) then
						event.object2:removeSelf()
						enemiesOnScreen = enemiesOnScreen - 1  --added to detect victory -Ryan
						if enemiesOnScreen == 0 and enemiesInQueue == 0 then
							print("You win!")
						end	
					end
				end
        elseif ( event.phase == "ended" ) then
 
               -- print( "ended: " )
 
        end
end
 
Runtime:addEventListener( "collision", onCollision )

enemiesInQueue = 20
timer.performWithDelay( 3000, spawnEne, enemiesInQueue )

local shot = {}


local function shoot()
	local lane = 1
	for  n=1, 4, 1 do
		if (n == 1) then lane = lane1
		elseif (n == 2) then lane = lane2
		elseif (n == 3) then lane = lane3
		--elseif (n == 4) then lane = lane4
		end
		shot[n] = display.newImage( "icon.png")
		shot[n].x =100; shot[n].y = lane
		shot[n].height = 10; shot[n].width = 10
		shot[n].class = "shot"
		--physics.addBody( shot[n], { } )

		-- remove the "isBullet" setting below to see the brick pass through cans without colliding!
		transition.to( shot[n], { time=(300), x=(500) } )
		--shot[n]:setLinearVelocity(1000, 0)
		--n = n + 1
	end
end

local function start()
	-- throw 3 shot
	timer.performWithDelay( 2000, shoot, 0 )
end

local function updateHealth()
	for i=1, table.maxn( allEne ) do
		allEnemHealth[i].width = allEne[i].health/allEne[i].maxHealth * 50
		allEnemHealth[i].y = allEne[i].y - 25
	end
end

-- wait 800 milliseconds, then call start function above
timer.performWithDelay( 800, start )

local function gameLoop( event )
	for i = 0,table.maxn( allEne ) do
		for n = 0,table.maxn( hero ) do
			if ( hasCollidedCircle( hero[n], allEne[i]) ) then
				allEne[i]:removeSelf()
				table.remove(allEne, i)
				enemiesInQueue = enemiesInQueue -1
				allEnemHealth[i]:removeSelf()
				table.remove(allEnemHealth, i)
			end
		end
	end

   return true
end

Runtime:addEventListener( "enterFrame", gameLoop )
Runtime:addEventListener( "enterFrame", updateHealth )
--bkg:addEventListener( "touch", spawnEne ) -- touch the screen to create disks