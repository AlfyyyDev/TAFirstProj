local gameStart = false
local gameComplete = false
local targetNum = 0
local p1Num = 5000
local p2Num = 5000
local p1dist = 5000
local p2dist = 5000
local p1colorScale = 0
local p2colorScale = 0
local p1Color = {0,0,0}
local p2Color = {0,0,0}
local incrementP1 = 2
local incrementP2 = 2
local round = 1
local p1score = 0
local p2score = 0
local winner = "none"
local colorTimer1 = 0
local colorTimer2 = 0
local adding1 = true
local adding2 = true

local NumbersGame = {}

function NumbersGame:update(dt)
  if gameStart == false and love.keyboard.isDown('return') then
    gameStart = true
    gameComplete = false
    round = 1
    p1score = 0
    p2score = 0
    create_number()
  elseif gameStart == true then
      hotcold()

      if p1dist <= 150 and p1dist > 0 then
        veryclose(dt)
      end

      if p1Num == targetNum then
        p1score = p1score + 1
        round = round + 1
        p1Num = 5000
        p2Num = 5000
        create_number()
        if p1score == 3 then
          gameStart = false
          gameComplete = true
          winner = "Player 1 IS THE WINNER"
        end
      elseif p2Num == targetNum then
        p2score = p2score + 1
        round = round + 1
        p1Num = 5000
        p2Num = 5000
        create_number()
        if p2score == 3 then
          gameStart = false
          gameComplete = true
          winner = "Player 2 IS THE WINNER"
        end
      end
  end
end

