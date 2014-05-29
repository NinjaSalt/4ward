require("classes.enemies")
require("classes.level")
require("classes.score")
require("classes.audioClass")
local sfx = require("classes.sfx")
local globals = require("classes.globals")
local storyboard = require( "storyboard" )
local counter = 0
local dcounter = 0
local dtcounter = 0
local enemyCounter = 0
local denemy = 0
local dtenemy = 0


-- Check for Secondary Win condition
      

function bkftbuttonPressed()
  local enemiesRemoved = 0 --keeps track of how many enemies have been removed from allEne
  if (globals.breakfastServe) then
    globals.breakfastServe = false
    for i = 1,table.maxn( allEne ) do
      i = i - enemiesRemoved --counts backwards from i the number of enemies that were removed to make sure we don't skip any enemies
      --if (allEne[i] ~= nil) then  --we shouldn't need this check anymore. We won't access any nil values
        if (allEne[i].y == lane1 and allEne[i].category == "breakfast") then
            enemyCounter = enemyCounter + 1
            makeDeathPoof(allEne[i])


            -- NEW SECONDARY CONDITION CHECK
            if currentLevel.victoryCondition~=false and
            currentLevel.victoryCondition.enemy.name==allEne[i].name then
                currentLevel.victoryCondition.amount = currentLevel.victoryCondition.amount-1
                if (currentLevel.victoryCondition.amount == 0) then
                  currentLevel.victoryCondition.conditionMet = true
                end
              
            end
            -- END NEW SECONDARY CONDITION CHECK

            -- TYPE CONDITION CHECK
            if currentLevel.categoryCondition~=false and
            currentLevel.categoryCondition.type==allEne[i].category then
                currentLevel.categoryCondition.amount = currentLevel.categoryCondition.amount-1
                if (currentLevel.categoryCondition.amount == 0) then
                  currentLevel.categoryCondition.success = true
                end
            
            end
            -- END TYPE CONDITION CHECK

            allEne[i]:removeSelf()
            table.remove(allEne, i)
            enemiesRemoved = enemiesRemoved + 1
            --allEnemHealth[i]:removeSelf()
            --table.remove(allEnemHealth, i)
            decrementEnemy(currentLevel)
			playSFX (sfx.audioServeFood, 1)
          end
        end
    globals.score = calcServingScore (enemyCounter, globals.score, globals.multiplier)
    globals.scoreText.text = (globals.score)
    transition.to( globals.breakfastButton, { time=500, alpha=0,onComplete=function() 
        if(globals.breakfastButton~=nil) then
          globals.breakfastButton:removeSelf() 
          globals.breakfastButton = nil
          counter = 0
          --checkEnemy()
        end
      end, tag="animation" } )
    
    enemyCounter = 0
  end
  return
end

function dnrbuttonPressed()
  local enemiesRemoved = 0 --keeps track of how many enemies have been removed from allEne
  if (globals.dinnerServe) then
    globals.dinnerServe = false
    for i = 1,table.maxn( allEne ) do
      i = i - enemiesRemoved --counts backwards from i the number of enemies that were removed to keep in order
      if (allEne[i] ~= nil) then
        if (allEne[i].y == lane2) then
          if (allEne[i].category == "dinner") then
            denemy = denemy + 1
            makeDeathPoof(allEne[i])

            -- NEW SECONDARY CONDITION CHECK
            if(currentLevel.victoryCondition~=false) then
              if(currentLevel.victoryCondition.enemy.name==allEne[i].name)then
                currentLevel.victoryCondition.amount = currentLevel.victoryCondition.amount-1
                if (currentLevel.victoryCondition.amount == 0) then
                  currentLevel.victoryCondition.conditionMet = true
                end
              end
            end
            -- END NEW SECONDARY CONDITION CHECK

             -- TYPE CONDITION CHECK
             if(currentLevel.categoryCondition~=false) then
              if(currentLevel.categoryCondition.type==allEne[i].category)then
                currentLevel.categoryCondition.amount = currentLevel.categoryCondition.amount-1
                if (currentLevel.categoryCondition.amount == 0) then
                  currentLevel.categoryCondition.success = true
                end
              end
            end
            -- END TYPE CONDITION CHECK


            allEne[i]:removeSelf()
            table.remove(allEne, i)
            enemiesRemoved = enemiesRemoved + 1
            --allEnemHealth[i]:removeSelf()
            --table.remove(allEnemHealth, i)
            decrementEnemy(currentLevel)
			playSFX (sfx.audioServeFood, 1)
          end
        end
      end
    end
    globals.score = calcServingScore (denemy, globals.score, globals.multiplier)
    globals.scoreText.text = (globals.score)
    transition.to( globals.dinnerButton, { time=500, alpha=0, onComplete=function() 
        if(globals.dinnerButton~=nil) then
          globals.dinnerButton:removeSelf() 
          globals.dinnerButton = nil
          dcounter = 0
        end
      end, tag="animation" } )
    
    denemy = 0
  end
  return
end

