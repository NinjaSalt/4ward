-- globals.lua

local globals = {}

-- global variable is game paused
globals.gamePaused = false;

globals.hearts = {}
globals.hearts[0] = display.newImage("images/heart.png",20,20)
globals.hearts[1] = display.newImage("images/heart.png",20,20)
globals.hearts[2] = display.newImage("images/heart.png",20,20)

return globals