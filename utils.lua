ad.utils = ad.utils or { trigger = {}, alias = {} }

-- This is the API Key for prowl, replace it with your own
ad.utils.prowlAPIKey = ""

-- Alias for sleep
if not ad.utils.alias.sleep then
    ad.utils.alias.sleep = tempAlias("^sleep(?:\s*)(.*)$", function() if not gmcp.char_data.is_flying then send(f("{matches[1]}")) else send(f("land;{matches[1]}")) end end)
end

function ad.utils.prowl(text)
    if gmcp and gmcp.login_data then
        local character = gmcp.login_data.name
        postHTTP("", f("https://api.prowlapp.com/publicapi/add?apikey={ad.utils.prowlAPIKey}&application=Mudlet&event=[ {character} ]  {text}"))
    else
        postHTTP("", f("https://api.prowlapp.com/publicapi/add?apikey={ad.utils.prowlAPIKey}&application=Mudlet&event=[ DSL ]  {text}"))
    end
end

-- Function to periodically send random commands to avoid disconnection
function ad.utils.void() 
    -- List of commands to randomly choose from
    local commands = {"sc", "imp", "inv", "sc", "look", "where", "sc", "sk", "sp;c", "eq", "look"}
    
    -- Randomly select a command from the list
    local which = math.random(#commands) 

    -- If the timer already exists, kill it to reset the interval
    if voidTimer then 
        killTimer(voidTimer) 
    end
    
    -- Create a new timer with a random delay to send the selected command
    voidTimer = tempTimer(math.random(291, 458), function() send(commands[which]) end)
end 

-- Register an event handler for 'sysDataSendRequest' to invoke the void function
registerAnonymousEventHandler("sysDataSendRequest", "ad.utils.void")