function dstbuttonPressed()
  local enemiesRemoved = 0
  if (globals.dessertServe) then
    globals.dessertServe = false
    for i = 1,table.maxn( allEne ) do
        i = i - enemiesRemoved
      if (allEne[i] ~= nil) then
        if (allEne[i].y == lane3) then
          if (allEne[i].category == "dessert") then
            dtenemy = dtenemy + 1
            makeDeathPoof(allEne[i])

            -- NEW SECONDARY CONDITION CHECK
            if(currentLevel.victoryCondition~=false) then
              if(currentLevel.victoryCondition.enemy.name==allEne[i].name)then
                currentLevel.victoryCondition.amount = currentLevel.victoryCondition.amount-1
                if (currentLevel.victoryCondition.amount == 0) then
                  currentLevel.victoryCondition.conditionMet = true
                end
              end
            end
            -- END NEW SECONDARY CONDITION CHECK

            -- TYPE CONDITION CHECK
            if(currentLevel.categoryCondition~=false) then
              if(currentLevel.categoryCondition.type==allEne[i].category)then
                currentLevel.categoryCondition.amount = currentLevel.categoryCondition.amount-1
                if (currentLevel.categoryCondition.amount == 0) then
                  currentLevel.categoryCondition.success = true
                end
              end
            end
            -- END TYPE CONDITION CHECK

            allEne[i]:removeSelf()
            table.remove(allEne, i)
            enemiesRemoved = enemiesRemoved + 1
            --allEnemHealth[i]:removeSelf()
            --table.remove(allEnemHealth, i)
            decrementEnemy(currentLevel)
			playSFX (sfx.audioServeFood, 1)
          end
        end
      end
    end
    globals.score = calcServingScore (dtenemy, globals.score, globals.multiplier)
    globals.scoreText.text = (globals.score)
    transition.to( globals.dessertButton, { time=500, alpha=0, onComplete=function() 
        if(globals.dessertButton~=nil) then
          globals.dessertButton:removeSelf() 
          globals.dessertButton = nil
          dtcounter = 0
        end
      end, tag="animation" } )
    
    dtenemy = 0
  end
  return
end

local bellSheetSettings =
    {
   --  width = 1107,
  --   height = 781,
    width = 54,
    height = 54,
   -- sheetContentWidth=280,
  -- sheetContentHeight=70,
  sheetContentWidth=108,
  sheetContentHeight=162,
  numFrames = 6
  }
  local bellSheet = graphics.newImageSheet("images/bellsheet.png",bellSheetSettings)
  local bellSheetSsequenceData = {
      {name = "breakfast", frames={1, 2}, time=1000, loopCount=0},
      {name = "dinner", frames={3, 4}, time=1000, loopCount=0},
      {name = "dessert", frames={5, 6}, time=1000, loopCount=0}
    }

function resetServeCounters()
    counter = 0
    dcounter = 0
    dtcounter = 0
end

function servingButtons()
    if (globals.breakfastServe) then
      if(counter<2) then
        counter = counter + 1
      end
      if (counter ==1) then
        --globals.breakfastButton = display.newImage("images/breakfast_serveButton.png")
        globals.breakfastButton = display.newSprite(bellSheet,bellSheetSsequenceData)
        --globals.breakfastButton.width = 36
        --globals.breakfastButton.height = 65
        globals.breakfastButton.y = lane1-(25)
        globals.breakfastButton.x = 95
        globals.breakfastButton:setSequence( "breakfast" )
        globals.breakfastButton:play()
        --transition.to( globals.breakfastButton, { x=globals.breakfastButton.width/2-3, tag="animation" } )
        globals.breakfastButton:addEventListener("tap", bkftbuttonPressed)
      end
    elseif (globals.breakfastServe == false) then
      if (globals.breakfastButton ~= nil) then
          transition.to( globals.breakfastButton, { time=500, alpha=0,onComplete=function() 
            if (globals.breakfastButton ~= nil) then
              globals.breakfastButton:removeSelf() 
              globals.breakfastButton = nil
            end
            counter = 0
          end, tag="animation" } )
      end
    end

    if (globals.dinnerServe) then
      if(dcounter<2) then
        dcounter = dcounter +1
      end
      if (dcounter ==1) then
        globals.dinnerButton = display.newSprite(bellSheet,bellSheetSsequenceData)
        -- globals.dinnerButton.width = 36
        -- globals.dinnerButton.height = 65
        -- globals.dinnerButton.y = lane2
        globals.dinnerButton.y = lane2-(25)
        globals.dinnerButton.x = 95
        globals.dinnerButton:setSequence( "dinner" )
        globals.dinnerButton:play()
        --transition.to( globals.dinnerButton, { x=globals.dinnerButton.width/2-3, tag="animation" } )
        globals.dinnerButton:addEventListener("tap", dnrbuttonPressed)
      end
    elseif (globals.dinnerServe == false) then
        if (globals.dinnerButton ~= nil) then
            transition.to( globals.dinnerButton, { time=500, alpha=0,onComplete=function() 
              if (globals.dinnerButton ~= nil) then
                globals.dinnerButton:removeSelf() 
                globals.dinnerButton = nil
              end
              dcounter = 0
              end, tag="animation" } )
        end
    end

    if (globals.dessertServe) then
      if(dtcounter<2) then
        dtcounter = dtcounter + 1
      end
      if (dtcounter == 1) then
        --globals.dessertButton = display.newImage("images/dessert_serveButton.png")
        globals.dessertButton = display.newSprite(bellSheet,bellSheetSsequenceData)
        -- globals.dessertButton.width = 36
        -- globals.dessertButton.height = 65
        --globals.dessertButton.y = lane3
        globals.dessertButton.y = lane3-(25)
        globals.dessertButton.x = 95
        globals.dessertButton:setSequence( "dessert" )
        globals.dessertButton:play()
        --transition.to( globals.dessertButton, { x=globals.dessertButton.width/2-3, tag="animation" } )
        globals.dessertButton:addEventListener("tap", dstbuttonPressed)
      end
    elseif (globals.dessertServe == false) then
        if (globals.dessertButton ~= nil) then
            transition.to( globals.dessertButton, { time=500, alpha=0,onComplete=function() 
              if (globals.dessertButton ~= nil) then
                globals.dessertButton:removeSelf() 
                globals.dessertButton = nil
              end
              dtcounter = 0
              end, tag="animation" } )
        end
    end
end