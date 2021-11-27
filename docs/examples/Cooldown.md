# Cooldown
Two simple scripts that get results from the same cooling system even though they were separate. 

These scripts have communications between them where one will only initially set a value for the cooldown and after 5 seconds the second script will run an update function that will get the data for checking where if the data comparison is greater than five it will print a message of success and the time, by the way, the update function will finish setting a new time for the cooldown where after all that the current cooldown will be printed.

## Script-1
```lua
--// Services
local CooldownService = require(game:GetService('ReplicatedStorage'):FindFirstChild('CooldownService'))

--// Variables
local Cooldown = CooldownService:GetCooldown('Cooldown')

--// Functions
Cooldown:Set()
```

## Script-2
```lua
--// Services
local CooldownService = require(game:GetService('ReplicatedStorage'):FindFirstChild('CooldownService'))

--// Variables
local Cooldown = CooldownService:GetCooldown('Cooldown')

--// Functions
task.wait(5)
Cooldown:Update(function(Time)
	local Compare = Cooldown:Compare(os.time())
	if Compare >= 5 then print('Success!', Time) end
end)

print(Cooldown:Get())
```