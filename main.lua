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
lane1 = 60
lane2 = 130
lane3 = 200
lane4 = 270

--The load the other files
local gameUI = require("move")
local physics = require("physics")
--Start the physics engine without any gravity
physics.start()
physics.setGravity( 0, 0 )

--load the backgroudn image into bkg and set the size of it to the size of the playable area which is defined in the build file
local bkg = display.newImage( "back.jpg", centerX, centerY, true )
bkg.height=display.contentHeight; bkg.width=display.contentWidth

-- The enemy "class" eneGfx is an array of images and allEne is basically array of all the enemies
local eneGfx = { "BombBabyBlue.png", "BombDarkBlue.png", "BombPink.png", "BombGreen.png" }
local allEne = {} -- empty table for storing objects

--calls the teleportation function located in move.lua
local function teleport( event )
	return move.teleport( event )
	
end

--creates an enemy
local function spawnEne( )
	local lane = lane1
	--set teh lane it will spawn in
	local randomPos = math.random(1, 4)
	if (randomPos == 1) then lane = lane1
	elseif (randomPos == 2) then lane = lane2
	elseif (randomPos == 3) then lane = lane3
	elseif (randomPos == 4) then lane = lane4
	end
	--pick a random image
	randImage = eneGfx[ math.random( 1, 4 ) ]
	allEne[#allEne + 1] = display.newImage( randImage )
	
	--define the enemy
	local enemy = allEne[#allEne]
	enemy.height = 50; enemy.width = 50
	enemy.x = 430; enemy.y = lane
	enemy.health=5
	enemy.class="enemy"
	--apply physics to the enemy; kinematic means that it will only collide with dynamic body types but not other kinematic 
	physics.addBody( enemy, "kinematic", { } )
	--set the move speed
	enemy:setLinearVelocity( -20, 0 )
	--listen for a draging action
	enemy:addEventListener( "touch", teleport ) 
	return true
end

--super janky but just stops veleocity on collision
local function onCollision( event )
        if ( event.phase == "began" ) then
				if ( event.object1.class=="hero" or event.object2.class=="hero" ) then
					event.object1:setLinearVelocity( 0, 0 )
					event.object2:setLinearVelocity( 0, 0 )
				end
				if ( event.object1.class=="shot" ) then
					event.object1:removeSelf()
				end
				if ( event.object2.class=="shot" ) then
					event.object2:removeSelf()
				end
				if ( event.object1.class=="enemy" ) then
					event.object1.health=event.object1.health-2
					if ( event.object1.health <= 0 ) then
						event.object1:removeSelf()
					end
				end
				if ( event.object2.class=="enemy" ) then
					event.object2.health=event.object2.health-2
					if ( event.object2.health <= 0 ) then
						event.object2:removeSelf()
					end
				end
        elseif ( event.phase == "ended" ) then
 
               -- print( "ended: " )
 
        end
end
 
Runtime:addEventListener( "collision", onCollision )

--spawn enemies every 3 seconds
timer.performWithDelay( 3000, spawnEne, 0 )

-- our heroes
local hero1 = display.newImage( "siren.png" )
hero1.x =50; hero1.y = lane1
hero1.height = 50; hero1.width = 50
hero1.class="hero"
physics.addBody( hero1, { density=0.3, friction=0.6 } )

local hero2 = display.newImage( "archer.png" )
hero2.x =50; hero2.y = lane2
hero2.height = 50; hero2.width = 50
hero2.class="hero"
physics.addBody( hero2, { density=0.3, friction=0.6 } )

local hero3 = display.newImage( "monkeyking.png" )
hero3.x =50; hero3.y = lane3
hero3.height = 50; hero3.width = 50
hero3.class="hero"
physics.addBody( hero3, { density=0.3, friction=0.6 } )

local hero4 = display.newImage( "penguinknight1.png" )
hero4.x =50; hero4.y = lane4
hero4.height = 50; hero4.width = 50
hero4.class="hero"
physics.addBody( hero4,{ density=0.3, friction=0.6 } )

local shot = {}


local function shoot()
	local lane = 1
	for  n=0, 4, 1 do
		if (n == 1) then lane = lane1
		elseif (n == 2) then lane = lane2
		elseif (n == 3) then lane = lane3
		elseif (n == 4) then lane = lane4
		end
		shot[n] = display.newImage( "icon.png")
		shot[n].x =100; shot[n].y = lane
		shot[n].height = 10; shot[n].width = 10
		shot[n].class = "shot"
		physics.addBody( shot[n], { } )

		-- remove the "isBullet" setting below to see the brick pass through cans without colliding!
		shot[n].isBullet = true

		shot[n]:setLinearVelocity(1000, 0)
		--n = n + 1
	end
end

local function start()
	-- throw 3 shot
	timer.performWithDelay( 2000, shoot, 0 )
end

-- wait 800 milliseconds, then call start function above
timer.performWithDelay( 800, start )

--bkg:addEventListener( "touch", spawnEne ) -- touch the screen to create disks