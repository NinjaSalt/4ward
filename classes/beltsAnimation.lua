local globals = require("classes.globals")
local normalSpeed = 2500
local slowSpeed = 17000
local fastSpeed = 1100

 local breakfastsheetSettings =
  	{
  	 width = 410,
  	 height = 60,
 	  numFrames = 12
	}
	 breakfastsheet = graphics.newImageSheet("images/belts03sheet.png",breakfastsheetSettings)
	 breakfastsequenceData = {
	--higher the time, slower it goes
	{ name = "breakfast_normal", frames={1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12}, time=normalSpeed, loopCount=0 },
   { name = "breakfast_normal2", frames={2, 3, 4 ,5 ,6 ,7 ,8 ,9 ,10, 11, 12, 1}, time=normalSpeed, loopCount=0 },
   { name = "breakfast_normal3", frames={3, 4, 5 ,6 ,7 ,8 ,9 ,10, 11, 12, 1, 2}, time=normalSpeed, loopCount=0 },
   { name = "breakfast_normal4", frames={4, 5, 6 ,7 ,8 ,9 ,10, 11, 12, 1, 2, 3}, time=normalSpeed, loopCount=0 },
   { name = "breakfast_normal5", frames={5, 6, 7 ,8 ,9 ,10, 11, 12, 1, 2, 3, 4}, time=normalSpeed, loopCount=0 },
   { name = "breakfast_normal6", frames={6, 7, 8, 9, 10, 11, 12, 1, 2, 3, 4, 5}, time=normalSpeed, loopCount=0 },
   { name = "breakfast_normal7", frames={7, 8, 9, 10, 11, 12, 1, 2, 3, 4, 5, 6}, time=normalSpeed, loopCount=0 },
   { name = "breakfast_normal8", frames={8, 9, 10, 11, 12, 1, 2, 3, 4, 5, 6, 7}, time=normalSpeed, loopCount=0 },
   { name = "breakfast_normal9", frames={9, 10, 11, 12, 1, 2, 3, 4, 5, 6, 7, 8}, time=normalSpeed, loopCount=0 },
   { name = "breakfast_normal10", frames={10, 11, 12, 1, 2, 3, 4, 5, 6, 7, 8, 9}, time=normalSpeed, loopCount=0 },
   { name = "breakfast_normal11", frames={11, 12, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10}, time=normalSpeed, loopCount=0 },
   { name = "breakfast_normal12", frames={12, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11}, time=normalSpeed, loopCount=0 },

   { name = "breakfast_fast", frames={1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12}, time=fastSpeed, loopCount=0 },
   { name = "breakfast_fast2", frames={2, 3, 4 ,5 ,6 ,7 ,8 ,9 ,10, 11, 12, 1}, time=fastSpeed, loopCount=0 },
   { name = "breakfast_fast3", frames={3, 4, 5 ,6 ,7 ,8 ,9 ,10, 11, 12, 1, 2}, time=fastSpeed, loopCount=0 },
   { name = "breakfast_fast4", frames={4, 5, 6 ,7 ,8 ,9 ,10, 11, 12, 1, 2, 3}, time=fastSpeed, loopCount=0 },
   { name = "breakfast_fast5", frames={5, 6, 7 ,8 ,9 ,10, 11, 12, 1, 2, 3, 4}, time=fastSpeed, loopCount=0 },
   { name = "breakfast_fast6", frames={6, 7, 8, 9, 10, 11, 12, 1, 2, 3, 4, 5}, time=fastSpeed, loopCount=0 },
   { name = "breakfast_fast7", frames={7, 8, 9, 10, 11, 12, 1, 2, 3, 4, 5, 6}, time=fastSpeed, loopCount=0 },
   { name = "breakfast_fast8", frames={8, 9, 10, 11, 12, 1, 2, 3, 4, 5, 6, 7}, time=fastSpeed, loopCount=0 },
   { name = "breakfast_fast9", frames={9, 10, 11, 12, 1, 2, 3, 4, 5, 6, 7, 8}, time=fastSpeed, loopCount=0 },
   { name = "breakfast_fast10", frames={10, 11, 12, 1, 2, 3, 4, 5, 6, 7, 8, 9}, time=fastSpeed, loopCount=0 },
   { name = "breakfast_fast11", frames={11, 12, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10}, time=fastSpeed, loopCount=0 },
   { name = "breakfast_fast12", frames={12, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11}, time=fastSpeed, loopCount=0 },

   { name = "breakfast_slow", frames={1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12}, time=slowSpeed, loopCount=0 },
   { name = "breakfast_slow2", frames={2, 3, 4 ,5 ,6 ,7 ,8 ,9 ,10, 11, 12, 1}, time=slowSpeed, loopCount=0 },
   { name = "breakfast_slow3", frames={3, 4, 5 ,6 ,7 ,8 ,9 ,10, 11, 12, 1, 2}, time=slowSpeed, loopCount=0 },
   { name = "breakfast_slow4", frames={4, 5, 6 ,7 ,8 ,9 ,10, 11, 12, 1, 2, 3}, time=slowSpeed, loopCount=0 },
   { name = "breakfast_slow5", frames={5, 6, 7 ,8 ,9 ,10, 11, 12, 1, 2, 3, 4}, time=slowSpeed, loopCount=0 },
   { name = "breakfast_slow6", frames={6, 7, 8, 9, 10, 11, 12, 1, 2, 3, 4, 5}, time=slowSpeed, loopCount=0 },
   { name = "breakfast_slow7", frames={7, 8, 9, 10, 11, 12, 1, 2, 3, 4, 5, 6}, time=slowSpeed, loopCount=0 },
   { name = "breakfast_slow8", frames={8, 9, 10, 11, 12, 1, 2, 3, 4, 5, 6, 7}, time=slowSpeed, loopCount=0 },
   { name = "breakfast_slow9", frames={9, 10, 11, 12, 1, 2, 3, 4, 5, 6, 7, 8}, time=slowSpeed, loopCount=0 },
   { name = "breakfast_slow10", frames={10, 11, 12, 1, 2, 3, 4, 5, 6, 7, 8, 9}, time=slowSpeed, loopCount=0 },
   { name = "breakfast_slow11", frames={11, 12, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10}, time=slowSpeed, loopCount=0 },
   { name = "breakfast_slow12", frames={12, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11}, time=slowSpeed, loopCount=0 }
}

