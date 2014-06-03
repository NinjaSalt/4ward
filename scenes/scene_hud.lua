---------------------------------------------------------------------------------
-- HUD LUA
-- Scene notes go here
---------------------------------------------------------------------------------
 
local globals = require("classes.globals") 
local storyboard = require( "storyboard" )
local scene = storyboard.newScene()
-- local loadsave = require("classes.loadsave")
 
-- Clear previous scene
storyboard.removeAll()

-- gameSettings = loadsave.loadTable("gamesettings.json")
 
-- local forward references should go here --
 
---------------------------------------------------------------------------------
-- BEGINNING OF YOUR IMPLEMENTATION
---------------------------------------------------------------------------------
 
-- Called when the scene's view does not exist:
function scene:createScene( event )
  local group = self.view

  -- OBJECTIVE --
  -- for spacing out objectives
  local spacer = 40
  local imgSpacer = 15
  local textSpacer = 50
  local between =  85
	function getObjectiveProgress()
		local numer = currentLevel.victoryCondition.memAmount-currentLevel.victoryCondition.amount
		local denom = currentLevel.victoryCondition.memAmount
		if numer > denom then return (denom.."/"..denom)
		else return (numer.."/"..denom) 
    end
	end
  -- returns progress of category conditions
  function getCatNumbers()

    local catNum = currentLevel.categoryCondition.memAmount - currentLevel.categoryCondition.amount
    local catDen = currentLevel.categoryCondition.memAmount
    if (catNum > catDen) then return (catDen.."/"..catDen)
    else return (catNum .."/" .. catDen) 
    end
  end

  -- returns progress #s of score conditions
  function getScoreNumbers()
    local scoreNum = globals.score
    local scoreDen = currentLevel.scoreCondition.memScore
    if (scoreNum > scoreDen) then return (scoreDen .. "/" .. scoreDen)
    else
      return (scoreNum .. "/" .. scoreDen)
    end
  end

  local function showItemObj()
    local objectiveGradient = display.newImage("images/scoreGradient.png")
    objectiveGradient.width = 70
    objectiveGradient.height = 25

    objectiveGradient.x = spacer
    spacer = spacer + between
    objectiveGradient.y = 15
    
    group:insert(objectiveGradient)  
    
    local objectiveIcon = display.newImage(currentLevel.victoryCondition.enemy.image)
    objectiveIcon.width = 25
    objectiveIcon.height = 25
    
    objectiveIcon.x = imgSpacer
    imgSpacer = imgSpacer + between
    objectiveIcon.y = 14
    
    group:insert(objectiveIcon)
    
    globals.objectiveText = display.newText( getObjectiveProgress(), textSpacer, 14, globals.LOBSTERTWO, 20 )
    textSpacer = textSpacer + between
    globals.objectiveText:setFillColor(1,1,1)
    group:insert(globals.objectiveText)  

  end

  -- Visual representation of category objectives.
  local function showCategoryObj()
    local catBack = display.newImage("images/scoreGradient.png")
    catBack.width = 70
    catBack.height = 25

    catBack.x = spacer
    spacer = spacer + between
    catBack.y = 15
    
    group:insert(catBack)

    local catIcon = "none"

    -- determines which icon to use.
    if (currentLevel.categoryCondition.type == "breakfast") then
      catIcon = "images/brIcon.png"
    end
    if (currentLevel.categoryCondition.type == "dinner") then
        catIcon = "images/diIcon.png"
    end
    if (currentLevel.categoryCondition.type == "dessert") then
      catIcon = "images/deIcon.png"
    end

    local catFace = display.newImage(catIcon)
    catFace.width = 30
    catFace.height = 30
    
    catFace.x = imgSpacer
    imgSpacer = imgSpacer + between
    catFace.y = 14
    
    group:insert(catFace)
    
    globals.categoryText = display.newText( getCatNumbers(), textSpacer, 14, globals.LOBSTERTWO, 20 )
    textSpacer = textSpacer + between
    globals.categoryText:setFillColor(1,1,1)
    group:insert(globals.categoryText)  

  end

  -- Visual representation of score objectives.
  local function showScoreObj()
     local scoreBack = display.newImage("images/scoreGradient.png")
    scoreBack.width = 85
    scoreBack.height = 25

    scoreBack.x = spacer
    spacer = spacer + between
    scoreBack.y = 15
    
    group:insert(scoreBack)  
    
    --local catFace = display.newImage(ADD_FACE_HERE)
    --catFace.width = 25
    --catFace.height = 25
    
    --catFace.x = imgSpacer
    imgSpacer = imgSpacer + between
    --catFace.y = 14
    
    --group:insert(catFace)
    
    globals.scoreObjText = display.newText( getScoreNumbers(), textSpacer, 14, globals.LOBSTERTWO, 20 )
    textSpacer = textSpacer + between
    globals.scoreObjText:setFillColor(1,1,1)
    group:insert(globals.scoreObjText)  

  end

  if (currentLevel.victoryCondition ~= false) then
    showItemObj()
   end
  -- function for category objective. 
  if (currentLevel.categoryCondition ~= false) then
    showCategoryObj()
  end
  -- function for score objective.
  if (currentLevel.scoreCondition ~= false) then
    showScoreObj()
  end

  -- SCORE --

  local scoreGradient = display.newImage("images/scoreGradient2.png")
  scoreGradient.width = 50
  scoreGradient.height = 25
  scoreGradient.x = 420
  scoreGradient.y = 15
  group:insert(scoreGradient)

  globals.scoreText = display.newText( globals.score, 420, 15, globals.LOBSTERTWO, 20 )
  globals.scoreText:setFillColor(1,1,1)
  group:insert(globals.scoreText)  

  -- PAUSE BUTTON

  local pauseButton = display.newImage("images/pauseNew.png")
  pauseButton.x = 465
  pauseButton.y = 15
  pauseButton.width = 25
  pauseButton.height = 25
  group:insert(pauseButton) 

    -- MULTIPLIER --
  local multiplierGradient = display.newImage("images/multiplierGradient2.png")
  multiplierGradient.width = 35
  multiplierGradient.height = 25
  multiplierGradient.x = 460
  multiplierGradient.y = 305  
  group:insert(multiplierGradient)

  local multiplierX = display.newText("x",455, 305, globals.IMPRIMA,20)
  multiplierX:setFillColor(250,250,0)
  group:insert(multiplierX)

  globals.multiplierText = display.newText( globals.multiplier, 465, 305, globals.LOBSTERTWO, 20 )
  globals.multiplierText:setFillColor(250,250,0)
  group:insert(globals.multiplierText)

