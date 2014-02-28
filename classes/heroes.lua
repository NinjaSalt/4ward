require("classes.items")
local globals = require("classes.globals" )
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
				useItem(targetHero)
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
	newH.timer = oldH.timer
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