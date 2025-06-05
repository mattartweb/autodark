-- Initialize the "ad.damage" table if not already defined
-- Add a nested table "round" to store per-round damage details
ad.damage = ad.damage or { round = {}, total = {}, alias = {}, trigger = {} }

-- Define damage values corresponding to various levels of damage descriptions
ad.damage.amount = {
    ["misses"] = 0,
    ["scratches"] = 2.5,
    ["grazes"] = 6.5,
    ["hits"] = 10.5,
    ["injures"] = 14.5,
    ["wounds"] = 18.5,
    ["mauls"] = 22.5,
    ["decimates"] = 26.5,
    ["devastates"] = 30.5,
    ["maims"] = 34.5,
    ["MUTILATES"] = 38.5,
    ["DISEMBOWELS"] = 42.5,
    ["DISMEMBERS"] = 46.5,
    ["MASSACRES"] = 50.5,
    ["MANGLES"] = 54.5,
    ["*** DEMOLISHES ***"] = 58.5,
    ["*** DEVASTATES ***"] = 68,
    ["=== OBLITERATES ==="] = 88,
    [">>> ANNIHILATES <<<"] = 113,
    ["<<< ERADICATES >>>"] = 138,
    ["does GHASTLY things to"] = 163,
	["does HORRID things to"] = 188,
	["does DREADFUL things to"] = 213,
    ["does HIDEOUS things to"] = 238,
    ["does INDESCRIBABLE things to"] = 263,
    ["does UNSPEAKABLE things to"] = 300,
}

-- Alias to handle dam commands
if not ad.damage.alias.commands then
    ad.damage.alias.commands = tempAlias("^dam (.*)$", function()
        ad.damage.processCommands(matches[2])
    end)
end

