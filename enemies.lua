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
        return newE
end

-- "create functions for enemies: dying, abilties"

--ability, just a very temporary placeholder until enemy abilties are decided.
function enemyAbility( event )
        local enemy = event.target
        if event.phase == "began" then
                print ( enemy.name )
        end
end

--dying/taking damage
function enemyLoseHealth( event ) --check for collision event.
        local enemy = event.target
        if event.phase == "began" then
        enemy.health = enemy.health-10 -- change this once strength/weakness is implemented.
        if (enemy.health <= 0) then
                enemy:removeSelf( )
        end
end

--create and use enemy
babyBlue = Enemy.create("BabyBlue", 5, 1, -20, 1, "BombBabyBlue.png")
darkBlue = Enemy.create("DarkBlue", 7, 2, -22, 2, "BombDarkBlue.png")
pinkBomb = Enemy.create("PinkBomb", 5, 2, -25, 3, "BombPink.png")
greenBomb = Enemy.create("GreenBomb", 7, 1, -18, 3, "BombGreen.png")
myEnemies = {}
myEnemies[0] = babyBlue
myEnemies[1] = darkBlue
myEnemies[2] = pinkBomb
myEnemies[3] = greenBomb