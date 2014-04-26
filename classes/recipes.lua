require("classes.enemies")
local globals = require ("classes.globals")
local loadsave = require("classes.loadsave")

gameSettings = loadsave.loadTable("gamesettings.json")

globals.recipes = {}
globals.recipes[0] = nil
for i = 1,table.maxn( comboEnemies )+1 do
	globals.recipes[i] = comboEnemies[i-1]
	globals.recipes[i].unlocked = false
	--if (gameSettings[5][i]~=nil) then
	--	print("loading recipe " .. i)
	--	globals.recipes[i].unlocked = gameSettings[5][i]
	--end
end

-- assigns the new combine recipes as unlocked when player creates a combo
function unlockCheck(number)
	if (globals.recipes[number+1]~= nil) then
		globals.recipes[number+1].unlocked = true
		if (gameSettings[number+1]~=nil) then
			print("saving recipe " .. number+1)
			gameSettings[5][number+1] = globals.recipes[number+1].unlocked
		end
	end
end