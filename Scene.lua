Scene = {}

function Scene:new()
    local public = {}
    local private = {}

    

    function public:load()

    end

    function public:update(dt)

    end

    function public:draw()

    end

    setmetatable(public, self)
    self.__index = self; return public
end
