--circle-based collision detection
function combination( obj1, obj2 )
   hasCollidied = false
   if ( obj1 == nil ) then  --make sure the first object exists
      return false
   end
   if ( obj2 == nil ) then  --make sure the other object exists
      return false
   end
   local dx = obj1.x - obj2.x
   local dy = obj1.y - obj2.y
   local distance = math.sqrt( dx*dx + dy*dy )
   local objectSize = (obj2.contentWidth/2) + (obj1.contentWidth/2)

   if ( distance < objectSize ) then
      hasCollidied = true
   end
   hasCollidied = false

   if (hasCollidied == true) then
      newType = foodgroup[obj1.type][obj2.type]
      
   end
end







   foodgroup = {}

   foodgroup = {
      egg = {egg = "bad", flour = "pancake", potato = "scambledPotato", strawberry = "bad", oil = "bad", steak = "steakOm", sugar = "meringue"},
      flour = {egg = "pancake", flour = "bad", potato = "croquette", strawberry = "strawberryTart", oil = "donut", steak = "CFS", sugar = "cake"},
      potato = {egg = "scambledPotato", flour = "croquette", potato = "mashed", strawberry = "bad", oil = "fries", steak = "steakBaked", sugar = "bad"},
      strawberry = {egg = "bad", flour = "strawberryTart", potato = "bad", strawberry = "bad", oil = "bad", steak = "bad", sugar = "strawberryCandy"},
      oil = {egg = "bad", flour = "donut", potato = "fries", strawberry = "bad", oil = "bad", steak = "CFS", sugar = "bad"},
      steak = {egg = "steakOm", flour = "CFS", potato = "steakBaked", strawberry = "bad", oil = "CFS", steak = "bad", sugar = "bad"},
      sugar = {egg = "bad", flour = "cake", potato = "bad", strawberry = "strawberryCandy", oil = "bad", steak = "bad", sugar = "bad"},
   }