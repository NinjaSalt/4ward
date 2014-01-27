Level = {}
Level.__index = Level

function Level.create(levelID, levelDifficulty, totalNumberOfEnemies, enemiesDestroyed, victoryCondition, enemyIDQueue, timeBetweenEachSpawn, levelCompleted, backgroundImage)
   local level = {}             -- our new object
   setmetatable(level,Level)  -- make Level handle lookup
   level.levelID = levelID
   level.levelDifficulty  = levelDifficulty
   level.totalNumberOfEnemies = totalNumberOfEnemies
   level.enemiesDestroyed = enemiesDestroyed
   level.victoryCondition = victoryCondition
   level.enemyIDQueue = enemyIDQueue
   level.timeBetweenEachSpawn = timeBetweenEachSpawn
   level.levelCompleted = levelCompleted
   level.backgroundImage = backgroundImage
   return level
end

function Level:startLevel(spawnEne)
	self:startSpawningofEnemies(spawnEne)
end

function Level:startSpawningofEnemies (spawnEne)
	spawnEneTimer = timer.performWithDelay( self.timeBetweenEachSpawn, spawnEne, self.totalNumberOfEnemies )
end

function Level:endLevel(levelCompleted)
	if levelCompleted ~= nil then
		self.levelCompleted = levelCompleted
	end
	if self.levelCompleted == true then
		print("You win!")
	else print("You lose!")
	end
	timer.cancel(attackTimer)
	timer.cancel(spawnEneTimer)
end

function Level:decrementEnemy()
	if self.totalNumberOfEnemies ~= -1 then
		self.totalNumberOfEnemies = self.totalNumberOfEnemies -1
	end
end