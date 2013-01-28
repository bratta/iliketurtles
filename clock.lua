--giant clock--
local sSide = {"left","right","top","bottom","back","front"}

--peripheral check
for i=1,#sSide do
  if peripheral.isPresent(sSide[i]) then
    if peripheral.getType(sSide[i]) == "monitor" then mon = peripheral.wrap(sSide[i])
    elseif peripheral.getType(sSide[i])==nil then
      error("No peripheral attached")
    end
  end
end

--variables
d0=1
d1=8
colPos=16
d2=21
d3=28
ampmPos=35
local digits = {}
digits[0]={
" dPYb ",
"dP  Yb",
"Yb  dP",
" YbdP "}
digits[1]={
"   .d ",
" .d88 ",
"   88 ",
"   88 "}
digits[2]={
"oP\"Yb.",
"\"' dP'",
"  dP' ",
".d8888"}
digits[3]={
" 88888",
"   .dP",
" o 'Yb",
" YbodP"}
digits[4]={
" dP88 ",
"dP 88 ",
"888888",
"   88 "}
digits[5]={
"888888",
"88oo. ",
"   '8b",
"8888P'"}
digits[6]={
"  dP' ",
".d8'  ",
"8P\"\"Yb",
"'YbodP"}
digits[7]={
"88888P",
"   dP ",
"  dP  ",
" dP   "}
digits[8]={
".dP\"o.",
"'8b.d'",
"d''Y8b",
"'bodP'"}
digits[9]={
"dP\"\"Yb",
"Ybood8",
"  .8P'",
" .dP' "}
local colon = {
 ".o.",
 "'\"'",
 ".o.",
 "'\"'"}
local am = {
"   db   8b    d8",
"  dPYb  88b  d88",
" dP__Yb 88YbdP88",
"dP\"\"\"\"Yb88 YY 88"}
local pm = {
" 88\"\"Yb 8b    d8",
" 88__dP 88b  d88",
" 88\"\"\"  88YbdP88",
" 88     88 YY 88"}

--functions
function writeDigit(digit, loc)
  for line = 1,4 do
    mon.setCursorPos(loc,line)
    mon.write(digits[digit][line])
  end
    
end

function digits12(h,m)
  mon.clear()

  --hours
  h12 = h % 12
  if h12 == 0 then h12 = 12 end
  if h12 >= 10 then
    writeDigit(1, d0)
    h12 = h12 - 10
  else
    writeDigit(0, d0)
  end
  writeDigit(h12, d1)

  --colon
  for i = 1,4 do
    mon.setCursorPos(colPos,i)
    mon.write(colon[i])
  end

  --minutes
  writeDigit(math.floor(m/10),d2)
  writeDigit(m%10,d3)
  
  --AM/PM
  for i = 1,4 do
    mon.setCursorPos(ampmPos,i)
    mon.write( h < 12 and am[i] or pm[i] )
  end
end


while true do
  local MChours = math.floor(os.time())
  local MCminutes = math.floor((os.time()-math.floor(os.time()))*60)
  digits12(MChours,MCminutes)
  sleep(0)
end
