require("classes.enemies")
local globals = require ("classes.globals")
globals.basics = {}
globals.basics[0] = nil
for i = 1,table.maxn( myEnemies )+1 do
	globals.basics[i] = myEnemies[i-1]
	globals.basics[i].locker = false
end

-- assigns the new combine recipes as unlocked when player creates a combo
function unlockBasicCheck(number)
	if (globals.basics[number+1]~= nil) then
		globals.basics[number+1].locker = true
	end
end