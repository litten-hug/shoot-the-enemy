Player = Object:extend()

function Player:new()
    self.image = love.graphics.newImage("Sprites/panda.png")
    self.x = 300
    self.y = 20
    self.speed = 500
    self.width = self.image:getWidth()
end

function Player:keyPressed(key)
    if key == "space" then
        table.insert(listOfBullets, Bullet(self.x + 20, self.y + 80))
    end
end

function Player:update(dt)
    if love.keyboard.isDown("left", "a", "j") then
        self.x = self.x - self.speed * dt
    end
    if love.keyboard.isDown("right", "d", "l") then
        self.x = self.x + self.speed * dt
    end

    local window_width = love.graphics.getWidth()

    if self.x < 0 then
        self.x = 0
    end
    if self.x > window_width then
        self.x = window_width
    end
    if self.x + self.width < 0 then
        self.x = 0
    end
    if self.x + self.width > window_width then
        self.x = window_width - self.width
    end
end

function Player:draw()
    love.graphics.draw(self.image, self.x, self.y)
end