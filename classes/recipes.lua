require("classes.enemies")
local globals = require ("classes.globals")
globals.recipes = {}
globals.recipes[0] = nil
for i = 1,table.maxn( comboEnemies )+1 do
	globals.recipes[i] = comboEnemies[i-1]
	globals.recipes[i].unlocked = false
end

-- assigns the new combine recipes as unlocked when player creates a combo
function unlockCheck(number)
	if (globals.recipes[number+1]~= nil) then
		globals.recipes[number+1].unlocked = true
	end
end