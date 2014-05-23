---------------------------------------------------------------------------------
-- SCENE NAME
-- Scene notes go here
---------------------------------------------------------------------------------
 
local storyboard = require( "storyboard" )
local scene = storyboard.newScene()
local globals= require("classes.globals") 
require("classes.items")
require("classes.heroes")
local widget = require( "widget" )
--globals.currency = require( "classes.score" )
-- Clear previous scene
storyboard.removeAll()
 
-- local forward references should go here --
 
---------------------------------------------------------------------------------
-- BEGINNING OF YOUR IMPLEMENTATION
---------------------------------------------------------------------------------
 
-- Called when the scene's view does not exist:
function scene:createScene( event )
  local group = self.view
  local prevScore = globals.currency.load()
  print("prevScore " .. prevScore)
  globals.currency.set(prevScore)

  -- if (prevScore==nil or globals.currency ~= nil) then
  --   globals.currency.set(0)
  -- end
  local itemList = {}

  local buyButton
  local itemName 
  local itemImage 
  local desc 
  local toUseText
  local toUse 

  local bkg = display.newImage( "images/mockback1.png", centerX, centerY, true )
  bkg.height=display.contentHeight; bkg.width=display.contentWidth
  group:insert (bkg)

  local leftBox =display.newRect(display.contentWidth/4,  display.contentHeight/2+30, display.contentWidth/2.2, display.contentHeight*.75)
  leftBox:setFillColor(0.870588, 0.721569, 0.529412)
  group:insert(leftBox)

  local leftInner = display.newRect(display.contentWidth/4,  display.contentHeight/2+30, display.contentWidth/2.4, display.contentHeight*.65)
  leftInner: setFillColor( 0.980392, 0.921569, 0.843137 )
  group:insert(leftInner)

  local rightBox =display.newRect(350 ,  display.contentHeight/2+30, display.contentWidth/2.2, display.contentHeight*.75)
  rightBox:setFillColor(0.870588, 0.721569, 0.529412)
  group:insert(rightBox)

  --lines for mock shelving
  local shelfx1 = 20
  local shelfx2 = 220
  local startY = 120

  local lineOne = display.newLine(shelfx1, startY, shelfx2 , startY)
  lineOne: setStrokeColor(0.870588, 0.721569, 0.529412)
  lineOne.strokeWidth = 4
  group:insert(lineOne)

  local lineTwo = display.newLine(shelfx1, startY+60, shelfx2 , startY+60)
  lineTwo: setStrokeColor( 0.870588, 0.721569, 0.529412)
  lineTwo.strokeWidth = 4
  group:insert(lineTwo)

  local lineThree = display.newLine(shelfx1, startY+140, shelfx2 , startY+140)
  lineThree: setStrokeColor( 0.870588, 0.721569, 0.529412)
  lineThree.strokeWidth = 4
  group:insert(lineThree)
  
  -- name of store
  local storeTitles = display.newText( "The Pantry", 0, 0, globals.LOBSTERTWO, 38 )
  storeTitles:setFillColor(0.282353, 0.819608, 0.8)
  storeTitles.x = display.contentCenterX-4
  storeTitles.y = 28
  group:insert( storeTitles )

  local storeTitle = display.newText( "The Pantry", 0, 0, globals.LOBSTERTWO, 38 )
  storeTitle:setFillColor(black)
  storeTitle.x = display.contentCenterX
  storeTitle.y = 30
  group:insert( storeTitle )


