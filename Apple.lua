require "Block"
require "oopExtended"

Apple = {}

extended(Apple, Block)

function Apple:new(px, py)
    local public = Block.new(self, px, py)
    local private = {}


    function public:getType()
        return "apple"
    end

    function public:draw()
        local size = public:getSize()
        local px, py = public:getPosition()

        love.graphics.setColor(0.4, 0.4, 0)
        love.graphics.rectangle("fill",
                    px * size,
                    py * size,
                    size,
                    size)
    end

    setmetatable(public, self)
    self.__index = self; return public
end
