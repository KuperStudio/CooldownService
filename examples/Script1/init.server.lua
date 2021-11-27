--// Services
local CooldownService = require(game:GetService('ReplicatedStorage'):FindFirstChild('CooldownService'))

--// Variables
local Cooldown = CooldownService:GetCooldown('Cooldown')

--// Functions
Cooldown:Set()