--circle-based collision detection
require("classes.enemies")

function combination( obj1, obj2 )
   hasCollidied = false
   if ( obj1 == nil ) then  --make sure the first object exists
      return false
   end
   if ( obj2 == nil ) then  --make sure the other object exists
      return false
   end
   if ( obj1.x == nil ) then  --make sure the first object exists
      return false
   end
   if ( obj2.x == nil ) then  --make sure the other object exists
      return false
   end
   local dx = obj1.x - obj2.x
   local dy = obj1.y - obj2.y
   local distance = math.sqrt( dx*dx + dy*dy )
   local objectSize = (obj2.contentWidth/4) + (obj1.contentWidth/4)

   if ( distance < objectSize ) then
      print("has collided")
      newType = foodgroup[obj1.type][obj2.type]
      print(obj1.type)
      print(obj2.type)
      print(newType)
      return true
   end

   return false
end

function replaceEnemy (obj1, obj2)
      if (obj1~=nil and obj2~=nil) then
      return foodgroup[obj1.type][obj2.type]
   end
end







   foodgroup = {}

   foodgroup = {
      egg = {egg = "bad", flour = "pancake", potato = "scambledPotato", strawberry = "bad", oil = "bad", steak = "steakOm", sugar = "meringue", pancake = "bad",
       scrambledPotato = "bad", steakOm = "bad", meringue = "bad" , croquette = "bad", strawberryTart = "bad", donut = "bad", CFS = "bad", cake = "bad", mashed = "bad",
       fries = "bad", steakBaked = "bad", strawberryCandy = "bad"},

      flour = {egg = "pancake", flour = "bad", potato = "croquette", strawberry = "strawberryTart", oil = "donut", steak = "CFS", sugar = "cake", pancake = "bad",
       scrambledPotato = "bad", steakOm = "bad", meringue = "bad" , croquette = "bad", strawberryTart = "bad", donut = "bad", CFS = "bad", cake = "bad", mashed = "bad",
       fries = "bad", steakBaked = "bad", strawberryCandy = "bad"},

      potato = {egg = "scambledPotato", flour = "croquette", potato = "mashed", strawberry = "bad", oil = "fries", steak = "steakBaked", sugar = "bad", pancake = "bad",
       scrambledPotato = "bad", steakOm = "bad", meringue = "bad" , croquette = "bad", strawberryTart = "bad", donut = "bad", CFS = "bad", cake = "bad", mashed = "bad",
       fries = "bad", steakBaked = "bad", strawberryCandy = "bad"},

      strawberry = {egg = "bad", flour = "strawberryTart", potato = "bad", strawberry = "bad", oil = "bad", steak = "bad", sugar = "strawberryCandy", pancake = "bad",
       scrambledPotato = "bad", steakOm = "bad", meringue = "bad" , croquette = "bad", strawberryTart = "bad", donut = "bad", CFS = "bad", cake = "bad", mashed = "bad",
       fries = "bad", steakBaked = "bad", strawberryCandy = "bad"},

      oil = {egg = "bad", flour = "donut", potato = "fries", strawberry = "bad", oil = "bad", steak = "CFS", sugar = "bad", pancake = "bad",
       scrambledPotato = "bad", steakOm = "bad", meringue = "bad" , croquette = "bad", strawberryTart = "bad", donut = "bad", CFS = "bad", cake = "bad", mashed = "bad",
       fries = "bad", steakBaked = "bad", strawberryCandy = "bad"},

      steak = {egg = "steakOm", flour = "CFS", potato = "steakBaked", strawberry = "bad", oil = "CFS", steak = "bad", sugar = "bad", pancake = "bad",
       scrambledPotato = "bad", steakOm = "bad", meringue = "bad" , croquette = "bad", strawberryTart = "bad", donut = "bad", CFS = "bad", cake = "bad", mashed = "bad",
       fries = "bad", steakBaked = "bad", strawberryCandy = "bad"},

      sugar = {egg = "bad", flour = "cake", potato = "bad", strawberry = "strawberryCandy", oil = "bad", steak = "bad", sugar = "bad", pancake = "bad",
       scrambledPotato = "bad", steakOm = "bad", meringue = "bad" , croquette = "bad", strawberryTart = "bad", donut = "bad", CFS = "bad", cake = "bad", mashed = "bad",
       fries = "bad", steakBaked = "bad", strawberryCandy = "bad"},

      pancake = {egg = "bad", flour = "bad", potato = "bad", strawberry = "bad", oil = "bad", steak = "bad", sugar = "bad", pancake = "bad",
       scrambledPotato = "bad", steakOm = "bad", meringue = "bad" , croquette = "bad", strawberryTart = "bad", donut = "bad", CFS = "bad", cake = "bad", mashed = "bad",
       fries = "bad", steakBaked = "bad", strawberryCandy = "bad"},

      scrambledPotato = {egg = "bad", flour = "bad", potato = "bad", strawberry = "bad", oil = "bad", steak = "bad", sugar = "bad", pancake = "bad",
       scrambledPotato = "bad", steakOm = "bad", meringue = "bad" , croquette = "bad", strawberryTart = "bad", donut = "bad", CFS = "bad", cake = "bad", mashed = "bad",
       fries = "bad", steakBaked = "bad", strawberryCandy = "bad"},

      steakOm = {egg = "bad", flour = "bad", potato = "bad", strawberry = "bad", oil = "bad", steak = "bad", sugar = "bad", pancake = "bad",
       scrambledPotato = "bad", steakOm = "bad", meringue = "bad" , croquette = "bad", strawberryTart = "bad", donut = "bad", CFS = "bad", cake = "bad", mashed = "bad",
       fries = "bad", steakBaked = "bad", strawberryCandy = "bad"},

      meringue = {egg = "bad", flour = "bad", potato = "bad", strawberry = "bad", oil = "bad", steak = "bad", sugar = "bad", pancake = "bad",
       scrambledPotato = "bad", steakOm = "bad", meringue = "bad" , croquette = "bad", strawberryTart = "bad", donut = "bad", CFS = "bad", cake = "bad", mashed = "bad",
       fries = "bad", steakBaked = "bad", strawberryCandy = "bad"},

      croquette = {egg = "bad", flour = "bad", potato = "bad", strawberry = "bad", oil = "bad", steak = "bad", sugar = "bad", pancake = "bad",
       scrambledPotato = "bad", steakOm = "bad", meringue = "bad" , croquette = "bad", strawberryTart = "bad", donut = "bad", CFS = "bad", cake = "bad", mashed = "bad",
       fries = "bad", steakBaked = "bad", strawberryCandy = "bad"},

       bad = {egg = "bad", flour = "bad", potato = "bad", strawberry = "bad", oil = "bad", steak = "bad", sugar = "bad", pancake = "bad",
      strawberryTart = "bad", steakOm = "bad", meringue = "bad" , croquette = "bad", strawberryTart = "bad", donut = "bad", CFS = "bad", cake = "bad", mashed = "bad",
       fries = "bad", steakBaked = "bad", strawberryCandy = "bad"},

      donut = {egg = "bad", flour = "bad", potato = "bad", strawberry = "bad", oil = "bad", steak = "bad", sugar = "bad", pancake = "bad",
       scrambledPotato = "bad", steakOm = "bad", meringue = "bad" , croquette = "bad", strawberryTart = "bad", donut = "bad", CFS = "bad", cake = "bad", mashed = "bad",
       fries = "bad", steakBaked = "bad", strawberryCandy = "bad"},

      CFS = {egg = "bad", flour = "bad", potato = "bad", strawberry = "bad", oil = "bad", steak = "bad", sugar = "bad", pancake = "bad",
       scrambledPotato = "bad", steakOm = "bad", meringue = "bad" , croquette = "bad", strawberryTart = "bad", donut = "bad", CFS = "bad", cake = "bad", mashed = "bad",
       fries = "bad", steakBaked = "bad", strawberryCandy = "bad"},

      cake = {egg = "bad", flour = "bad", potato = "bad", strawberry = "bad", oil = "bad", steak = "bad", sugar = "bad", pancake = "bad",
       scrambledPotato = "bad", steakOm = "bad", meringue = "bad" , croquette = "bad", strawberryTart = "bad", donut = "bad", CFS = "bad", cake = "bad", mashed = "bad",
       fries = "bad", steakBaked = "bad", strawberryCandy = "bad"},

      mashed = {egg = "bad", flour = "bad", potato = "bad", strawberry = "bad", oil = "bad", steak = "bad", sugar = "bad", pancake = "bad",
       scrambledPotato = "bad", steakOm = "bad", meringue = "bad" , croquette = "bad", strawberryTart = "bad", donut = "bad", CFS = "bad", cake = "bad", mashed = "bad",
       fries = "bad", steakBaked = "bad", strawberryCandy = "bad"},

      fries = {egg = "bad", flour = "bad", potato = "bad", strawberry = "bad", oil = "bad", steak = "bad", sugar = "bad", pancake = "bad",
       scrambledPotato = "bad", steakOm = "bad", meringue = "bad" , croquette = "bad", strawberryTart = "bad", donut = "bad", CFS = "bad", cake = "bad", mashed = "bad",
       fries = "bad", steakBaked = "bad", strawberryCandy = "bad"},

      steakBaked = {egg = "bad", flour = "bad", potato = "bad", strawberry = "bad", oil = "bad", steak = "bad", sugar = "bad", pancake = "bad",
       scrambledPotato = "bad", steakOm = "bad", meringue = "bad" , croquette = "bad", strawberryTart = "bad", donut = "bad", CFS = "bad", cake = "bad", mashed = "bad",
       fries = "bad", steakBaked = "bad", strawberryCandy = "bad"},

      strawberryCandy = {egg = "bad", flour = "bad", potato = "bad", strawberry = "bad", oil = "bad", steak = "bad", sugar = "bad", pancake = "bad",
       scrambledPotato = "bad", steakOm = "bad", meringue = "bad" , croquette = "bad", strawberryTart = "bad", donut = "bad", CFS = "bad", cake = "bad", mashed = "bad",
       fries = "bad", steakBaked = "bad", strawberryCandy = "bad"},
       
      bad = {egg = "bad", flour = "bad", potato = "bad", strawberry = "bad", oil = "bad", steak = "bad", sugar = "bad", pancake = "bad",
       scrambledPotato = "bad", steakOm = "bad", meringue = "bad" , croquette = "bad", strawberryTart = "bad", donut = "bad", CFS = "bad", cake = "bad", mashed = "bad",
       fries = "bad", steakBaked = "bad", strawberryCandy = "bad"}
   }