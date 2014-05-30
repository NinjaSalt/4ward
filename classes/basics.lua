require("classes.enemies")
local globals = require ("classes.globals")
-- local loadsave = require("classes.loadsave")

-- gameSettings = loadsave.loadTable("gamesettings.json")
globals.basics = {}
globals.basics[0] = nil
for i = 1,table.maxn( myEnemies )+1 do
	globals.basics[i] = myEnemies[i-1]
	globals.basics[i].locker = false
	if (gameSettings[4][i]~=nil) then
		globals.basics[i].locker = gameSettings[4][i]
	end
end

-- assigns the new combine recipes as unlocked when player creates a combo
function unlockBasicCheck(number)
	if (globals.basics[number+1]~= nil) then
		globals.basics[number+1].locker = true
		if (gameSettings[number+1]~=nil) then
			items[number+1].unlocked = true
			gameSettings[4][number+1] = globals.basics[number+1].locker
		end
	end
end