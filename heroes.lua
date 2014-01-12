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
   return hero
end

function Hero:upgradeH( amount )
   self.health = self.health + amount
end
function ability( event )
	local hero = event.target
	if event.phase == "began" then
		print ( hero.name )
	end
end
function makeHero( newH, oldH )
	newH.health = oldH.health      
	newH.attack = oldH.attack
	newH.image = oldH.image
	newH.name = oldH.name
	newH.class = oldH.class
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