local currencyGradient = display.newImage("images/money.png")
  currencyGradient.width = 80
  currencyGradient.height = 40
  currencyGradient.x = currencyGradient.width/2+5
  currencyGradient.y = currencyGradient.height/2+5
  group:insert(currencyGradient)

  globals.currenyText = globals.currency.init({
    fontSize = 20,
    font = "Helvetica",
    x = currencyGradient.width/2+5,
    y = currencyGradient.height/2+5,
    maxDigits = 7,
    leadingZeros = false,
    filename = "currencyfile.txt"
    })
 -- currenyText:setFillColor( black )
  group:insert(globals.currenyText)
  
	local function scrollListener( event )

		local phase = event.phase
		if ( phase == "began" ) then print( "Scroll view was touched" )
		elseif ( phase == "moved" ) then print( "Scroll view was moved" )
		elseif ( phase == "ended" ) then print( "Scroll view was released" )
		end

		-- In the event a scroll limit is reached...
		if ( event.limitReached ) then
			if ( event.direction == "up" ) then print( "Reached top limit" )
			elseif ( event.direction == "down" ) then print( "Reached bottom limit" )
			elseif ( event.direction == "left" ) then print( "Reached left limit" )
			elseif ( event.direction == "right" ) then print( "Reached right limit" )
			end
		end

		return true
	end

	
