Enemy = {}
Enemy.__index = Enemy

function Enemy.create(name, health, attack, speed, defense, image)
        local enemy = {}                                --new object
        setmetatable( enemy, Enemy )        --make Enemy
        enemy.name = name                                 --initialize object
        enemy.health = health
        enemy.attack = attack
        enemy.speed = speed
        enemy.defense = defense
        enemy.image = image
        enemy.class = "enemy"
        return enemy
end

function makeEnemy(newE, oldE)
        newE.name = oldE.name
        newE.health = oldE.health
        newE.attack = oldE.attack
        newE.speed = oldE.speed
        newE.defense = oldE.defense
        newE.image = oldE.image
        newE.class = oldE.class
        return newE
end

--create and use enemy
babyBlue = Enemy.create("BabyBlue", 5, 1, -20, 1, "BombBabyBlue.png")
darkBlue = Enemy.create("DarkBlue", 7, 2, -25, 2, "BombDarkBlue.png")
pinkBomb = Enemy.create("PinkBomb", 5, 2, -30, 3, "BombPink.png")
greenBomb = Enemy.create("GreenBomb", 7, 1, -18, 3, "BombGreen.png")
myEnemies = {}
myEnemies[0] = babyBlue
myEnemies[1] = darkBlue
myEnemies[2] = pinkBomb
myEnemies[3] = greenBomb