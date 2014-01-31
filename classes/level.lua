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
   return level
end

function Level.load(levelID)
	return levels[levelID]
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


levels = {}
levels[1] = {}
levels[1] = Level.create(1, 0, {1,0,1,0}, 1500)