jlEvent = {}

jlEvent.__index = jlEvent
--[[MAKE INTO A SINGLETON!!!]]--
setmetatable(jlEvent,
		{__call = function(cls, ...)
			return cls.new(...)
		end})

function jlEvent.new()
	local self = setmetatable({}, jlEvent)
	self:init()
	return self
end

function jlEvent.new(s, t, d, id)
	local self = setmetatable({}, jlEvent)
	self:init(s, t, d, id)
	return self
end

function jlEvent:init(sender, target, desc, id)
	self.sender = sender
	self.target = target
	self.description = desc
	self.id = id
	self.timer = nil
end

function jlEvent.new(s, t, d, id, timer)
	local self = setmetatable({}, jlEvent)
	self:init(s, t, d, id, timer)
	return self
end

function jlEvent:init(sender, target, desc, id, timer)
	self.sender = sender
	self.target = target
	self.description = desc
	self.id = id
	self.timer = timer
end

function jlEvent:init(sender, target, desc, id, data, timer)
	self.sender = sender
	self.target = target
	self.description = desc
	self.id = id
	self.data = data
	self.timer = timer
end

function jlEvent.new(s, t, d, id, da, timer)
	local self = setmetatable({}, jlEvent)
	self:init(s, t, d, id, da, timer)
	return self
end

function jlEvent:getTimer()
	return self.timer
end

--function jlEvent:init()
--	self.sender = "none"
--	self.target = "none"
--	self.description = "none"
--	self.id = "none"
--end
function jlEvent:getDesc()
	return self.description
end

function jlEvent:getSender()
	return self.sender
end

function jlEvent:getData()
	return self.data
end

function jlEvent:getTarget()
	return self.target
end

function jlEvent:getID()
	return self.id
end