local dinnersheetSettings =
  	{
  	 width = 410,
  	 height = 60,
 	  numFrames = 12
	}
	 dinnersheet = graphics.newImageSheet("images/belts01sheet.png",dinnersheetSettings)
	 dinnersequenceData = {
	--higher the time, slower it goes
   { name = "dinner_normal", frames={1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12}, time=normalSpeed, loopCount=0 },
   { name = "dinner_normal2", frames={2, 3, 4 ,5 ,6 ,7 ,8 ,9 ,10, 11, 12, 1}, time=normalSpeed, loopCount=0 },
   { name = "dinner_normal3", frames={3, 4, 5 ,6 ,7 ,8 ,9 ,10, 11, 12, 1, 2}, time=normalSpeed, loopCount=0 },
   { name = "dinner_normal4", frames={4, 5, 6 ,7 ,8 ,9 ,10, 11, 12, 1, 2, 3}, time=normalSpeed, loopCount=0 },
   { name = "dinner_normal5", frames={5, 6, 7 ,8 ,9 ,10, 11, 12, 1, 2, 3, 4}, time=normalSpeed, loopCount=0 },
   { name = "dinner_normal6", frames={6, 7, 8, 9, 10, 11, 12, 1, 2, 3, 4, 5}, time=normalSpeed, loopCount=0 },
   { name = "dinner_normal7", frames={7, 8, 9, 10, 11, 12, 1, 2, 3, 4, 5, 6}, time=normalSpeed, loopCount=0 },
   { name = "dinner_normal8", frames={8, 9, 10, 11, 12, 1, 2, 3, 4, 5, 6, 7}, time=normalSpeed, loopCount=0 },
   { name = "dinner_normal9", frames={9, 10, 11, 12, 1, 2, 3, 4, 5, 6, 7, 8}, time=normalSpeed, loopCount=0 },
   { name = "dinner_normal10", frames={10, 11, 12, 1, 2, 3, 4, 5, 6, 7, 8, 9}, time=normalSpeed, loopCount=0 },
   { name = "dinner_normal11", frames={11, 12, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10}, time=normalSpeed, loopCount=0 },
   { name = "dinner_normal12", frames={12, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11}, time=normalSpeed, loopCount=0 },

   { name = "dinner_fast", frames={1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12}, time=fastSpeed, loopCount=0 },
   { name = "dinner_fast2", frames={2, 3, 4 ,5 ,6 ,7 ,8 ,9 ,10, 11, 12, 1}, time=fastSpeed, loopCount=0 },
   { name = "dinner_fast3", frames={3, 4, 5 ,6 ,7 ,8 ,9 ,10, 11, 12, 1, 2}, time=fastSpeed, loopCount=0 },
   { name = "dinner_fast4", frames={4, 5, 6 ,7 ,8 ,9 ,10, 11, 12, 1, 2, 3}, time=fastSpeed, loopCount=0 },
   { name = "dinner_fast5", frames={5, 6, 7 ,8 ,9 ,10, 11, 12, 1, 2, 3, 4}, time=fastSpeed, loopCount=0 },
   { name = "dinner_fast6", frames={6, 7, 8, 9, 10, 11, 12, 1, 2, 3, 4, 5}, time=fastSpeed, loopCount=0 },
   { name = "dinner_fast7", frames={7, 8, 9, 10, 11, 12, 1, 2, 3, 4, 5, 6}, time=fastSpeed, loopCount=0 },
   { name = "dinner_fast8", frames={8, 9, 10, 11, 12, 1, 2, 3, 4, 5, 6, 7}, time=fastSpeed, loopCount=0 },
   { name = "dinner_fast9", frames={9, 10, 11, 12, 1, 2, 3, 4, 5, 6, 7, 8}, time=fastSpeed, loopCount=0 },
   { name = "dinner_fast10", frames={10, 11, 12, 1, 2, 3, 4, 5, 6, 7, 8, 9}, time=fastSpeed, loopCount=0 },
   { name = "dinner_fast11", frames={11, 12, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10}, time=fastSpeed, loopCount=0 },
   { name = "dinner_fast12", frames={12, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11}, time=fastSpeed, loopCount=0 },

   { name = "dinner_slow", frames={1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12}, time=slowSpeed, loopCount=0 },
   { name = "dinner_slow2", frames={2, 3, 4 ,5 ,6 ,7 ,8 ,9 ,10, 11, 12, 1}, time=slowSpeed, loopCount=0 },
   { name = "dinner_slow3", frames={3, 4, 5 ,6 ,7 ,8 ,9 ,10, 11, 12, 1, 2}, time=slowSpeed, loopCount=0 },
   { name = "dinner_slow4", frames={4, 5, 6 ,7 ,8 ,9 ,10, 11, 12, 1, 2, 3}, time=slowSpeed, loopCount=0 },
   { name = "dinner_slow5", frames={5, 6, 7 ,8 ,9 ,10, 11, 12, 1, 2, 3, 4}, time=slowSpeed, loopCount=0 },
   { name = "dinner_slow6", frames={6, 7, 8, 9, 10, 11, 12, 1, 2, 3, 4, 5}, time=slowSpeed, loopCount=0 },
   { name = "dinner_slow7", frames={7, 8, 9, 10, 11, 12, 1, 2, 3, 4, 5, 6}, time=slowSpeed, loopCount=0 },
   { name = "dinner_slow8", frames={8, 9, 10, 11, 12, 1, 2, 3, 4, 5, 6, 7}, time=slowSpeed, loopCount=0 },
   { name = "dinner_slow9", frames={9, 10, 11, 12, 1, 2, 3, 4, 5, 6, 7, 8}, time=slowSpeed, loopCount=0 },
   { name = "dinner_slow10", frames={10, 11, 12, 1, 2, 3, 4, 5, 6, 7, 8, 9}, time=slowSpeed, loopCount=0 },
   { name = "dinner_slow11", frames={11, 12, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10}, time=slowSpeed, loopCount=0 },
   { name = "dinner_slow12", frames={12, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11}, time=slowSpeed, loopCount=0 }
}

