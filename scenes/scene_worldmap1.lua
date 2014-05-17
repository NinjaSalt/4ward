---------------------------------------------------------------------------------
-- SCENE NAME
-- Scene notes go here
---------------------------------------------------------------------------------
 
local storyboard = require( "storyboard" )
local scene = storyboard.newScene()
local globals = require("classes.globals")
local widget = require( "widget" )
-- local loadsave = require("classes.loadsave")
require("classes.levelUnlocking")

-- gameSettings = loadsave.loadTable("gamesettings.json")

 
-- Clear previous scene
storyboard.removeAll()
 
-- local forward references should go here --
 
---------------------------------------------------------------------------------
-- BEGINNING OF YOUR IMPLEMENTATION
---------------------------------------------------------------------------------

-- Called when the scene's view does not exist:
function scene:createScene( event )

  local group = self.view

  local levelSelect = 1
  local levels = {}
  levels_1 = {}
  levels_2 = {}
  levels_3 = {}
  
  local bkg = display.newImage( "images/mockback2.png", centerX, centerY, true )
  bkg.height=display.contentHeight; bkg.width=display.contentWidth
  group:insert (bkg)
  -- local bkg = display.newRect( centerX, centerY, display.contentWidth, display.contentHeight )
  -- bkg:setFillColor( gray )
  -- bkg.alpha = .5
  -- group:insert (bkg)

  -- local banner = display.newImageRect( "images/bannerBlue.png", 200, 80 )
  -- banner.x = 236
  -- banner.y = 45
  -- group:insert(banner)

  local titleText = {
    text = "On The Set",   
    x = 236,
    y = 40,
    width = display.contentWidth-152,     --required for multi-line and alignment
    font = globals.LOBSTERTWO,   
    fontSize = 35,
    align = "center"  --new alignment parameter
  }

  local title = display.newText(titleText)
  title:setFillColor( black )  
  group:insert(title)

  local itemShop = display.newImageRect( "images/pantry.png", 80, 80 )
  itemShop.x = 370
  itemShop.y = 40
  group:insert(itemShop)

  local recipeBook = display.newImageRect( "images/book.png", 75, 75 )
  recipeBook.x = 100
  recipeBook.y = 40
  group:insert(recipeBook)

  -- ScrollView listener
  local function scrollListener( event )

      local phase = event.phase
      if ( phase == "began" ) then print( "Scroll view was touched" )
      elseif ( phase == "moved" ) then print( "Scroll view was moved" )
      elseif ( phase == "ended" ) then print( "Scroll view was released" )
      end

      -- In the event a scroll limit is reached...
      if ( event.limitReached ) then
          --if ( event.direction == "up" ) then print( "Reached top limit" )
         -- elseif ( event.direction == "down" ) then print( "Reached bottom limit" )
          if ( event.direction == "left" ) then print( "Reached left limit" )
          elseif ( event.direction == "right" ) then print( "Reached right limit" )
          end
      end

      return true
  end

  -- Create the widget
  local scrollView = widget.newScrollView{
  --left = 0,
  --top = 100,
   y = 110,
   x = display.contentWidth/2,
    width = display.contentWidth - 60,
    height = 60,
    topPadding = 25,
    bottomPadding = 0,
    leftPadding = 0,
    rightPadding = 50,
    hideBackground = true,
    horizontalScrollDisabled = false,
    verticalScrollDisabled = true,
    --backgroundColor = { 0.7373, 0.5608, 0.5608 },
    listener = scrollListener
  }
  group:insert( scrollView)

  levels = {display.newImageRect( "images/world1/w1level1.png", 50, 50 ), display.newImageRect( "images/world1/w1level2.png", 50, 50 ), display.newImageRect( "images/world1/w1level3.png", 50, 50 ), 
            display.newImageRect( "images/world1/w1level4.png", 50, 50 ), display.newImageRect( "images/world1/w1level5.png", 50, 50 ), display.newImageRect( "images/world1/w1level6.png", 50, 50 ), 
            display.newImageRect( "images/world1/w1level7.png", 50, 50 ), display.newImageRect( "images/world1/w1level8.png", 50, 50 ), display.newImageRect( "images/world1/w1level9.png", 50, 50 ), 
            display.newImageRect( "images/world1/w1level10.png", 50, 50 )}

  levels_1 = {display.newImageRect( "images/world1/1star/w1level1_1.png", 50, 50 ), display.newImageRect( "images/world1/1star/w1level2_1.png", 50, 50 ), display.newImageRect( "images/world1/1star/w1level3_1.png", 50, 50 ), 
            display.newImageRect( "images/world1/1star/w1level4_1.png", 50, 50 ), display.newImageRect( "images/world1/1star/w1level5_1.png", 50, 50 ), display.newImageRect( "images/world1/1star/w1level6_1.png", 50, 50 ), 
            display.newImageRect( "images/world1/1star/w1level7_1.png", 50, 50 ), display.newImageRect( "images/world1/1star/w1level8_1.png", 50, 50 ), display.newImageRect( "images/world1/1star/w1level9_1.png", 50, 50 ), 
            display.newImageRect( "images/world1/1star/w1level10_1.png", 50, 50 )}

  levels_2 = {display.newImageRect( "images/world1/2star/w1level1_2.png", 50, 50 ), display.newImageRect( "images/world1/2star/w1level2_2.png", 50, 50 ), display.newImageRect( "images/world1/2star/w1level3_2.png", 50, 50 ), 
            display.newImageRect( "images/world1/2star/w1level4_2.png", 50, 50 ), display.newImageRect( "images/world1/2star/w1level5_2.png", 50, 50 ), display.newImageRect( "images/world1/2star/w1level6_2.png", 50, 50 ), 
            display.newImageRect( "images/world1/2star/w1level7_2.png", 50, 50 ), display.newImageRect( "images/world1/2star/w1level8_2.png", 50, 50 ), display.newImageRect( "images/world1/2star/w1level9_2.png", 50, 50 ), 
            display.newImageRect( "images/world1/2star/w1level10_2.png", 50, 50 )}

  levels_3 = {display.newImageRect( "images/world1/3star/w1level1_3.png", 50, 50 ), display.newImageRect( "images/world1/3star/w1level2_3.png", 50, 50 ), display.newImageRect( "images/world1/3star/w1level3_3.png", 50, 50 ), 
            display.newImageRect( "images/world1/3star/w1level4_3.png", 50, 50 ), display.newImageRect( "images/world1/3star/w1level5_3.png", 50, 50 ), display.newImageRect( "images/world1/3star/w1level6_3.png", 50, 50 ), 
            display.newImageRect( "images/world1/3star/w1level7_3.png", 50, 50 ), display.newImageRect( "images/world1/3star/w1level8_3.png", 50, 50 ), display.newImageRect( "images/world1/3star/w1level9_3.png", 50, 50 ), 
            display.newImageRect( "images/world1/3star/w1level10_3.png", 50, 50 )}



  for i=1, table.maxn( levels ) do
    if (levels_1[i] ~=nil and levels_2[i] ~= nil and levels_3[i] ~= nil) then
      levels_1[i].alpha = 0
      levels_2[i].alpha = 0
      levels_3[i].alpha = 0
    end
    levels[i].x = 55*i
    if (globals.stars[1][i]~= nil) then
       if (globals.stars[1][i] >= 1) then
        levels[i]:removeSelf( )
        levels[i] = nil
        levels_1[i].alpha = 1
        levels[i] = levels_1[i]
        levels[i].x = 55*i
      end
      if (globals.stars[1][i] >= 2) then
        levels[i]:removeSelf( )
        levels[i] = nil
        levels_2[i].alpha = 1
        levels[i] = levels_2[i]
        levels[i].x = 55*i
      end
      if (globals.stars[1][i] >= 3) then
        levels[i]:removeSelf( )
        levels[i] = nil
        levels_3[i].alpha = 1
        levels[i] = levels_3[i]
        levels[i].x = 55*i
      end
    end
    scrollView:insert(  levels[i] )
  end

   local function onTapLevel1 ( event )
    if (levelTitle ~= nil and objectives ~= nil) then
      transition.to( levelTitle, { time=200, alpha=0} )
      transition.to( objectives, { time=200, alpha=0} )
    end
        levelSelect = 1
        print("levelselet: " ..levelSelect)
    end
    local function onTapLevel2 ( event )
    if (levelTitle ~= nil and objectives ~= nil) then
      transition.to( levelTitle, { time=200, alpha=0} )
      transition.to( objectives, { time=200, alpha=0} )
    end
        levelSelect = 2
        print("levelselet: " ..levelSelect)
    end
    local function onTapLevel3 ( event )
    if (levelTitle ~= nil and objectives ~= nil) then
      transition.to( levelTitle, { time=200, alpha=0} )
      transition.to( objectives, { time=200, alpha=0} )
    end
        levelSelect = 3
        print("levelselet: " ..levelSelect)
    end
    local function onTapLevel4 ( event )
    if (levelTitle ~= nil and objectives ~= nil) then
      transition.to( levelTitle, { time=200, alpha=0} )
      transition.to( objectives, { time=200, alpha=0} )
    end
        levelSelect = 4
        print("levelselet: " ..levelSelect)
    end
    local function onTapLevel5 ( event )
    if (levelTitle ~= nil and objectives ~= nil) then
      transition.to( levelTitle, { time=200, alpha=0} )
      transition.to( objectives, { time=200, alpha=0} )
    end
        levelSelect = 5
        print("levelselet: " ..levelSelect)
    end
    local function onTapLevel6 ( event )
    if (levelTitle ~= nil and objectives ~= nil) then
      transition.to( levelTitle, { time=200, alpha=0} )
      transition.to( objectives, { time=200, alpha=0} )
    end
        levelSelect = 6
        print("levelselet: " ..levelSelect)
    end
    local function onTapLevel7 ( event )
    if (levelTitle ~= nil and objectives ~= nil) then
      transition.to( levelTitle, { time=200, alpha=0} )
      transition.to( objectives, { time=200, alpha=0} )
    end
        levelSelect = 7
        print("levelselet: " ..levelSelect)
    end
    local function onTapLevel8 ( event )
    if (levelTitle ~= nil and objectives ~= nil) then
      transition.to( levelTitle, { time=200, alpha=0} )
      transition.to( objectives, { time=200, alpha=0} )
    end
        levelSelect = 8
        print("levelselet: " ..levelSelect)
    end
    local function onTapLevel9 ( event )
    if (levelTitle ~= nil and objectives ~= nil) then
      transition.to( levelTitle, { time=200, alpha=0} )
      transition.to( objectives, { time=200, alpha=0} )
    end
        levelSelect = 9
        print("levelselet: " ..levelSelect)
    end
    local function onTapLevel10 ( event )
    if (levelTitle ~= nil and objectives ~= nil) then
      transition.to( levelTitle, { time=200, alpha=0} )
      transition.to( objectives, { time=200, alpha=0} )
    end
        levelSelect = 10
        print("levelselet: " ..levelSelect)
    end

    local levelStart = display.newImageRect( "images/startButton.png", 65/2, 65/2 )
  levelStart.x = display.contentWidth-levelStart.width/2
  levelStart.y = display.contentHeight-levelStart.height/2
  group:insert(levelStart)

  local objectivesText = {
    text = "Objectives: Make a pancake!",     
    x = -250,
    y = -240,
    width = display.contentWidth-152,     --required for multi-line and alignment
    font = globals.IMPRIMA,   
    fontSize = 18,
    align = "center"  --new alignment parameter
  }

  local objectives = display.newText(objectivesText)
  group:insert(objectives)

  local levelTitleText = {
    text = "Step 1: Can you... Cook?",     
    x = -250,
    y = -195,
    width = display.contentWidth-152,     --required for multi-line and alignment
    font = globals.LOBSTERTWO,   
    fontSize = 28,
    align = "center"  --new alignment parameter
  }

  local levelTitle = display.newText(levelTitleText)
  group:insert(levelTitle)

      -- to get to recipe book.
  local function onTapBookIcon( event )
    recipeBook: removeSelf()
    recipeBook = nil
    recipeBook = display.newImageRect( "images/book2.png", 75, 75 )
    recipeBook.x = 100
    recipeBook.y = 40
  group:insert(recipeBook)
    timer.performWithDelay(700, function()
      storyboard.removeScene( scene )
      storyboard.gotoScene( "scenes.scene_book", {effect = "fade", time = 500})
    storyboard.showOverlay("scenes.overlay_backButton", {effect = "fade", time = 500})
      end)
  end

  -- to get to the store
  local function onTapStoreButton( event )
    itemShop: removeSelf( )
    itemShop = nil
    itemShop = display.newImageRect( "images/pantry2.png", 80, 80 )
    itemShop.x = 370
    itemShop.y = 40
    group:insert(itemShop)
  timer.performWithDelay(700, function()
    storyboard.removeScene( scene )
    storyboard.gotoScene( "scenes.scene_store", {effect = "fade", time = 500})
    storyboard.showOverlay("scenes.overlay_backButton", {effect = "fade", time = 500})
      end)
  end

  recipeBook:addEventListener( "tap", onTapBookIcon )
  itemShop:addEventListener( "tap", onTapStoreButton )
  --resetScreen:addEventListener( "tap", resetlevelSelect )

  local backButton = display.newImage("images/leftArrow.png")
  backButton.x = 466 
  backButton.y = 12
  backButton.height = 20
  backButton.width = 20
  group:insert(backButton)
  
  local function onTapBack( event )
    storyboard.removeScene( scene )
    storyboard.gotoScene( "scenes.scene_worldmap",{ effect = "fade", time = 250})
  end

  backButton:addEventListener("tap",onTapBack)


  local function onTapStartLevel (event)
  	if( levelSelect < 10 or ( levelSelect == 10  and worlds[1].levelsUnlocked[5] ) ) then
  		storyboard.removeScene( scene )
  		storyboard.gotoScene( "scenes.scene_ingame", { effect = "fade", time = 250, params = {level = levelSelect, world = 1}})
  	end
  end
  
  levels[1]:addEventListener("tap", onTapLevel1)
  levels[2]:addEventListener("tap", onTapLevel2)
  levels[3]:addEventListener("tap", onTapLevel3)
  levels[4]:addEventListener("tap", onTapLevel4)
  levels[5]:addEventListener("tap", onTapLevel5)
  levels[6]:addEventListener("tap", onTapLevel6)
  levels[7]:addEventListener("tap", onTapLevel7)
  levels[8]:addEventListener("tap", onTapLevel8)
  levels[9]:addEventListener("tap", onTapLevel9)
  levels[10]:addEventListener("tap", onTapLevel10)


  levelStart:addEventListener("tap", onTapStartLevel)

  -- local function onTapBackArrow (event)
  --   storyboard.removeScene(scene)
  --   storyboard.gotoScene("scenes.scene_worldmap", {effect = "fade", time = 250})
  -- end

  -- backArrow:addEventListener("tap", onTapBackArrow)
  --onTapLevel1()
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