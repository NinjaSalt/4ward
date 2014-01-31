Level = {}
Level.__index = Level

local levels = {}
levels[1] = {}
levels[1] = {1, 0, {1,0,1,0}, 3000}

function Level.create(levelID) --victoryCondition, enemyIDQueue, timeBetweenEachSpawn)
   local level = {}             -- our new object
   setmetatable(level,Level)  -- make Level handle lookup
   level.levelID = levelID
   level.enemyIDQueue = {}
   level.enemyIDQueue = levels[levelID][3] --#enemyIDQueue
   level.totalNumberOfEnemies = #(level.enemyIDQueue)
   level.enemiesAlive = level.totalNumberOfEnemies
   level.timeBetweenEachSpawn = levels[levelID][4]
   level.spawnTimer = {}
   level.spawnCounter = 0
   return level
end

function Level:startLevel()
	self.spawnEneTimer = timer.performWithDelay( self.timeBetweenEachSpawn, self, self.totalNumberOfEnemies )
end

function Level:endLevel(levelCompleted)
	if levelCompleted == true then
		print("You win!")
	else print("You lose!")
	end
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
end

