Enemy = {}
Enemy.__index = Enemy

function Enemy.create(name, health, attack, speed, defense, image, maxHealth, type, pointValue, category, comboText)
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
        enemy.comboText = comboText
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
        newE.comboText = oldE.comboText
        return newE
end

function moveSpeed( x, speed, lane )
	local laneSpeed
	for i = 0,table.maxn( hero ) do
		if ( hero[i].y == lane ) then
			if (hero[i].laneSpeed == 1) then speedMod = 6
			elseif (hero[i].laneSpeed == 2) then speedMod = 2.5
			elseif (hero[i].laneSpeed == 3) then speedMod = .5
			end
		end
	end
	local timeComplete = ((39000*((x-50)/380))*speed)/speedMod
	return timeComplete
end

function updateMoveSpeed (myHero)
	for i = 1,table.maxn( allEne ) do
		if (allEne[i].y==myHero.y) then
			transition.cancel(allEne[i])
			transition.to( allEne[i], { time=(moveSpeed(allEne[i].x, allEne[i].speed, allEne[i].y)), x=(50), tag = "animation" } )
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
local speed = 1
egg = Enemy.create("Egg", 10, 1, speed, 4, "images/egg.png", 10, "egg", 5, "basic", "Egg")
steak = Enemy.create ("Steak", 10, 1, speed, 4, "images/steak.png", 10, "steak", 5, "basic", "Steak")
strawberry = Enemy.create("Strawberry", 10, 1, speed, 4, "images/strawberry.png", 10, "strawberry", 5, "basic", "Strawberry")
flour = Enemy.create("Flour", 10, 2, speed, 4, "images/flour.png", 10, "flour", 5, "basic", "Flour")
potato = Enemy.create("Potato", 10, 2,speed, 4, "images/potato.png", 10, "potato", 5, "basic", "Potato")
oil = Enemy.create("Oil", 10, 2, speed, 4, "images/fryer.png", 10, "oil", 5, "basic", "Oil")
sugar = Enemy.create("Sugar", 10, 2, speed, 4, "images/sugar.png", 10, "sugar", 5, "basic", "Sugar")

--combinations
bad = Enemy.create("Bad", 5, 2, speed, 4, "images/BombGreen.png", 5, "bad", 2, "bad", "All bad combos")
pancake = Enemy.create("Pancake", 5, 2, speed, 4, "images/pancake.png", 5, "pancake", 10, "breakfast", "Egg + Flour")
donut = Enemy.create ("Donut", 5, 2, speed, 4, "images/donut.png", 5, "donut", 10, "breakfast", "Flour + Oil")
cake = Enemy.create ("Cake", 5, 2, speed, 4, "images/Cake.png", 5, "cake", 10, "dessert", "Flour + Sugar")
CFS = Enemy.create ("Country Fried Steak", 5, 2, speed, 4, "images/CFS.png", 5, "CFS", 10, "dinner", "Steak + Oil")
croquette = Enemy.create ("Croquette", 5, 2, speed, 4, "images/Croquette.png", 5, "croquette",10, "dinner", "Potato + Flour")
fries = Enemy.create ("Fries", 5, 2, speed, 4, "images/fries.png", 5, "fries",10, "dinner", "Potato + Oil")
mashed = Enemy.create ("Mashed Potato", 5, 2,speed, 4, "images/MashPotato.png", 5, "mashed",10, "dinner", "Potato + Potato")
meringue = Enemy.create ("Meringue", 5, 2, speed, 4, "images/Meringue.png", 5, "meringue",10, "dessert", "Egg + Sugar")
scrambledPotato = Enemy.create ("Scrambled Eggs & Potato", 5, 2, speed, 3, "images/scrambledPotato.png", 5, "scrambledPotato",10, "breakfast", "Egg + Potato")
steakBaked = Enemy.create ("Steak & Baked Potato", 5, 2, speed, 4, "images/steakbaked.png", 5, "steakBaked",10, "dinner", "Steak + Potato")
steakOm = Enemy.create ("Steak Omelette", 5, 2, speed, 4, "images/SteakOm.png", 5, "steakOm",10,"breakfast", "Egg + Steak")
strawberryCandy = Enemy.create ("Strawberry Candy", 5, 2, speed, 4, "images/StrawberryCandy.png", 5, "strawberryCandy",10, "dessert", "Strawberry + Sugar")
strawberryTart = Enemy.create ("Strawberry Tart", 5, 2, speed, 4, "images/StrawberryTart.png", 5, "strawberryTart",10, "dessert", "Strawberry + Sugar")

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