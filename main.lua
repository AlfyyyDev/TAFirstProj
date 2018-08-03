

function love.load()
   love.window.setTitle("Number Game")
   love.graphics.setNewFont(12)
   love.graphics.setColor(0,0,0)
   love.graphics.setBackgroundColor(255,255,255)
   incrementP1 = 2
   incrementP2 = 2
   incrementTable = {1000, 100, 10}
   p1Num = 5000
   p2Num = 5000
   round = 1
   p1score = 0
   p2score = 0
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
      love.graphics.setColor(0,0,0)
      love.graphics.setBackgroundColor(255,255,255)
      love.graphics.print('Round ' .. round, 400, 50)
      love.graphics.print(targetNum, 400, 300)
      love.graphics.print(incrementTable[incrementP1], 300, 100)
      love.graphics.print(incrementTable[incrementP2], 500, 100)
      love.graphics.print(p1Num, 300, 200)
      love.graphics.print(p2Num, 500, 200)
      love.graphics.print('Score ' .. p1score, 200, 150)
      love.graphics.print('Score ' .. p2score, 600, 150)
      love.graphics.setColor(p1TempColor)
      love.graphics.circle("fill", 300, 300, 35, 20)
      love.graphics.setColor(p2TempColor)
      love.graphics.circle("fill", 500, 300, 35, 20)

    elseif gameStart == false then
      love.graphics.setColor(0,0,0)
      love.graphics.setBackgroundColor(255,255,255)
      love.graphics.print("Enter to Start. Escape To Quit", 300, 100)
    end
    if gameComplete == true then
      love.graphics.setColor(0,0,0)
      love.graphics.setBackgroundColor(255,255,255)
      love.graphics.print(winner, 400, 300)
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
  elseif p1dist == 0 then
    p1TempColor = {0.4,1,0.1}
  end

  if p2dist <= 10000 and p2dist > 7500 then
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
  end
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














--hiaosdhioasd
