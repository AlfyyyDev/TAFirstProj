

function love.load()
  fontmain = love.graphics.newFont("goodtimesfont.ttf", 50)
  fontplayernums =  love.graphics.newFont("goodtimesfont.ttf", 90)
  love.graphics.setFont(fontmain)
  love.window.setTitle("Number Game")
  love.window.setMode(1024,768)
  love.graphics.setColor(0,0,0)
  love.graphics.setBackgroundColor(1,0.6,0.2)
  windowWidth, windowHeight = love.window.getMode()
  incrementP1 = 2
  incrementP2 = 2
  incrementTable = {1000, 100, 10}
  p1Num = 5000
  p2Num = 5000
  round = 1
  p1score = 0
  p2score = 0
  colorScale = 0
  quitGame = false
  test = "nothing"
  gameStart = false
  gameComplete = false
  winner = "none"
  p1TempColor = {0,0,0}
  p2TempColor = {0,0,0}
end

function love.update(dt)
  if quitGame == true then
    love.event.quit()
  end
  if gameStart == false and love.keyboard.isDown('return') then
    gameStart = true
    gameComplete = false
    round = 1
    p1score = 0
    p2score = 0
    create_number()

  elseif gameStart == true then
      hotcold()
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

function love.draw()
    if gameStart == true then
      ROUND_STRING = "Round " .. round
      ROUND = "Round "
      SCORE = "Score "
      P1SCORE_STRING = "Score " .. p1score
      P2SCORE_STRING = "Score " .. p2score
      love.graphics.setFont(fontmain)
      love.graphics.setColor(1, 1, 1)
      love.graphics.print(ROUND_STRING, textXLoc(1, 1, ROUND), textYLoc(14, 2, ROUND)) --round counter
      love.graphics.print('Player One', 300, 100) --selected  player 1
      love.graphics.print('Player Two', 500, 100) --selected player 2
      love.graphics.print(P1SCORE_STRING, textXLoc(3, 1, SCORE), textYLoc(5, 2, SCORE)) --player 1 score
      love.graphics.print(P2SCORE_STRING, textXLoc(3, 3, SCORE), textYLoc(5, 2, SCORE)) --player 2 score

      love.graphics.setColor(1,1,1)

      RECT_WIDTH = '1000 100 10'
      RECT_ONE_X = shapeXLoc(3,1, getFontWidth(RECT_WIDTH) + 115)
      RECT_TWO_X = shapeXLoc(3,3, getFontWidth(RECT_WIDTH) + 115)
      INNER_RECT_WIDTH = (getFontWidth(RECT_WIDTH) + 115)/3

      love.graphics.rectangle("fill", RECT_ONE_X,
        shapeYLoc(1, 1, windowHeight/4), getFontWidth(RECT_WIDTH) + 115, windowHeight/4, 20, 20, 10000)
      love.graphics.setColor(1,0.6,0.2)
      --left box 1
      love.graphics.rectangle("fill", shapeXLoc(3,1, getFontWidth(RECT_WIDTH) + 105), shapeYLoc(1, 1, (windowHeight/4) - 10),
       INNER_RECT_WIDTH - 10, (windowHeight/4) - 10, 20, 20, 10000)
      --middle box 1
      love.graphics.rectangle("fill", shapeXLoc(3,1, getFontWidth(RECT_WIDTH) + 105) + INNER_RECT_WIDTH, shapeYLoc(1, 1, (windowHeight/4) - 10),
       INNER_RECT_WIDTH - 10, (windowHeight/4) - 10, 20, 20, 10000)
      --right box 1
      love.graphics.rectangle("fill", shapeXLoc(3,1, getFontWidth(RECT_WIDTH) + 105)  + (INNER_RECT_WIDTH * 2), shapeYLoc(1, 1, (windowHeight/4) - 10),
       INNER_RECT_WIDTH - 10, (windowHeight/4) - 10, 20, 20, 10000)


      love.graphics.setColor(1,1,1)
      love.graphics.rectangle("fill", RECT_TWO_X,
        shapeYLoc(1, 1, windowHeight/4), getFontWidth(RECT_WIDTH) + 115, windowHeight/4, 20, 20, 10000)
      love.graphics.setColor(1,0.6,0.2)
      --left box 2
      love.graphics.rectangle("fill", shapeXLoc(3,3, getFontWidth(RECT_WIDTH) + 105), shapeYLoc(1, 1, (windowHeight/4) - 10),
       INNER_RECT_WIDTH - 10, (windowHeight/4) - 10, 20, 20, 10000)
      --middle box 2
      love.graphics.rectangle("fill", shapeXLoc(3,3, getFontWidth(RECT_WIDTH) + 105)  + INNER_RECT_WIDTH, shapeYLoc(1, 1, (windowHeight/4) - 10),
       INNER_RECT_WIDTH - 10, (windowHeight/4) - 10, 20, 20, 10000)
      --right box 2
      love.graphics.rectangle("fill", shapeXLoc(3,3, getFontWidth(RECT_WIDTH) + 105)  + (INNER_RECT_WIDTH * 2), shapeYLoc(1, 1, (windowHeight/4) - 10),
       INNER_RECT_WIDTH - 10, (windowHeight/4) - 10, 20, 20, 10000)

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

      love.graphics.setColor(p1TempColor)
      love.graphics.circle("fill", shapeXLoc(6,2, (CIRCLE_OUTLINE_RADIUS*2)),
        shapeYLoc(9,9,(CIRCLE_OUTLINE_RADIUS)), CIRCLE_FILL_RADIUS, 10000)
      love.graphics.circle("line", shapeXLoc(6,2, (CIRCLE_OUTLINE_RADIUS*2)),
        shapeYLoc(9,9,(CIRCLE_OUTLINE_RADIUS)), CIRCLE_FILL_RADIUS, 10000)

      love.graphics.setColor(p2TempColor)
      love.graphics.circle("fill", shapeXLoc(6,6, (CIRCLE_OUTLINE_RADIUS*6)),
        shapeYLoc(9,9,(CIRCLE_OUTLINE_RADIUS)), CIRCLE_FILL_RADIUS, 10000)
      love.graphics.circle("line", shapeXLoc(6,6, (CIRCLE_OUTLINE_RADIUS*6)),
        shapeYLoc(9,9,(CIRCLE_OUTLINE_RADIUS)), CIRCLE_FILL_RADIUS, 10000) ---^^^ proximity circles ^^^

    elseif gameStart == false then
      love.graphics.setFont(fontmain)
      love.graphics.setColor(1,1,1)
      love.graphics.print("Enter to Start. Escape To Quit", textXLoc(1,1,"Enter to Start. Escape To Quit"), 100)
    end
    if gameComplete == true then
      love.graphics.setFont(fontmain)
      love.graphics.setColor(1,1,1)
      love.graphics.print(targetNum, textXLoc(1,1,targetNum), textYLoc(2,2,targetNum)) --target number
      love.graphics.print(winner, textXLoc(1,1,winner), 300)
    end
