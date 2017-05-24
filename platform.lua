local Platform = {
    width = 100,
    height = 100,
    x = 0,
    y = 0,
    color = { 255, 255, 255 }
}

function Platform.__index(table, key)
    return Platform[key]
end

function Platform.new(o)
    setmetatable(o, Platform)
    return o
end

function Platform.draw(self)
    love.graphics.setColor(self.color)
    love.graphics.rectangle('fill', self.x, self.y, self.width, self.height)
end

return Platform
