require("classes.items")
local globals = require("classes.globals" )
local bullet_speed = 50 
Hero = {}
Hero.__index = Hero

function Hero.create(health, attack, image, name, num)
   local hero = {}             -- our new object
   setmetatable(hero,Hero)  -- make Hero handle lookup
   hero.health = health      -- initialize our object
   hero.attack = attack
   hero.image = image
   hero.name = name
   hero.class = "hero"
   hero.num = num --for the conveyor belts
   hero.laneSpeed = 2
   hero.abilityUsed = false
   hero.item = nil
   return hero
end

function Hero:changeItem( item )
   self.item = item
end

function remove_bullet( bullet )
  local index = table.indexOf( globals.bullet_array, bullet )
  transition.cancel( bullet.transition )
  table.remove( globals.bullet_array, index )
  display.remove( bullet )
end 

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

function ability( event )
	local belt = event.target
	local targetHero
	if (belt.id == 0) then targetHero = hero[0]
    elseif (belt.id == 1) then targetHero = hero[1]
    elseif (belt.id == 2) then targetHero = hero[2]
	end
	local heroX = event.x
	local phase = event.phase
	local stage = display.getCurrentStage()
	local markY = targetHero.y
	local frameNum1, frameNum2, frameNum3
	
	if event.phase == "began" then
		stage:setFocus( belt, event.id )
		belt.isFocus = true
	elseif belt.isFocus then
		if "ended" == phase or "cancelled" == phase then
			stage:setFocus( belt, nil )
			belt.isFocus = false
			--checks if the touch moved either left or right
			--left swipe makes the lanes go faster
			if (event.x - event.xStart ~= 0 and event.x - event.xStart < -7) then
				if ( targetHero.laneSpeed == 2 ) then
					targetHero.laneSpeed = 1
					updateMoveSpeed(targetHero)
					globals.levers[targetHero.num]:setSequence( "fast" )
					globals.levers[targetHero.num]:play()
					if (targetHero.num == 0) then
						frameNum1 = globals.belts[targetHero.num].frame
						
						print(frameNum1)
						globals.belts[targetHero.num]:setSequence( "breakfast_fast" )
						globals.belts[targetHero.num]:setFrame( frameNum1 )
						globals.belts[targetHero.num]:play()
					elseif (targetHero.num == 1) then
						frameNum2 = globals.belts[targetHero.num].frame
						
						globals.belts[targetHero.num]:setSequence( "dinner_fast" )
						globals.belts[targetHero.num]:setFrame( frameNum2 )
						globals.belts[targetHero.num]:play()
					elseif (targetHero.num == 2) then
						frameNum3 = globals.belts[targetHero.num].frame
						
						globals.belts[targetHero.num]:setSequence( "dessert_fast" )
						globals.belts[targetHero.num]:setFrame( frameNum3 )
						globals.belts[targetHero.num]:play()
					end
				elseif ( targetHero.laneSpeed == 3 ) then
					targetHero.laneSpeed = 2
					updateMoveSpeed(targetHero)
					globals.levers[targetHero.num]:setSequence( "normal" )
					globals.levers[targetHero.num]:play()
					if (targetHero.num == 0) then
						frameNum1 = globals.belts[targetHero.num].frame
						globals.belts[targetHero.num]:setSequence( "breakfast_normal" )
						globals.belts[targetHero.num]:setFrame( frameNum1 )
						globals.belts[targetHero.num]:play()
					elseif (targetHero.num == 1) then
						frameNum2 = globals.belts[targetHero.num].frame
						globals.belts[targetHero.num]:setSequence( "dinner_normal" )
						globals.belts[targetHero.num]:setFrame( frameNum2 )
						globals.belts[targetHero.num]:play()
					elseif (targetHero.num == 2) then
						frameNum3 = globals.belts[targetHero.num].frame
						globals.belts[targetHero.num]:setSequence( "dessert_normal" )
						globals.belts[targetHero.num]:setFrame( frameNum3 )
						globals.belts[targetHero.num]:play()
					end
				end
				--right swipe makes the lanes go slower
			elseif (event.x - event.xStart ~= 0 and event.x - event.xStart > 7) then
				if ( targetHero.laneSpeed == 2 ) then
					targetHero.laneSpeed = 3
					updateMoveSpeed(targetHero)
					globals.levers[targetHero.num]:setSequence( "slow" )
					globals.levers[targetHero.num]:play()
					if (targetHero.num == 0) then
						frameNum1 = globals.belts[targetHero.num].frame
						globals.belts[targetHero.num]:setSequence( "breakfast_slow" )
						globals.belts[targetHero.num]:setFrame( frameNum1 )
						globals.belts[targetHero.num]:play()
					elseif (targetHero.num == 1) then
						frameNum2 = globals.belts[targetHero.num].frame
						globals.belts[targetHero.num]:setSequence( "dinner_slow" )
						globals.belts[targetHero.num]:setFrame( frameNum2 )
						globals.belts[targetHero.num]:play()
					elseif (targetHero.num == 2) then
						frameNum3 = globals.belts[targetHero.num].frame
						globals.belts[targetHero.num]:setSequence( "dessert_slow" )
						globals.belts[targetHero.num]:setFrame( frameNum3 )
						globals.belts[targetHero.num]:play()
					end
				elseif ( targetHero.laneSpeed == 1 ) then
					targetHero.laneSpeed = 2
					updateMoveSpeed(targetHero)
					globals.levers[targetHero.num]:setSequence( "normal" )
					globals.levers[targetHero.num]:play()
					if (targetHero.num == 0) then
						frameNum1 = globals.belts[targetHero.num].frame
						globals.belts[targetHero.num]:setSequence( "breakfast_normal" )
						globals.belts[targetHero.num]:setFrame( frameNum1 )
						globals.belts[targetHero.num]:play()
					elseif (targetHero.num == 1) then
						frameNum2 = globals.belts[targetHero.num].frame
						globals.belts[targetHero.num]:setSequence( "dinner_normal" )
						globals.belts[targetHero.num]:setFrame( frameNum2 )
						globals.belts[targetHero.num]:play()
					elseif (targetHero.num == 2) then
						frameNum3 = globals.belts[targetHero.num].frame
						globals.belts[targetHero.num]:setSequence( "dessert_normal" )
						globals.belts[targetHero.num]:setFrame( frameNum3 )
						globals.belts[targetHero.num]:play()
					end
				end
			--checks if the touch didn't move from original position. Meaning that it was a tap
			elseif (event.x - event.xStart == 0) then
				--useItem(targetHero)
			end
		end
	end
end

function makeHero( newH, oldH )
	newH.health = oldH.health      
	newH.attack = oldH.attack
	newH.image = oldH.image
	newH.name = oldH.name
	newH.class = oldH.class
	newH.abilityUsed = oldH.abilityUsed
	newH.laneSpeed = oldH.laneSpeed
	newH.item = oldH.item
	newH.num = oldH.num
	return newH
end

-- create and use an Hero
chefB = Hero.create(1000, 1, "images/chefholder.png", "chefB", 0)
chefDin = Hero.create(1000, 1, "images/dinner.png", "chefDin", 1)
chefDess = Hero.create(1000, 1, "images/dessert.png", "chefDess", 2)
--joe = Hero.create(1000, 1, "penguinknight1.png", "joe")
myHeroes = {}
myHeroes[0]=chefB
myHeroes[1]=chefDin
myHeroes[2]=chefDess
--myHeroes[3]=joe