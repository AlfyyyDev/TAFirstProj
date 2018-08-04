
function love.load()
  mode = 'numbersgame'
  fontmain = love.graphics.newFont("goodtimesfont.ttf", 50)
  fontplayernums =  love.graphics.newFont("goodtimesfont.ttf", 90)
  fontsmall = love.graphics.newFont("goodtimesfont.ttf", 45)
  love.graphics.setFont(fontmain)
  love.window.setTitle("Number Game")
  love.window.setMode(1024,768)
  love.graphics.setColor(0,0,0)
  love.graphics.setBackgroundColor(1,0.6,0.2)
  windowWidth, windowHeight = love.window.getMode()
end

function love.update(dt)
  if quitGame == true then
    love.event.quit()
  end
  if mode == 'numbersgame' then
    NumbersGame = require "numbersgame"
    NumbersGame:update()
  end
end

function love.draw()
  if mode == 'numbersgame' then
    NumbersGame:draw()
  end
end

function love.keypressed(key)
  if mode == 'numbersgame' then
    NumbersGame:keypressed(key)
  end
end

function love.keyreleased(key)
  if key == 'a' then
    a_down = false
  elseif key == 's' then
    s_down = false
  elseif key == 'd' then
    d_down = false
  elseif key == 'w' then
    w_down = false
  elseif key == 'left' then
    left_down = false
  elseif key == 'down' then
    down_down = false
  elseif key == 'right' then
    right_down = false
  elseif key == 'up' then
    up_down = false
  end
end
--[[
--Generates random target number for players to guess
--Cannot equal 500 as that would break the game D:
function create_number()
  math.randomseed(os.time())
  targetNum = math.random(1, 1000)
  while targetNum == 500 do
    targetNum = math.random(1, 1000)
  end
  targetNum = tostring(targetNum)
  targetNum = targetNum .. '0'
  targetNum = tonumber(targetNum)
end

--[[Hotcold function generates the hot cold measure color for the hotcold meters
takes the random target number and subtracts the players numbers returning
absolute value, then range is applied for color CHANGE TO CONSTANT ADJUST

function hotcold()
  p1dist = math.abs(targetNum - p1Num)
  p2dist = math.abs(targetNum - p2Num)

  if p1dist > 5250 then
    p1colorScale = 0
    p1TempColor = {p1colorScale, 0, 0}
  elseif p1dist <= 5250 and p1dist > 5000 then
    p1colorScale = (5250 - p1dist)/250
    p1TempColor = {p1colorScale, 0, 0}
  elseif p1dist <= 5000 and p1dist > 500 then
    p1colorScale = (5000 - p1dist)/4500
    p1TempColor = {1, p1colorScale, 0}
  elseif p1dist <= 500 and p1dist > 0 then
    p1colorScale = p1dist/500
    p1TempColor = {p1colorScale, 1, 0}
  end

  if p2dist > 5250 then
    p2colorScale = 0
    p2TempColor = {p2colorScale, 0, 0}
  elseif p2dist <= 5250 and p2dist > 5000 then
    p2colorScale = (5250 - p2dist)/250
    p2TempColor = {p2colorScale, 0, 0}
  elseif p2dist <= 5000 and p2dist > 500 then
    p2colorScale = (5000 - p2dist)/4500
    p2TempColor = {1, p2colorScale, 0}
  elseif p2dist <= 500 and p2dist > 0 then
    p2colorScale = p2dist/500
    p2TempColor = {p2colorScale, 1, 0}
  end
end




--[[
10000 - 7500
7500 - 5000
5000 - 2500
2500 - 1000
1000 - 500
500 - 250
250 - 100
100 - 50
50 - 10
10 - 0



--Sets text X Location, Division factor, screen part, and text width
--Division factor decides how many sections to divide screen into
--Screen part decides which dividing line to place text
function textXLoc(div, part, text)
  return (windowWidth * part)/(div + 1) - love.graphics.getFont():getWidth(text)/2
end

function textYLoc(div, part, text)
  return (windowHeight * part)/(div + 1) - love.graphics.getFont():getHeight(text)/2
end

function shapeXLoc(div, part, width)
  return (windowWidth * part)/(div + 1) - width/2
end

function shapeYLoc(div, part, height)
  return (windowHeight * part)/(div + 1) - height/2
end

function getFontWidth(text)
  return love.graphics.getFont():getWidth(text)
end

function getFontHeight(text)
  return love.graphics.getFont():getHeight(text)
end

--]]
--[[hiaosdhioasd
hiaosdhioasd
hiaosdhioasd
hiaosdhioasd
hiaosdhioasd
hiaosdhioasd
hiaosdhioasd
hiaosdhioasd
hiaosdhioasd
hiaosdhioasd
hiaosdhioasd
hiaosdhioasd
hiaosdhioasd
hiaosdhioasd
hiaosdhioasd
hiaosdhioasd
hiaosdhioasd
hiaosdhioasd
hiaosdhioasd
hiaosdhioasd
hiaosdhioasd
hiaosdhioasd
hiaosdhioasd
hiaosdhioasd
hiaosdhioasd
hiaosdhioasd
hiaosdhioasd
hiaosdhioasd
hiaosdhioasd
hiaosdhioasd
hiaosdhioasd
hiaosdhioasd
hiaosdhioasd
hiaosdhioasd
hiaosdhioasd
hiaosdhioasd
]]
