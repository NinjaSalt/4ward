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

function Level:startLevel()
print("#enemies:"..self.totalNumberOfEnemies)
	self.spawnEneTimer = timer.performWithDelay( self.timeBetweenEachSpawn, self, self.totalNumberOfEnemies )
end

function Level:endLevel(levelCompleted)
	if levelCompleted == true then
		print("You win!")
	else print("You lose!")
	end
	self.spawnCounter = 0
end

function Level:decrementEnemy()
	if self.totalNumberOfEnemies ~= -1 then
		self.totalNumberOfEnemies = self.totalNumberOfEnemies -1
	end
end

--function Level:spawnNextEnemy()
function Level:timer(event)
	self.spawnCounter = self.spawnCounter + 1
	spawnEne(self.enemyIDQueue[self.spawnCounter])
	self.timeBetweenEachSpawn = 500
	print ("Hi")
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
levels[1] = {}
levels[1] = Level.create(1, 0, {1,4,1,0,5,2}, 2000)