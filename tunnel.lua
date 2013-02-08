-- tunnel
-- Written by Tim Gourley (bratta)

local length = 100

function setup()
  print("I will create a 3x3 tunnel for you.")
  print("Place Ender chest in slot 1. Remaining slots should be empty.")
  print("Charge with a charging station, I will not eat coal.")
  print("How far should I go?")
  length = tonumber(io.read())
end

function dig_up()
  while turtle.up() == false do
    turtle.digUp()
    turtle.suckUp()
  end
  if turtle.getItemCount(10) >= 1 then
    dump_inventory()
  end
end

function dig_down()
  while turtle.down() == false do
    turtle.digDown()
    turtle.suckDown()
  end
  if turtle.getItemCount(10) >= 1 then
    dump_inventory()
  end
end

function dig_forward()
  while turtle.forward() == false do
    turtle.dig()
    turtle.suck()
  end
  if turtle.getItemCount(10) >= 1 then
    dump_inventory()
  end
end

function dig()
  while turtle.detect() == true do
    turtle.dig()
    turgle.suck()
  end
  if turtle.getItemCount(10) >= 1 then
    dump_inventory()
  end
end

function dump_inventory()
  while turtle.detectUp() do
    turtle.digUp()
  end
  turtle.select(1)
  while turtle.placeUp() == false do
    turtle.digUp()
  end
  for i = 2, 16 do
    turtle.select(i)
    turtle.dropUp()
  end
  turtle.select(1)
  turtle.digUp()
end

function main()
  for i = 1, length do
    dig_forward()
    dig_up()
    dig_up()
    for i = 1, 3 do
      turtle.turnLeft()
      dig()
      turtle.turnRight()
      turtle.turnRight()
      dig()
      turtle.turn_left()
      if i < 3 then
        dig_down()
      end
    end
  end
  dump_inventory()
  print("Job's done!")
end

setup()
main()