local dessertsheetSettings =
  	{
  	 width = 410,
  	 height = 60,
 	  numFrames = 12
	}
	 dessertsheet = graphics.newImageSheet("images/belts02sheet.png",dessertsheetSettings)
	 dessertsequenceData = {
	--higher the time, slower it goes
   { name = "dessert_normal", frames={1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12}, time=normalSpeed, loopCount=0 },
   { name = "dessert_normal2", frames={2, 3, 4 ,5 ,6 ,7 ,8 ,9 ,10, 11, 12, 1}, time=normalSpeed, loopCount=0 },
   { name = "dessert_normal3", frames={3, 4, 5 ,6 ,7 ,8 ,9 ,10, 11, 12, 1, 2}, time=normalSpeed, loopCount=0 },
   { name = "dessert_normal4", frames={4, 5, 6 ,7 ,8 ,9 ,10, 11, 12, 1, 2, 3}, time=normalSpeed, loopCount=0 },
   { name = "dessert_normal5", frames={5, 6, 7 ,8 ,9 ,10, 11, 12, 1, 2, 3, 4}, time=normalSpeed, loopCount=0 },
   { name = "dessert_normal6", frames={6, 7, 8, 9, 10, 11, 12, 1, 2, 3, 4, 5}, time=normalSpeed, loopCount=0 },
   { name = "dessert_normal7", frames={7, 8, 9, 10, 11, 12, 1, 2, 3, 4, 5, 6}, time=normalSpeed, loopCount=0 },
   { name = "dessert_normal8", frames={8, 9, 10, 11, 12, 1, 2, 3, 4, 5, 6, 7}, time=normalSpeed, loopCount=0 },
   { name = "dessert_normal9", frames={9, 10, 11, 12, 1, 2, 3, 4, 5, 6, 7, 8}, time=normalSpeed, loopCount=0 },
   { name = "dessert_normal10", frames={10, 11, 12, 1, 2, 3, 4, 5, 6, 7, 8, 9}, time=normalSpeed, loopCount=0 },
   { name = "dessert_normal11", frames={11, 12, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10}, time=normalSpeed, loopCount=0 },
   { name = "dessert_normal12", frames={12, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11}, time=normalSpeed, loopCount=0 },

   { name = "dessert_fast", frames={1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12}, time=fastSpeed, loopCount=0 },
   { name = "dessert_fast2", frames={2, 3, 4 ,5 ,6 ,7 ,8 ,9 ,10, 11, 12, 1}, time=fastSpeed, loopCount=0 },
   { name = "dessert_fast3", frames={3, 4, 5 ,6 ,7 ,8 ,9 ,10, 11, 12, 1, 2}, time=fastSpeed, loopCount=0 },
   { name = "dessert_fast4", frames={4, 5, 6 ,7 ,8 ,9 ,10, 11, 12, 1, 2, 3}, time=fastSpeed, loopCount=0 },
   { name = "dessert_fast5", frames={5, 6, 7 ,8 ,9 ,10, 11, 12, 1, 2, 3, 4}, time=fastSpeed, loopCount=0 },
   { name = "dessert_fast6", frames={6, 7, 8, 9, 10, 11, 12, 1, 2, 3, 4, 5}, time=fastSpeed, loopCount=0 },
   { name = "dessert_fast7", frames={7, 8, 9, 10, 11, 12, 1, 2, 3, 4, 5, 6}, time=fastSpeed, loopCount=0 },
   { name = "dessert_fast8", frames={8, 9, 10, 11, 12, 1, 2, 3, 4, 5, 6, 7}, time=fastSpeed, loopCount=0 },
   { name = "dessert_fast9", frames={9, 10, 11, 12, 1, 2, 3, 4, 5, 6, 7, 8}, time=fastSpeed, loopCount=0 },
   { name = "dessert_fast10", frames={10, 11, 12, 1, 2, 3, 4, 5, 6, 7, 8, 9}, time=fastSpeed, loopCount=0 },
   { name = "dessert_fast11", frames={11, 12, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10}, time=fastSpeed, loopCount=0 },
   { name = "dessert_fast12", frames={12, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11}, time=fastSpeed, loopCount=0 },

   { name = "dessert_slow", frames={1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12}, time=slowSpeed, loopCount=0 },
   { name = "dessert_slow2", frames={2, 3, 4 ,5 ,6 ,7 ,8 ,9 ,10, 11, 12, 1}, time=slowSpeed, loopCount=0 },
   { name = "dessert_slow3", frames={3, 4, 5 ,6 ,7 ,8 ,9 ,10, 11, 12, 1, 2}, time=slowSpeed, loopCount=0 },
   { name = "dessert_slow4", frames={4, 5, 6 ,7 ,8 ,9 ,10, 11, 12, 1, 2, 3}, time=slowSpeed, loopCount=0 },
   { name = "dessert_slow5", frames={5, 6, 7 ,8 ,9 ,10, 11, 12, 1, 2, 3, 4}, time=slowSpeed, loopCount=0 },
   { name = "dessert_slow6", frames={6, 7, 8, 9, 10, 11, 12, 1, 2, 3, 4, 5}, time=slowSpeed, loopCount=0 },
   { name = "dessert_slow7", frames={7, 8, 9, 10, 11, 12, 1, 2, 3, 4, 5, 6}, time=slowSpeed, loopCount=0 },
   { name = "dessert_slow8", frames={8, 9, 10, 11, 12, 1, 2, 3, 4, 5, 6, 7}, time=slowSpeed, loopCount=0 },
   { name = "dessert_slow9", frames={9, 10, 11, 12, 1, 2, 3, 4, 5, 6, 7, 8}, time=slowSpeed, loopCount=0 },
   { name = "dessert_slow10", frames={10, 11, 12, 1, 2, 3, 4, 5, 6, 7, 8, 9}, time=slowSpeed, loopCount=0 },
   { name = "dessert_slow11", frames={11, 12, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10}, time=slowSpeed, loopCount=0 },
   { name = "dessert_slow12", frames={12, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11}, time=slowSpeed, loopCount=0 }
}

