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
   hero.abilityUsed = false
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
				print("left "..hero.name)
			elseif (event.x - event.xStart ~= 0 and event.x - event.xStart > 7) then
				print("right "..hero.name)
			--checks if the touch didn't move from original position. Meaning that it was a tap
			elseif (event.x - event.xStart == 0) then
				print ( hero.name )
				if (hero.abilityUsed == false) then
					print(hero.abilityUsed )
					print("ability used!")
					hero.abilityUsed = true
				elseif (hero.abilityUsed == true) then
					print(hero.abilityUsed)
					print("cooling down")
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
	return newH
end

-- create and use an Hero
lapis = Hero.create(1000, 1, "siren.png", "lapis")
norienne = Hero.create(1000, 1, "archer.png", "norienne")
sun = Hero.create(1000, 1, "monkeyking.png", "sun")
joe = Hero.create(1000, 1, "penguinknight1.png", "joe")
myHeroes = {}
myHeroes[0]=lapis
myHeroes[1]=norienne
myHeroes[2]=sun
myHeroes[3]=joe