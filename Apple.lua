require "Block"
require "oopExtended"

Apple = {}

extended(Apple, Block)

function Apple:new(px, py)
    local public = Block(self, px, py)
    local private = {}

    function public:isCoordsOnIt(x, y)
        local px, py = public:getPosition()
        return px == x and py == y
    end

    function public:getType()
        return "apple"
    end

    setmetatable(public, self)
    self.__index = self; return public
end
