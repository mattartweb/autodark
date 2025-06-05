ad.pk = ad.pk or { trigger = {}, alias = {} }

-- Create trigger if not already initialized
if not ad.pk.trigger.chaseRightHere then
    ad.pk.trigger.chaseRightHere = tempRegexTrigger(
        [[^(\S+)(?:\s*)(?:\S*), right here\.$]],
        function()
            if string.lower(string.sub(matches[2], 1, #ad.pk.target)) == string.lower(ad.pk.target) then
                send(f("{ad.pk.action} {ad.pk.target}"))
            end
        end
    )
end
disableTrigger(ad.pk.trigger.chaseRightHere)

-- Create trigger if not already initialized
if not ad.pk.trigger.chaseNearby then
    ad.pk.trigger.chaseNearby = tempRegexTrigger(
        [[^(\S+)(?:\s*)(?:\S*), nearby to the (\S+)\.$]],
        function()
            if string.lower(string.sub(matches[2], 1, #ad.pk.target)) == string.lower(ad.pk.target) then
                send(f("{matches[3]};{ad.pk.action} {ad.pk.target};scan"))
            end
        end
    )
end
disableTrigger(ad.pk.trigger.chaseNearby)

-- Create trigger if not already initialized
if not ad.pk.trigger.chaseNotFar then
    ad.pk.trigger.chaseNotFar = tempRegexTrigger(
        [[^(\S+)(?:\s*)(?:\S*), not far (\S+)\.$]],
        function()
            if string.lower(string.sub(matches[2], 1, #ad.pk.target)) == string.lower(ad.pk.target) then
                send(f("{matches[3]};{matches[3]};{ad.pk.action} {ad.pk.target};scan"))
            end
        end
    )
end
disableTrigger(ad.pk.trigger.chaseNotFar)

-- Create trigger if not already initialized
if not ad.pk.trigger.chaseOffInDistance then
    ad.pk.trigger.chaseOffInDistance = tempRegexTrigger(
        [[^(\S+)(?:\s*)(?:\S*), off in the distance (\S+)\.$]],
        function()
            if string.lower(string.sub(matches[2], 1, #ad.pk.target)) == string.lower(ad.pk.target) then
                send(f("{matches[3]};{matches[3]};{matches[3]};{ad.pk.action} {ad.pk.target};scan"))
            end
        end
    )
end
disableTrigger(ad.pk.trigger.chaseOffInDistance)

-- Create trigger if not already initialized
if not ad.pk.trigger.chaseMoves then
    ad.pk.trigger.chaseMoves = tempRegexTrigger(
        [[^(\S+)(?:\s*)(?:\S*) (?:walks|runs|floats|swims|leaves|flies) (\S+)\.$]],
        function()
            if string.lower(string.sub(matches[2], 1, #ad.pk.target)) == string.lower(ad.pk.target) then
                send("~~")
                if matches[3] == "in" then
                    send(f("{ad.pk.action} {ad.pk.target}"))
                else
                    send(f("{matches[3]};{ad.pk.action} {ad.pk.target};scan"))
                end
            end
        end
    )
end
disableTrigger(ad.pk.trigger.chaseMoves)

-- Alias to toggle leveling functionality
if not ad.pk.alias.commands then
    ad.pk.alias.commands = tempAlias("^pk (.*)$", function()
        ad.pk.processCommands(matches[2])
    end)
end

function ad.pk.processCommands(command)
    if command == "on" then
        ad.pk.enableTriggers()
    elseif command == "off" then
        ad.pk.disableTriggers()
    elseif string.match(command, "^[Tt][Aa][Rr][Gg][Ee][Tt]%s(.*)") then
        local cmd = string.match(command, "^[Tt][Aa][Rr][Gg][Ee][Tt]%s(.*)")
        ad.pk.target = cmd
        hecho(f("{ad.colors.lightBlack}[ AUTODARK ] -#r PK target set to {cmd}#r\n"))
    elseif string.match(command, "^[Aa][Cc][Tt][Ii][Oo][Nn]%s(.*)") then
        local cmd = string.match(command, "^[Aa][Cc][Tt][Ii][Oo][Nn]%s(.*)")
        ad.pk.action = cmd
        hecho(f("{ad.colors.lightBlack}[ AUTODARK ] -#r PK action set to {cmd}#r\n"))
    end
end

-- Enable all triggers
function ad.pk.enableTriggers()
    enableTrigger(ad.pk.trigger.chaseRightHere)
    enableTrigger(ad.pk.trigger.chaseNearby)
    enableTrigger(ad.pk.trigger.chaseNotFar)
    enableTrigger(ad.pk.trigger.chaseOffInDistance)
    enableTrigger(ad.pk.trigger.chaseMoves)
end

-- Disable all triggers
function ad.pk.disableTriggers()
    disableTrigger(ad.pk.trigger.chaseRightHere)
    disableTrigger(ad.pk.trigger.chaseNearby)
    disableTrigger(ad.pk.trigger.chaseNotFar)
    disableTrigger(ad.pk.trigger.chaseOffInDistance)
    disableTrigger(ad.pk.trigger.chaseMoves)
end