-- BREAKFAST STARTS --
function breakfast_fast (hero, frameNum)
	if (frameNum == 1) then
		return globals.belts[hero]:setSequence( "breakfast_fast" )
	elseif (frameNum == 2) then
		return globals.belts[hero]:setSequence( "breakfast_fast2" )
	elseif (frameNum == 3) then
		return globals.belts[hero]:setSequence( "breakfast_fast3" )
	elseif (frameNum == 4) then
		return globals.belts[hero]:setSequence( "breakfast_fast4" )
	elseif (frameNum == 5) then
		return globals.belts[hero]:setSequence( "breakfast_fast5" )
	elseif (frameNum == 6) then
		return globals.belts[hero]:setSequence( "breakfast_fast6" )
	elseif (frameNum == 7) then
		return globals.belts[hero]:setSequence( "breakfast_fast7" )
	elseif (frameNum == 8) then 
		return globals.belts[hero]:setSequence( "breakfast_fast8" )
	elseif (frameNum == 9) then 
		return globals.belts[hero]:setSequence( "breakfast_fast9" )
	elseif (frameNum == 10) then 
		return globals.belts[hero]:setSequence( "breakfast_fast10" )
	elseif (frameNum == 11) then 
		return globals.belts[hero]:setSequence( "breakfast_fast11" )
	elseif (frameNum == 12) then 
		return globals.belts[hero]:setSequence( "breakfast_fast12")
	end