-- Ensure the hit damage trigger is set up only once
if not ad.damage.trigger.hit then
    -- Define a trigger to capture and process damage messages
    ad.damage.trigger.hit = tempRegexTrigger(
        [[^(?:A |An |The |a |an |the )?\s*(Your|.*?'s|[^%s]+)(?:\s(.*?))?\s(misses|scratches|grazes|hits|injures|wounds|mauls|decimates|devastates|maims|MUTILATES|DISEMBOWELS|DISMEMBERS|MASSACRES|MANGLES|\*\*\* DEMOLISHES \*\*\*|\*\*\* DEVASTATES \*\*\*|=== OBLITERATES ===|\>\>\> ANNIHILATES \<\<\<|\<\<\< ERADICATES \>\>\>|does DREADFUL things to|does GHASTLY things to|does HIDEOUS things to|does HORRID things to|does INDESCRIBABLE things to|does UNSPEAKABLE things to)\s(?:A |An |The |a |an |the )?(.*?)(?:\.|!)$(?<!hits the ground \.\.\. DEAD\.$)]],
        function()
		    if ad.data.damage then
                -- Display damage value using cyan color
                hecho(f("{ad.colors.cyan}({ad.damage.amount[matches[4]]})"))
                -- Add damage details for the current hit
                ad.damage.addDamage(matches[2], matches[3], matches[4], matches[5])
			else
			    disableTrigger("ad.damage.trigger.hit")
			end
        end
    )
end

-- Ensure the round damage trigger is set up only once
if not ad.damage.trigger.round then
	-- Define a trigger to print and reset round damage details when a status message is detected
    ad.damage.trigger.round = tempRegexTrigger(
        [[^(?:A|An|The|a|an|the) (.*) (?:is in excellent condition.|has a few scratches.|has some small wounds and bruises.|has quite a few wounds.|has some big nasty wounds and scratches.|looks pretty hurt.|is in awful condition.|is DEAD!!)(?:\s*)$]],
        function()
	        if ad.data.damage then
	            ad.damage.printRound()
		    else
		        disableTrigger("ad.damage.trigger.round")
		    end
	    end
    )
end

function ad.damage.processCommands(command)
    if command == "on" then
        ad.data.damage = true
	    ad.save()
        enableTrigger("ad.damage.trigger.hit")
		enableTrigger("ad.damage.trigger.round")
        hecho(f("{ad.colors.lightBlack}[ AUTODARK ] -#r Damage reporting is now set to {ad.colors.yellow}{ad.data.damage}#r.\n"))
    elseif command == "off" then
        ad.data.damage = false
	    ad.save()
        ad.damage.total = {}
		ad.damage.round = {}
		disableTrigger("ad.damage.trigger.hit")
		disableTrigger("ad.damage.trigger.round")
        hecho(f("{ad.colors.lightBlack}[ AUTODARK ] -#r Damage reporting is now set to {ad.colors.yellow}{ad.data.damage}#r.\n"))
    elseif command == "report" then
        ad.damage.report()
    elseif command == "reset" then
        ad.damage.total = {}
        hecho(f("{ad.colors.lightBlack}[ AUTODARK ] -#r Damage totals have been reset.\n"))
    else
       send(f("dam {command}"))
    end
end

-- Function to add damage to the current round's damage details
-- name is the name of the entity doing damage
-- noun is the type of damage
-- dam is the damage description
function ad.damage.addDamage(name, noun, dam, target)
    if name == "Your" then
	    name = "You"
	end
	
	if target == "him" or target == "her"
	    then target = name
	end
	
	if string.ends(name, "'s") then
	    name = string.cut(name, string.len(name) - 2)
	end

    -- Ensure all nested tables exist for the 'round' tracking
    ad.damage.round[name] = ad.damage.round[name] or {}
    ad.damage.round[name][target] = ad.damage.round[name][target] or {}
    ad.damage.round[name][target][noun] = ad.damage.round[name][target][noun] or { amount = 0 }
    
    -- Ensure all nested tables exist for the 'total' tracking
    ad.damage.total[name] = ad.damage.total[name] or {}
    ad.damage.total[name][target] = ad.damage.total[name][target] or {}
    ad.damage.total[name][target][noun] = ad.damage.total[name][target][noun] or { amount = 0 }

    -- Add the damage to the 'round' tracking
    ad.damage.round[name][target][noun].amount = ad.damage.round[name][target][noun].amount + ad.damage.amount[dam]

    -- Add the damage to the 'total' tracking
    ad.damage.total[name][target][noun].amount = ad.damage.total[name][target][noun].amount + ad.damage.amount[dam]
end

-- Function to print damage details for the current round and reset the data
function ad.damage.printRound()
	for name, targets in pairs(ad.damage.round) do
        for target, nouns in pairs(targets) do
            for noun, data in pairs(nouns) do
                local amount = data.amount or 0
                hecho(f("{ad.colors.cyan}[{name},{amount},{noun},{target}]#r"))
            end
        end
    end

    -- Reset the round table to empty
    ad.damage.round = {}
end

function ad.damage.report()
    local border = f("{ad.colors.lightBlack}+") .. string.rep("-", 98) .. "+#r"
	local title = f("{ad.colors.lightBlack}|#r" .. string.rep(" ", 38) .. "AUTODARK DAMAGE REPORT"  .. string.rep(" ", 38) .. "{ad.colors.lightBlack}|#r")
    local header = f("{ad.colors.lightBlack}|#r Name" .. string.rep(" ", 27) .. "Target"  .. string.rep(" ", 25) .. "Noun"  .. string.rep(" ", 20) .. "Amount" .. string.rep(" ", 5) .. "{ad.colors.lightBlack}|#r")
    local report = { border, title, border, header, border }

    for name, targets in pairs(ad.damage.total) do
	    local overall = 0
		
        for target, nouns in pairs(targets) do
            for noun, data in pairs(nouns) do
                local amount = data.amount or 0
				name = string.format("%-30s", name)
				target = string.format("%-30s", target)
				noun = string.format("%-23s", noun)
				amount = string.format("%-10s", amount)
				overall = overall + amount
                local row = f("{ad.colors.lightBlack}|{ad.colors.cyan} {name} {target} {noun} {amount} {ad.colors.lightBlack}|#r")
                table.insert(report, row)
            end
        end
		
		name = string.format("%-30s", name)
		overall = string.format("%-10s", overall)
		local row = f("{ad.colors.lightBlack}|#r {name}" .. string.rep(" ", 32) .. "OVERALL DAMAGE:         {overall} {ad.colors.lightBlack}|#r")
		table.insert(report, row)
		table.insert(report, border)
    end

    if #report == 5 then
        -- No damage recorded
        hecho(f("{ad.colors.lightBlack}[ AUTODARK ] - #rNo damage recorded.\n"))
    else
        -- Print the report
        hecho(table.concat(report, "\n") .. "\n")
    end
end
