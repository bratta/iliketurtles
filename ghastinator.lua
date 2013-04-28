-- The Ghastinator
-- by Bratta
--
-- Controls a tier 5 ghast spawner with an on-off redstone signal
-- Sends a pulse of redstone out that can be used by High Energy Pellet Launchers
-- to slaughter the dreaded beasts.

local control_input = "front"
local ghast_side = "back"
local pulse_side = "right"

-- Turn off the ghast spawner initially. We're using redstone signal off = spawner off
-- and redstone signal on = spawner on. So you'll need a NOT gate somewhere since Soul
-- Shard mechanics are the opposite.
redstone.setOutput(ghast_side, false)

term.clear()
term.setCursorPos(1,1)
print "The Ghastinator is ready for action."
print "CTRL-T to terminate."

function sendKillPulse()
  redstone.setOutput(pulse_side, true)
  sleep(0.2)
  redstone.setOutput(pulse_side, false)
  sleep(0.8)
end

while true do
  if redstone.getInput(control_input) == true then
    redstone.setOutput(ghast_side, true)
    sendKillPulse()
    sleep(2)
  else
    redstone.setOutput(ghast_side, false)
  end
  sleep(1)
end
