Hero = {}
Hero.__index = Hero

function Hero.create(health, attack, image, name)
   local hero = {}             -- our new object
   setmetatable(hero,Hero)  -- make Hero handle lookup
   hero.health = health      -- initialize our object
   hero.attack = attack
   hero.image = image
   hero.name = name
   hero.class = "hero"
   hero.laneSpeed = 2
   hero.abilityUsed = false
   hero.timer = 50
   return hero
end

function Hero:upgradeH( amount )
   self.health = self.health + amount
end

function ability( event )
	local hero = event.target
	local heroX = event.x
	local phase = event.phase
	local stage = display.getCurrentStage()
	local markY = hero.y
	if event.phase == "began" then
		stage:setFocus( hero, event.id )
		hero.isFocus = true
	elseif hero.isFocus then
		if "ended" == phase or "cancelled" == phase then
			stage:setFocus( hero, nil )
			hero.isFocus = false
			--checks if the touch moved either left or right
			if (event.x - event.xStart ~= 0 and event.x - event.xStart < -7) then
				if ( hero.laneSpeed ~=1 ) then
					hero.laneSpeed = hero.laneSpeed-1
					updateMoveSpeed(hero)
					hero.abilityUsed = true
				end
			elseif (event.x - event.xStart ~= 0 and event.x - event.xStart > 7) then
				if ( hero.laneSpeed ~=3 ) then
					hero.laneSpeed = hero.laneSpeed+1
					updateMoveSpeed(hero)
					hero.abilityUsed = true
				end
			--checks if the touch didn't move from original position. Meaning that it was a tap
			elseif (event.x - event.xStart == 0) then
				print ( hero.name )
				if (hero.abilityUsed == false) then
					hero.abilityUsed = true
				elseif (hero.abilityUsed == true) then
					hero.abilityUsed = false
				end
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
	return newH
end

function updateHeroHealth(heroHealth)
	for i=0, 2, 1 do
		allHeroHealth[i].width = heroHealth/3 * 50
	end
end

-- create and use an Hero
lapis = Hero.create(1000, 1, "images/ramsey.png", "lapis")
norienne = Hero.create(1000, 1, "images/giada.png", "norienne")
sun = Hero.create(1000, 1, "images/brown.png", "sun")
--joe = Hero.create(1000, 1, "penguinknight1.png", "joe")
myHeroes = {}
myHeroes[0]=lapis
myHeroes[1]=norienne
myHeroes[2]=sun
--myHeroes[3]=joe