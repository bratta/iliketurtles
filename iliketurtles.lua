-- Script to download files from this repository
-- Written by bratta

local args = { ... }
local filename = args[1]
local url = "https://raw.github.com/bratta/iliketurtles/"
local response = http.get(url..filename..".lua").readAll()

if response then
  if not fs.exists(filename) then
    f = fs.open(filename, "w")
    f.write(response)
    f.close()
    print("File '"..filename.."' downloaded.")
  else
    error("File '"..filename.."' already exists.")
  end
else
  error("Could not download file '"..filename.."'!")
end
