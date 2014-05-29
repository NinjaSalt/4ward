---------------------------------------------------------------------------------
-- SCENE NAME
-- Scene notes go here
---------------------------------------------------------------------------------
 
local storyboard = require( "storyboard" )
local globals = require("classes.globals")
local scene = storyboard.newScene()
local nextLevel 
local nextWorld
-- Clear previous scene
storyboard.removeAll()
 
-- local forward references should go here --
 
---------------------------------------------------------------------------------
-- BEGINNING OF YOUR IMPLEMENTATION
---------------------------------------------------------------------------------
 
-- Called when the scene's view does not exist:
function scene:createScene( event )
  local group = self.view
  local params = event.params
  nextLevel = params.level
  nextWorld = params.world
  local dotOne
  local dotTwo
  local dotThree
  local loadText

  
  local options = {
   effect = "fade",
   time = 500
}

  local textArray = {}

-- have an array of helpful hints/text
  textArray = {"Don't forget those triple combos!", "Each chef has their own category of food they like to serve.", "Be careful of the host's surprises!", "Sometimes, two items don't match.", 
              "You can swipe left to speed up and right to slow down.", "Combine two ingredients when they're aligned on the belts and swipe up or down.", "Don't forget to serve your delicious meals!", 
              "You can use the compost bin to get rid of bad combinations.", "Try to get all the stars by completing the objectives!"}

  -- local bkg = display.newImage( "images/b8.png", centerX, centerY, true )
  -- bkg.height=display.contentHeight; bkg.width=display.contentWidth
  -- group:insert (bkg)

  local function startLevel()
    timer.performWithDelay(200, function()storyboard.gotoScene( "scenes.scene_ingame",{ effect = "fade", time = 100, params = {level = nextLevel, world = nextWorld}})end)
  end

