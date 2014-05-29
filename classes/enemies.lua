Enemy = {}
Enemy.__index = Enemy

function Enemy.create(name, health, attack, speed, defense, image, maxHealth, type, category, comboText)
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
        enemy.category = category
        enemy.comboText = comboText
        return enemy
end

-- "create functions for enemies: dying, abilties"

--ability, just a very temporary placeholder until enemy abilties are decided.
function enemyAbility( event )
        local enemy = event.target
        if event.phase == "began" then
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

--[[function updateEnemyHealth()
	for i=1, table.maxn( allEne ) do
		if ( allEnemHealth[i].y == nil ) then  --make sure the first object exists
		  break
	    end
		allEnemHealth[i].width = allEne[i].health/allEne[i].maxHealth * 50
		allEnemHealth[i].y = allEne[i].y - 25
		allEnemHealth[i].x = allEne[i].x
	end
end]]--


-- THE 5 CATEGORIES: BREAKFAST, DINNER, DESSERT, BASIC, BAD.
--create and use enemy
-- basic ingredients
local speed = 1
egg = Enemy.create("Egg", 10, 1, speed, 4, "images/egg.png", 10, "egg", "basic", "Egg")
steak = Enemy.create ("Steak", 10, 1, speed, 4, "images/steak.png", 10, "steak", "basic", "Steak")
strawberry = Enemy.create("Strawberry", 10, 1, speed, 4, "images/strawberry.png", 10, "strawberry", "basic", "Strawberry")
flour = Enemy.create("Flour", 10, 2, speed, 4, "images/flour.png", 10, "flour", "basic", "Flour")
potato = Enemy.create("Potato", 10, 2,speed, 4, "images/potato.png", 10, "potato", "basic", "Potato")
oil = Enemy.create("Oil", 10, 2, speed, 4, "images/fryer.png", 10, "oil", "basic", "Oil")
sugar = Enemy.create("Sugar", 10, 2, speed, 4, "images/sugar.png", 10, "sugar", "basic", "Sugar")
lemon = Enemy.create("Lemon", 10, 2, speed, 4, "images/lemon.png", 10, "lemon", "basic", "Lemon")

--combinations
bad = Enemy.create("Bad", 5, 2, speed, 4, "images/BombGreen.png", 5, "bad", "bad", "All bad combos")
pancake = Enemy.create("Pancake", 5, 2, speed, 4, "images/pancake.png", 5, "pancake", "breakfast", "Egg + Flour")
donut = Enemy.create ("Donut", 5, 2, speed, 4, "images/donut.png", 5, "donut", "breakfast", "Flour + Oil")
cake = Enemy.create ("Cake", 5, 2, speed, 4, "images/Cake.png", 5, "cake", "dessert", "Flour + Sugar")
CFS = Enemy.create ("Country Fried Steak", 5, 2, speed, 4, "images/CFS.png", 5, "CFS", "dinner", "Steak + Oil")
croquette = Enemy.create ("Croquette", 5, 2, speed, 4, "images/Croquette.png", 5, "croquette","dinner", "Potato + Flour")
fries = Enemy.create ("Fries", 5, 2, speed, 4, "images/fries.png", 5, "fries","dinner", "Potato + Oil")
mashed = Enemy.create ("Mashed Potato", 5, 2,speed, 4, "images/MashPotato.png", 5, "mashed","dinner", "Potato + Potato")
meringue = Enemy.create ("Meringue", 5, 2, speed, 4, "images/Meringue.png", 5, "meringue","dessert", "Egg + Sugar")
scrambledPotato = Enemy.create ("Scrambled Eggs & Potato", 5, 2, speed, 3, "images/scrambledPotato.png", 5, "scrambledPotato","breakfast", "Egg + Potato")
steakBaked = Enemy.create ("Steak & Baked Potato", 5, 2, speed, 4, "images/steakbaked.png", 5, "steakBaked","dinner", "Steak + Potato")
steakOm = Enemy.create ("Steak Omelette", 5, 2, speed, 4, "images/SteakOm.png", 5, "steakOm","breakfast", "Egg + Steak")
strawberryCandy = Enemy.create ("Strawberry Candy", 5, 2, speed, 4, "images/StrawberryCandy.png", 5, "strawberryCandy","dessert", "Strawberry + Sugar")
strawberryTart = Enemy.create ("Strawberry Tart", 5, 2, speed, 4, "images/StrawberryTart.png", 5, "strawberryTart","dessert", "Strawberry + Flour")
lemonCookie = Enemy.create ("Lemon Cookie", 5, 2, speed, 4, "images/lemonCookie.png", 5, "lemonCookie","dessert", "Lemon + Flour")
strawLemonade = Enemy.create ("Strawberry Lemonade", 5, 2, speed, 4, "images/strawLemonade.png", 5, "strawLemonade","breakfast", "Strawberry + Lemon")
lemonSteak = Enemy.create ("Lemon Marinaded Steak", 5, 2, speed, 4, "images/lemonSteak.png", 5, "lemonSteak","dinner", "Lemon + Steak")
lemonCandy = Enemy.create ("Lemon Candy", 5, 2, speed, 4, "images/lemonCandy.png", 5, "lemonCandy","dessert", "Lemon + Sugar")

-- TRIPLE COMBOS
sheperdsPie = Enemy.create("Sheperd's Pie", 5, 2, speed, 4, "images/shepPie.png", 10, "sheperdsPie", "dinner", "Mashed Potato + Steak" )
strawberryCake = Enemy.create("Strawberry Cake", 5, 2, speed, 4, "images/strawberryCake.png", 10, "strawberryCake", "dessert", "Cake + Strawberry" )
steakFries = Enemy.create("Steak and Fries", 5, 2, speed, 4, "images/steakFries.png", 10, "steakFries", "dinner", "Steak + Fries")
strawPancake = Enemy.create("Strawberry Jam Pancake", 5, 2, speed, 4, "images/strJamPancake.png", 10, "strawPancake", "breakfast", "Pancake + Strawberry")
lemonDonut = Enemy.create("Lemon Curd Donut", 5, 2, speed, 4, "images/lemonDonut.png", 10, "lemonDonut", "breakfast", "Donut + Lemon")
lemonCake = Enemy.create("Lemon Cake", 5, 2, speed, 4, "images/lemonCake.png", 10, "lemonCake", "dessert", "Cake + Lemon")
lemonPie = Enemy.create("Lemon Meringue Pie", 5, 2, speed, 4, "images/lemonPie.png", 10, "lemonPie", "dessert", "Meringue + Lemon")


myEnemies = {}
myEnemies[0] = egg
myEnemies[1] = flour
myEnemies[2] = steak
myEnemies[3] = strawberry
myEnemies[4] = oil
myEnemies[5] = potato
myEnemies[6] = sugar
myEnemies[7] = lemon

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
comboEnemies[14] = lemonCookie
comboEnemies[15] = strawLemonade
comboEnemies[16] = lemonSteak
comboEnemies[17] = lemonCandy

-- triple combos
comboEnemies[18] = sheperdsPie
comboEnemies[19] = strawberryCake
comboEnemies[20] = steakFries
comboEnemies[21] = strawPancake 
comboEnemies[22] = lemonDonut
comboEnemies[23] = lemonCake
comboEnemies[24] = lemonPie
