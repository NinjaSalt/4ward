Level = {}
Level.__index = Level

function Level.create(levelID, victoryCondition, enemyIDQueue, timeBetweenEachSpawn, categoryCondition, scoreCondition, levelTitle)
   local level = {}             -- our new object
   setmetatable(level,Level)  -- make Level handle lookup
   level.levelID = levelID
   level.victoryCondition = victoryCondition
   level.enemyIDQueue = {}
   level.enemyIDQueue = enemyIDQueue
   level.totalNumberOfEnemies = #(enemyIDQueue)
   level.enemiesAlive = level.totalNumberOfEnemies
   level.timeBetweenEachSpawn = timeBetweenEachSpawn
   level.spawnCounter = 0
   level.stars = 0
   level.spawnEneTimer = {}
   level.categoryCondition = categoryCondition
   level.scoreCondition = scoreCondition
   level.levelTitle = levelTitle
   return level
end

function Level.load(world, levelID)
	local level = {}
   setmetatable(level,Level)  -- make Level handle lookup
   level = display.newRect(0,0,0,0)
   level.levelID = levelID
   level.victoryCondition = (levels[world][levelID]).victoryCondition
   level.enemyIDQueue = {}
   level.enemyIDQueue = levels[world][levelID].enemyIDQueue
   level.totalNumberOfEnemies = levels[world][levelID].totalNumberOfEnemies
   level.enemiesAlive = levels[world][levelID].enemiesAlive
   level.timeBetweenEachSpawn = levels[world][levelID].timeBetweenEachSpawn
   level.spawnCounter = 0
   level.stars = levels[world][levelID].stars
   level.spawnEneTimer = {}
   level.categoryCondition = (levels[world][levelID]).categoryCondition
   level.scoreCondition = (levels[world][levelID]).scoreCondition
   level.levelTitle = (levels[world][levelID]).levelTitle
   return level
end

function startLevel(level)
print("#enemies:"..level.totalNumberOfEnemies)
	spawnEneTimer = timer.performWithDelay( level.timeBetweenEachSpawn[1], function() spawnNextEnemy(level) end)
end

function decrementEnemy(level)
	if level.totalNumberOfEnemies ~= -1 then
		level.totalNumberOfEnemies = level.totalNumberOfEnemies -1
	end
end

function incrementEnemy(level)
	level.totalNumberOfEnemies = level.totalNumberOfEnemies +1
end

