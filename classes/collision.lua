--circle-based collision detection
function hasCollidedCircle( obj1, obj2 )
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
   if ( obj1.y == nil ) then  --make sure the first object exists
      return false
   end
   if ( obj2.y == nil ) then  --make sure the other object exists
      return false
   end
   local dx = obj1.x - obj2.x
   local dy = obj1.y - obj2.y
   local distance = math.sqrt( dx*dx + dy*dy )
   local objectSize = (obj2.contentWidth/2) + (obj1.contentWidth/2)

   if ( distance < objectSize ) then
      return true
   end
   return false
end