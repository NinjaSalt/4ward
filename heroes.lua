Hero = {}
Hero.__index = Hero

function Hero.create(health, attack, image)
   local hero = {}             -- our new object
   setmetatable(hero,Hero)  -- make Hero handle lookup
   hero.health = health      -- initialize our object
   hero.attack = attack
   hero.image = image
   hero.class = "hero"
   return hero
end

function Hero:upgradeH(amount)
   self.health = self.health + amount
end

-- create and use an Hero
lapis = Hero.create(1000, 1, "siren.png")
norienne = Hero.create(1000, 1, "archer.png")
sun = Hero.create(1000, 1, "monkeyking.png")
joe = Hero.create(1000, 1, "penguinknight1.png")
myHeroes = {}
myHeroes[0]=lapis
myHeroes[1]=norienne
myHeroes[2]=sun
myHeroes[3]=joe