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

-- HUD OBJECTIVE --
globals.objectiveText = nil
globals.categoryText = nil
globals.scoreObjText = nil

-- HUD MULTIPLIER -- 
globals.multiplier = 0
globals.multiplierText = nil

-- HUD SCORE --
globals.score = 0
globals.scoreText = nil

-- HUD LIVES --
--globals.lives = 3
--globals.numLives = nil

-- FONTS --
globals.LOBSTERTWO = "blank"
globals.IMPRIMA = "blank"

-- CHECK DURNING ANTAGONIST --
globals.notDurningAntagonist = true

-- CHEF ANIMATION GLOBAL FUNCTIONS --
globals.breakfastanimation = nil

--SERVING BUTTONS--
globals.breakfastButton = nil
globals.dinnerButton = nil
globals.dessertButton = nil

globals.breakfastServe = false
globals.dinnerServe = false
globals.dessertServe = false

--HOLD--
globals.hold = nil

--SPOT--
globals.spot = nil

-- IN GAME VISUALS --
globals.goodTextArray = {}
globals.critTextArray = {}
globals.badTextArray = {}
globals.deathPoofArray = {}

globals.stars = {}
globals.stars[1] = {0,0,0,0,0}
globals.stars[2] = {0,0,0,0,0}
globals.stars[3] = {0,0,0,0,0}

return globals