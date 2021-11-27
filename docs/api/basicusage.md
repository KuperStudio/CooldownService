# Basic Usage
After setting up the service, we can now learn more about our service and put each system into practice.

## Requiring
To get started we will be calling our module depending on how we set it up.

```lua
--// Services
local CooldownService = require(game:GetService('ReplicatedStorage'):FindFirstChild('CooldownService'))
```

For the require we are calling the service **ReplicatedStorage** and after that requiring the module **CooldownService** that we insert in ReplicatedStorage.

## Getting Cooldown
Obtaining Cooldown will provide us with various functions that we can use to manipulate our service and that is why obtaining our Cooldown is considered one of the most important part of the service.

```lua
local Cooldown = CooldownService:GetCooldown('Cooldown')
```

To get our Cooldown we use function **:GetCooldown()** and enter a name for our Cooldown, optionally we can insert indexes that acted as subclasses in our Cooldown, this can also be called folders.

## Use of Cooldown

1. Setting Time
This function will change its cooldown value to the time the function was executed.

```lua
Cooldown:Set()
```

2. Resetting Time
Will reset cooldown value to zero.

```lua
Cooldown:Reset()
```

3. Getting Time
This function will get the value saved in cooldown.

```lua
local Time = Cooldown:Get()
```

4. Updating Time
This function will get the current cooling value by entering it as an argument of the defined function and will set the cooling value for the time since the end of the entered function as an argument.

```lua
Cooldown:Update(function(Time)
	print(Time)
end)
```

5. Comparing Value
This function will compare the time entered as an argument with the cooldown time and thus give a return of the subtraction between the values.

```lua
local Difference = Cooldown:Compare(os.time())
```

6. Destroying Cooldown
Will destroy starting class from current cooldown.

```lua
Cooldown:Destroy()
```

!!! warning
	After destroying the initial class, all subclasses or other cooldowns with the same subclass references will be destroyed.

## Practing
It is very important to put into practice everything we have learned so far so that there are no remaining doubts.

For our practice we will be making a simple function that will compare if the elapsed time was greater than or equivalent to five between the configuration function and the update function.

```lua
--// CooldownService
local CooldownService = require(game:GetService('ReplicatedStorage'):FindFirstChild('CooldownService'))
local Cooldown = CooldownService:GetCooldown('Cooldown')

--// Variables
local WaitingTime = math.random(0, 10)

--// Functions
Cooldown:Set() --> Cooldown = os.time()
print(1, Cooldown:Get()) --> print(Cooldown)

task.wait(WaitingTime)

Cooldown:Update(function(Time)
	if Cooldown:Compare(os.time()) >= 5 then
		print('Success!', Time) --> print('Success!', Cooldown)
	end
end) --> Cooldown = os.time()

print(2, Cooldown:Get()) --> print(Cooldown)
```