function NumbersGame:draw()
  if gameStart == true then
    ROUND_STRING = "Round " .. round
    P1SCORE_STRING = "Score " .. p1score
    P2SCORE_STRING = "Score " .. p2score
    P1_STRING = "Player One"
    P2_STRING = "Player Two"
    love.graphics.setFont(fontmain)
    love.graphics.setColor(1, 1, 1)
    love.graphics.print(ROUND_STRING, textXLoc(1, 1, ROUND_STRING), textYLoc(14, 2, ROUND_STRING)) --round counter
    love.graphics.print(P1_STRING, textXLoc(3, 1, P1_STRING), textYLoc(3, 1, P1_STRING)) --selected  player 1
    love.graphics.print(P2_STRING, textXLoc(3, 3, P2_STRING), textYLoc(3, 1, P2_STRING)) --selected player 2
    love.graphics.print(P1SCORE_STRING, textXLoc(3, 1, P1SCORE_STRING), textYLoc(5, 2, P1SCORE_STRING)) --player 1 score
    love.graphics.print(P2SCORE_STRING, textXLoc(3, 3, P2SCORE_STRING), textYLoc(5, 2, P2SCORE_STRING)) --player 2 score

    love.graphics.setColor(1,1,1)
    RECT_WIDTH = '1000 100 10'
    RECT_ONE_X = shapeXLoc(3,1, getFontWidth(RECT_WIDTH) + 115)
    RECT_TWO_X = shapeXLoc(3,3, getFontWidth(RECT_WIDTH) + 115)
    INNER_RECT_WIDTH = (getFontWidth(RECT_WIDTH) + 115)/3

    love.graphics.rectangle("fill", RECT_ONE_X,
      shapeYLoc(1, 1, windowHeight/4), getFontWidth(RECT_WIDTH) + 115, windowHeight/4, 20, 20, 10000)
    love.graphics.rectangle("line", RECT_ONE_X,
      shapeYLoc(1, 1, windowHeight/4), getFontWidth(RECT_WIDTH) + 115, windowHeight/4, 20, 20, 10000)
    love.graphics.setColor(1,0.6,0.2)
    love.graphics.rectangle("fill", shapeXLoc(3,1, getFontWidth(RECT_WIDTH) + 105), shapeYLoc(1, 1, (windowHeight/4) - 10),
      INNER_RECT_WIDTH - 10, (windowHeight/4) - 10, 20, 20, 10000)
    love.graphics.rectangle("line", shapeXLoc(3,1, getFontWidth(RECT_WIDTH) + 105), shapeYLoc(1, 1, (windowHeight/4) - 10),
      INNER_RECT_WIDTH - 10, (windowHeight/4) - 10, 20, 20, 10000)
    love.graphics.rectangle("fill", shapeXLoc(3,1, getFontWidth(RECT_WIDTH) + 105) + INNER_RECT_WIDTH, shapeYLoc(1, 1, (windowHeight/4) - 10),
      INNER_RECT_WIDTH - 10, (windowHeight/4) - 10, 20, 20, 10000)
    love.graphics.rectangle("line", shapeXLoc(3,1, getFontWidth(RECT_WIDTH) + 105) + INNER_RECT_WIDTH, shapeYLoc(1, 1, (windowHeight/4) - 10),
      INNER_RECT_WIDTH - 10, (windowHeight/4) - 10, 20, 20, 10000)
    love.graphics.rectangle("fill", shapeXLoc(3,1, getFontWidth(RECT_WIDTH) + 105) + (INNER_RECT_WIDTH * 2), shapeYLoc(1, 1, (windowHeight/4) - 10),
      INNER_RECT_WIDTH - 10, (windowHeight/4) - 10, 20, 20, 10000)
    love.graphics.rectangle("line", shapeXLoc(3,1, getFontWidth(RECT_WIDTH) + 105) + (INNER_RECT_WIDTH * 2), shapeYLoc(1, 1, (windowHeight/4) - 10),
      INNER_RECT_WIDTH - 10, (windowHeight/4) - 10, 20, 20, 10000)

    love.graphics.setFont(fontmain)
    love.graphics.setColor(1,1,1)
    love.graphics.rectangle("fill", RECT_TWO_X,
      shapeYLoc(1, 1, windowHeight/4), getFontWidth(RECT_WIDTH) + 115, windowHeight/4, 20, 20, 10000)
    love.graphics.rectangle("line", RECT_TWO_X,
      shapeYLoc(1, 1, windowHeight/4), getFontWidth(RECT_WIDTH) + 115, windowHeight/4, 20, 20, 10000)
    love.graphics.setColor(1,0.6,0.2)
    love.graphics.rectangle("fill", shapeXLoc(3,3, getFontWidth(RECT_WIDTH) + 105), shapeYLoc(1, 1, (windowHeight/4) - 10),
      INNER_RECT_WIDTH - 10, (windowHeight/4) - 10, 20, 20, 10000)
    love.graphics.rectangle("line", shapeXLoc(3,3, getFontWidth(RECT_WIDTH) + 105), shapeYLoc(1, 1, (windowHeight/4) - 10),
      INNER_RECT_WIDTH - 10, (windowHeight/4) - 10, 20, 20, 10000)
    love.graphics.rectangle("fill", shapeXLoc(3,3, getFontWidth(RECT_WIDTH) + 105)  + INNER_RECT_WIDTH, shapeYLoc(1, 1, (windowHeight/4) - 10),
      INNER_RECT_WIDTH - 10, (windowHeight/4) - 10, 20, 20, 10000)
    love.graphics.rectangle("line", shapeXLoc(3,3, getFontWidth(RECT_WIDTH) + 105)  + INNER_RECT_WIDTH, shapeYLoc(1, 1, (windowHeight/4) - 10),
      INNER_RECT_WIDTH - 10, (windowHeight/4) - 10, 20, 20, 10000)
    love.graphics.rectangle("fill", shapeXLoc(3,3, getFontWidth(RECT_WIDTH) + 105)  + (INNER_RECT_WIDTH * 2), shapeYLoc(1, 1, (windowHeight/4) - 10),
      INNER_RECT_WIDTH - 10, (windowHeight/4) - 10, 20, 20, 10000)
    love.graphics.rectangle("line", shapeXLoc(3,3, getFontWidth(RECT_WIDTH) + 105)  + (INNER_RECT_WIDTH * 2), shapeYLoc(1, 1, (windowHeight/4) - 10),
      INNER_RECT_WIDTH - 10, (windowHeight/4) - 10, 20, 20, 10000)

    love.graphics.setColor(1,1,1)
    love.graphics.setFont(fontsmall)
    FONT_WIDTH = '1000 100 10'
    love.graphics.print('1000', shapeXLoc(3,1, getFontWidth(FONT_WIDTH) + 125), shapeYLoc(1, 1, getFontHeight('1000')))
    love.graphics.print('100', shapeXLoc(3,1, getFontWidth(FONT_WIDTH) + 125) + INNER_RECT_WIDTH + 20, shapeYLoc(1, 1, getFontHeight('1000')))
    love.graphics.print('10', shapeXLoc(3,1, getFontWidth(FONT_WIDTH) + 125) + (INNER_RECT_WIDTH * 2) + 35, shapeYLoc(1, 1, getFontHeight('1000')))
    love.graphics.print('1000', shapeXLoc(3,3, getFontWidth(FONT_WIDTH) + 125), shapeYLoc(1, 1, getFontHeight('1000')))
    love.graphics.print('100', shapeXLoc(3,3, getFontWidth(FONT_WIDTH) + 125) + INNER_RECT_WIDTH + 20, shapeYLoc(1, 1, getFontHeight('1000')))
    love.graphics.print('10', shapeXLoc(3,3, getFontWidth(FONT_WIDTH) + 125) + (INNER_RECT_WIDTH * 2) + 35, shapeYLoc(1, 1, getFontHeight('1000')))

    love.graphics.setColor(0,0,0)
     if incrementP1 == 1 then
       love.graphics.rectangle("line", RECT_ONE_X, shapeYLoc(1, 1, windowHeight/4),
        INNER_RECT_WIDTH, windowHeight/4, 20, 20, 10000)
     elseif incrementP1 == 2 then
       love.graphics.rectangle("line", RECT_ONE_X  + INNER_RECT_WIDTH, shapeYLoc(1, 1, windowHeight/4),
        INNER_RECT_WIDTH, windowHeight/4, 20, 20, 10000)
     elseif incrementP1 == 3 then
       love.graphics.rectangle("line", RECT_ONE_X  + (INNER_RECT_WIDTH * 2), shapeYLoc(1, 1, windowHeight/4),
        INNER_RECT_WIDTH, windowHeight/4, 20, 20, 10000)
     end

     if incrementP2 == 1 then
       love.graphics.rectangle("line", RECT_TWO_X, shapeYLoc(1, 1, windowHeight/4),
        INNER_RECT_WIDTH, windowHeight/4, 20, 20, 10000)
     elseif incrementP2 == 2 then
       love.graphics.rectangle("line", RECT_TWO_X  + INNER_RECT_WIDTH, shapeYLoc(1, 1, windowHeight/4),
        INNER_RECT_WIDTH, windowHeight/4, 20, 20, 10000)
     elseif incrementP2 == 3 then
       love.graphics.rectangle("line", RECT_TWO_X  + (INNER_RECT_WIDTH * 2), shapeYLoc(1, 1, windowHeight/4),
        INNER_RECT_WIDTH, windowHeight/4, 20, 20, 10000)
     end

    love.graphics.setColor(1,1,1)
    love.graphics.setFont(fontplayernums)
    love.graphics.print(p1Num, textXLoc(3, 1, p1Num), textYLoc(3, 3, p1Num)) --player 1 number
    love.graphics.print(p2Num, textXLoc(3, 3, p2Num), textYLoc(3, 3, p2Num)) --player 2 number

    love.graphics.setColor(1,1,1)
    local CIRCLE_OUTLINE_RADIUS = 37
    local CIRCLE_FILL_RADIUS = 35
    local CIRCLE_SEGMENT = 10000
    love.graphics.circle("fill", shapeXLoc(6,2, (CIRCLE_OUTLINE_RADIUS*2)),
      shapeYLoc(9,9,(CIRCLE_OUTLINE_RADIUS)), CIRCLE_OUTLINE_RADIUS, CIRCLE_SEGMENT) --VVV proximity circles VVV
    love.graphics.circle("fill", shapeXLoc(6,6, (CIRCLE_OUTLINE_RADIUS*6)),
      shapeYLoc(9,9,(CIRCLE_OUTLINE_RADIUS)), CIRCLE_OUTLINE_RADIUS, CIRCLE_SEGMENT)
    love.graphics.circle("line", shapeXLoc(6,2, (CIRCLE_OUTLINE_RADIUS*2)),
      shapeYLoc(9,9,(CIRCLE_OUTLINE_RADIUS)), CIRCLE_OUTLINE_RADIUS, CIRCLE_SEGMENT)
    love.graphics.circle("line", shapeXLoc(6,6, (CIRCLE_OUTLINE_RADIUS*6)),
      shapeYLoc(9,9,(CIRCLE_OUTLINE_RADIUS)), CIRCLE_OUTLINE_RADIUS, CIRCLE_SEGMENT)

    love.graphics.setColor(p1Color)
    love.graphics.circle("fill", shapeXLoc(6,2, (CIRCLE_OUTLINE_RADIUS*2)),
      shapeYLoc(9,9,(CIRCLE_OUTLINE_RADIUS)), CIRCLE_FILL_RADIUS, 10000)
    love.graphics.circle("line", shapeXLoc(6,2, (CIRCLE_OUTLINE_RADIUS*2)),
      shapeYLoc(9,9,(CIRCLE_OUTLINE_RADIUS)), CIRCLE_FILL_RADIUS, 10000)

    love.graphics.setColor(p2Color)
    love.graphics.circle("fill", shapeXLoc(6,6, (CIRCLE_OUTLINE_RADIUS*6)),
      shapeYLoc(9,9,(CIRCLE_OUTLINE_RADIUS)), CIRCLE_FILL_RADIUS, 10000)
    love.graphics.circle("line", shapeXLoc(6,6, (CIRCLE_OUTLINE_RADIUS*6)),
      shapeYLoc(9,9,(CIRCLE_OUTLINE_RADIUS)), CIRCLE_FILL_RADIUS, 10000) ---^^^ proximity circles ^^^

  elseif gameStart == false then
    love.graphics.setFont(fontmain)
    love.graphics.setColor(1,1,1)
    love.graphics.print("Enter to Start.", textXLoc(1,1,"Enter to Start."), 100)
    love.graphics.print("Escape to Quit.", textXLoc(1,1,"Escape to Quit."), 100 + getFontHeight("Enter to Start."))
  end
  if gameComplete == true then
    love.graphics.setFont(fontmain)
    love.graphics.setColor(1,1,1)
    love.graphics.print(targetNum, textXLoc(1,1,targetNum), textYLoc(2,2,targetNum)) --target number
    love.graphics.print(winner, textXLoc(1,1,winner), 300)
  end
