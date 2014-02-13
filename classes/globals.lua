-- globals.lua

local globals = {}

-- global variable is game paused
globals.gamePaused = false;

globals.hearts = {}

globals.score = 0
globals.lives = 3

globals.currency = require( "classes.score" )

globals.recipe = {}
--globals.recipe = require ("classes.recipes")

globals.isPaused= false

globals.belts = {}
globals.bullet_array = {}

globals.belts[0] = nil
globals.belts[1] = nil
globals.belts[2] = nil

--FONTS.
globals.LOBSTERTWO = "blank"
globals.IMPRIMA = "blank"

return globals