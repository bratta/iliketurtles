--
-- Charge Station
-- by Bratta
--

-- Place a turtle with this script next to an MFE/MFSU/Batbox
-- Place an ender chest on top of the turtle. Pair an ender pouch with said
-- chest and keep this setup chunk loaded. Viola, you can charge from
-- anywhere.

-- TODO: Make it suck smarter. The problem is that turtles can't pick which slot to suck from a connected inventory.
-- TODO: Use gates to determine when it is charged instead of waiting a static amount of time. The Gate Reader doesn't seem to pick up on fully charged items right now though.

local suckjobs = 0

function show_suckjobs()
  term.clear()
  term.setCursorPos(1,1)
  print("Items Sucked and Charged: " .. tostring(suckjobs))
end

turtle.select(1)
while true do
  show_suckjobs()
  if turtle.suckUp() then
    suckjobs = suckjobs + 1
    print("I'm-a chargin' my fireball!")
    turtle.drop()
    sleep(30)
    turtle.suck()
    turtle.dropUp()
    print("Gotta wait before I suck again, baby.")
    sleep(30)
  end
  sleep(1)
end
