ad.seals = ad.seals or { trigger = {}, alias = {}, group = {} }

-- Create trigger if not already initialized
if not ad.seals.trigger.groupStart then
    ad.seals.trigger.groupStart = tempRegexTrigger(
        [[^(?:\S+) group:$]],
        function()
            enableTrigger(ad.seals.trigger.checkGroup)
            disableTrigger(ad.seals.trigger.groupStart)
        end
    )
end
disableTrigger(ad.seals.trigger.groupStart)

-- Trigger to parse group members
if not ad.seals.trigger.checkGroup then
    ad.seals.trigger.checkGroup = tempRegexTrigger(
        [[^\[(?:\d+) (?:\S+)\] (\S+)(?:\s+)(\d+)%(?:\s+)hp(?:\s+)(\d+)%(?:\s+)mana(?:\s+)(\d+)%(?:\s+)mv$]],
        function(matches)
            local name = matches[2]
            ad.seals.group[name] = ad.seals.group[name] or 0
            hecho(f("{ad.colors.lightBlack}[ AUTODARK ] -#r Added group member {name}.\n"))
        end
    )
end
disableTrigger(ad.seals.trigger.checkGroup)

-- Create trigger if not already initialized
if not ad.seals.trigger.groupEnd then
    ad.seals.trigger.groupEnd = tempRegexTrigger(
        [[^$]],
        function()
            disableTrigger(ad.seals.trigger.checkGroup)
            disableTrigger(ad.seals.trigger.groupEnd)
            hecho(f("{ad.colors.lightBlack}[ AUTODARK ] -#r Seals group created.\n"))
        end
    )
end
disableTrigger(ad.seals.trigger.groupEnd)

-- Trigger to catch seal acquisition
if not ad.seals.trigger.getSeal then
    ad.seals.trigger.getSeal = tempRegexTrigger(
        [[^(\S+) ge(?:t|ts) a metal seal with the (?:\S+) stamp.$]],
        function(matches)
            local name = matches[2]
            
            if name == "You" then
	            name = gmcp.login_data.name
	        end
            
            if ad.seals.group[name] ~= nil then
                ad.seals.group[name] = ad.seals.group[name] + 1
                hecho(f("{ad.colors.lightBlack}[ AUTODARK ] - {ad.colors.cyan}{name}#r received a seal. Total seals: {ad.seals.group[name]}.\n"))
                send(f("gtell {name} picked up a seal."))
            end
        end
    )
end
disableTrigger(ad.seals.trigger.getSeal)

-- Create trigger if not already initialized
if not ad.seals.trigger.passSeal then
    ad.seals.trigger.passSeal = tempRegexTrigger(
        [[^(\S+) gives a metal seal with the (?:\S+) stamp to (\S+).$]],
        function(matches)
            local giver = matches[2]
            local getter = matches[3]
            
            if giver == "You" then
	            giver = gmcp.login_data.name
	        end
            
            if getter == "you" then
	            getter = gmcp.login_data.name
	        end
            
            if ad.seals.group[giver] ~= nil and ad.seals.group[getter] ~= nil then
                ad.seals.group[name] = ad.seals.group[name] - 1
                hecho(f("{ad.colors.lightBlack}[ AUTODARK ] - {ad.colors.cyan}{name}#r passed a seal. Total seals: {ad.seals.group[name]}.\n"))
                ad.seals.group[name] = ad.seals.group[name] + 1
                hecho(f("{ad.colors.lightBlack}[ AUTODARK ] - {ad.colors.cyan}{name}#r received a seal. Total seals: {ad.seals.group[name]}.\n"))
                send(f("gtell {giver} passed a seal to {getter}."))
            end
        end
    )
end
disableTrigger(ad.seals.trigger.passSeal)

-- Create trigger if not already initialized
if not ad.seals.trigger.sealsReport then
    ad.seals.trigger.sealsReport = tempRegexTrigger(
        [[^(?:\S+) tells the group 'seals'$]],
        function()
            local result = {}
            for name, count in pairs(ad.seals.group) do
                table.insert(result, string.format("%s: %d", name, count))
            end
            local msg = table.concat(result, ", ")
            
            send(f("{msg}"))
        end
    )
end
disableTrigger(ad.seals.trigger.sealsReport)

-- Alias to toggle leveling functionality
if not ad.seals.alias.commands then
    ad.seals.alias.commands = tempAlias("^seals (.*)$", function()
        ad.seals.processCommands(matches[2])
    end)
end

function ad.seals.processCommands(command)
    if command == "on" then
        ad.seals.enableTriggers()
    elseif command == "off" then
        ad.seals.disableTriggers()
        ad.seals.group = {}
    elseif command == "group" then
        enableTrigger(ad.seals.trigger.groupStart)
        hecho(f("{ad.colors.lightBlack}[ AUTODARK ] -#r Creating seals group.\n"))
        send("gro")
    end
end

-- Enable all triggers
function ad.seals.enableTriggers()
    enableTrigger(ad.seals.trigger.getSeal)
    enableTrigger(ad.seals.trigger.passSeal)
    enableTrigger(ad.seals.trigger.sealsReport)
end

-- Disable all triggers
function ad.seals.disableTriggers()
    disableTrigger(ad.seals.trigger.groupStart)
    disableTrigger(ad.seals.trigger.checkGroup)
    disableTrigger(ad.seals.trigger.groupEnd)
    disableTrigger(ad.seals.trigger.getSeal)
    disableTrigger(ad.seals.trigger.passSeal)
    disableTrigger(ad.seals.trigger.sealsReport)
end