end

function breakfast_normal (hero, frameNum)
	if (frameNum == 1) then
		return globals.belts[hero]:setSequence( "breakfast_normal" )
	elseif (frameNum == 2) then
		return globals.belts[hero]:setSequence( "breakfast_normal2" )
	elseif (frameNum == 3) then
		return globals.belts[hero]:setSequence( "breakfast_normal3" )
	elseif (frameNum == 4) then
		return globals.belts[hero]:setSequence( "breakfast_normal4" )
	elseif (frameNum == 5) then
		return globals.belts[hero]:setSequence( "breakfast_normal5" )
	elseif (frameNum == 6) then
		return globals.belts[hero]:setSequence( "breakfast_normal6" )
	elseif (frameNum == 7) then 
		return globals.belts[hero]:setSequence( "breakfast_normal7" )
	elseif (frameNum == 8) then 
		return globals.belts[hero]:setSequence( "breakfast_normal8" )
	elseif (frameNum == 9) then 
		return globals.belts[hero]:setSequence( "breakfast_normal9" )
	elseif (frameNum == 10) then 
		return globals.belts[hero]:setSequence( "breakfast_normal10" )
	elseif (frameNum == 11) then 
		return globals.belts[hero]:setSequence( "breakfast_normal11" )
	elseif (frameNum == 12) then 
		return globals.belts[hero]:setSequence( "breakfast_normal12")
	end
