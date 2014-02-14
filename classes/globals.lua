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

-- ARRAY FOR CONVERYER BELTS --
globals.belts = {}
globals.belts[0] = nil
globals.belts[1] = nil
globals.belts[2] = nil
globals.levers = {}
globals.levers[0] = nil
globals.levers[1] = nil
globals.levers[2] = nil

-- ARRAY FOR BULLETS --
globals.bullet_array = {}

-- HUD MULTIPLIER -- 
globals.multiplier = 0
globals.multiplierText = nil

-- FONTS --
globals.LOBSTERTWO = "blank"
globals.IMPRIMA = "blank"

return globals