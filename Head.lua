require "Block"
require "oopExtended"

Head = {}

extended(Head, Block)

function Head:new(px, py)
    local public = Block.new(self, px, py)
    local private = {}

    private.speedX = 1
    private.speedY = 0

    function public:tick()
        public:changePosition(private.speedX, private.speedY)
    end

    function public:control(key)
        if key == "w" then
            private.speedX = 0
            private.speedY = -1
        elseif key == "s" then
            private.speedX = 0
            private.speedY = 1
        elseif key == "a" then
            private.speedX = -1
            private.speedY = 0
        elseif key == "d" then
            private.speedX = 1
            private.speedY = 0
        end
    end


    setmetatable(public, self)
    self.__index = self; return public
end
