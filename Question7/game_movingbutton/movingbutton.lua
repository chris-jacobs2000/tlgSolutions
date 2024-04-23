--[[PREFACE: When searching for forums to help with this code, I found a similar solution
on github (https://github.com/rodrigo-ot/jumpGame/tree/main/client_jumpgame). I took
the time to understand the code in it's entirety and tried to use that same logic
below. My goal was to not copy it for verbatim, but rather be able to demonstrate
that I understand how all the components work to make the final product. I wanted
to place this note as a preface to give credit to the author and show transparency
for areas that look similar in logic. ]]--


--[[ ANIMATED BUTTON ON CUSTOM UI ]]--


-- Creating our window variable as well as our table variable to hold instanziations
window = nil
Interview = {}

-- Creating multiple variables to hold values for possible optimization in reducing multiple global calls
local random = math.random
local winHeight = nil
local winWidth = nil
local butHeight = nil
local butWidth = nil

-- Creating an event variable that either holds the cycleEvent value or nil, indicating either active animation or inactivity
movementEvent = nil

----
--[[Initialize Method: Method used for initializing our connection to the game as well as functions for when the user is logging in and logging out]]--
----
function init()
  connect(g_game, {onLogin = Interview.create,
  onGameEnd = Interview.destroy })
end

----
--[[Terminate Method: Method used for terminating our connection to the game as well as destroying our window and table once fully terminated]]--
----
function terminate()
  disconnect(g_game, { onLogin = Interview.create,
  onGameEnd = Interview.destroy })
  -- Pass the table through to the destroy method to completely wipe it
  Interview.destroy()

  -- Finally, we want to remove the event from the cycle and reset the value to null to indicate inactivity
  removeEvent(movementEvent)
  movementEvent = nil
end

----
--[[Create Method: Creates our window once the onLogin event has been encountered]]--
----
function Interview.create()
  -- Give our window variable the attributes from our OTUI file
  window = g_ui.displayUI('movingbutton.otui')

  -- Create a button variable that links to our butto in the OTUI file.
  jumpButton = window:getChildById('jumpButton')

  -- Instanziate window dimension variables
  winHeight = window:getHeight()
  winWidth = window:getWidth()
  
  -- Instanziate button dimension variables
  butHeight = jumpButton:getHeight()
  butWidth = jumpButton:getWidth()

  -- Once everything is created, we pass a true condition to the handler to start the animation
  Interview.animationHandler(true)

end

----
--[[Destroy Method: Destroys our window once the user encounters the onGameEnd event.]]--
----
function Interview.destroy()
  -- Error handling statement that ensures the window is active before destroying
  if window then
    window:destroy()
  end

  -- Finally, the last step is to let the animation handler know to halt the cycle event and destroy the table
  Interview.animationHandler(false)
end

----
--[[Reset Method: Once the button has been pushed, we reset the button the right side of the screen at a random height]]--
----
function Interview.reset()
  -- Resetting the x-coordinate location of the button
  jumpButton:setMarginRight(0)

  -- Give a new random y-coordinate location for the button
  -- Note: We multiply the button height by 2.5 to ensure that the button stays on the window (range = (0,175) instead of range = (0,225))
  jumpButton:setMarginTop(random(0, (winHeight - butHeight * 3)))
end

----
--[[Move Left: This function is how the button animates towards the left side of the window.]]--
----
function Interview.moveLeft()

  -- We get the current x-coordinate position of the button
  local butRight = jumpButton:getMarginRight()

  -- If the button's location multiple by it's width (with some padding) is less than the window's width, we know we still have some space to keep moving
  if butRight + butWidth * 1.5 < winWidth then
    jumpButton:setMarginRight(butRight + 10)

    -- However, if this value is greater than our width, we need to reset since we are at the end of the window
  else
    Interview.reset()
  end
  
end

----
--[[Condition Handler: Keeps track of whether the button needs to be animated (where cycleEvent needs to be called) or if it can be deactivated]]--
----
function Interview.animationHandler(condition)
  if condition then
    -- If the condition is true, we first check to see if the movementEvent is ongoing. If so, we need to reset it to nil
    if movementEvent ~= nil then
      removeEvent(movementEvent)
      movementEvent = nil
    end

    -- After resetting the event, we then reset the table with all the events inside as well
    Interview.reset()

    -- Finally, we initialize (or reinitialize) the animation to cycle every 100 ms
    movementEvent = cycleEvent(Interview.moveLeft, 100)
  else
    -- If the condition is false, we need to halt the event entirely, so we will follow the similar steps as above
    if movementEvent ~= nil then
      removeEvent(movementEvent)
      movementEvent = nil
    end
  
    -- After resetting the event, we then reset the table with all the events inside as well
    Interview.reset()
  end
end