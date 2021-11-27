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