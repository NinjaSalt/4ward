-- globals.lua

local globals = {}

globals.font =
{
	if "Win" == system.getInfo( "platformName" ) then
    	PTSERIF = "PT Serif"
	elseif "Android" == system.getInfo( "platformName" ) then
    	PTSERIF = "PTF55F"
	else
    -- Mac and iOS
   	PTSERIF = "PTSerif-Regular"
		end
	CustFont = display.newText( "PTSerif-Regular", 40, 20, PTSERIF, 24 )
}