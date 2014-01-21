-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

local centerX = display.contentCenterX
local centerY = display.contentCenterY
local _W = display.contentWidth
local _H = display.contentHeight

--The y location of the four lanes
lane1 = 40
lane2 = 120
lane3 = 200
lane4 = 280

--The load the other files
local gameUI = require("move")
require("heroes")
require("enemies")
local collision = require("collision")
--Start the physics engine without any gravity

--load the backgroudn image into bkg and set the size of it to the size of the playable area which is defined in the build file
local bkg = display.newImage( "back.jpg", centerX, centerY, true )
bkg.height=display.contentHeight; bkg.width=display.contentWidth

--calls the teleportation function located in move.lua
local function teleport( event )
	return move.teleport( event )
	
end

local function moveSpeed( x, speed )
	local timeComplete = (7000*((x-50)/380))*speed
	return timeComplete
end

local function heroTouch(hero)
	if (hero.abilityUsed == false) then
		hero:addEventListener( "touch", ability )
	elseif (hero.abilityUsed == true ) then
		hero:addEventListener( "touch", cooldown )
	end
end

-- The enemy "class" eneGfx is an array of images and allEne is basically array of all the enemies
local eneGfx = { "BombBabyBlue.png", "BombDarkBlue.png", "BombPink.png", "BombGreen.png" }
local allEne = {} -- empty table for storing objects
allEnemHealth = {}

-- Heroes, you can see the class heroes.lua
local hero = {}
for n=0, 3, 1 do
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
	elseif (n == 3) then hero[n].y = lane4
	end
	hero[n].height = 50; hero[n].width = 50
	hero[n]:addEventListener( "touch", ability )
end

--creates an enemy
--John's code
local function spawnEne( )
	local lane = lane1
	--set teh lane it will spawn in
	local randomPos = math.random(1, 4)
	if (randomPos == 1) then lane = lane1
	elseif (randomPos == 2) then lane = lane2
	elseif (randomPos == 3) then lane = lane3
	elseif (randomPos == 4) then lane = lane4
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
	transition.to( allEne[#allEne], { time=(moveSpeed(allEne[#allEne].x, allEne[#allEne].speed)), x=(50) } )
	
	--move health bars along with enemies
	transition.to( allEnemHealth[#allEne], { time=(moveSpeed(allEne[#allEne].x, allEne[#allEne].speed)), x=(50) } )
	--listen for a draging action
	allEne[#allEne]:addEventListener( "touch", teleport ) 

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
					end
				end
				if ( event.object2.class=="enemy" ) then
					--event.object2.health=event.object2.health-2
					if ( event.object2.health <= 0 ) then
						event.object2:removeSelf()
					end
				end
        elseif ( event.phase == "ended" ) then
 
               -- print( "ended: " )
 
        end
end
 
Runtime:addEventListener( "collision", onCollision )

timer.performWithDelay( 3000, spawnEne, 0 )

local shot = {}


local function shoot()
	local lane = 1
	for  n=1, 4, 1 do
		if (n == 1) then lane = lane1
		elseif (n == 2) then lane = lane2
		elseif (n == 3) then lane = lane3
		elseif (n == 4) then lane = lane4
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
				transition.cancel( allEne[i] )
			end
		end
	end

   return true
end

Runtime:addEventListener( "enterFrame", gameLoop )
Runtime:addEventListener( "enterFrame", updateHealth )
--bkg:addEventListener( "touch", spawnEne ) -- touch the screen to create disks