end

function breakfast_slow (hero, frameNum)
	if (frameNum == 1) then
		return globals.belts[hero]:setSequence( "breakfast_slow" )
	elseif (frameNum == 2) then
		return globals.belts[hero]:setSequence( "breakfast_slow2" )
	elseif (frameNum == 3) then
		return globals.belts[hero]:setSequence( "breakfast_slow3" )
	elseif (frameNum == 4) then
		return globals.belts[hero]:setSequence( "breakfast_slow4" )
	elseif (frameNum == 5) then
		return globals.belts[hero]:setSequence( "breakfast_slow5" )
	elseif (frameNum == 6) then
		return globals.belts[hero]:setSequence( "breakfast_slow6" )
	elseif (frameNum == 7) then
		return globals.belts[hero]:setSequence( "breakfast_slow7" )
	elseif (frameNum == 8) then 
		return globals.belts[hero]:setSequence( "breakfast_slow8" )
	elseif (frameNum == 9) then 
		return globals.belts[hero]:setSequence( "breakfast_slow9" )
	elseif (frameNum == 10) then 
		return globals.belts[hero]:setSequence( "breakfast_slow10" )
	elseif (frameNum == 11) then 
		return globals.belts[hero]:setSequence( "breakfast_slow11" )
	elseif (frameNum == 12) then 
		return globals.belts[hero]:setSequence( "breakfast_slow12")
	end
end
-- BREAKFAST END --