--function Level:spawnNextEnemy()
function spawnNextEnemy(level)
	level.spawnCounter = level.spawnCounter + 1
	spawnEne(level.enemyIDQueue[level.spawnCounter])
	--See if there are more enemies, if so recursively call the timer
	if ( #(level.enemyIDQueue)~= level.spawnCounter ) then
		spawnEneTimer = timer.performWithDelay( level.timeBetweenEachSpawn[level.spawnCounter+1], function() spawnNextEnemy(level) end)
	end
end


function makeSecondaryWin( enemy, amount )
	local secondaryWin = {}
	secondaryWin.enemy = enemy
	secondaryWin.amount = 1
	secondaryWin.memAmount = amount
	secondaryWin.conditionMet = false
	return secondaryWin
end

-- makes category conditions. (i.e. Make two breakfast items.)
function makeCatWin(ntype, amount)
   local catWin = {}
   catWin.type = ntype
   catWin.amount = 1
   catWin.memAmount = amount
   catWin.success= false
   return catWin
end

-- makes minimum score conditions.
function makeScoreWin (score)
   local scoreWin = {}
   scoreWin.score = 1
   scoreWin.memScore= score
   scoreWin.success = false
   return scoreWin
end

levels = {}
levels[1] = {}
levels[2] = {}
levels[3] = {}

-- the victoryCondition is either zero for a normal level or 1 for a secondary objective
-- the secondary objective is made up of the food and then how many, for example {1,{1,1},false} means they have to make 1 pancake
-- the time between signifies the time that the next enemy will take to spawn
--levels[1] = Level.create(1, makeSecondaryWin(pancake,1), {1,4,1,0,5,2}, {2000,2000,2000,2000,2000,2000})

-- Note: Enemies must be spaced out at least 2545 ms to prevent automatic collisions

--use as reference to create enemies
--myEnemies[0] = egg
--myEnemies[1] = flour
--myEnemies[2] = steak
--myEnemies[3] = strawberry
--myEnemies[4] = oil
--myEnemies[5] = potato
--myEnemies[6] = sugar
-- end reference


-- WORLDS ARE "EPISODES", LEVELS ARE "CHALLENGES"

-- EPISODE ONE: On the Set of Now We're Cooking!
-- Can you Cook? (2 items)
levels[1][1] = Level.create(1, makeSecondaryWin(pancake,1), {1,0}, {1000,6001}, false, makeScoreWin(10), "Step 1: Can you Cook?")
-- Can You Really Cook? (2 items)
levels[1][2] = Level.create(2, makeSecondaryWin(pancake,1), {1,0}, {200,6500}, false, makeScoreWin(10), "Step 2: Can You Really Cook?")
-- Meal Maker (2 Items)
levels[1][3] = Level.create(3, makeSecondaryWin(steakBaked,1), {2,5}, {200,6300}, false, makeScoreWin(10), "Step 3: Meal Maker")
-- Rise and Shine (3 Items)
levels[1][4] = Level.create(4, false, {0,5,0}, {300,2600,2600}, makeCatWin("breakfast",1), makeScoreWin(10), "Step 4: Rise and Shine")
-- Donut Mess Up! (4 Items)
levels[1][5] = Level.create (5, makeSecondaryWin(donut, 1), {1,4,1,0}, {300,3000,3000,3000}, makeCatWin("breakfast",2), false, "Step 5: Donut Mess Up!")
-- [Unnammed Level] (6 Items)
levels[1][6] = Level.create (6, false, {0,1,2,5,2,5}, {500,3000,3000,3000,3000,3000}, makeCatWin("dinner",1), makeScoreWin(40), "Step 6: [Unnammed Level]")
-- Your Life is at Steak! (8 items)
levels[1][7] = Level.create(7, makeSecondaryWin(steakOm,1), {0,2,0,1,1,4,2,0}, {500,3000,3000,3000,3000,3000,3000,3000}, false, makeScoreWin(40), "Step 7: Your Life is at Steak!")
-- The Most Important Meal of the Day (10 items)
levels[1][8] = Level.create(8, false, {0,1,5,0,5,1,2,0,5,0}, {500,3000,3000,3000,3000,3000,3000,3000,2600,2600}, makeCatWin("breakfast", 2), makeScoreWin(60), "Step 8: Most Important Meal")
-- I Say Potato (10 items)
levels[1][9] = Level.create(9, makeSecondaryWin(mashed,2), {2,5,4,5,5,2,5,4,0,5}, {500,3000,3000,2600,3000,2600,3000,3000,2600,3100}, makeCatWin("dinner", 3), false, "Step 9: I Say Potato")
-- Certi-fried Chef! (14 items)
levels[1][10] = Level.create(10, makeSecondaryWin(fries, 4), {1,4,5,5,0,1,4,2,5,4,2,4,1,5}, {300,2600,2600,3100,3100,3000,3000,2800,3100,3000,3000,3200,2600,2600}, false, makeScoreWin(100), "Step 10: Certi-fried Chef!")

-- EPISODE TWO: CANDY STORE CRAZE
-- Taste Test (10 items)
levels[2][1] = Level.create(1, false, {0,6,1,6,5,1,0,6,6,1}, {300,2600,2600,4000,3000,3000,2600,2600,2600, 2600}, makeCatWin("dessert", 3), makeScoreWin(120), "Step 1: Taste Test") 
-- Cake and Bake (10 items)
levels[2][2] = Level.create(2, makeSecondaryWin(cake,3), {5,1,6,4,6,6,1,1,6,0}, {300,3100,3100,2600,4500,2600,2600,2600,3000,3000}, false, makeScoreWin(140), "Step 2: Cake and Bake") 
-- Super Sugar Rush! (14 items)
levels[2][3] = Level.create(3, makeSecondaryWin(strawberryCandy,2), {0,3,2,6,6,1,3,6,1,5,1,3,0,6}, {300,3100,3100,2600,4500,2600,2600,2600,3000,3000,3000,100,3000,3000}, makeCatWin("dessert", 4), false, "Step 3: Super Sugar Rush!")
-- Strawberries of Wrath (14 items)
levels[2][4] = Level.create(4, makeSecondaryWin(strawberryTart, 4), {1,3,3,1,2,1,6,3,3,6,6,1,1,1}, {300,2600,2700,2600,2600,2700,2700,2600,2600,2600,2600,2600,2600,2600}, false, makeScoreWin(250), "Step 4: Strawberries of Wrath")
-- The Sweetest Treat! (20 items)
levels[2][5] = Level.create(5, makeSecondaryWin(strawberryCake, 3), {0,3,6,1,2,0,1,3,6,6,3,5,1,3,6,3,1,6,0,1}, {300,2600,2600,3500,3500,3500,2600,2600,3500,3200,3000,3000,2800,2800,2800,2800,3100,3000,3000,2600}, makeCatWin("dessert", 7), false, "Step 5: The Sweetest Treat!")

--EPISODE 3
levels[3][1] = Level.create(1, false, {1,4}, {500,500}, false, false, "Title")
levels[3][2] = Level.create(2, false, {1,2}, {500,500}, false, false, "Title")
levels[3][3] = Level.create(3, false, {1,2}, {500,500}, false, false, "Title")
levels[3][4] = Level.create(4, false, {1,2}, {500,500}, false, false, "Title")