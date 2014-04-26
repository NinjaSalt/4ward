---------------------------------------------------------------------------------
-- RECIPE BOOK TUTORIAL SCENE: Pop-up for recipe book tutorial.
-- Scene notes go here
---------------------------------------------------------------------------------
 
local storyboard = require( "storyboard" )
local scene = storyboard.newScene()
local globals= require ("classes.globals") 
-- Clear previous scene
storyboard.removeAll()
 
-- local forward references should go here --
 
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

  -- final instruction, closes tutorial.
  local function tutorialFour()
    tutThree:removeSelf()
    threeText:removeSelf()
    globals.completedBook = true
    storyboard.hideOverlay( "slideUp", 500 )

  end

  -- third instruction pop-up
  local function tutorialThree()

    tutTwo:removeSelf()
    twoText:removeSelf()

  tutThree = display.newRect( centerX, centerY+ 20, display.contentWidth, display.contentHeight/5 )
  tutThree.alpha = .85
  tutThree:addEventListener( "touch", tutorialFour )
  group:insert(tutThree)

  threeText = display.newText("Tap on side tabs to filter your recipes.", display.contentWidth/2, 185, globals.IMPRIMA, 20)
  threeText:setFillColor( black )
  group:insert(threeText)


 
  end
  
  -- second instruction pop-up
  local function tutorialTwo()
  print ("two")
  tutOne:removeSelf()
  oneText:removeSelf()

  tutTwo = display.newRect( centerX, centerY+ 20, display.contentWidth, display.contentHeight/5 )
  tutTwo.alpha = .85
  tutTwo:addEventListener( "touch", tutorialThree )
  group:insert(tutTwo)

  twoText = display.newText("See all your unlocked recipes here.", display.contentWidth/2, 185, globals.IMPRIMA, 20)
  twoText:setFillColor( black )
  group:insert(twoText)


  end

  --first instruction.
  local function tutorialOne()
  print ("one")
  tutOne = display.newRect( centerX, centerY+ 20, display.contentWidth, display.contentHeight/5 )
  tutOne.alpha = .85
  tutOne:addEventListener( "touch", tutorialTwo )
  group:insert(tutOne)
  
  oneText = display.newText( "Welcome to the Recipe Book!", display.contentWidth/2, 185, globals.IMPRIMA, 20 )
  oneText:setFillColor(black )
  group:insert(oneText)

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