-- digdown
-- Written by Tim Gourley (bratta)

local depth = 59
local square_length = 4
local current_direction = 0
local x_moved_from_origin = 0
local y_moved_from_origin = 0
local z_moved_from_origin = 0

function setup()
  print("I will dig a square down to level 5 for you.")
  print("Place Ender chest in slot 1. Remaining slots should be empty.")
  print("Charge with a charging station, I will not eat coal.")
  print("Length of the square size?")
  square_length = tonumber(io.read())
  print("What is my current elevation?")
  depth = tonumber(io.read()) - 5
end

function move_forward()
  if (turtle.forward()) then
    if current_direction == 0 then
      z_moved_from_origin = z_moved_from_origin + 1
    elseif current_direction == 1 then
      x_moved_from_origin = x_moved_from_origin - 1
    elseif current_direction == 2 then
      z_moved_from_origin = z_moved_from_origin - 1
    elseif current_direction == 3 then
      x_moved_from_origin = x_moved_from_origin + 1
    end
    return true
  else
    return false
  end
end

function turn_left(num_times)
  num_times = num_times or 1
  for i = 1, num_times do
    current_direction = (current_direction - 1) % 4
    turtle.turnLeft()
  end
end

function turn_right(num_times)
  num_times = num_times or 1
  for i = 1, num_times do
    current_direction = (current_direction + 1) % 4
    turtle.turnRight()
  end
end

function move_up()
  if turtle.moveUp() then
    y_moved_from_origin = y_moved_from_origin + 1
    return true
  else
    return false
  end
end

function move_down()
  if turtle.moveDown() then
    y_moved_from_origin = y_moved_from_origin - 1
    return true
  else
    return false
  end
end

function dig_up(number_of_blocks)
  number_of_blocks = number_of_blocks or 1
  if number_of_blocks < 1 then
    return
  end
  for y = 1, number_of_blocks do
    while move_up() == false do
      turtle.digUp()
      turtle.suckUp()
    end
  end
  if turtle.getItemCount(10) >= 1 then
    dump_inventory()
  end
end

function dig_down(number_of_blocks)
  number_of_blocks = number_of_blocks or 1
  if number_of_blocks < 1 then
    return
  end
  for y = 1, number_of_blocks do
    while move_down() == false do
      turtle.digDown()
      turtle.suckDown()
    end
  end
  if turtle.getItemCount(10) >= 1 then
    dump_inventory()
  end
end

function dig_forward()
  while move_forward() == false do
    turtle.dig()
    turtle.suck()
  end
  if turtle.getItemCount(10) >= 1 then
    dump_inventory()
  end
end

function go_home()
  dig_up(y_moved_from_origin)
  if current_direction == 0 then
    turn_right(2)
  elseif current_direction == 1 then
    turn_right()
  elseif current_direction == 3 then
    turn_left()
  end

  for i = 1, z_moved_from_origin do
    dig_forward()
  end
  turn_left()

  for i = 1, x_moved_from_origin do
    dig_forward()
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
  total_blocks = square_length * square_length * depth
  print("Digging a " .. square_length .. "x" .. square_length .. " hole to level 5")
  print("For a total of " .. total_blocks .. " blocks mined.")

  turn_left()
  dig_down()
  for y = 1, depth do
    for x = 1, square_length do
      for z = 1, square_length-1 do
        dig_forward()
      end
      if x == square_length then
        -- Finished our last row at this level
        if y ~= depth then
          turn_right()
          dig_down()
        end
      else
        -- Hooray for the maths
        if (((y % 2) ~= 0) and ((x % 2) == 0)) or (((y % 2) == 0) and ((x % 2) ~= 0)) then
          turn_left()
          dig_forward()
          turn_left()
        else
          turn_right()
          dig_forward()
          turn_right()
        end
      end
    end
  end
  go_home()
  dump_inventory()
  print("Job's done!")
end

setup()
main()
