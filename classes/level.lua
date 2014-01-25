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

function Level:startLevel(levelID,levelDifficulty, totalNumberOfEnemies, victoryCondition, backgroundImage)

end

function Level:startSpawningofEnemies (timeBetweenEachSpawn, enemyIDQueue)

end

function Level:endLevel(levelCompleted)

end