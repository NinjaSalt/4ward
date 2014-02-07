require("classes.enemies")

TimeLine = {}
TimeLine.__index = TimeLine


local timeLineWidth = 400

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
		timeLine.enemyQueue[i] = display.newImage(myEnemies[enemyIDQueue[i]].image)
		timeLine.enemyQueue[i].y = 300
		timeLine.enemyQueue[i].x = (480-timeLineWidth)/2 + (timeLine.spawnTimes[i]/timeLine.spawnTimes[#timeLine.spawnTimes])*timeLineWidth
		
		timeLine.enemyQueue[i].width = 24
		timeLine.enemyQueue[i].height = 24
	end
	return timeLine
end


--480, 320     game dimensions