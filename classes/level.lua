Level = {}
Level.__index = Level

function Level.create(levelID, victoryCondition, enemyIDQueue, timeBetweenEachSpawn)
   local level = {}             -- our new object
   setmetatable(level,Level)  -- make Level handle lookup
   level.levelID = levelID
   level.enemyIDQueue = {}
   level.enemyIDQueue = enemyIDQueue
   level.totalNumberOfEnemies = #(enemyIDQueue)
   level.enemiesAlive = level.totalNumberOfEnemies
   level.timeBetweenEachSpawn = timeBetweenEachSpawn
   level.spawnCounter = 0
   level.spawnEneTimer = {}
   return level
end

function Level.load(levelID)
	local level = {}
   setmetatable(level,Level)  -- make Level handle lookup
   level = display.newRect(0,0,0,0)
	level.levelID = levelID
   level.enemyIDQueue = {}
   level.enemyIDQueue = levels[levelID].enemyIDQueue
   level.totalNumberOfEnemies = levels[levelID].totalNumberOfEnemies
   level.enemiesAlive = levels[levelID].enemiesAlive
   level.timeBetweenEachSpawn = levels[levelID].timeBetweenEachSpawn
   level.spawnCounter = 0
   level.spawnEneTimer = {}
   return level
end

function startLevel(level)
print("#enemies:"..level.totalNumberOfEnemies)
	spawnEneTimer = timer.performWithDelay( level.timeBetweenEachSpawn, function() spawnNextEnemy(level) end, level.totalNumberOfEnemies )
	spawnEneTimer.params = { myLevel = level}
end

function endLevel(level, levelCompleted)
	if levelCompleted == true then
		print("You win!")
	else print("You lose!")
	end
	level.spawnCounter = 0
end

function decrementEnemy(level)
	if level.totalNumberOfEnemies ~= -1 then
		level.totalNumberOfEnemies = level.totalNumberOfEnemies -1
	end
end

--function Level:spawnNextEnemy()
function spawnNextEnemy(level)
	level.spawnCounter = level.spawnCounter + 1
	spawnEne(level.enemyIDQueue[level.spawnCounter])
	level.timeBetweenEachSpawn = 500
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

levels = {}
levels[1] = Level.create(1, 0, {1,4,1,0,5,2}, 2000)