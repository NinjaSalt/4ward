require("classes.enemies")

TimeLine = {}
TimeLine.__index = TimeLine


timeLineWidth = 200
enemySize = 25

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
		timeLine.enemyQueue[i].y = 17--320-enemySize/2
		timeLine.enemyQueue[i].x = 380 --240-timeLineWidth/2 + (timeLine.spawnTimes[i]/timeLine.spawnTimes[#timeLine.spawnTimes])*timeLineWidth - enemySize/2
		--timeLine.enemyQueue[i].x = (timeLine.spawnTimes[i]/timeLine.spawnTimes[#timeLine.spawnTimes])*timeLineWidth - enemySize/2
		
		timeLine.enemyQueue[i].width = enemySize
		timeLine.enemyQueue[i].height = enemySize
	end
	return timeLine
end


function TimeLine.createTimeLineBar()
	local bar = {}
	bar[1] = display.newRect(240-timeLineWidth/2-enemySize/2,320-enemySize/2, enemySize, enemySize)
	bar[1]:setFillColor(.5,.5,.5)
	bar[2] = display.newRect(240+timeLineWidth/2+enemySize/2,320-enemySize/2, enemySize, enemySize)
	bar[2]:setFillColor(.5,.5,.5)
	bar[3] = display.newRect(240,320-enemySize*1.1, timeLineWidth+2*enemySize, enemySize*.2)
	bar[3]:setFillColor(.4,.4,.4)
	return bar
end
--480, 320     game dimensions


--transition.to( allEne[#allEne], { time=(moveSpeed(allEne[#allEne].x, allEne[#allEne].speed, allEne[#allEne].y)), x=(50) ,tag="animation"}  )
--bullet.transition = transition.to( bullet, {x=500, time=bt, onComplete=remove_bullet, tag="animation"} )