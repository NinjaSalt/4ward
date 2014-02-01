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
	local timeComplete = ((25000*((x-50)/380))*speed)/speedMod
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
-- basic ingredients
egg = Enemy.create("egg", 5, 1, 1, 1, "images/egg.png", 5, "egg")
steak = Enemy.create ("steak", 6, 1, 1, 1, "images/steak.png", 5, "steak")
strawberry = Enemy.create("strawberry", 7, 1, .85, 3, "images/strawberry.png", 7, "strawberry")

-- placeholders
flour = Enemy.create("flour", 7, 2, .9, 2, "images/flour.png", 7, "flour")
potato = Enemy.create("potato", 7, 2, .9, 2, "images/potato.png", 7, "potato")
oil = Enemy.create("oil", 7, 2, .9, 2, "images/fryer.png", 7, "oil")
sugar = Enemy.create("sugar", 7, 2, .9, 2, "images/sugar.png", 7, "sugar")

--combinations
bad = Enemy.create("GreenBomb", 5, 2, 1.1, 3, "images/BombGreen.png", 5, "bad")
pancake = Enemy.create("pancake", 5, 2, 1.1, 3, "images/pancake.png", 5, "pancake")
donut = Enemy.create ("donut", 5, 2, 1.1, 3, "images/donut.png", 5, "donut")
cake = Enemy.create ("cake", 5, 2, 1.1, 3, "images/Cake.png", 5, "cake")
CFS = Enemy.create ("CFS", 5, 2, 1.1, 3, "images/CFS.png", 5, "CFS")
croquette = Enemy.create ("croquette", 5, 2, 1.1, 3, "images/croquette.png", 5, "croquette")
fries = Enemy.create ("fries", 5, 2, 1.1, 3, "images/fries.png", 5, "fries")
mashed = Enemy.create ("mashed", 5, 2, 1.1, 3, "images/MashPotato.png", 5, "mashed")
meringue = Enemy.create ("meringue", 5, 2, 1.1, 3, "images/meringue.png", 5, "meringue")
scrambledPotato = Enemy.create ("scrambledPotato", 5, 2, 1.1, 3, "images/scrambledPotato.png", 5, "scrambledPotato")
steakBaked = Enemy.create ("steakBaked", 5, 2, 1.1, 3, "images/steakbaked.png", 5, "steakBaked")
steakOm = Enemy.create ("steakOm", 5, 2, 1.1, 3, "images/SteakOm.png", 5, "steakOm")
strawberryCandy = Enemy.create ("strawberryCandy", 5, 2, 1.1, 3, "images/StrawberryCandy.png", 5, "strawberryCandy")
strawberryTart = Enemy.create ("strawberryTart", 5, 2, 1.1, 3, "images/StrawberryTart.png", 5, "strawberryTart")

myEnemies = {}
myEnemies[0] = egg
myEnemies[1] = flour
myEnemies[2] = steak
myEnemies[3] = strawberry
myEnemies[4] = oil
myEnemies[5] = potato
myEnemies[6] = sugar

comboEnemies = {}
--myEnemies[2] = pinkBomb
--myEnemies[3] = greenBomb
--combo enemies that shouldn't be spawning
comboEnemies[0] = bad
comboEnemies[1] = pancake 
comboEnemies[2] = donut 
comboEnemies[3] = cake
comboEnemies[4] = CFS
comboEnemies[5] = croquette
comboEnemies[6] = fries
comboEnemies[7] = mashed
comboEnemies[8] = meringue
comboEnemies[9] = scrambledPotato
comboEnemies[10] = steakBaked
comboEnemies[11] = steakOm
comboEnemies[12] = strawberryCandy
comboEnemies[13] = strawberryTart