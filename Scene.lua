require "Head"
require "Apple"
require "Body"

Scene = {}

function Scene:new()
    local public = {}
    local private = {}

    private.head = Head:new(1, 1)
    private.actors = {}
    private.score = 0

    table.insert(private.actors, Apple:new(4, 4))
    table.insert(private.actors, Body:new(private.head))

    private.dtBatery = 0
    private.timeOfTick = 0.3
    

    function public:load()

    end

    function private:checkCollisions()
        for k,v in pairs(private.actors) do
            if v:checkCollisions(private.head:getPosition()) then
                if v:getType() == "apple" then
                    private.score = private.score + 1
                    local apple = private.actors[1]
                    apple:changePosition(1, 1)

                    table.insert(private.actors, Body:new(private.actors[#private.actors]))
                end
            end
        end
    end


    function public:update(dt)
        private.dtBatery = private.dtBatery + dt

        if private.dtBatery >= private.timeOfTick then
            for i = #private.actors, 1, -1 do
                private.actors[i]:tick()
            end

            private.head:tick()

            private:checkCollisions()

            private.dtBatery = private.dtBatery - private.timeOfTick

        end
    end

    function public:draw()
        private.head:draw()

        for k,v in pairs(private.actors) do
			v:draw()
		end

    end

    function public:control(key)
        private.head:control(key)
    end

    setmetatable(public, self)
    self.__index = self; return public
end
