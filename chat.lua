-- Initialize the "ad.chat" table if it doesn't exist
ad.chat = ad.chat or { trigger = {} }

createBuffer("chatBuffer")
setWindowWrap("chatBuffer", 1000)

if exists("ad.chat.trigger.chatTrigger", "trigger") == 0 then
    tempComplexRegexTrigger("ad.chat.trigger.chatTrigger", [[^\a?(?:[\[\(][\w\s@]+[\]\)]\s*)*[\w\'\s]+?[\[\(]?()[\]\)]?[\w\s\(\)\':]*? \'(.*)\'$]], [[]], 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, nil)
    tempComplexRegexTrigger("ad.chat.trigger.chatTrigger", [[^\(([tT]haxanos)\)[\w\s\(\):]*? \'(.*)\'$]], [[]], 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, nil)
    tempComplexRegexTrigger("ad.chat.trigger.chatTrigger", [[^\(([sS]halonesti)\)[\w\s\(\):]*? \'(.*)\'$]], [[]], 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, nil)
    tempComplexRegexTrigger("ad.chat.trigger.chatTrigger", [[^([kK]ingdom[s]?)[\w\s\(\):]*? \'(.*)\'$]], [[]], 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, nil)
    tempComplexRegexTrigger("ad.chat.trigger.chatTrigger", [[^\(([cC]onclave)\)[\w\s\(\):]*? \'(.*)\'$]], [[]], 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, nil)
    tempComplexRegexTrigger("ad.chat.trigger.chatTrigger", [[^You raise a level!!  You gain \d+ hit points, \d+ mana, \d+ move, and \d+ practices.$]], [[]], 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, nil)
    tempComplexRegexTrigger("ad.chat.trigger.chatTrigger", [[^\[ (.*) \] (.*) got (offed|toasted|killed|ROCKED|RAMPAGED|\*\*\*DESTROYED\*\*\*) by (.*?)(\s?)\[ (.*) \]\s$]], [[]], 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, nil)
    tempComplexRegexTrigger("ad.chat.trigger.chatTrigger", [[^\[(BROADCAST) [\w\s\']+\].*$]], [[ad.chat.chatUpdate()]], 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, nil)
end

-- Function to process and update chat messages
function ad.chat.chatUpdate()
    -- Get the content of the current line
    local currentLine = getCurrentLine()

    -- List of patterns to skip
    local skipPatterns = {
        "^Name(s):",
        "^The Bishop of New Thalos says",
        "^A young blue gnome guard says",
        "^An old green gnome guard says",
        "^A gnome philosopher's assistant says",
        "This creature is upon the cycle of training",
        "A gnome says 'Remembertoduck!'",
        "Bloodbath System:",
        "Portmaster shouts '",
    }
    
    -- List of patterns to prowl
    local prowlPatterns = {
        "tells you '",
        "tells the group '",
        "Kingdom: '",
        "clans '",
    }

    -- Check if the line matches any of the skip patterns
    for _, pattern in ipairs(skipPatterns) do
        if currentLine:find(pattern) then
            return -- Skip processing this line
        end
    end
    
    -- Check if the line matches any of the prowl patterns
    for _, pattern in ipairs(prowlPatterns) do
        if currentLine:find(pattern) then
            ad.utils.prowl(currentLine)
        end
    end

    -- Process the line if it does not match the conditions
    selectCurrentLine()        -- Select the current line
    copy()                     -- Copy the selected line to clipboard
    appendBuffer("chat")       -- Append the line to the 'chat' buffer
    appendBuffer("chatBuffer") -- Append the line to a secondary 'chatBuffer' buffer
end