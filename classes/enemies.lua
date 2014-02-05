Enemy = {}
Enemy.__index = Enemy

function Enemy.create(name, health, attack, speed, defense, image, maxHealth, type, pointValue, category)
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
        enemy.pointValue = pointValue
        enemy.category = category
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
        newE.pointValue = oldE.pointValue
        newE.category = oldE.category
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


-- THE 5 CATEGORIES: BREAKFAST, DINNER, DESSERT, BASIC, BAD.
--create and use enemy
-- basic ingredients
egg = Enemy.create("egg", 5, 1, 1, 1, "images/egg.png", 5, "egg", 5, "basic")
steak = Enemy.create ("steak", 6, 1, 1, 1, "images/steak.png", 5, "steak", 5, "basic")
strawberry = Enemy.create("strawberry", 7, 1, .85, 3, "images/strawberry.png", 7, "strawberry", 5, "basic")
flour = Enemy.create("flour", 7, 2, .9, 2, "images/flour.png", 7, "flour", 5, "basic")
potato = Enemy.create("potato", 7, 2, .9, 2, "images/potato.png", 7, "potato", 5, "basic")
oil = Enemy.create("oil", 7, 2, .9, 2, "images/fryer.png", 7, "oil", 5, "basic")
sugar = Enemy.create("sugar", 7, 2, .9, 2, "images/sugar.png", 7, "sugar", 5, "basic")

--combinations
bad = Enemy.create("Bad", 5, 2, 1.1, 3, "images/BombGreen.png", 5, "bad", -3, "bad")
pancake = Enemy.create("Pancake", 5, 2, 1.1, 3, "images/pancake.png", 5, "pancake", 10, "breakfast")
donut = Enemy.create ("Donut", 5, 2, 1.1, 3, "images/donut.png", 5, "donut", 10, "breakfast")
cake = Enemy.create ("Cake", 5, 2, 1.1, 3, "images/Cake.png", 5, "cake", 10, "dessert")
CFS = Enemy.create ("CFS", 5, 2, 1.1, 3, "images/CFS.png", 5, "CFS", 10, "dinner")
croquette = Enemy.create ("Croquette", 5, 2, 1.1, 3, "images/croquette.png", 5, "croquette",10, "dinner")
fries = Enemy.create ("Fries", 5, 2, 1.1, 3, "images/fries.png", 5, "fries",10, "dinner")
mashed = Enemy.create ("Mashed", 5, 2, 1.1, 3, "images/MashPotato.png", 5, "mashed",10, "dinner")
meringue = Enemy.create ("Meringue", 5, 2, 1.1, 3, "images/meringue.png", 5, "meringue",10, "dessert")
scrambledPotato = Enemy.create ("ScrambledPotato", 5, 2, 1.1, 3, "images/scrambledPotato.png", 5, "scrambledPotato",10, "breakfast")
steakBaked = Enemy.create ("SteakBaked", 5, 2, 1.1, 3, "images/steakbaked.png", 5, "steakBaked",10, "dinner")
steakOm = Enemy.create ("Steak Omelette", 5, 2, 1.1, 3, "images/SteakOm.png", 5, "steakOm",10,"breakfast")
strawberryCandy = Enemy.create ("Strawberry Candy", 5, 2, 1.1, 3, "images/StrawberryCandy.png", 5, "strawberryCandy",10, "dessert")
strawberryTart = Enemy.create ("Strawberry Tart", 5, 2, 1.1, 3, "images/StrawberryTart.png", 5, "strawberryTart",10, "dessert")

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