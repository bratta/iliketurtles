-- Area Flatten v1.0 by Guude
-- http://ejectdicks.com

-- Vars
local tArgs = { ... }
local togo = tonumber(tArgs[1])
local width = tonumber(tArgs[2])
togo = togo or 1
width = width or togo


-- Functions
function tfuel(amount) 
 if turtle.getFuelLevel() < 5 then
  turtle.select(16) 
  turtle.refuel(amount)
  turtle.select(1)
 end
end

function upuntil()
 local upc = 0
 for u = 1, 5 do
  repeat
   tfuel(1)
   turtle.digUp()
   if turtle.up() then
    upc = upc + 1
   end
   sleep(0.25)
  until turtle.detectUp() == false
 end
 for dc = 1, upc do
  tfuel(1)
  turtle.down()
 end
end

function turnaround()
  turtle.turnRight()
  turtle.turnRight()
end

-- Main Script
for i = 1, width do
 for j = 1, togo do
  tfuel(1)
  if turtle.detect() then
   repeat
    turtle.dig()
    sleep(0.5)
   until turtle.detect() == false
   turtle.forward()
   upuntil()
  else
   turtle.forward()
   upuntil()
  end
 end
 turnaround()
 for j = 1, togo do
  tfuel(1)
  turtle.forward()
 end
 turtle.turnLeft()
 if turtle.detect() then
  repeat
   turtle.dig()
   sleep(0.5)
  until turtle.detect() == false
 end
 turtle.forward()
 turtle.turnLeft()
end
