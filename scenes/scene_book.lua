---------------------------------------------------------------------------------
-- RECIPE BOOK SCENE
-- Displays the recipe book of unlocked combos
---------------------------------------------------------------------------------
 
local storyboard = require( "storyboard" )
local scene = storyboard.newScene()
local globals = require ("classes.globals")

require("classes.recipes")
require("classes.basics")
require("classes.heroes")
local widget = require( "widget" )
-- Clear previous scene
storyboard.removeAll()
 
-- local forward references should go here --
 
---------------------------------------------------------------------------------
-- BEGINNING OF YOUR IMPLEMENTATION
---------------------------------------------------------------------------------
 
-- Called when the scene's view does not exist:
function scene:createScene( event )
  local group = self.view
  local recipesList = {}
  local foodImage
  local nameText
  local basicText
  local basicsList = {}
  local comboDescY = 275 
  local tabsX = 445

  local bkg = display.newImage( "images/mockback1.png", centerX, centerY, true )
  bkg.height=display.contentHeight; bkg.width=display.contentWidth
  group:insert (bkg)

  local bookBkg = display.newRect(display.contentWidth/2, display.contentHeight/2+20, display.contentWidth-40, display.contentHeight*.8)
  bookBkg:setFillColor(0.980392, 0.921569, 0.843137)
  group:insert(bookBkg)

  local picBkg = display.newRect(display.contentWidth/4,  display.contentHeight/2+20, display.contentWidth/2.5, display.contentHeight*.7)
  group:insert(picBkg)

  local focalRect =display.newRect(display.contentWidth/4,  display.contentHeight/2+20, display.contentWidth/3, display.contentHeight/2 )
  focalRect:setFillColor(1, 0.941176, 0.960784)
  group:insert(focalRect)

  --extended tabs.
  local extendY = 500
  local extendBasic = display.newRect(440, extendY, 25, 50)
  group:insert(extendBasic)

  -- Create the widget
   local scrollView = widget.newScrollView{
    y = 185,
    x = display.contentCenterX + display.contentWidth/6,
    width = display.contentWidth/2 - 50,
    height = display.contentHeight - 90,
    topPadding = 20,
    horizontalScrollDisabled = true,
    }
    group:insert(scrollView)

  local function onTapBasic(event,params)
  local body = event.target

    if (body.locker and foodImage ~= nil and nameText ~= nil and basicText ~= nil) then
      foodImage:removeSelf( )
      nameText:removeSelf( )
      basicText:removeSelf( )
    elseif (body.locker and nameText ~= nil and basicText ~= nil and foodImage == nil) then
      nameText:removeSelf( )
      basicText:removeSelf( )
    elseif (body.locker ==false and nameText ~= nil and basicText ~= nil and foodImage == nil) then
      nameText:removeSelf( )
      basicText:removeSelf( )
    elseif (body.locker ==false and nameText ~= nil and basicText ~= nil and foodImage ~= nil) then
      foodImage:removeSelf( )
      nameText:removeSelf( )
      basicText:removeSelf( )
    end
    -- Had to assign these as nil after removing them
    -- since removing them does not make them nil, they still have a value and it causes problems when it comes back around
    foodImage = nil
    nameText = nil
    basicText = nil

      if (body.locker) then
      foodImage = display.newImage( body.image )
      foodImage.width = display.contentWidth/2 - 100
      foodImage.height = display.contentWidth/2 - 100
      foodImage.x = display.contentWidth/4
      foodImage.y = 180
      group:insert(foodImage)
    end
    -- Displays the name of the combo
    nameText = display.newText( body.name, display.contentWidth/4, 85, globals.IMPRIMA, 20 )
    nameText:setFillColor(black )
    group:insert(nameText)

    -- Displays the ingredients combination of the combo food
    basicText=  display.newText( " ", display.contentWidth/4, 85, globals.IMPRIMA, 20 )
    group:insert(basicText)

  end


  local function onTapItem( event, params )
    local body = event.target
    if (body.unlocked and foodImage ~= nil and nameText ~= nil and basicText ~= nil) then
      foodImage:removeSelf( )
      nameText:removeSelf( )
      basicText:removeSelf( )
    elseif (body.unlocked and nameText ~= nil and basicText ~= nil and foodImage == nil) then
      nameText:removeSelf( )
      basicText:removeSelf( )
    elseif (body.unlocked ==false and nameText ~= nil and basicText ~= nil and foodImage == nil) then
      nameText:removeSelf( )
      basicText:removeSelf( )
    elseif (body.unlocked ==false and nameText ~= nil and basicText ~= nil and foodImage ~= nil) then
      foodImage:removeSelf( )
      nameText:removeSelf( )
      basicText:removeSelf( )
    end
    -- Had to assign these as nil after removing them
    -- since removing them does not make them nil, they still have a value and it causes problems when it comes back around
    foodImage = nil
    nameText = nil
    basicText = nil
      --setting the images 
    if (body.unlocked) then
      foodImage = display.newImage( body.image )
      foodImage.width = display.contentWidth/2 - 100
      foodImage.height = display.contentWidth/2 - 100
      foodImage.x = display.contentWidth/4
      foodImage.y = 180
      group:insert(foodImage)
    end
    -- Displays the name of the combo
    nameText = display.newText( body.name, display.contentWidth/4, 85, globals.IMPRIMA, 20 )
    nameText:setFillColor(black )
    group:insert(nameText)
    -- Displays the ingredients combination of the combo food
    basicText = display.newText( body.comboText, display.contentWidth/4, comboDescY, globals.IMPRIMA, 20 )
    basicText:setFillColor(black )
    group:insert(basicText)
  end

  local function basicSelect(event)
    local bY = 0
    -- clear recipes.
     for a = 1, table.maxn(globals.recipes) do
      if (recipesList[a]~= nil) then
        recipesList[a]:removeSelf()
      end
    end
    for i = 1,table.maxn( globals.recipes ) do
      recipesList[i] = nil --display.newText(" ", 0 ,0, globals.IMPRIMA, 1) 
    end

    -- end clear recipes.
    for c=1, table.maxn (globals.basics) do
      if (basicsList[c]~=nil) then
        basicsList[c]: removeSelf()
      end
    end

    -- TAB ADJUSTMENTS CLEARING
    breakfastRep: removeSelf()
    dinnerRep: removeSelf()
    dessertRep: removeSelf()

    breakfastRep = display.newImage("images/brHalfTab.png", tabsX, 160, true)
    breakfastRep.width = 40
    breakfastRep.height = 40
    group:insert(breakfastRep)

    dinnerRep = display.newImage("images/diHalfTab.png", tabsX, 220, true)
    dinnerRep.width = 40
    dinnerRep.height = 40
    group:insert(dinnerRep)

    dessertRep = display.newImage("images/deHalfTab.png", tabsX, 280, true)
    dessertRep.width = 40
    dessertRep.height = 40
    group:insert(dessertRep)

    extendBasic.y = 100
    extendBasic:setFillColor( 0.443137, 0.776471, 0.443137)

    for d= 1, table.maxn(globals.basics) do
      if ( globals.basics[d].locker == false) then 
      basicsList[d] = display.newText( "? ? ?", 0, 0, globals.IMPRIMA, 17 )
      basicsList[d]:setFillColor(black)
      basicsList[d].x = scrollView.width/2--scrollView.contentBounds.xMin
      basicsList[d].y = bY
      basicsList[d].id = d
      basicsList[d].name = "? ? ?"
      basicsList[d].image = nil
      basicsList[d].locker = false
      scrollView:insert( basicsList[d] )
      basicsList[d]:addEventListener( "tap", onTapBasic )
      bY=bY+40
    else
      basicsList[d] = display.newText( globals.basics[d].name, 0, 0, globals.IMPRIMA, 17 )
      basicsList[d]:setFillColor(black)
      basicsList[d].x = scrollView.width/2--scrollView.contentBounds.xMin
      basicsList[d].y = bY
      basicsList[d].id = d
      basicsList[d].name = globals.basics[d].name
      basicsList[d].image = globals.basics[d].image
      basicsList[d].locker = true
      scrollView:insert( basicsList[d] )
      basicsList[d]:addEventListener( "tap", onTapBasic )
      bY=bY+40
    end
  end

