function love.load()
  mode = 'numbersgame'
  fontmain = love.graphics.newFont("goodtimesfont.ttf", 50)
  fontplayernums =  love.graphics.newFont("goodtimesfont.ttf", 90)
  fontsmall = love.graphics.newFont("goodtimesfont.ttf", 45)
  love.graphics.setFont(fontmain)
  love.window.setTitle("Party Game")
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
    NumbersGame:update(dt)
  elseif mode == 'menu' then
    Menu = require "menu"
    Menu:update(dt)
  end
end

function love.draw()
  if mode == 'numbersgame' then
    NumbersGame:draw()
  elseif mode == 'menu' then
    Menu:draw()
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

function love.mousepressed(x, y, button, istouch, presses)
  if mode == 'menu' then
    Menu:mousepressed(x,y,button,istouch,presses)
  end
end
