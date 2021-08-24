require "Block"
require "oopExtended"

Body = {}

extended(Body, Block)

function Body:new(target) 
    local public = Block.new(self, target:getPosition())
    local private = {}

    private.target = target

    function public:tick()
        public:setPosition(private.target:getPosition())
    end

    function public:getType()
        return "body"
    end

    setmetatable(public, self)
    self.__index = self; return public
end
