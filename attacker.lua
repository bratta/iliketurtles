--
-- Attacker
-- Written by Tim Gourley (Bratta)
--
-- This is a dumb attack program. By dumb I mean that
-- its job is to only attack, not to manage loot or XP.
-- Fill the turtle's inventory with garbage (cobblestone, etc.)
-- to prevent him from accidentally sucking up stuff

while true do
  turtle.attack()
  sleep(.5)
end

