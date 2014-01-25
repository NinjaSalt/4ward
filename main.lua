-- main.lua
 
-- Hide the iPhone status bar
display.setStatusBar( display.HiddenStatusBar )
centerX = display.contentCenterX
centerY = display.contentCenterY
_W = display.contentWidth
_H = display.contentHeight
local options = {
   effect = "fade",
   time = 500
}

local storyboard = require( "storyboard" )
storyboard.gotoScene("scenes.scene_splash" , options)




