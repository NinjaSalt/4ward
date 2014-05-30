---------------------------------------------------------------------------------
-- ITEM TUTORIAL SCENE: Pop-up for pantry tutorial.
-- Scene notes go here
---------------------------------------------------------------------------------
 
local storyboard = require( "storyboard" )
local scene = storyboard.newScene()
local loadsave = require("classes.loadsave")
local globals= require ("classes.globals") 
-- Clear previous scene
storyboard.removeAll()
 
-- local forward references should go here --

gameSettings = loadsave.loadTable("gamesettings.json")
 
---------------------------------------------------------------------------------
-- BEGINNING OF YOUR IMPLEMENTATION
---------------------------------------------------------------------------------
 
-- Called when the scene's view does not exist:
function scene:createScene( event )
  local group = self.view
 
   local options =
{
    effect = "fade",
    time = 100,
    isModal = true
}

  local bkg = display.newRect( centerX, centerY, display.contentWidth, display.contentHeight )
  bkg:setFillColor( gray )
  bkg.alpha = .5
  group:insert (bkg)

  --NEED TO DO: add "tap to continue" icon of some sort.
   -- final instruction, closes tutorial
   local function tutorialFive()

    tutFour:removeSelf()
    fourText:removeSelf()
    triangle:removeSelf()
    gameSettings[8][2] = true
    loadsave.saveTable(gameSettings , "gamesettings.json")
    storyboard.hideOverlay("scenes.overlay_pantryTutorial", "slideUp", 500 )
    storyboard.showOverlay("scenes.overlay_backButton", {effect = "fade", time = 500})
   end


  -- tutorial four
  local function tutorialFour()
    tutThree:removeSelf()
    threeText:removeSelf()
    triangle:removeSelf()

    tutFour = display.newRect( centerX, centerY+ 20, display.contentWidth, display.contentHeight/5 )
    tutFour.alpha = .85
    tutFour:addEventListener( "tap", tutorialFive )
    group:insert(tutFour)

    fourText = display.newText("You will unlock items as you complete challenges!", display.contentWidth/2, 185, globals.IMPRIMA, 20)
    fourText:setFillColor( black )
    group:insert(fourText)

  triangle = display.newImage( "images/continue.png", 100, 100, true )
  triangle.x = 450
  triangle.y = 200
  triangle.width = 25
  triangle.height = 25
  group:insert( triangle )

  end

  -- third instruction pop-up
  local function tutorialThree()

    tutTwo:removeSelf()
    twoText:removeSelf()
    triangle:removeSelf()

  tutThree = display.newRect( centerX, centerY+ 20, display.contentWidth, display.contentHeight/5 )
  tutThree.alpha = .85
  tutThree:addEventListener( "tap", tutorialFour )
  group:insert(tutThree)

  threeText = display.newText("Click items on the list for more info.", display.contentWidth/2, 185, globals.IMPRIMA, 20)
  threeText:setFillColor( black )
  group:insert(threeText)

  triangle = display.newImage( "images/continue.png", 100, 100, true )
  triangle.x = 450
  triangle.y = 200
  triangle.width = 25
  triangle.height = 25
  group:insert( triangle )


  end
  
  -- second instruction pop-up
  local function tutorialTwo()
  tutOne:removeSelf()
  oneText:removeSelf()
  triangle:removeSelf()

  tutTwo = display.newRect( centerX, centerY+ 20, display.contentWidth, display.contentHeight/5 )
  tutTwo.alpha = .85
  tutTwo:addEventListener( "tap", tutorialThree )
  group:insert(tutTwo)

  twoText = display.newText("Buy items to help you during showtime.", display.contentWidth/2, 185, globals.IMPRIMA, 20)
  twoText:setFillColor( black )
  group:insert(twoText)

  triangle = display.newImage( "images/continue.png", 100, 100, true )
  triangle.x = 450
  triangle.y = 200
  triangle.width = 25
  triangle.height = 25
  group:insert( triangle )


  end

  --first instruction.
  local function tutorialOne()
  tutOne = display.newRect( centerX, centerY+ 20, display.contentWidth, display.contentHeight/5 )
  tutOne.alpha = .85
  tutOne:addEventListener( "tap", tutorialTwo )
  group:insert(tutOne)
  
  oneText = display.newText( "Welcome to the pantry!", display.contentWidth/2, 185, globals.IMPRIMA, 20 )
  oneText:setFillColor(black )
  group:insert(oneText)

  triangle = display.newImage( "images/continue.png", 100, 100, true )
  triangle.x = 450
  triangle.y = 200
  triangle.width = 25
  triangle.height = 25
  group:insert( triangle )

  end

-- performs first pop-up.
timer.performWithDelay( 100 , tutorialOne() )

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