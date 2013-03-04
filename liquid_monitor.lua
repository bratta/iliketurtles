-- Liquid Monitor
-- by Bratta
--
-- Run on a computer to the left of a 
-- Nuclear Information Reader (from Misc. Peripherals)
-- with the proper card paired with your Railcraft tank
-- It will then toggle redstone in the front of the computer
-- based on the tank being full or reaching a certain liquid
-- threshold

local card_slot = 1
local reader_side = "right"
local redstone_side = "front"
local threshold_pct = 0.75  -- Percent to reach before turning on redstone signal

reader = peripheral.wrap(reader_side)
while true do
  term.clear()
  term.setCursorPos(1,1)
  a, b, c, info = reader.get(card_slot)
  capacity = info["capacity"]
  amount = info["amount"]
  threshold = capacity * threshold_pct
  print("Amount: " .. tostring(amount))
  print("Capacity: " .. tostring(capacity))
  if amount == capacity then
    redstone.setOutput(redstone_side, false)
    print("Tank is at capacity; disabling power.")
  elseif amount < threshold then
    redstone.setOutput(redstone_side, true)
    print("Tank is below threshold; enabling power.")
  end
  sleep(5)
end
