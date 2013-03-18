--
-- Enchanter
-- Written by Tim Gourley (bratta)
--

-- This turtle does not melee, but instead collects XP from an XP attachment
-- and grabs/enchants books. It also requires the inventory upgrade module.
-- Make sure books are in an inventory above the turtle, and an enderchest is
-- in front of it. The turtle's back should be to the mob (he's a badass that way).

xp = peripheral.wrap("left")
inv = peripheral.wrap("right")
xp.setAutoCollect(true)
turtle.select(1)

while true do
  if xp.getLevels() >= 30 then
    if inv.suckUp(0,1) then
      xp.enchant(30)
      turtle.drop()
    end
    sleep(10)
  end
end
