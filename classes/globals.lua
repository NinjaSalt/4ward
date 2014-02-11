-- globals.lua

local globals = {}

-- global variable is game paused
globals.gamePaused = false;

globals.hearts = {}

globals.score = 0

globals.currency = require( "classes.score" )

globals.recipe = {}
--globals.recipe = require ("classes.recipes")

globals.isPaused= false

globals.belts = {}
for n=0, 2, 1 do
	globals.belts[n] = nil
end

--FONTS.
globals.LOBSTERTWO = "blank"
globals.IMPRIMA = "blank"

return globals