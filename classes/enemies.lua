Enemy = {}
Enemy.__index = Enemy

function Enemy.create(name, health, attack, speed, defense, image, maxHealth, type)
        local enemy = {}                                --new object
        setmetatable( enemy, Enemy )        --make Enemy
        enemy.name = name                                 --initialize object
        enemy.health = health
        enemy.attack = attack
        enemy.speed = speed
        enemy.defense = defense
        enemy.image = image
        enemy.maxHealth = maxHealth
        enemy.class = "enemy"
        enemy.type = type
        return enemy
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
        end
		if (enemy.health <= 0) then
                enemy:removeSelf( )
        end
end

function passValuesToNewEne(newE, oldE)
        newE.name = oldE.name
        newE.health = oldE.health
        newE.attack = oldE.attack
        newE.speed = oldE.speed
        newE.defense = oldE.defense
        newE.image = oldE.image
        newE.class = oldE.class
        newE.maxHealth= oldE.maxHealth
        newE.type = oldE.type
        return newE
end

function moveSpeed( x, speed, lane )
	local laneSpeed
	for i = 0,table.maxn( hero ) do
		if ( hero[i].y == lane ) then
			if (hero[i].laneSpeed == 1) then speedMod = .5
			elseif (hero[i].laneSpeed == 2) then speedMod = 1
			elseif (hero[i].laneSpeed == 3) then speedMod = 2
			end
		end
	end
	local timeComplete = ((30000*((x-50)/380))*speed)/speedMod
	return timeComplete
end

function updateMoveSpeed (myHero)
	for i = 1,table.maxn( allEne ) do
		if (allEne[i].y==myHero.y) then
			transition.cancel(allEne[i])
			transition.to( allEne[i], { time=(moveSpeed(allEne[i].x, allEne[i].speed, allEne[i].y)), x=(50) } )
		end
	end
end

function updateEnemyHealth()
	for i=1, table.maxn( allEne ) do
		if ( allEnemHealth[i].y == nil ) then  --make sure the first object exists
		  break
	    end
		allEnemHealth[i].width = allEne[i].health/allEne[i].maxHealth * 50
		allEnemHealth[i].y = allEne[i].y - 25
		allEnemHealth[i].x = allEne[i].x
	end
end
--create and use enemy
babyBlue = Enemy.create("BabyBlue", 5, 1, 1, 1, "images/BombBabyBlue.png", 5, "egg")
darkBlue = Enemy.create("DarkBlue", 7, 2, .9, 2, "images/BombDarkBlue.png", 7, "flour")
--pinkBomb = Enemy.create("PinkBomb", 5, 2, 1.1, 3, "images/BombPink.png", 5, "potato")
--greenBomb = Enemy.create("GreenBomb", 7, 1, .85, 3, "images/BombGreen.png", 7, "strawberry")
pancake = Enemy.create("PinkBomb", 5, 2, 1.1, 3, "images/BombPink.png", 5, "pancake")
bad = Enemy.create("GreenBomb", 5, 2, 1.1, 3, "images/BombGreen.png", 5, "bad")
myEnemies = {}
myEnemies[0] = babyBlue
myEnemies[1] = darkBlue

comboEnemies = {}
--myEnemies[2] = pinkBomb
--myEnemies[3] = greenBomb
--combo enemies that shouldn't be spawning
comboEnemies[0] = pancake
comboEnemies[1] = bad 