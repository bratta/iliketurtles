--
-- Enchanter
-- Written by Tim Gourley (bratta)
--

-- This turtle does not melee, but instead collects XP from an XP attachment
-- and grabs/enchants books. It also requires the inventory upgrade module.
-- Make sure books are in an inventory above the turtle, and an enderchest is
-- in front of it. The turtle's back should be to the mob (he's a badass that way).

local books_enchanted = 0

xp = peripheral.wrap("left")
inv = peripheral.wrap("right")
xp.setAutoCollect(true)
turtle.select(1)

while true do
  term.clear()
  term.setCursorPos(1,1)
  print("Current level: " .. tostring(xp.getLevels()))
  print("Books enchanted since last boot: " .. tostring(books_enchanted))
  if xp.getLevels() >= 30 then
    if inv.suckUp(0,1) then
      xp.enchant(30)
      books_enchanted = books_enchanted + 1
      turtle.drop()
    else
      print("Out of books!")
    end
    sleep(10)
  end
end