end

function NumbersGame:keypressed(key)
  if key == 'a' then
    a_down = true
    if incrementP1 > 1 then
      incrementP1 = incrementP1 - 1
    end
  elseif key =='d' then
    if incrementP1 < 3 then
      incrementP1 = incrementP1 + 1
    end
  elseif key == 'w' then
    w_down = true
    if incrementP1 == 1 then
      if p1Num + 1000 <= 10000 then
        p1Num = p1Num + 1000
      end
    elseif incrementP1 == 2 then
      if p1Num + 100 <= 10000 then
        p1Num = p1Num + 100
      end
    elseif incrementP1 == 3 then
      if p1Num + 10 <= 10000 then
        p1Num = p1Num + 10
      end
    end
  elseif key == 's' then
      s_down = true
    if incrementP1 == 1 then
      if p1Num - 1000 >= 0 then
        p1Num = p1Num - 1000
      end
    elseif incrementP1 == 2 then
      if p1Num - 100 >= 0 then
        p1Num = p1Num - 100
      end
    elseif incrementP1 == 3 then
      if p1Num - 10 >= 0 then
        p1Num = p1Num - 10
      end
    end
  elseif key =='left' then
    left_down = true
    if incrementP2 > 1 then
      incrementP2 = incrementP2 - 1
    end
  elseif key == 'right' then
    right_down = true
    if incrementP2 < 3 then
      incrementP2 = incrementP2 + 1
    end
  elseif key == 'up' then
    up_down = true
    if incrementP2 == 1 then
      if p2Num + 1000 <= 10000 then
        p2Num = p2Num + 1000
      end
    elseif incrementP2 == 2 then
      if p2Num + 100 <= 10000 then
        p2Num = p2Num + 100
      end
    elseif incrementP2 == 3 then
      if p2Num + 10 <= 10000 then
        p2Num = p2Num + 10
      end
    end
  elseif key == 'down' then
    down_down = true
    s_down = true
    if incrementP2 == 1 then
      if p2Num - 1000 >= 0 then
        p2Num = p2Num - 1000
      end
    elseif incrementP2 == 2 then
      if p2Num - 100 >= 0 then
        p2Num = p2Num - 100
      end
    elseif incrementP2 == 3 then
      if p2Num - 10 >= 0 then
        p2Num = p2Num - 10
      end
    end

  elseif key == 'escape' then
    quitGame = true
  end
