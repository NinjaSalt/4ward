Level = {}
Level.__index = Level

function Level.create(levelID, victoryCondition, enemyIDQueue, timeBetweenEachSpawn, categoryCondition, scoreCondition)
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
   return level
end

function Level.load(world, levelID)
	local level = {}
   setmetatable(level,Level)  -- make Level handle lookup
   level = display.newRect(0,0,0,0)
   level.levelID = levelID
   print("levelID: "..levelID)
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

--use as reference to create enemies
--myEnemies[0] = egg
--myEnemies[1] = flour
--myEnemies[2] = steak
--myEnemies[3] = strawberry
--myEnemies[4] = oil
--myEnemies[5] = potato
--myEnemies[6] = sugar
-- end reference
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

--world 1
levels[1][1] = Level.create(1, makeSecondaryWin(pancake,1), {1,0}, {1000,3000}, false, makeScoreWin(10))
levels[1][2] = Level.create(2, false, {1,6,1,6,1,6,1,6,3}, {1000,3000,3000,3000,3000,3000,2600,2600,2600}, makeCatWin("dessert", 3), makeScoreWin(80))
levels[1][3] = Level.create(3, makeSecondaryWin(steakOm,1), {0,6,2,4,3,6,2,0,5,0,2,1}, {500,3000,3000,3000,3000,3000,3000,3000,6000,2600,2600,2600}, false, makeScoreWin(150))
levels[1][4] = Level.create(4, makeSecondaryWin(fries,2), {6,5,2,4,5,4,5,4}, {500,3000,3000,3000,3000,3000,3000,3000}, makeCatWin("dinner",2), false)
levels[1][5] = Level.create(5, makeSecondaryWin(pancake,1), {1,4,1,0,5,2}, {1000,3000,3000,3000,3000,3000}, false, makeScoreWin(120))

--world 2
levels[2][1] = Level.create(1, false, {4,4}, {500,500}, false, false)
levels[2][2] = Level.create(2, false, {1,2}, {500,500}, false, false)
levels[2][3] = Level.create(3, false, {1,2}, {500,500}, false, false)
levels[2][4] = Level.create(4, false, {1,2}, {500,500}, false, false)

--world 3
levels[3][1] = Level.create(1, false, {1,4}, {500,500}, false, false)
levels[3][2] = Level.create(2, false, {1,2}, {500,500}, false, false)
levels[3][3] = Level.create(3, false, {1,2}, {500,500}, false, false)
levels[3][4] = Level.create(4, false, {1,2}, {500,500}, false, false)