end


  -- function that allows tabbing to work (for breakfast, dinner, dessert.)
  local function catSelect(event)
    -- remove previous list
    for a = 1, table.maxn(globals.recipes) do
      if (recipesList[a]~= nil) then
        recipesList[a]:removeSelf()
      end
    end
    -- clear basic list.
    for c=1, table.maxn (globals.basics) do
      if (basicsList[c]~=nil) then
        basicsList[c]: removeSelf()
      end
    end
    for b = 1, table.maxn(globals.basics) do 
      basicsList[b] = nil
    end
    -- end clearing.

    -- TAB ADJUSTMENTS CLEARING
    breakfastRep: removeSelf()
    dinnerRep: removeSelf()
    dessertRep: removeSelf()

    -- TAB ADJUSMENTS DEPENDING ON WHICH CATEGORY WAS CHOSEN
    if (event.target.category == "breakfast") then

    breakfastRep = display.newImage("images/brFullTab.png", tabsX, 160, true)
    breakfastRep.width = 40
    breakfastRep.height = 40
    group:insert(breakfastRep)

    dinnerRep = display.newImage("images/diHalfTab.png", tabsX, 220, true)
    dinnerRep.width = 40
    dinnerRep.height = 40
    group:insert(dinnerRep)

    dessertRep = display.newImage("images/deHalfTab.png", tabsX, 280, true)
    dessertRep.width = 40
    dessertRep.height = 40
    group:insert(dessertRep)

    extendBasic.y = 160
    extendBasic:setFillColor(1, 0.980392, 0.803922)
    elseif (event.target.category == "dinner") then

    breakfastRep = display.newImage("images/brHalfTab.png", tabsX, 160, true)
    breakfastRep.width = 40
    breakfastRep.height = 40
    group:insert(breakfastRep)

    dinnerRep = display.newImage("images/diFullTab.png", tabsX, 220, true)
    dinnerRep.width = 40
    dinnerRep.height = 40
    group:insert(dinnerRep)

    dessertRep = display.newImage("images/deHalfTab.png", tabsX, 280, true)
    dessertRep.width = 40
    dessertRep.height = 40
    group:insert(dessertRep)

    extendBasic.y = 220
    extendBasic:setFillColor(0.27451, 0.509804, 0.705882)
    else
    breakfastRep = display.newImage("images/brHalfTab.png", tabsX, 160, true)
    breakfastRep.width = 40
    breakfastRep.height = 40
    group:insert(breakfastRep)

    dinnerRep = display.newImage("images/diHalfTab.png", tabsX, 220, true)
    dinnerRep.width = 40
    dinnerRep.height = 40
    group:insert(dinnerRep)

    dessertRep = display.newImage("images/deFullTab.png", tabsX, 280, true)
    dessertRep.width = 40
    dessertRep.height = 40
    group:insert(dessertRep)

    extendBasic.y = 280
    extendBasic:setFillColor( 1, 0.713725, 0.756863)
    end

    local myY = 0
    for i = 1,table.maxn( globals.recipes ) do
    -- if recipes are still locked, display them as ???
    if ( globals.recipes[i].unlocked == false) then 
      if (globals.recipes[i].category == event.target.category) then
      recipesList[i] = display.newText( "? ? ?", 0, 0, globals.IMPRIMA, 17 )
      recipesList[i]:setFillColor(black)
      recipesList[i].x = scrollView.width/2--scrollView.contentBounds.xMin
      recipesList[i].y = myY
      recipesList[i].id = i
      recipesList[i].name = "? ? ?"
      recipesList[i].image = nil
      recipesList[i].comboText = "? ? + ? ?"
      recipesList[i].unlocked = false
      scrollView:insert( recipesList[i] )
      myY=myY+40
      recipesList[i]:addEventListener( "tap", onTapItem )
    else
      recipesList[i] = nil --display.newText(" ", 0 ,0, globals.IMPRIMA, 1) --really strange way of going about this..
      end
      -- if recipes are unlocked, assign them the names and images of the combos
      elseif ( globals.recipes[i].unlocked ) then 
        if (globals.recipes[i].category == event.target.category) then
        recipesList[i] = display.newText( globals.recipes[i].name, 0, 0, globals.IMPRIMA, 17)
        recipesList[i]:setFillColor(black)
        recipesList[i].x = scrollView.width/2--scrollView.contentBounds.xMin
        recipesList[i].y = myY
        recipesList[i].id = i
        recipesList[i].name = globals.recipes[i].name
        recipesList[i].image = globals.recipes[i].image
        recipesList[i].comboText = globals.recipes[i].comboText
        recipesList[i].unlocked = true
        scrollView:insert( recipesList[i] )
        myY=myY+40
        recipesList[i]:addEventListener( "tap", onTapItem )
      else
        recipesList[i] = nil --display.newText(" ", 0 ,0, globals.IMPRIMA, 1)
        end
      end
      end
    end

 -- new code for separating recipes into tabs. basic, breakfast, dinner, dessert.
  --local currentTab = "basic"
  local bookTitle = display.newText( "Recipe Book", 0, 0, globals.LOBSTERTWO, 48 )
  bookTitle:setFillColor(black)
  bookTitle.x = display.contentCenterX
  bookTitle.y = 35
  group:insert( bookTitle )

  local currentTab = basicTab
  
  local basicTab = display.newRect(460, 100, 30, 50)
  basicTab:setFillColor( 0.443137, 0.776471, 0.443137)
  
  local breakfastTab = display.newRect(460, 160, 30, 50)
  breakfastTab: setFillColor (1, 0.980392, 0.803922)
  breakfastTab.category = "breakfast"
  
  local dinnerTab = display.newRect(460, 220, 30, 50)
  dinnerTab: setFillColor(0.27451, 0.509804, 0.705882)
  dinnerTab.category = "dinner"
  
  local dessertTab = display.newRect(460, 280, 30, 50)
  dessertTab: setFillColor( 1, 0.713725, 0.756863)
  dessertTab.category = "dessert"

  basicTab:addEventListener( "tap", basicSelect )
  breakfastTab:addEventListener( "tap", catSelect )
  dinnerTab:addEventListener( "tap", catSelect )
  dessertTab:addEventListener( "tap", catSelect )
  
  group:insert(basicTab)
  group:insert(breakfastTab)
  group:insert(dinnerTab)
  group:insert(dessertTab)


  --TAB ICON IMAGES 
  breakfastRep = display.newImage("images/brHalfTab.png", tabsX, 160, true)
  breakfastRep.width = 40
  breakfastRep.height = 40
  group:insert(breakfastRep)

  dinnerRep = display.newImage("images/diHalfTab.png", tabsX, 220, true)
  dinnerRep.width = 40
  dinnerRep.height = 40
  group:insert(dinnerRep)

  dessertRep = display.newImage("images/deHalfTab.png", tabsX, 280, true)
  dessertRep.width = 40
  dessertRep.height = 40
  group:insert(dessertRep)




  -- call basic items for the first time.
  for b = 1, table.maxn(globals.basics) do
    basicsList[b] = nil --display.newText( " ", 0, 0, globals.IMPRIMA, 1 )
  end

  local myY = 0
    for i = 1,table.maxn( globals.recipes ) do
      -- if recipes are still locked, display them as ???
      if ( globals.recipes[i].unlocked == false) then 
      recipesList[i] = display.newText( "? ? ?", 0, 0, globals.IMPRIMA, 17 )
      recipesList[i]:setFillColor(black)
      recipesList[i].x = scrollView.width/2--scrollView.contentBounds.xMin
      recipesList[i].y = myY
      recipesList[i].id = i
      recipesList[i].name = "? ? ?"
      recipesList[i].image = nil
      recipesList[i].comboText = "? ? + ? ?"
      recipesList[i].unlocked = false
      scrollView:insert( recipesList[i] )
      myY=myY+40
      recipesList[i]:addEventListener( "tap", onTapItem )
      -- if recipes are unlocked, assign them the names and images of the combos
      elseif ( globals.recipes[i].unlocked ) then 
      recipesList[i] = display.newText( globals.recipes[i].name, 0, 0, globals.IMPRIMA, 17 )
      recipesList[i]:setFillColor(black)
      recipesList[i].x = scrollView.width/2--scrollView.contentBounds.xMin
      recipesList[i].y = myY
      recipesList[i].id = i
      recipesList[i].name = globals.recipes[i].name
      recipesList[i].image = globals.recipes[i].image
      recipesList[i].comboText = globals.recipes[i].comboText
      recipesList[i].unlocked = true
      scrollView:insert( recipesList[i] )
      myY=myY+40
      recipesList[i]:addEventListener( "tap", onTapItem )
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
  if (globals.completedBook ~= true) then
  storyboard.showOverlay( "scenes.scene_recipeTutorial" , {effect = "slideDown", time = 500 })
  end
end
 
-- Called immediately after scene has moved onscreen:
function scene:enterScene( event )
  local group = self.view
end
 
-- Called when scene is about to move offscreen:
function scene:exitScene( event )
  local group = self.viewf
 
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