require("classes.enemies")
require("classes.level")
local globals = require("classes.globals")
local storyboard = require( "storyboard" )

function buttonPressed()
  if (globals.breakfastServe) then
    globals.breakfastServe = false
    --[[for i = 1,table.maxn( allEne ) do
      if (allEne[i].y == lane1) then
        if (allEne[i].category == "breakfast")
          allEne[i]:removeSelf()
          allEne[i] = nil
          decrementEnemy(currentLevel)
        end
      end
    end]]
    print("TESTINGGGGGGGGGGGGGG")
    globals.breakfastButton:removeSelf()
    globals.breakfastButton = nil
  end
end

function servingButtons()
  globals.breakfastButton = display.newImage("images/breakfast_serveButton.png")
  globals.breakfastButton.width = 39
  globals.breakfastButton.height = 70
  globals.breakfastButton.x = globals.breakfastButton.width/2 - 3
  globals.breakfastButton.y = lane1
  globals.breakfastButton:addEventListener("tap", buttonPressed)
  --group:insert( globals.breakfastButton )
end