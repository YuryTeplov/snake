require "Block"
require "oopExtended"

Body = {}

extended(Body, Block)

function Body:new(px, py, target)
    local public = Block.new(self, px, py)
    local private = {}

    private.target = target

    function public:tick()
        public:setPosition(private.target:getPosition)
    end

    function public:getType()
        return "body"
    end

    setmetatable(public, self)
    self.__index = self; return public
end
