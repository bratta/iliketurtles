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
