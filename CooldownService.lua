--// Types
type table = {[any]: any}

--// CooldownService
local CooldownService = {} do
	local Cooldowns = {}
	
	local function GetWithIndexes(Indexes: table): table
		local Result = Cooldowns
		for _, v in next, Indexes do
			if not Result[v] then Result[v] = {} end
			Result = Result[v]
		end
		return Result
	end
	
	local Cooldown = {} do
		Cooldown.__index = Cooldown
		
		function Cooldown:set()
			GetWithIndexes(self.Indexes)[self.Name] = os.time()
		end
		
		function Cooldown:Set() return self:set() end
		
		function Cooldown:get()
			return GetWithIndexes(self.Indexes)[self.Name]
		end
		
		function Cooldown:Get() return self:get() end
		
		function Cooldown:reset()
			GetWithIndexes(self.Indexes)[self.Name] = 0
		end
		
		function Cooldown:Reset() return self:reset() end
		
		function Cooldown:update(Callback: (Time: number) -> any): number
			if typeof(Callback) ~= 'function' then return self:get() end
			
			Callback(self:get())
			self:set()
			return self:get()
		end
		
		function Cooldown:Update(Callback: (Time: number) -> any): number return self:update(Callback) end
		
		function Cooldown:compare(Number: number): number
			if typeof(Number) ~= 'number' then return self:get() end
			return Number - self:get()
		end
		
		function Cooldown:Compare(Number: number): number return self:compare(Number) end
		
		function Cooldown:destroy()
			if self.Indexes[1] then Cooldowns[self.Indexes[1]] = nil; return end
			Cooldowns[self.Name] = nil
		end
		
		function Cooldown:Destroy() self:destroy() end
	end
	
	function CooldownService:GetCooldown(Name: string, ...)
		assert(typeof(Name) == 'string', 'Invalid "Name" argument.')
		
		local self = setmetatable({}, Cooldown)
		self.Name = Name
		self.Indexes = {...}
		return self
	end
end

--// Return
return CooldownService