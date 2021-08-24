require "Head"

Scene = {}

function Scene:new()
    local public = {}
    local private = {}

    private.head = Head:new(1, 1)

    private.dtBatery = 0
    private.timeOfTick = 0.3
    

    function public:load()

    end

    function public:update(dt)
        private.dtBatery = private.dtBatery + dt

        if private.dtBatery >= private.timeOfTick then
            private.head:tick()
            private.dtBatery = private.dtBatery - private.timeOfTick
        end

    end

    function public:draw()
        private.head:draw()
    end

    function public:control(key)
        private.head:control(key)
    end

    setmetatable(public, self)
    self.__index = self; return public
end