-- Create the widget
	local scrollView = widget.newScrollView{
		y = 190,
		x = display.contentCenterX+110,
		width = 200,
		height = 220,
		topPadding = 20,
		--hideBackground = true,
		horizontalScrollDisabled = true,
		backgroundColor = { 0.2, 0.2, 0.2 },
		listener = scrollListener
	}
  group:insert( scrollView)
  
  local function onTapBuy( event )
    storyboard.removeScene( scene )
    storyboard.showOverlay( "scenes.scene_storeChef",{ effect = "slideDown", time = 500, params = {item = items[event.target.id]}})
    --globals.negativeNum = (-1)*items[event.target.id].cost
  end

  --local buyButton
  --local itemName
  --local itemImage
  --local desc
  --local toUse


  local function onTapUnlockedItem(event)
  	local body= event.target
  	if (buyButton~= nil) then
  		buyButton:removeSelf()
  		toUseText:removeSelf()
  	end

  	if (itemName ~= nil) then
  		itemName:removeSelf()
  		itemImage:removeSelf()
  		desc:removeSelf()
  		toUse:removeSelf()
  	end

  	buyButton = nil
  	itemName = nil
  	itemImage = nil
  	desc = nil
  	toUse = nil

  	--display name
  	itemName = display.newText(body.name, display.contentWidth/4, 105, globals.LOBSTERTWO, 21)
  	itemName:setFillColor (0)
  	group:insert(itemName)

  	-- display image
  	itemImage = display.newImage (body.image,display.contentWidth/4, 150)
  	itemImage.width = 50
  	itemImage.height = 50
  	group:insert(itemImage)


  	-- description for locked:
  	desc = display.newText(body.description, display.contentWidth/4, 200, globals.IMPRIMA, 12)
  	desc:setFillColor(0)
  	group:insert(desc)

  	-- "to use"
  	toUseText = display.newText("HOW TO USE", display.contentWidth/4, 230, globals.IMPRIMA, 10)
  	toUseText: setFillColor( 0.282353, 0.819608, 0.8)
  	group:insert(toUseText)

  	--description for toUse (for locked it's the level)
  	toUse = display.newText (body.toUse, display.contentWidth/4, 245, globals.IMPRIMA, 12)
  	toUse: setFillColor(0)
  	group:insert(toUse)

  	--buy button
  	buyButton = display.newText ("Buy for ".. body.cost, display.contentWidth/4, 278, globals.LOBSTERTWO, 25)
  	buyButton: setFillColor(0.502, 0, 0)

    buyButton.alpha = 0.2
  	buyButton.id = body.id
    if (prevScore > 300) then
      buyButton.alpha = 1
      buyButton: setFillColor(0.282353, 0.819608, 0.8)
      buyButton:addEventListener( "tap", onTapBuy )
    end
  	group:insert(buyButton)

  end

  local function onTapLockedItem(event)
  	local body = event.target

  	if (buyButton~= nil) then
  		buyButton:removeSelf()
  		toUseText:removeSelf()
  	end

  	if (itemName ~= nil) then
  		itemName:removeSelf()
  		itemImage:removeSelf()
  		desc:removeSelf()
  		toUse:removeSelf()
  	end

  	buyButton = nil
  	toUseText = nil
  	itemName = nil
  	itemImage = nil
  	desc = nil
  	toUse = nil

  	--display name
  	itemName = display.newText("? ? ?", display.contentWidth/4, 105, globals.LOBSTERTWO, 21)
  	itemName:setFillColor (0)
  	group:insert(itemName)

  	-- display image
  	itemImage = display.newImage ("images/lock.png",display.contentWidth/4, 150)
  	itemImage.width = 50
  	itemImage.height = 50
  	group:insert(itemImage)


  	-- description for locked:
  	desc = display.newText("LOCKED UNTIL", display.contentWidth/4, 200, globals.IMPRIMA, 16)
  	desc:setFillColor(0)
  	group:insert(desc)

  	--description for toUse (for locked it's the level)
  	toUse = display.newText (body.lockLevel, display.contentWidth/4, 235, globals.IMPRIMA, 20)
  	toUse: setFillColor(0)
  	group:insert(toUse)

  end
  
  local myY = 0
  local costList = {}
	for i = 1,table.maxn( items ) do
		if ( items[i].unlocked ) then 
		  itemList[i] = display.newText( items[i].name, 0, 0, globals.IMPRIMA, 18 )
		  itemList[i].anchorX = 0
		  --itemList[i]:setFillColor(white)
		  itemList[i].x = 20--scrollView.contentBounds.xMin
		  itemList[i].y = myY
		  itemList[i].id = i
		  itemList[i].name = items[i].name
		  itemList[i].image = items[i].image
		  itemList[i].description = items[i].description
		  itemList[i].toUse = items[i].toUse
		  itemList[i].lockLevel = items[i].lockLevel
		  itemList[i].cost = items[i].cost
		  costList[i] = display.newText( items[i].cost, 0, 0, globals.IMPRIMA, 18 )
		  costList[i].anchorX = 0
		  costList[i].y = myY
		  costList[i].x = scrollView.width-20
		  costList[i].anchorX = 1
		  scrollView:insert( itemList[i] )
		  scrollView:insert( costList[i] )
		  myY=myY+35
		  itemList[i]:addEventListener( "tap", onTapUnlockedItem )
		else
		  itemList[i] = display.newText( "????", 0, 0, globals.IMPRIMA, 18 )
		  itemList[i].anchorX = 0
		  itemList[i].description = items[i].description
		  itemList[i].toUse = items[i].toUse
		  itemList[i].lockLevel = items[i].lockLevel
		  --itemList[i]:setFillColor(white)
		  itemList[i].x = 20--scrollView.contentBounds.xMin
		  itemList[i].y = myY
		  itemList[i].id = i
		  costList[i] = display.newText( "????", 0, 0, globals.IMPRIMA, 18 )
		  costList[i].anchorX = 0
		  costList[i].y = myY
		  costList[i].x = scrollView.width-20
		  costList[i].anchorX = 1
		  scrollView:insert( itemList[i] )
		  scrollView:insert( costList[i] )
		  itemList[i]:addEventListener( "tap", onTapLockedItem )
		  myY=myY+35
		end
	end

  -- local backButton = display.newImage("images/leftArrow.png")
  -- backButton.x = 466 
  -- backButton.y = 12
  -- backButton.height = 20
  -- backButton.width = 20
  -- group:insert(backButton)
  
  -- local function onTapBack( event )
  --   storyboard.removeScene( scene )
  --   storyboard.gotoScene( "scenes.scene_worldmap",{ effect = "fade", time = 250})
  -- end

  -- backButton:addEventListener("tap",onTapBack)



end
 
-- Called BEFORE scene has moved onscreen:
function scene:willEnterScene( event )
  local group = self.view
 
end
 
-- Called immediately after scene has moved onscreen:
function scene:enterScene( event )
  local group = self.view
  prevScore = globals.currency.load()
        globals.currency.set(prevScore)

-- goes to pantry tutorial page.
if (globals.completedShop ~= true) then
  storyboard.showOverlay( "scenes.scene_pantryTutorial" , {effect = "slideDown", time = 500 })
 end
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