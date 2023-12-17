function love.load()
  Object = require "classic"
  require "Characters/player"
  require "Characters/enemy"
  require "Characters/bullet"

  player = Player()
  enemy = Enemy()
  listOfBullets = {}
end

function love.update(dt)
  player:update(dt)
  enemy:update(dt)

  for index,bullet in ipairs(listOfBullets) do
    bullet:update(dt)
    bullet:checkCollision(enemy)
    if bullet.dead then
      table.remove(listOfBullets, index)
    end
  end
end

function love.draw()
  love.graphics.print(scoreCount, 0, 0, 0, 5, 5)
  player:draw()
  enemy:draw()
  for index,bullet in ipairs(listOfBullets) do
    bullet:draw()
  end
end

function love.keypressed(key)
  player:keyPressed(key)
end