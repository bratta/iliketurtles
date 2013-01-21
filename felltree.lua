-- Fell Tree script
-- by Tim Gourley (bratta)

-- Place an enderchest in slot 1, saplings in 15
-- and bonemeal in 16. Saplings creating non-branching
-- trees work best (like spruce).

local enderchest_slot = 1
local sapling_slot = 15
local bonemeal_slot = 16

function plant_tree()
  if turtle.getItemCount(sapling_slot) > 0 then
    turtle.select(sapling_slot)
    turtle.place()
  end
  if turtle.getItemCount(bonemeal_slot) > 0 then
    turtle.select(bonemeal_slot)
    turtle.place()
  end
end

function fell_tree()
  turtle.dig()
  turtle.forward()
  while turtle.detectUp() do
    turtle.digUp()
    turtle.up()
  end
  while not turtle.detectDown() do
    turtle.down()
  end
  turtle.back()
end

function dump_inventory()
  if turtle.getItemCount(enderchest_slot) > 0 then
    while turtle.detectUp() do
      turtle.digUp()
    end
    turtle.select(enderchest_slot)
    while turtle.placeUp() == false do
      turtle.digUp()
    end
    for i = 2,16 do
      turtle.select(i)
      turtle.dropUp()
    end
    turtle.select(enderchest_slot)
    turtle.digUp()
  end
end

-- Main loop
for i = 1,turtle.getItemCount(sapling_slot) do
  plant_tree()
  fell_tree()
end
dump_inventory()
