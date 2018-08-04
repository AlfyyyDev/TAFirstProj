local gui = require 'Gspot'
local Menu = {}
local lg = love.graphics

local menustate = 'main'

local startbutton = gui:button('Test Button', {x = 300, y = gui.style.unit, w = 300, h = gui.style.unit})


function Menu:update(dt)
end

function Menu:draw()
  if menustate == 'main' then
    gui:draw()
  end
end

function Menu:mousepressed(x,y,button,istouch,presses)
  gui:mousepress(x,y,button)
end

return Menu
