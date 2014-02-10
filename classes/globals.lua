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

return globals