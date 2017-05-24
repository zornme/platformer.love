Platform = require 'platform'

function love.load()
    platform = Platform.new({
        width = love.graphics.getWidth(),
        height = love.graphics.getHeight(),
        x = 0,
        y = love.graphics.getHeight() / 2
    })

    player = {
        x = love.graphics.getWidth() / 2,
        y = love.graphics.getHeight() / 2,
        speed = 200,
        img = love.graphics.newImage('purple.png'),
        ground = love.graphics.getHeight() / 2,
        y_velocity = 0,
        jump_height = -300,
        gravity = -500,
    }
end

function love.update(dt)
    if love.keyboard.isDown('d') then
        if player.x < (love.graphics.getWidth() - player.img:getWidth()) then
            player.x = player.x + (player.speed * dt)
        end
    elseif love.keyboard.isDown('a') then
        if player.x > 0 then
            player.x = player.x - (player.speed * dt)
        end
    end

    if love.keyboard.isDown('space') then
        if player.y_velocity == 0 then
            player.y_velocity = player.jump_height
        end
    end

    if player.y_velocity ~= 0 then
        player.y = player.y + player.y_velocity * dt
        player.y_velocity = player.y_velocity - player.gravity * dt
    end

    if player.y > player.ground then
        player.y_velocity = 0
        player.y = player.ground
    end
end

function love.draw()
    platform:draw()
    love.graphics.draw(player.img, player.x, player.y, 0, 1, 1, 0, 32)
end