-- PLAYERS ITEM BELT
  itemBelt = {}

  itemBelt[0] = display.newImage("images/itemHolder.png")
  itemBelt[0].width = 40
  itemBelt[0].height = 40
  itemBelt[0].x = 250
  itemBelt[0].y = 300
  group:insert(itemBelt[0])

  itemBelt[0] = display.newImage("images/itemHolder.png")
  itemBelt[0].width = 40
  itemBelt[0].height = 40
  itemBelt[0].x = 200
  itemBelt[0].y = 300
  group:insert(itemBelt[0])

  itemBelt[0] = display.newImage("images/itemHolder.png")
  itemBelt[0].width = 40
  itemBelt[0].height = 40
  itemBelt[0].x = 300
  itemBelt[0].y = 300
  group:insert(itemBelt[0])

	for i = 0, 2, 1 do
      if gameSettings[6][i+1] ~= false then
		myItems[i] = gameSettings[6][i+1]
	  elseif gameSettings[6][i+1] == false then
		myItems[i] = nil
      end
	end
    
  local gameItems = {}

  local itemSpace = 200
  for i = 0,table.maxn( myItems ) do
    if ( myItems[i] ~= nil )then
      gameItems[i] = display.newImage(myItems[i].image)
      passValuesToNewItem (gameItems[i], myItems[i])
      gameItems[i].width = 25
      gameItems[i].height = 25
      gameItems[i].x = itemSpace
      gameItems[i].y = 300
      gameItems[i].myItemRef = i
      if ( gameItems[i].itemType == "foodType" or gameItems[i].itemType == "trash") then
      gameItems[i]:addEventListener( "touch", itemFoodDrag ) 
     --  elseif ( gameItems[i].itemType == "break" ) then
     --  gameItems[i]:addEventListener( "tap", itemTap ) 
	    -- elseif ( gameItems[i].itemType == "swap" ) then
     --  gameItems[i]:addEventListener( "tap", itemTap )
      end
      group:insert(gameItems[i])
    end
    itemSpace = itemSpace+50
  end
  
  --Hold
  function removeHold()
	if(globals.hold ~= nil) then globals.hold:removeSelf() end
	globals.hold = nil
  end

  function makeHold(eneInHold, eneX, eneY)
	if(globals.hold ~= nil) then globals.hold:removeSelf() end
	local image
	for n = 0,table.maxn( myEnemies ) do
		if( myEnemies[n].type == eneInHold )then
			image = myEnemies[n].image
		end
	end
	for n = 0,table.maxn( comboEnemies ) do
		if( comboEnemies[n].type == eneInHold )then
			image = comboEnemies[n].image
		end
	end
	  
	  globals.hold = display.newImage(image)
	  globals.hold.width = 25
	  globals.hold.height = 25
	  globals.hold.x = 100
	  globals.hold.y = 20
	  globals.hold.eneX = eneX
	  globals.hold.eneY = eneY
	  globals.hold:addEventListener( "tap", makeHoldEne )
	  group:insert(globals.hold)
  end

 local function onTapPause( event )
    storyboard.showOverlay("scenes.scene_pause", {effect = "slideDown", time=500})
    --timer.pause(attackTimer)
    timer.pause(spawnEneTimer)
    --pausing animation
  if (globals.breakfastButton~=nil) then
    globals.breakfastButton:pause()
  end
    if (globals.dinnerButton~=nil) then
    globals.dinnerButton:pause()
  end
    if (globals.dessertButton~=nil) then
    globals.dessertButton:pause()
  end
    globals.breakfastanimation:pause()
    globals.dinneranimation:pause()
  globals.dessertanimation:pause()
    if ( antagonistTimer ~= nil) then
     timer.cancel(antagonistTimer)
     end
    for n=0, 2, 1 do
      globals.belts[n]:pause()
  end
    transition.pause("animation")
  end

  pauseButton:addEventListener( "tap", onTapPause )
