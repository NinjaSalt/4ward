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
	local hero = event.target
	local heroX = event.x
	local phase = event.phase
	local stage = display.getCurrentStage()
	local markY = hero.y
	local frameNum1, frameNum2, frameNum3
	if event.phase == "began" then
		stage:setFocus( hero, event.id )
		hero.isFocus = true
	elseif hero.isFocus then
		if "ended" == phase or "cancelled" == phase then
			stage:setFocus( hero, nil )
			hero.isFocus = false
			--checks if the touch moved either left or right
			--left swipe makes the lanes go faster
			if (event.x - event.xStart ~= 0 and event.x - event.xStart < -7) then
				if ( hero.laneSpeed == 2 ) then
					hero.laneSpeed = 1
					updateMoveSpeed(hero)
					globals.levers[hero.num]:setSequence( "fast" )
					globals.levers[hero.num]:play()
					if (hero.num == 0) then
						frameNum1 = globals.belts[hero.num].frame
						
						print(frameNum1)
						globals.belts[hero.num]:setSequence( "breakfast_fast" )
						globals.belts[hero.num]:setFrame( frameNum1 )
						globals.belts[hero.num]:play()
					elseif (hero.num == 1) then
						frameNum2 = globals.belts[hero.num].frame
						
						globals.belts[hero.num]:setSequence( "dinner_fast" )
						globals.belts[hero.num]:setFrame( frameNum2 )
						globals.belts[hero.num]:play()
					elseif (hero.num == 2) then
						frameNum3 = globals.belts[hero.num].frame
						
						globals.belts[hero.num]:setSequence( "dessert_fast" )
						globals.belts[hero.num]:setFrame( frameNum3 )
						globals.belts[hero.num]:play()
					end
				elseif ( hero.laneSpeed == 3 ) then
					hero.laneSpeed = 2
					updateMoveSpeed(hero)
					globals.levers[hero.num]:setSequence( "normal" )
					globals.levers[hero.num]:play()
					if (hero.num == 0) then
						frameNum1 = globals.belts[hero.num].frame
						globals.belts[hero.num]:setSequence( "breakfast_normal" )
						globals.belts[hero.num]:setFrame( frameNum1 )
						globals.belts[hero.num]:play()
					elseif (hero.num == 1) then
						frameNum2 = globals.belts[hero.num].frame
						globals.belts[hero.num]:setSequence( "dinner_normal" )
						globals.belts[hero.num]:setFrame( frameNum2 )
						globals.belts[hero.num]:play()
					elseif (hero.num == 2) then
						frameNum3 = globals.belts[hero.num].frame
						globals.belts[hero.num]:setSequence( "dessert_normal" )
						globals.belts[hero.num]:setFrame( frameNum3 )
						globals.belts[hero.num]:play()
					end
				end
				--right swipe makes the lanes go slower
			elseif (event.x - event.xStart ~= 0 and event.x - event.xStart > 7) then
				if ( hero.laneSpeed == 2 ) then
					hero.laneSpeed = 3
					updateMoveSpeed(hero)
					globals.levers[hero.num]:setSequence( "slow" )
					globals.levers[hero.num]:play()
					if (hero.num == 0) then
						frameNum1 = globals.belts[hero.num].frame
						globals.belts[hero.num]:setSequence( "breakfast_slow" )
						globals.belts[hero.num]:setFrame( frameNum1 )
						globals.belts[hero.num]:play()
					elseif (hero.num == 1) then
						frameNum2 = globals.belts[hero.num].frame
						globals.belts[hero.num]:setSequence( "dinner_slow" )
						globals.belts[hero.num]:setFrame( frameNum2 )
						globals.belts[hero.num]:play()
					elseif (hero.num == 2) then
						frameNum3 = globals.belts[hero.num].frame
						globals.belts[hero.num]:setSequence( "dessert_slow" )
						globals.belts[hero.num]:setFrame( frameNum3 )
						globals.belts[hero.num]:play()
					end
				elseif ( hero.laneSpeed == 1 ) then
					hero.laneSpeed = 2
					updateMoveSpeed(hero)
					globals.levers[hero.num]:setSequence( "normal" )
					globals.levers[hero.num]:play()
					if (hero.num == 0) then
						frameNum1 = globals.belts[hero.num].frame
						globals.belts[hero.num]:setSequence( "breakfast_normal" )
						globals.belts[hero.num]:setFrame( frameNum1 )
						globals.belts[hero.num]:play()
					elseif (hero.num == 1) then
						frameNum2 = globals.belts[hero.num].frame
						globals.belts[hero.num]:setSequence( "dinner_normal" )
						globals.belts[hero.num]:setFrame( frameNum2 )
						globals.belts[hero.num]:play()
					elseif (hero.num == 2) then
						frameNum3 = globals.belts[hero.num].frame
						globals.belts[hero.num]:setSequence( "dessert_normal" )
						globals.belts[hero.num]:setFrame( frameNum3 )
						globals.belts[hero.num]:play()
					end
				end
			--checks if the touch didn't move from original position. Meaning that it was a tap
			elseif (event.x - event.xStart == 0) then
				useItem(hero)
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