-- globals.lua

local globals = {}

-- global variable is game paused
globals.gamePaused = false;

globals.currency = require( "classes.score" )

globals.recipes = {}
globals.basics = {}
--globals.recipe = require ("classes.recipes")

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
globals.bullet = {}
globals.bullet[0] = nil
globals.bullet[1] = nil
globals.bullet[2] = nil

-- HUD MULTIPLIER -- 
globals.multiplier = 0
globals.multiplierText = nil

-- HUD SCORE --
globals.score = 0
globals.scoreText = nil

-- HUD LIVES --
globals.lives = 3
globals.numLives = nil

-- FONTS --
globals.LOBSTERTWO = "blank"
globals.IMPRIMA = "blank"

-- CHECK DURNING ANTAGONIST --
globals.notDurningAntagonist = true

return globals