end
 
-- Called BEFORE scene has moved onscreen:
function scene:willEnterScene( event )
  local group = self.view
 
end
 
-- Called immediately after scene has moved onscreen:
function scene:enterScene( event )
  local group = self.view
 
end
 
-- Called when scene is about to move offscreen:
function scene:exitScene( event )
  local group = self.view
  --scoreText:removeSelf()
end
 
-- Called AFTER scene has finished moving offscreen:
function scene:didExitScene( event )
  local group = self.view
 
end
 
-- Called prior to the removal of scene's "view" (display view)
function scene:destroyScene( event )
  local group = self.view
 
end
 
-- Called if/when overlay scene is displayed via storyboard.showOverlay()
function scene:overlayBegan( event )
  local group = self.view
  local overlay_name = event.sceneName  -- name of the overlay scene
 
end
 
-- Called if/when overlay scene is hidden/removed via storyboard.hideOverlay()
function scene:overlayEnded( event )
  local group = self.view
  local overlay_name = event.sceneName  -- name of the overlay scene
 
end
 
---------------------------------------------------------------------------------
-- END OF YOUR IMPLEMENTATION
---------------------------------------------------------------------------------
 
-- "createScene" event is dispatched if scene's view does not exist
scene:addEventListener( "createScene", scene )
 
-- "willEnterScene" event is dispatched before scene transition begins
scene:addEventListener( "willEnterScene", scene )
 
-- "enterScene" event is dispatched whenever scene transition has finished
scene:addEventListener( "enterScene", scene )
 
-- "exitScene" event is dispatched before next scene's transition begins
scene:addEventListener( "exitScene", scene )
 
-- "didExitScene" event is dispatched after scene has finished transitioning out
scene:addEventListener( "didExitScene", scene )
 
-- "destroyScene" event is dispatched before view is unloaded, which can be
-- automatically unloaded in low memory situations, or explicitly via a call to
-- storyboard.purgeScene() or storyboard.removeScene().
scene:addEventListener( "destroyScene", scene )
 
-- "overlayBegan" event is dispatched when an overlay scene is shown
scene:addEventListener( "overlayBegan", scene )
 
-- "overlayEnded" event is dispatched when an overlay scene is hidden/removed
scene:addEventListener( "overlayEnded", scene )
 
---------------------------------------------------------------------------------
 
return scene