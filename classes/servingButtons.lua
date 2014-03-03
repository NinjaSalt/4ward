require("classes.enemies")
require("classes.level")
require("classes.score")
local globals = require("classes.globals")
local storyboard = require( "storyboard" )
local counter = 0
local enemyCounter = 0

function buttonPressed()
  --if (globals.breakfastServe) then
    globals.breakfastServe = false
    for i = 1,table.maxn( allEne ) do
      if (allEne[i] ~= nil) then
        if (allEne[i].y == lane1) then
          if (allEne[i].category == "breakfast") then
            enemyCounter = enemyCounter + 1
            print(enemyCounter)
            allEne[i]:removeSelf()
            table.remove(allEne, i)
            allEnemHealth[i]:removeSelf()
            table.remove(allEnemHealth, i)
            decrementEnemy(currentLevel)
          end
        end
      end
    end
    print("TESTINGGGGGGGGGGGGGG")
    print(globals.score)
    print(globals.multiplier)
    globals.score = globals.score + ((20*enemyCounter)*globals.multiplier)
    globals.scoreText.text = (globals.score)
    transition.to( globals.breakfastButton, { x=-globals.breakfastButton.width, tag="animation" } )
    globals.breakfastButton:removeSelf()
    globals.breakfastButton = nil
    counter = 0
    enemyCounter = 0
 --end
end

function servingButtons()
  counter = counter+1
 --print(counter)
  if (counter ==1) then
    globals.breakfastButton = display.newImage("images/breakfast_serveButton.png")
    globals.breakfastButton.width = 39
    globals.breakfastButton.height = 70
    --globals.breakfastButton.x = globals.breakfastButton.width/2 - 3
    globals.breakfastButton.y = lane1
    transition.to( globals.breakfastButton, { x=globals.breakfastButton.width/2-3, tag="animation" } )
    globals.breakfastButton:addEventListener("tap", buttonPressed)
    --group:insert( globals.breakfastButton )
  end
end