--if it's world 1, show the breakfast chef
  if (nextWorld == 1) then
    local bkg = display.newImage( "images/inbetween1.png", centerX, centerY, true )
  bkg.height=display.contentHeight; bkg.width=display.contentWidth
  group:insert (bkg)
    local breakfast_load = display.newImageRect( "images/breakfast_fill.png", 300, 300 )
    breakfast_load.x = display.contentWidth/2
    breakfast_load.y = display.contentHeight/3
    breakfast_load:scale( 0.3, 0.3 )
     group:insert (breakfast_load)

    local breakfast_hurt = display.newImageRect( "images/breakfast_hurt.png", 256, 256 )
    breakfast_hurt.x = display.contentWidth/2
    breakfast_hurt.y = display.contentHeight/3
    breakfast_hurt:scale( 0, 0 )
    breakfast_hurt.alpha = 0
    group:insert (breakfast_hurt)

    transition.to(breakfast_load, {time=2000, height = 300, onComplete=
      function() 
        breakfast_load:removeSelf( )
        breakfast_load = nil
        transition.to(breakfast_hurt, {time=300, alpha = 1, xScale = 0.4, yScale = 0.4, onComplete=
          function() 
            dotOne:removeSelf( )
            dotOne = nil
            dotTwo:removeSelf( )
            dotTwo = nil
            dotThree:removeSelf( )
            dotThree = nil
            loadText.text = "Tap to start!"
            loadText.x = display.contentWidth/2
          end})
        bkg:addEventListener( "tap", startLevel )
      end})
  end

  if (nextWorld == 2) then
    local bkg = display.newImage( "images/inbetween2.png", centerX, centerY, true )
  bkg.height=display.contentHeight; bkg.width=display.contentWidth
  group:insert (bkg)
    local dessert_load = display.newImageRect( "images/dessert_fill.png", 300, 300 )
    dessert_load.x = display.contentWidth/2
    dessert_load.y = display.contentHeight/3
    dessert_load:scale( 0.3, 0.3 )
     group:insert (dessert_load)

    local dessert_hurt = display.newImageRect( "images/dessert_hurt.png", 256, 256 )
    dessert_hurt.x = display.contentWidth/2
    dessert_hurt.y = display.contentHeight/3
    dessert_hurt:scale( 0, 0 )
    dessert_hurt.alpha = 0
    group:insert (dessert_hurt)

    transition.to(dessert_load, {time=2000, height = 300, onComplete=
      function() 
        dessert_load:removeSelf( )
        dessert_load = nil
        transition.to(dessert_hurt, {time=300, alpha = 1, xScale = 0.4, yScale = 0.4, onComplete=
          function() 
            dotOne:removeSelf( )
            dotOne = nil
            dotTwo:removeSelf( )
            dotTwo = nil
            dotThree:removeSelf( )
            dotThree = nil
            loadText.text = "Tap to start!"
            loadText.x = display.contentWidth/2
          end})
        bkg:addEventListener( "tap", startLevel )
      end})
  end

  if (nextWorld == 3) then
    local bkg = display.newImage( "images/inbetween3.png", centerX, centerY, true )
  bkg.height=display.contentHeight; bkg.width=display.contentWidth
  group:insert (bkg)
    local dinner_load = display.newImageRect( "images/dinner_fill.png", 300, 300 )
    dinner_load.x = display.contentWidth/2
    dinner_load.y = display.contentHeight/3
    dinner_load:scale( 0.3, 0.3 )
     group:insert (dinner_load)

    local dinner_hurt = display.newImageRect( "images/dinner_hurt.png", 256, 256 )
    dinner_hurt.x = display.contentWidth/2
    dinner_hurt.y = display.contentHeight/3
    dinner_hurt:scale( 0, 0 )
    dinner_hurt.alpha = 0
    group:insert (dinner_hurt)

    transition.to(dinner_load, {time=2000, height = 300, onComplete=
      function() 
        dinner_load:removeSelf( )
        dinner_load = nil
        transition.to(dinner_hurt, {time=300, alpha = 1, xScale = 0.4, yScale = 0.4, onComplete=
          function() 
            dotOne:removeSelf( )
            dotOne = nil
            dotTwo:removeSelf( )
            dotTwo = nil
            dotThree:removeSelf( )
            dotThree = nil
            loadText.text = "Tap to start!"
            loadText.x = display.contentWidth/2
          end})
        bkg:addEventListener( "tap", startLevel )
      end})
  end

  loadText = display.newText("Now Loading", display.contentWidth/2-30, display.contentHeight/2+60, globals.LOBSTERTWO, 35)
  loadText:setFillColor( 0 )
  group:insert(loadText)

  dotOne = display.newImage("images/sugar.png", 800, display.contentHeight/2+70,30,30)
  dotOne.width = 15
  dotOne.height = 15
  group:insert(dotOne)

  dotTwo = display.newImage("images/flour.png", 800, display.contentHeight/2+70,30,30)
  dotTwo.width = 15
  dotTwo.height = 15
  group:insert(dotTwo)

  dotThree = display.newImage("images/sugar.png", 800, display.contentHeight/2+70,30,30)
  dotThree.width = 15
  dotThree.height = 15
  group:insert(dotThree)

  timer.performWithDelay(400, function() transition.to(dotOne, {time=300, x= display.contentWidth/2+80}) end)
  timer.performWithDelay(800, function() transition.to(dotTwo, {time=300, x= display.contentWidth/2+ 100}) end)
  timer.performWithDelay(1200, function() transition.to(dotThree, {time=300, x= display.contentWidth/2+ 120}) end)

  --selects a random number from te textArray
  local randomint = math.random(1,9)
     local tipText = {
    text = textArray[randomint],     
    x = display.contentWidth/2,
    y = display.contentHeight/2+15,
    width = display.contentWidth-40,     --required for multi-line and alignment
    font = globals.IMPRIMA,   
    fontSize = 18,
    align = "center"  --new alignment parameter
  }

  local tip = display.newText(tipText)
  tip:setFillColor( black )  
  group:insert(tip)




  -- local loadText = display.newText("Now Loading", display.contentWidth/2-30, display.contentHeight/2, globals.LOBSTERTWO, 40)
  -- loadText:setFillColor( 0 )
  -- group:insert(loadText)

  -- local dotOne = display.newImage("images/sugar.png", 800, display.contentHeight/2+10,30,30)
  -- dotOne.width = 15
  -- dotOne.height = 15
  -- group:insert(dotOne)

  -- local dotTwo = display.newImage("images/flour.png", 800, display.contentHeight/2+10,30,30)
  -- dotTwo.width = 15
  -- dotTwo.height = 15
  -- group:insert(dotTwo)

  -- local dotThree = display.newImage("images/sugar.png", 800, display.contentHeight/2+10,30,30)
  -- dotThree.width = 15
  -- dotThree.height = 15
  -- group:insert(dotThree)

	--timer.performWithDelay(400, function() transition.to(dotOne, {time=300, x= display.contentWidth/2+80}) end)
  --timer.performWithDelay(800, function() transition.to(dotTwo, {time=300, x= display.contentWidth/2+ 100}) end)
  --timer.performWithDelay(1200, function() transition.to(dotThree, {time=300, x= display.contentWidth/2+ 120}) end)
  --timer.performWithDelay(2200, function()storyboard.gotoScene( "scenes.scene_ingame",{ effect = "fade", time = 500, params = {level = nextLevel, world = nextWorld}})end)

  --bkg:addEventListener( "tap", startLevel )

 
end
 
-- Called BEFORE scene has moved onscreen:
function scene:willEnterScene( event )
  local group = self.view
 
end
 
-- Called immediately after scene has moved onscreen:
function scene:enterScene( event )
  local group = self.view
  local params = event.params
  nextLevel = params.level
  nextWorld = params.world
end
 
-- Called when scene is about to move offscreen:
function scene:exitScene( event )
  local group = self.view
 
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