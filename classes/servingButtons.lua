require("classes.enemies")
require("classes.level")
require("classes.score")
local globals = require("classes.globals")
local storyboard = require( "storyboard" )
local counter = 0
local dcounter = 0
local dtcounter = 0
local enemyCounter = 0
local denemy = 0
local dtenemy = 0

function bkftbuttonPressed()
  if (globals.breakfastServe) then
    globals.breakfastServe = false
    for i = 1,table.maxn( allEne ) do
      if (allEne[i] ~= nil) then
        if (allEne[i].y == lane1) then
          if (allEne[i].category == "breakfast") then
            enemyCounter = enemyCounter + 1
            allEne[i]:removeSelf()
            table.remove(allEne, i)
            allEnemHealth[i]:removeSelf()
            table.remove(allEnemHealth, i)
            decrementEnemy(currentLevel)
            checkEnemy()
          end
        end
      end
    end
    globals.score = globals.score + ((20*enemyCounter)*globals.multiplier)
    globals.scoreText.text = (globals.score)
    transition.to( globals.breakfastButton, { x=-globals.breakfastButton.width, tag="animation" } )
    globals.breakfastButton:removeSelf()
    globals.breakfastButton = nil
    counter = 0
    enemyCounter = 0
  end
  return
end

function dnrbuttonPressed()
  if (globals.dinnerServe) then
    globals.dinnerServe = false
    for i = 1,table.maxn( allEne ) do
      if (allEne[i] ~= nil) then
        if (allEne[i].y == lane2) then
          if (allEne[i].category == "dinner") then
            denemy = denemy + 1
            allEne[i]:removeSelf()
            table.remove(allEne, i)
            allEnemHealth[i]:removeSelf()
            table.remove(allEnemHealth, i)
            decrementEnemy(currentLevel)
            checkEnemy()
          end
        end
      end
    end
    globals.score = globals.score + ((20*denemy)*globals.multiplier)
    globals.scoreText.text = (globals.score)
    transition.to( globals.dinnerButton, { x=-globals.dinnerButton.width, tag="animation" } )
    globals.dinnerButton:removeSelf()
    globals.dinnerButton = nil
    dcounter = 0
    denemy = 0
  end
  return
end

function dstbuttonPressed()
  if (globals.dessertServe) then
    globals.dessertServe = false
    for i = 1,table.maxn( allEne ) do
      if (allEne[i] ~= nil) then
        if (allEne[i].y == lane3) then
          if (allEne[i].category == "dessert") then
            dtenemy = dtenemy + 1
            allEne[i]:removeSelf()
            table.remove(allEne, i)
            allEnemHealth[i]:removeSelf()
            table.remove(allEnemHealth, i)
            decrementEnemy(currentLevel)
            checkEnemy()
          end
        end
      end
    end
    globals.score = globals.score + ((20*dtenemy)*globals.multiplier)
    globals.scoreText.text = (globals.score)
    transition.to( globals.dessertButton, { x=-globals.dessertButton.width, tag="animation" } )
    globals.dessertButton:removeSelf()
    globals.dessertButton = nil
    dtcounter = 0
    dtenemy = 0
  end
  return
end

function servingButtons()
    if (globals.breakfastServe) then
      counter = counter + 1
      if (counter ==1) then
        globals.breakfastButton = display.newImage("images/breakfast_serveButton.png")
        globals.breakfastButton.width = 36
        globals.breakfastButton.height = 65
        --globals.breakfastButton.x = globals.breakfastButton.width/2 - 3
        globals.breakfastButton.y = lane1
        transition.to( globals.breakfastButton, { x=globals.breakfastButton.width/2-3, tag="animation" } )
        globals.breakfastButton:addEventListener("tap", bkftbuttonPressed)
        --group:insert( globals.breakfastButton )
      end
    end

    if (globals.dinnerServe) then
      dcounter = dcounter +1
      if (dcounter ==1) then
        globals.dinnerButton = display.newImage("images/dinner_serveButton.png")
        globals.dinnerButton.width = 36
        globals.dinnerButton.height = 65
        --globals.breakfastButton.x = globals.breakfastButton.width/2 - 3
        globals.dinnerButton.y = lane2
        transition.to( globals.dinnerButton, { x=globals.dinnerButton.width/2-3, tag="animation" } )
        globals.dinnerButton:addEventListener("tap", dnrbuttonPressed)
        --group:insert( globals.breakfastButton )
      end
    end

    if (globals.dessertServe) then
      dtcounter = dtcounter + 1
      if (dtcounter == 1) then
        globals.dessertButton = display.newImage("images/dessert_serveButton.png")
        globals.dessertButton.width = 36
        globals.dessertButton.height = 65
        --globals.breakfastButton.x = globals.breakfastButton.width/2 - 3
        globals.dessertButton.y = lane3
        transition.to( globals.dessertButton, { x=globals.dessertButton.width/2-3, tag="animation" } )
        globals.dessertButton:addEventListener("tap", dstbuttonPressed)
        --group:insert( globals.breakfastButton )
      end
    end
end