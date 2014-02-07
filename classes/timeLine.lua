require("classes.enemies")

TimeLine = {}
TimeLine.__index = TimeLine


local timeLineWidth = 480
local enemySize = 20

function TimeLine.create(enemyIDQueue, timeBetweenEachSpawn)
	local timeLine = {}
	setmetatable(timeLine, TimeLine)
	timeLine.spawnTimes = {}
	timeLine.enemyQueue = {}
	timeLine.spawnTimes[1] = timeBetweenEachSpawn[1]
	for i = 2, #timeBetweenEachSpawn, 1 do
		timeLine.spawnTimes[i] = timeBetweenEachSpawn[i]+timeLine.spawnTimes[i-1]
	end
	for i = 1, #enemyIDQueue, 1 do
		print(timeLine.spawnTimes[i])
		timeLine.enemyQueue[i] = display.newImage(myEnemies[enemyIDQueue[i]].image)
		timeLine.enemyQueue[i].y = 306
		--timeLine.enemyQueue[i].x = (480-timeLineWidth)/2 + (timeLine.spawnTimes[i]/timeLine.spawnTimes[#timeLine.spawnTimes])*timeLineWidth - enemySize/2
		timeLine.enemyQueue[i].x = (timeLine.spawnTimes[i]/timeLine.spawnTimes[#timeLine.spawnTimes])*timeLineWidth - enemySize/2
		
		timeLine.enemyQueue[i].width = enemySize
		timeLine.enemyQueue[i].height = enemySize
	end
	return timeLine
end


--480, 320     game dimensions


--transition.to( allEne[#allEne], { time=(moveSpeed(allEne[#allEne].x, allEne[#allEne].speed, allEne[#allEne].y)), x=(50) ,tag="animation"}  )
--bullet.transition = transition.to( bullet, {x=500, time=bt, onComplete=remove_bullet, tag="animation"} )