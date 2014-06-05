LevelList = {}
LevelList.__index = LevelList

function LevelList.create(worldID, numOfLevels)
   local levelList = {}
   setmetatable(levelList,LevelList)
   levelList.levelsUnlocked = {true}
   for i = 2, numOfLevels, 1 do
		levelList.levelsUnlocked[i] = false
   end
   levelList.worldID = worldID
   levelList.numOfLevels = numOfLevels
   levelList.nextWorldUnlocked = false
   return levelList
end

--to access which levels are unlocked in a world
function LevelList.load(world)
	return worlds[world]
end

--sets a level to unlocked
function LevelList.unlockLevel(world, level)
	if level == worlds[world].numOfLevels + 1 then
		worlds[world].nextWorldUnlocked = true
	else
		worlds[world].levelsUnlocked[level] = true
	end
end

--check if a level has been unlocked
function LevelList.isLevelUnlocked(world, level)
	return worlds[world].levelsUnlocked[level]
end

--returns number of levels in a given world
function LevelList.getNumOfLevels(world)
	return worlds[world].numOfLevels
end

--returns true if the world has been unlocked
function LevelList.worldUnlocked(world)
	return worlds[world-1].nextWorldUnlocked
end

worlds = {}

worlds[1] = LevelList.create(1, 10)
worlds[2] = LevelList.create(2, 10)
worlds[3] = LevelList.create(3, 10)