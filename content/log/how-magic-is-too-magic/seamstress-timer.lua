local action = function() print("hello!") end
local delta = 0.5
local stage_end = -1 -- this is the default
local stage = 1 -- this is the default
local running = false -- this is NOT the default
local t = seamstress.Timer(action, delta, stage_end, stage, running)
t.running = true -- this line of code starts the timer!
-- now the timer will print "hello" every 0.5 seconds
-- you can do fun things like swap out t.action
-- or t.delta (from within the callback for best results)
-- or t.stage_end or t.stage and the timer will respond
