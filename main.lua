require "Scene"

function love.load()
    scene = Scene:new()
end

function love.update(dt)
    scene:update(dt)
end

function love.draw()
    scene:draw()
end

function love.keypressed(key, scancode, isrepeat)
    scene:control(key)
end