end

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

function hotcold()
  p1dist = math.abs(targetNum - p1Num)
  p2dist = math.abs(targetNum - p2Num)

  if p1dist > 5250 then
    p1colorScale = 0
    p1Color = {p1colorScale, 0, 0}
  elseif p1dist <= 5250 and p1dist > 5000 then
    p1colorScale = (5250 - p1dist)/250
    p1Color = {p1colorScale, 0, 0}
  elseif p1dist <= 5000 and p1dist > 500 then
    p1colorScale = (5000 - p1dist)/4500
    p1Color = {1, p1colorScale, 0}
  elseif p1dist <= 500 and p1dist > 0 then
    p1colorScale = p1dist/500
    p1Color = {p1colorScale, 1, 0}
  end

  if p2dist > 5250 then
    p2colorScale = 0
    p2Color = {p2colorScale, 0, 0}
  elseif p2dist <= 5250 and p2dist > 5000 then
    p2colorScale = (5250 - p2dist)/250
    p2Color = {p2colorScale, 0, 0}
  elseif p2dist <= 5000 and p2dist > 500 then
    p2colorScale = (5000 - p2dist)/4500
    p2Color = {1, p2colorScale, 0}
  elseif p2dist <= 500 and p2dist > 0 then
    p2colorScale = p2dist/500
    p2Color = {p2colorScale, 1, 0}
  end
end

function veryclose(dt)
  if adding1 == false then
    colorTimer1 = colorTimer1 - dt * (1000/(p1dist + 50))
    p1Color = {colorTimer1,1,0}
  elseif adding1 == true then
    colorTimer1 = colorTimer1 + dt * (1000/(p1dist + 50))
    p1Color = {colorTimer1,1,0}
  end
  if colorTimer1 <= 0 then
    adding1 = true
  elseif colorTimer1 >= 1 then
    adding1 = false
  end

  if adding2 == false then
    colorTimer2 = colorTimer2 - dt * (1000/(p2dist + 50))
    p2Color = {colorTimer2,1,0}
  elseif adding2 == true then
    colorTimer2 = colorTimer2 + dt * (1000/(p2dist + 50))
    p2Color = {colorTimer2,1,0}
  end
  if colorTimer2 <= 0 then
    adding2 = true
  elseif colorTimer2 >= 1 then
    adding2 = false
  end
end

--Functional X Location for text, how many lines, which line
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

return NumbersGame
