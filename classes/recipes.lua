require("classes.enemies")
local globals = require ("classes.globals")
-- local loadsave = require("classes.loadsave")

-- gameSettings = loadsave.loadTable("gamesettings.json")

globals.recipes = {}
globals.recipes[0] = nil
for i = 1,table.maxn( comboEnemies )+1 do
	globals.recipes[i] = comboEnemies[i-1]
	globals.recipes[i].unlocked = false
	if (gameSettings[5][i]~=nil) then
		globals.recipes[i].unlocked = gameSettings[5][i]
	end
end

-- assigns the new combine recipes as unlocked when player creates a combo
function unlockCheck(number)
	if (globals.recipes[number+1].unlocked~= nil) then
	--make the text pop up that you've unlocked it
		if (globals.recipes[number+1].unlocked~= true) then
			-- the border
			local backBorder = display.newRect( display.contentWidth/2, 295, 155, 65 )
			backBorder: setFillColor (black)
			transition.to( backBorder, { time=3000, alpha=0, onComplete=function() backBorder:removeSelf() end } )
			
			--the white background
			local back = display.newRect( display.contentWidth/2, 295, 150, 60 )
			transition.to( back, { time=3000, alpha=0, onComplete=function() back:removeSelf() end } )
			
			--the text itself
			local unlockText = display.newText( globals.recipes[number+1].name .. " Unlocked", display.contentWidth/2, 295, globals.LOBSTERTWO, 28 )
			unlockText:setFillColor(black)
			transition.to( unlockText, { time=3000, alpha=0, onComplete=function() unlockText:removeSelf() end } )
			
			backBorder.width = unlockText.width+20
			back.width = unlockText.width+15
		end
		globals.recipes[number+1].unlocked = true
	end
	if (gameSettings[5][number+1]~=nil) then
		gameSettings[5][number+1] = globals.recipes[number+1].unlocked
	end
end