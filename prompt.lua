-- Initialize the "ad.prompt" table with default values if not already set
-- Adds a nested table "info" for storing prompt-related data
-- Adds a nested table "alias" and "trigger" for temp items
-- Includes flags "promptVis" and "tickVis" for controlling visibility
ad.prompt = ad.prompt or { info = {}, alias = {}, trigger = {}, promptVis = true, tickVis = true }

-- Define the regex pattern for parsing the prompt
local promptPattern = [[^(\[Quiet\]\s*|)<([^\|]+)\|([\d\?\-]+)\|([\d\?]+)\|([\d\-]+)\|(\d+)\|([\d\-]+)\|(\d+)\|([^\|]*)\|(\d+)\|(\d+)\|(\d+)\|(\d+)\|(\d+)\|(\d+)\|(\d*)\|([\w ]+)\|(\w+)\|([^\|]+)\|([^\|]+)\|(\d+)(?:\|(\d*)\|(\d*))?\|([^\|]*)(?:\|(\d*)\|(\d*))?\|(.*)>]]

-- Alias to handle prompt commands
if not ad.prompt.alias.promptCommands then
    ad.prompt.alias.promptCommands = tempAlias("^prompt (.*)$", function()
        ad.prompt.processPromptAlias(matches[2])
    end)
end

-- Alias to handle tick commands
if not ad.prompt.alias.tickCommands then
    ad.prompt.alias.tickCommands = tempAlias("^tick (.*)$", function()
        ad.prompt.processTickAlias(matches[2])
    end)
end

-- Ensure the shielded regex trigger for parsing the prompt is set up only once
if exists("ad.prompt.trigger.promptTrigger", "trigger") == 0 then
    -- Trigger for detecting the beginning of the prompt
    tempComplexRegexTrigger("ad.prompt.trigger.promptTrigger", [[^(\[Quiet\]\s*|)<]], [[]], 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, nil)
    -- Main trigger for parsing and refreshing the prompt values
    tempComplexRegexTrigger("ad.prompt.trigger.promptTrigger", promptPattern, [[ad.prompt.promptRefresh(multimatches[2])]], 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, nil)
end

-- Refresh prompt data and update the display
-- "promptValues" is a table containing parsed values from the regex trigger
function ad.prompt.promptRefresh(promptValues)
    table.remove(promptValues, 1)  -- Remove the "quiet" flag for simpler processing
    local prevTime = ad.prompt.info.time  -- Keep track of the previous game time for tick detection
    
    -- Update the "info" table with new values from the parsed prompt
    ad.prompt.info = {
        quiet = promptValues[1],               -- Quiet mode indicator
        time = promptValues[2],                -- Current game time
        hp = promptValues[3],                  -- Health points
        maxHP = promptValues[4],               -- Maximum health points
        mana = promptValues[5],                -- Mana points
        maxMana = promptValues[6],             -- Maximum mana points
        move = promptValues[7],                -- Movement points
        maxMove = promptValues[8],             -- Maximum movement points
        exits = promptValues[9] or "",         -- Available exits
        xp = promptValues[10] or "",           -- Experience points
        tnl = promptValues[11] or "",          -- To next level
        gold = promptValues[12] or "",         -- Gold amount
        silver = promptValues[13] or "",       -- Silver amount
        qp = promptValues[14] or "",           -- Quest points
        wimpy = promptValues[15] or "",        -- Wimpy threshold
        meritxp = promptValues[16] or "",      -- Merit experience points
        stance = promptValues[17] or "",       -- Combat stance
        alignment = promptValues[18] or "",    -- Player alignment
        language = promptValues[19] or "",     -- Active language
        dayTime = promptValues[20] or "",      -- Time of day
        craftskill = promptValues[21] or "",   -- Craft skill level
        bloodPercent = promptValues[22] or "", -- Blood percentage
        bloodPoints = promptValues[23] or "",  -- Blood points
        flying = promptValues[24] or "",       -- Flying status
        weight = promptValues[25] or "",       -- Carried weight
        maxWeight = promptValues[26] or "",    -- Maximum carry weight
        room = promptValues[27] or "",         -- Current room name
        name = name,                           -- Player name
    }
    
    -- Calculate and update percentages for health, mana, and moves
    ad.prompt.info.health_percent = tonumber(ad.prompt.info.hp) and math.floor(100 * ad.prompt.info.hp / ad.prompt.info.maxHP) or "???"
    ad.prompt.info.mana_percent = math.floor(100 * ad.prompt.info.mana / ad.prompt.info.maxMana)
    ad.prompt.info.moves_percent = math.floor(100 * ad.prompt.info.move / ad.prompt.info.maxMove)
    
    -- Handle quiet mode display
    if ad.prompt.info.quiet == "[Quiet] " then
        ad.prompt.info.quiet = f("#r[{ad.colors.cyan}Quiet#r] ")
    end

    -- Format health, mana, and moves based on their respective percentages
    local formatStat = function(value, percent)
        if percent > 75 then return f("{ad.colors.fg}" .. tostring(value) .. "#r")
        elseif percent > 50 then return f("{ad.colors.lightYellow}" .. tostring(value) .. "#r")
        else return f("{ad.colors.lightRed}" .. tostring(value) .. "#r")
        end
    end
    
    ad.prompt.info.hp = formatStat(ad.prompt.info.hp, ad.prompt.info.health_percent)
    ad.prompt.info.mana = formatStat(ad.prompt.info.mana, ad.prompt.info.mana_percent)
    ad.prompt.info.move = formatStat(ad.prompt.info.move, ad.prompt.info.moves_percent)
	
    -- Format nighttime values
    if string.find("Sun Set|Dusk|Night Time", ad.prompt.info.dayTime) then
        ad.prompt.info.dayTime = f("{ad.colors.red},FF000000{ad.prompt.info.dayTime}#r")
    end
    
    -- Update the new prompt format
    replacePrompt = f("{ad.prompt.info.quiet}#r\<{ad.prompt.info.hp}/{ad.prompt.info.maxHP}hp {ad.prompt.info.mana}/{ad.prompt.info.maxMana}m {ad.prompt.info.move}/{ad.prompt.info.maxMove}mv {ad.prompt.info.dayTime} {ad.prompt.info.time} {ad.prompt.info.room} {ad.prompt.info.exits}>")
	
	-- Replace the existing prompt with the new one
    selectString(line, 1)
    if ad.prompt.promptVis then
        hreplace(replacePrompt)
    else
        deleteLine()
        moveCursor(0, getLineNumber() + 1)  -- Move to the next line before deleting again
        deleteLine()
    end

    -- Raise events
    raiseEvent("onPrompt")
    if prevTime ~= ad.prompt.info.time then
        raiseEvent("onTick")
    end