-- DINNER STARTS --
function dinner_fast (hero, frameNum)
	if (frameNum == 1) then
		return globals.belts[hero]:setSequence( "dinner_fast" )
	elseif (frameNum == 2) then
		return globals.belts[hero]:setSequence( "dinner_fast2" )
	elseif (frameNum == 3) then
		return globals.belts[hero]:setSequence( "dinner_fast3" )
	elseif (frameNum == 4) then
		return globals.belts[hero]:setSequence( "dinner_fast4" )
	elseif (frameNum == 5) then
		return globals.belts[hero]:setSequence( "dinner_fast5" )
	elseif (frameNum == 6) then
		return globals.belts[hero]:setSequence( "dinner_fast6" )
	elseif (frameNum == 7) then
		return globals.belts[hero]:setSequence( "dinner_fast7" )
	elseif (frameNum == 8) then 
		return globals.belts[hero]:setSequence( "dinner_fast8" )
	elseif (frameNum == 9) then 
		return globals.belts[hero]:setSequence( "dinner_fast9" )
	elseif (frameNum == 10) then 
		return globals.belts[hero]:setSequence( "dinner_fast10" )
	elseif (frameNum == 11) then 
		return globals.belts[hero]:setSequence( "dinner_fast11" )
	elseif (frameNum == 12) then 
		return globals.belts[hero]:setSequence( "dinner_fast12")
	end
end

function dinner_normal (hero, frameNum)
	if (frameNum == 1) then
		return globals.belts[hero]:setSequence( "dinner_normal" )
	elseif (frameNum == 2) then
		return globals.belts[hero]:setSequence( "dinner_normal2" )
	elseif (frameNum == 3) then
		return globals.belts[hero]:setSequence( "dinner_normal3" )
	elseif (frameNum == 4) then
		return globals.belts[hero]:setSequence( "dinner_normal4" )
	elseif (frameNum == 5) then
		return globals.belts[hero]:setSequence( "dinner_normal5" )
	elseif (frameNum == 6) then
		return globals.belts[hero]:setSequence( "dinner_normal6" )
	elseif (frameNum == 7) then 
		return globals.belts[hero]:setSequence( "dinner_normal7" )
	elseif (frameNum == 8) then 
		return globals.belts[hero]:setSequence( "dinner_normal8" )
	elseif (frameNum == 9) then 
		return globals.belts[hero]:setSequence( "dinner_normal9" )
	elseif (frameNum == 10) then 
		return globals.belts[hero]:setSequence( "dinner_normal10" )
	elseif (frameNum == 11) then 
		return globals.belts[hero]:setSequence( "dinner_normal11" )
	elseif (frameNum == 12) then 
		return globals.belts[hero]:setSequence( "dinner_normal12")
	end
end

function dinner_slow (hero, frameNum)
	if (frameNum == 1) then
		return globals.belts[hero]:setSequence( "dinner_slow" )
	elseif (frameNum == 2) then
		return globals.belts[hero]:setSequence( "dinner_slow2" )
	elseif (frameNum == 3) then
		return globals.belts[hero]:setSequence( "dinner_slow3" )
	elseif (frameNum == 4) then
		return globals.belts[hero]:setSequence( "dinner_slow4" )
	elseif (frameNum == 5) then
		return globals.belts[hero]:setSequence( "dinner_slow5" )
	elseif (frameNum == 6) then
		return globals.belts[hero]:setSequence( "dinner_slow6" )
	elseif (frameNum == 7) then
		return globals.belts[hero]:setSequence( "dinner_slow7" )
	elseif (frameNum == 8) then 
		return globals.belts[hero]:setSequence( "dinner_slow8" )
	elseif (frameNum == 9) then 
		return globals.belts[hero]:setSequence( "dinner_slow9" )
	elseif (frameNum == 10) then 
		return globals.belts[hero]:setSequence( "dinner_slow10" )
	elseif (frameNum == 11) then 
		return globals.belts[hero]:setSequence( "dinner_slow11" )
	elseif (frameNum == 12) then 
		return globals.belts[hero]:setSequence( "dinner_slow12")
	end
end
-- DINNER END --

