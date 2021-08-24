Block = {}

function Block:new(posX, posY)
    local public = {}
    local private = {}

    private.positionX = posX
    private.positionY = posY

    private.size = 30

    function public:getPosition()
        return private.positionX, private.positionY
    end

    function public:getSize()
        return private.size
    end

    function public:changePosition(dx, dy)
        private.positionX = private.positionX + dx
        private.positionY = private.positionY + dy
    end

    function public:setPosition(px, py)
        private.positionX = px
        private.positionY = py
    end

    function public:tick()
    end

    function public:draw()
        love.graphics.setColor(0, 0.4, 0.4)
        love.graphics.rectangle("fill",
                    private.positionX * private.size,
                    private.positionY * private.size,
                    private.size,
                    private.size)
    end


    setmetatable(public, self)
    self.__index = self; return public
end