end

-- Function to set a timer that triggers 5 seconds before the next tick
function ad.prompt.setTickTimer()
    if ad.prompt.tickVis then
        if tempTickTimer then
            killTimer(tempTickTimer)  -- Cancel the existing timer if it exists
        end
        -- Set a new timer to display a tick warning message
        tempTickTimer = tempTimer(35, function() 
            hecho(f("{ad.colors.lightRed}Tick in 5 seconds.\n"))
        end)
    end
end

function ad.prompt.processPromptAlias(command)
    if command == "fix" then
        send("prompt <%t|%h|%H|%m|%M|%v|%V|%e|%x|%X|%g|%s|%q|%y|%L|%S|%a|%l|%d|%C|%b|%p|%f|%o|%O|%r>%c", false)
    elseif command == "on" then
        ad.prompt.promptVis = true
        hecho(f("{ad.colors.lightBlack}[ AUTODARK ] -#r Prompt visibility is now set to {ad.colors.yellow}{ad.prompt.promptVis}#r.\n"))
    elseif command == "off" then
        ad.prompt.promptVis = false
        hecho(f("{ad.colors.lightBlack}[ AUTODARK ] -#r Prompt visibility is now set to {ad.colors.yellow}{ad.prompt.promptVis}#r.\n"))
    else
       send(f("prompt {command}"))
    end
end

-- Toggles the visibility of the tick warning and manages the timer
function ad.prompt.processTickAlias(command)
    if command == "on" then
        ad.prompt.tickVis = true
        hecho(f("{ad.colors.lightBlack}[ AUTODARK ] -#r Tick visibility is now set to {ad.colors.yellow}{ad.prompt.tickVis}#r.\n"))
    elseif command == "off" then
        ad.prompt.tickVis = false
        hecho(f("{ad.colors.lightBlack}[ AUTODARK ] -#r Tick visibility is now set to {ad.colors.yellow}{ad.prompt.tickVis}#r.\n"))
    else
       send(f("tick {command}"))
    end
    
    if not ad.prompt.tickVis and tempTickTimer then
        killTimer(tempTickTimer)
    end
end

-- Register an event handler to set a tick timer on the "onTick" event
registerAnonymousEventHandler("onTick", "ad.prompt.setTickTimer")
