require("classes.items")
require("classes.beltsAnimation")
require("classes.audioClass")
local sfx = require("classes.sfx")
local globals = require("classes.globals" )
local bullet_speed = 50 
local attackTimer_bfst = false
local attackTimer_dnr = false
local attackTimer_dst = false
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
   hero.timer = 3
   hero.item = nil
   return hero
end

function Hero:changeItem( item )
   self.item = item
end

-- ATTACK TIMER FUNCTIONS --
-- function attackTimer_bkft()
-- 	if (globals.attack_bkft) then
-- 		hero[0].timer = hero[0].timer - 1
-- 		if(hero1TimerText~=nil) then
-- 			hero1TimerText:removeSelf()
-- 		end
-- 		hero1TimerText = display.newText( hero[0].timer, hero[0].x, hero[0].y-hero[0].width/2, globals.LOBSTERTWO, 16 )
-- 		hero1TimerText:setFillColor(0,0,0)
-- 		if (hero[0].timer == 0) then
-- 			globals.attack_bkft = false
-- 			hero[0].timer = 3
-- 			if(hero1TimerText~=nil) then
-- 				hero1TimerText:removeSelf()
-- 				hero1TimerText=nil
-- 			end
-- 			--hero[0].abilityUsed=false
-- 		end
-- 	end
-- end

-- SWIPING LANES FUNCTIONS --
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
					playSFX (sfx.audioLaneSpeedUp, 1)
					if (targetHero.num == 0) then
						globals.belts[targetHero.num]:pause()
						frameNum1 = globals.belts[targetHero.num].frame
						breakfast_fast (targetHero.num, frameNum1)
						globals.belts[targetHero.num]:play()
					elseif (targetHero.num == 1) then
						globals.belts[targetHero.num]:pause()
						frameNum2 = globals.belts[targetHero.num].frame
						dinner_fast (targetHero.num, frameNum2)
						globals.belts[targetHero.num]:play()
					elseif (targetHero.num == 2) then
						globals.belts[targetHero.num]:pause()
						frameNum3 = globals.belts[targetHero.num].frame
						dessert_fast (targetHero.num, frameNum3)
						globals.belts[targetHero.num]:play()
					end
				elseif ( targetHero.laneSpeed == 3 ) then
					targetHero.laneSpeed = 2
					updateMoveSpeed(targetHero)
					globals.levers[targetHero.num]:setSequence( "normal" )
					globals.levers[targetHero.num]:play()
					playSFX (sfx.audioLaneSpeedUp, 1)
					if (targetHero.num == 0) then
						globals.belts[targetHero.num]:pause()
						frameNum1 = globals.belts[targetHero.num].frame
						breakfast_normal (targetHero.num, frameNum1)
						globals.belts[targetHero.num]:play()
					elseif (targetHero.num == 1) then
						globals.belts[targetHero.num]:pause()
						frameNum2 = globals.belts[targetHero.num].frame						
						dinner_normal (targetHero.num, frameNum2)
						globals.belts[targetHero.num]:play()
					elseif (targetHero.num == 2) then
						globals.belts[targetHero.num]:pause()
						frameNum3 = globals.belts[targetHero.num].frame						
						dessert_normal (targetHero.num, frameNum3)
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
					playSFX (sfx.audioLaneSlow, 1)
					if (targetHero.num == 0) then
						globals.belts[targetHero.num]:pause()
						frameNum1 = globals.belts[targetHero.num].frame						
						breakfast_slow (targetHero.num, frameNum1)
						globals.belts[targetHero.num]:play()
					elseif (targetHero.num == 1) then
						globals.belts[targetHero.num]:pause()
						frameNum2 = globals.belts[targetHero.num].frame						
						dinner_slow (targetHero.num, frameNum2)
						globals.belts[targetHero.num]:play()
					elseif (targetHero.num == 2) then
						globals.belts[targetHero.num]:pause()
						frameNum3 = globals.belts[targetHero.num].frame						
						dessert_slow (targetHero.num, frameNum3)
						globals.belts[targetHero.num]:play()
					end
				elseif ( targetHero.laneSpeed == 1 ) then
					targetHero.laneSpeed = 2
					updateMoveSpeed(targetHero)
					globals.levers[targetHero.num]:setSequence( "normal" )
					globals.levers[targetHero.num]:play()
					playSFX (sfx.audioLaneSlow, 1)
					if (targetHero.num == 0) then
						globals.belts[targetHero.num]:pause()
						frameNum1 = globals.belts[targetHero.num].frame						
						breakfast_normal (targetHero.num, frameNum1)
						globals.belts[targetHero.num]:play()
					elseif (targetHero.num == 1) then
						globals.belts[targetHero.num]:pause()
						frameNum2 = globals.belts[targetHero.num].frame						
						dinner_normal (targetHero.num, frameNum2)
						globals.belts[targetHero.num]:play()
					elseif (targetHero.num == 2) then
						globals.belts[targetHero.num]:pause()
						frameNum3 = globals.belts[targetHero.num].frame						
						dessert_normal (targetHero.num, frameNum3)
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
-- END OF SWIPING LANES FUNCTIONS --

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
	newH.timer = oldH.timer
	return newH
end

-- create and use an Hero
chefB = Hero.create(1000, 1, "images/chefholder.png", "chefB", 0)
chefDin = Hero.create(1000, 1, "images/chefholder.png", "chefDin", 1)
chefDess = Hero.create(1000, 1, "images/chefholder.png", "chefDess", 2)
--joe = Hero.create(1000, 1, "penguinknight1.png", "joe")
myHeroes = {}
myHeroes[0]=chefB
myHeroes[1]=chefDin
myHeroes[2]=chefDess
--myHeroes[3]=joe