-- DESSERT STARTS --
function dessert_fast (hero, frameNum)
	if (frameNum == 1) then
		return globals.belts[hero]:setSequence( "dessert_fast" )
	elseif (frameNum == 2) then
		return globals.belts[hero]:setSequence( "dessert_fast2" )
	elseif (frameNum == 3) then
		return globals.belts[hero]:setSequence( "dessert_fast3" )
	elseif (frameNum == 4) then
		return globals.belts[hero]:setSequence( "dessert_fast4" )
	elseif (frameNum == 5) then
		return globals.belts[hero]:setSequence( "dessert_fast5" )
	elseif (frameNum == 6) then 
		return globals.belts[hero]:setSequence( "dessert_fast6" )
	elseif (frameNum == 7) then
		return globals.belts[hero]:setSequence( "dessert_fast7" )
	elseif (frameNum == 8) then 
		return globals.belts[hero]:setSequence( "dessert_fast8" )
	elseif (frameNum == 9) then 
		return globals.belts[hero]:setSequence( "dessert_fast9" )
	elseif (frameNum == 10) then 
		return globals.belts[hero]:setSequence( "dessert_fast10" )
	elseif (frameNum == 11) then 
		return globals.belts[hero]:setSequence( "dessert_fast11" )
	elseif (frameNum == 12) then 
		return globals.belts[hero]:setSequence( "dessert_fast12")
	end
end

function dessert_normal (hero, frameNum)
	if (frameNum == 1) then
		return globals.belts[hero]:setSequence( "dessert_normal" )
	elseif (frameNum == 2) then
		return globals.belts[hero]:setSequence( "dessert_normal2" )
	elseif (frameNum == 3) then
		return globals.belts[hero]:setSequence( "dessert_normal3" )
	elseif (frameNum == 4) then
		return globals.belts[hero]:setSequence( "dessert_normal4" )
	elseif (frameNum == 5) then
		return globals.belts[hero]:setSequence( "dessert_normal5" )
	elseif (frameNum == 6) then
		return globals.belts[hero]:setSequence( "dessert_normal6" )
	elseif (frameNum == 7) then 
		return globals.belts[hero]:setSequence( "dessert_normal7" )
	elseif (frameNum == 8) then 
		return globals.belts[hero]:setSequence( "dessert_normal8" )
	elseif (frameNum == 9) then 
		return globals.belts[hero]:setSequence( "dessert_normal9" )
	elseif (frameNum == 10) then 
		return globals.belts[hero]:setSequence( "dessert_normal10" )
	elseif (frameNum == 11) then 
		return globals.belts[hero]:setSequence( "dessert_normal11" )
	elseif (frameNum == 12) then 
		return globals.belts[hero]:setSequence( "dessert_normal12")
	end
end

function dessert_slow (hero, frameNum)
	if (frameNum == 1) then
		return globals.belts[hero]:setSequence( "dessert_slow" )
	elseif (frameNum == 2) then
		return globals.belts[hero]:setSequence( "dessert_slow2" )
	elseif (frameNum == 3) then
		return globals.belts[hero]:setSequence( "dessert_slow3" )
	elseif (frameNum == 4) then
		return globals.belts[hero]:setSequence( "dessert_slow4" )
	elseif (frameNum == 5) then
		return globals.belts[hero]:setSequence( "dessert_slow5" )
	elseif (frameNum == 6) then
		return globals.belts[hero]:setSequence( "dessert_slow6" )
	elseif (frameNum == 7) then
		return globals.belts[hero]:setSequence( "dessert_slow7" )
	elseif (frameNum == 8) then 
		return globals.belts[hero]:setSequence( "dessert_slow8" )
	elseif (frameNum == 9) then 
		return globals.belts[hero]:setSequence( "dessert_slow9" )
	elseif (frameNum == 10) then 
		return globals.belts[hero]:setSequence( "dessert_slow10" )
	elseif (frameNum == 11) then 
		return globals.belts[hero]:setSequence( "dessert_slow11" )
	elseif (frameNum == 12) then 
		return globals.belts[hero]:setSequence( "dessert_slow12")
	end
end
-- DESSERT END --