end

function love.keypressed(key)
  if key == 'a' then
    a_down = true
    if incrementP1 > 1 then
      incrementP1 = incrementP1 - 1
    end
  elseif key =='d' then
    d_down = true
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
--]]
function hotcold()
  p1dist = math.abs(targetNum - p1Num)
  p2dist = math.abs(targetNum - p2Num)

  if p1dist <= 10000 and p1dist > 7500 then
    p1TempColor = {0.3,0.2,1}
  elseif p1dist <= 7500 and p1dist > 5000 then
    p1TempColor = {0.3,1,0.8}
  elseif p1dist <= 5000 and p1dist > 2500 then
    p1TempColor = {0.9,0.9,0}
  elseif p1dist <= 2500 and p1dist > 1000 then
    p1TempColor = {0.9,0.7,0}
  elseif p1dist <= 1000 and p1dist > 500 then
    p1TempColor = {0.9,0.5,0.1}
  elseif p1dist <= 500 and p1dist > 250 then
    p1TempColor = {1,0.2,0}
  elseif p1dist <= 250 and p1dist > 100 then
    p1TempColor = {1,0,0}
  elseif p1dist <= 100 and p1dist > 50 then
    p1TempColor = {1,0,0.1}
  elseif p1dist <= 50 and p1dist > 10 then
    p1TempColor = {0.5,0,0.1}
  elseif p1dist <= 10 and p1dist >= 0 then
    p1TempColor = {0.4,1,0.1}
  end

--[[  if p2dist <= 10000 and p2dist > 7500 then
    p2TempColor = {0.3,0.2,1}
  elseif p2dist <= 7500 and p2dist > 5000 then
    p2TempColor = {0.3,1,0.8}
  elseif p2dist <= 5000 and p2dist > 2500 then
    p2TempColor = {0.9,0.9,0}
  elseif p2dist <= 2500 and p2dist > 1000 then
    p2TempColor = {0.9,0.7,0}
  elseif p2dist <= 1000 and p2dist > 500 then
    p2TempColor = {0.9,0.5,0.1}
  elseif p2dist <= 500 and p2dist > 250 then
    p2TempColor = {1,0.2,0}
  elseif p2dist <= 250 and p2dist > 100 then
    p2TempColor = {1,0,0}
  elseif p2dist <= 100 and p2dist > 50 then
    p2TempColor = {1,0,0.1}
  elseif p2dist <= 50 and p2dist > 10 then
    p2TempColor = {0.5,0,0.1}
  elseif p2dist <= 10 and p2dist >= 0 then
    p2TempColor = {0.4,1,0.1}
  end]]

  if p2dist > 5250 then
    colorScale = 0
    p2TempColor = {colorScale, 0, 0}
  elseif p2dist <= 5250 and p2dist > 5000 then
    colorScale = (5250 - p2dist)/250
    p2TempColor = {colorScale, 0, 0}
  elseif p2dist <= 5000 and p2dist > 500 then
    colorScale = (5000 - p2dist)/4500
    p2TempColor = {1, colorScale, 0}
  elseif p2dist <= 500 and p2dist > 0 then
    colorScale = p2dist/500
    p2TempColor = {colorScale, 1, 0}
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

]]


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
