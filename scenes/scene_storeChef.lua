---------------------------------------------------------------------------------
-- SCENE NAME
-- Scene notes go here
-- The menu for the map screen
---------------------------------------------------------------------------------
 
local storyboard = require( "storyboard" )
local scene = storyboard.newScene()
local itemToGive
 notTouched = true
local globals= require("classes.globals") 
local loadsave = require("classes.loadsave")
 
require("classes.items")
require("classes.heroes")
require("scenes.scene_store")
-- Clear previous scene
storyboard.removeAll()

gameSettings = loadsave.loadTable("gamesettings.json")
 
-- local forward references should go here --
 
---------------------------------------------------------------------------------
-- BEGINNING OF YOUR IMPLEMENTATION
---------------------------------------------------------------------------------
 
-- Called when the scene's view does not exist:
function scene:createScene( event )
  local group = self.view
  
  local options = {
   effect = "fade",
   time = 500
  }
  local prevScore = gameSettings[7]
  --globals.currency.set(prevScore)


  local bkg = display.newRect( centerX, centerY, display.contentWidth, display.contentHeight )
  bkg:setFillColor( gray )
  bkg.alpha = .5
  group:insert (bkg)
  
  bkg:addEventListener("touch", function() return true end)
  bkg:addEventListener("tap", function() return true end)

  local menuBorder = display.newRect( display.contentWidth/2, display.contentHeight/2, 260, 260)
  menuBorder:setFillColor(0)
  group:insert(menuBorder)

  local menuBack = display.newRect( display.contentWidth/2, display.contentHeight/2, 250, 250)
  menuBack: setFillColor( 0.980392, 0.921569, 0.843137 )
  group:insert (menuBack) 
  
  local whichText = display.newText("Choose an item slot:", display.contentWidth/2, 55, globals.LOBSTERTWO, 20)
  whichText:setFillColor( 0 )
  group:insert(whichText)

  local function cancel(event)
    storyboard.removeScene( scene )
    storyboard.hideOverlay( "slideUp", 500 )
    storyboard.showOverlay("scenes.overlay_backButton", {effect = "fade", time = 500})
  end

  local goBack = display.newText("Cancel", display.contentWidth/2, 265, globals.LOBSTERTWO, 20)
  goBack:setFillColor( 0 )
  goBack:addEventListener( "tap", cancel )
  group:insert(goBack)

  local function giveItem1( event )
  	if (notTouched) then
  		myItems[0] = itemToGive
      if gameSettings[6][1] == false then
        gameSettings[6][1]=myItems[0]
        loadsave.saveTable(gameSettings , "gamesettings.json")
      end
  		notTouched = false
      if (prevScore > itemToGive.cost) then
        gameSettings[7] = gameSettings[7] - myItems[0].cost
        loadsave.saveTable(gameSettings , "gamesettings.json")
      end
  	end
    updateCurrency()
	  storyboard.removeScene( scene )
    storyboard.hideOverlay( "slideDown", 500 )
    storyboard.showOverlay("scenes.overlay_backButton", {effect = "fade", time = 500})
  end

  local function giveItem2( event )
    if (notTouched) then
  		myItems[1] = itemToGive
      if gameSettings[6][2] == false then
        gameSettings[6][2]=myItems[1]
        loadsave.saveTable(gameSettings , "gamesettings.json")
      end
  		notTouched = false
      if (prevScore > itemToGive.cost) then
        gameSettings[7] = gameSettings[7] - myItems[1].cost
        loadsave.saveTable(gameSettings , "gamesettings.json")
      end
  	end
    updateCurrency()
	  storyboard.removeScene( scene )
    storyboard.hideOverlay( "slideDown", 500 )
    storyboard.showOverlay("scenes.overlay_backButton", {effect = "fade", time = 500})
  end

  local function giveItem3( event )
    if (notTouched) then
  		myItems[2] = itemToGive
  		if gameSettings[6][3] == false then
	      gameSettings[6][3]=myItems[2]
	      loadsave.saveTable(gameSettings , "gamesettings.json")
	  	end
  		notTouched = false
      if (prevScore > itemToGive.cost) then
        gameSettings[7] = gameSettings[7] - myItems[2].cost
        loadsave.saveTable(gameSettings , "gamesettings.json")
      end
  	end
    updateCurrency()
	  storyboard.removeScene( scene )
    storyboard.hideOverlay( "slideDown", 500 )
    storyboard.showOverlay("scenes.overlay_backButton", {effect = "fade", time = 500})
    
  end

  for i = 0, 2, 1 do
    if (gameSettings[6][i+1]~=false) then
      myItems[i] = gameSettings[6][i+1]
    elseif (gameSettings[6][i+1]==false) then
		  myItems[i] = nil
    end
  end

  local gameItems = {}
  local spacing = -60
  for i = 0, 2, 1 do
	  	if ( myItems[i] ~= nil)then
  			gameItems[i] = display.newImage(myItems[i].image, display.contentWidth/2, (display.contentHeight/2) + spacing)
  			gameItems[i].height = 50 
  			gameItems[i].width = 50 
  			gameItems[i]:setStrokeColor("black")
  			gameItems[i].strokeWidth = 3
  			if ( i == 0 )then gameItems[i]:addEventListener( "touch", giveItem1 ) 
  			elseif ( i == 1 ) then gameItems[i]:addEventListener( "touch", giveItem2 )
  			elseif ( i == 2) then gameItems[i]:addEventListener( "touch", giveItem3 )
			end
			group:insert (gameItems[i])
		else
			gameItems[i] = display.newRect(display.contentWidth/2, (display.contentHeight/2) + spacing, 50, 50)
			gameItems[i]:setStrokeColor("black")
			gameItems[i].strokeWidth = 3
			if ( i == 0 )then gameItems[i]:addEventListener( "touch", giveItem1 ) 
			elseif  ( i == 1 ) then gameItems[i]:addEventListener( "touch", giveItem2 )
			elseif ( i == 2) then gameItems[i]:addEventListener( "touch", giveItem3 )
			end
			group:insert (gameItems[i])
		end
		spacing = spacing+60
	end
   
end
 
-- Called BEFORE scene has moved onscreen:
function scene:willEnterScene( event )
  local group = self.view
 
end
 
-- Called immediately after scene has moved onscreen:
function scene:enterScene( event )
  local group = self.view
  local params = event.params
  itemToGive = params.item
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