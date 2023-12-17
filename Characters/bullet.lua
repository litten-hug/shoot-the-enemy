Bullet = Object:extend()
scoreCount = 0

function Bullet:new(x, y)
    self.image = love.graphics.newImage("Sprites/bullet.png")
    self.x = x
    self.y = y
    self.speed = 700
    self.width = self.image:getWidth()
    self.height = self.image:getHeight()
end

function Bullet:update(dt)
    self.y = self.y + self.speed * dt

    if self.y > love.graphics.getHeight() then
        scoreCount = 0
        love.load()
    end
end

function Bullet:draw()
    love.graphics.draw(self.image, self.x, self.y)
end

function Bullet:checkCollision(enemy)
    local self_left = self.x
    local self_right = self.x + self.width
    local self_top = self.y
    local self_bottom = self.y + self.height

    local obj_left = enemy.x
    local obj_right = enemy.x + enemy.width
    local obj_top = enemy.y
    local obj_bottom = enemy.y + enemy.height

    if  self_right > obj_left
    and self_left < obj_right
    and self_bottom > obj_top
    and self_top < obj_bottom then
        self.dead = true
        scoreCount = scoreCount + 1
        enemy.speed = enemy.speed + (enemy.speed * 0.5)
    end
end