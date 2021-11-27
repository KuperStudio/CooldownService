# API

## CooldownService

### CooldownService:GetCooldown(Name: string, ...any)
```lua
local Cooldown = CooldownService:GetCooldown('Cooldown')
```
It will get a cooldown and return functions so that you can manipulate the cooldown.

!!! note
    The main argument is the Cooldown name, but you can go on adding subcategories.
    This can be something like **:GetCooldown('Power', Player.UserId, 'Powers')**. Note that 'Power' is the name of the cooling and will be the last category to be listed in the table: **{ Players.UserId = { Powers = { Power = os.time() } } }**.

## Cooldown

### Cooldown:Set()
```lua
Cooldown:Set()
```
Set cooldown to current time.

### Cooldown:Reset()
```lua
Cooldown:Reset()
```
Resets cooldown to zero.

### Cooldown:Get()
```lua
local lastTime = Cooldown:Get()
```
Get the current cooldown value.

### Cooldown:Update(Callback: (Time: number) -> any)
```lua
local newTime = Cooldown:Update(function(Time)
    if os.time()-Time >= 5 then
        print('Success!', Time)
    end
end)
```
Get the cooldown value and after executing the function, set the cooldown value to the current time.

### Cooldown:Compare(Number: number)
```lua
local Time = Cooldown:Compare(os.time())
```
Compare the number entered as an argument with the cooldown value.

### Cooldown:Destroy()
```lua
Cooldown:Destroy()
```
Destroy current cooldown.

!!! warning
    This will destroy all cooldown that are connected in the same class as the current one. It is recommended that you use **reset()** instead of destroy.

!!! notice
    In the future we will bring a more appropriate function to the system.