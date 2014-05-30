-- globals.lua

local globals = {}

-- global variable is game paused
globals.gamePaused = false;
globals.musicLevel = 1
globals.soundLevel = 1

globals.worldMusic = 0;

--SAVING NUMBERS
--num worlds
globals.numWorlds = 3
--how many levels
globals.numLevels = 10
--1 = score, 2 = stars
globals.numStorage = 2
-- globals.gameSavedValues = {}
-- for n = 1,table.maxn( numWorlds+1 ) do
-- 	globals.gameSavedValues[n] = {}
-- end
-- for n = 1,table.maxn( numWorlds+1 ) do
-- 	for j = 1,table.maxn( numLevels+1 ) do
-- 	globals.gameSavedValues[n][j] = {}
-- 	end
-- end
-- for n = 1,table.maxn( numWorlds+1 ) do
-- 	for j = 1,table.maxn( numLevels+1 ) do
-- 		for h = 1,table.maxn( numStorage+1 ) do
-- 			globals.gameSavedValues[n][j][h] = 0
-- 		end
-- 	end
-- end

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
globals.negativeNum = 0

-- FONTS --
globals.LOBSTERTWO = "blank"
globals.IMPRIMA = "blank"
globals.JOSEFIN = "blank"

-- CHECK DURNING ANTAGONIST --
globals.notDurningAntagonist = true

-- CHEF ANIMATION GLOBAL FUNCTIONS --
globals.breakfastanimation = nil
globals.dinneranimation = nil
globals.dessertanimation = nil

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
globals.deathPoofArray = {}

globals.stars = {}
globals.stars[1] = {0,0,0,0,0,0,0,0,0,0}
globals.stars[2] = {0,0,0,0,0,0,0,0,0,0}
globals.stars[3] = {0,0,0,0,0,0,0,0,0,0}

-- globals for shop/book tutorial (needs to be saved)
globals.completedBook = false
globals.completedShop = false

-- globals for chef tip / danger warning (needs to be saved)
globals.completedTip = false

-- globals for trash can tip
globals.completedTrash = false

return globals