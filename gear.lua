ad.gear = ad.gear or { trigger = {}, alias = {} }

ad.gear.slots = {
    light = "used as light",
    ring1 = "worn on finger 1",
    ring2 = "worn on finger 2",
    neck1 = "worn around neck 1",
    neck2 = "worn around neck 2",
    torso = "worn on torso",
    head = "worn on head",
    legs = "worn on legs",
    feet = "worn on feet",
    hands = "worn on hands",
    arms = "worn on arms",
    shield = "worn as shield",
    body = "worn about body",
    waist = "worn about waist",
    wrist1 = "worn around wrist 1",
    wrist2 = "worn around wrist 2",
    wield = "wielded",
    held = "held",
    float = "floating nearby",
    second = "secondary weapon",
    sheath = "sheathed",
    quiver = "worn as quiver",
}

-- Ordered list of keys for traversal
ad.gear.orderedKeys = {
    "light", "ring1", "ring2", "neck1", "neck2", "torso", "head", "legs", "feet",
    "hands", "arms", "shield", "body", "waist", "wrist1", "wrist2", "wield",
    "held", "float", "second", "sheath", "quiver"
}

-- Create trigger if not already initialized
if not ad.gear.trigger.wear then
    ad.gear.trigger.wear = tempRegexTrigger(
        [[^You(\s)(light|wear|wield|release|sheath|hold|put)(\s)]],
        function()
            disableTrigger(ad.gear.trigger.wear)
            ad.gear.nextItem()
        end
    )
end
disableTrigger(ad.gear.trigger.wear)

-- Create trigger if not already initialized
if not ad.gear.trigger.remove then
    ad.gear.trigger.remove = tempRegexTrigger(
        [[^You (stop using|unsheath) ]],
        function()
            disableTrigger(ad.gear.trigger.remove)
            enableTrigger("ad.gear.trigger.success")
            enableTrigger("ad.gear.trigger.fail")
            enableTrigger("ad.gear.trigger.wand")
            enableTrigger(ad.gear.trigger.dontKnow)
            ad.gear.currItem = ad.gear.currItem:gsub("^[0-9]+%.", "")
            send(f("{ad.gear.command} {ad.gear.currItem}"))
        end
    )
end
disableTrigger(ad.gear.trigger.remove)

-- Ensure the trigger is set up only once
if exists("ad.gear.trigger.success", "trigger") == 0 then
    tempComplexRegexTrigger(
        "ad.gear.trigger.success",
        [[^(.*) glows with a holy aura\.$]],
        [[]],
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, nil
    )

    tempComplexRegexTrigger(
        "ad.gear.trigger.success",
        [[^.* is too powerful for you to overcome\.$]],
        [[]],
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, nil
    )

    tempComplexRegexTrigger(
        "ad.gear.trigger.success",
        [[^You protect .* from fire\.$]],
        [[]],
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, nil
    )

    tempComplexRegexTrigger(
        "ad.gear.trigger.success",
        [[^.* is already protected from burning\.$]],
        [[]],
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, nil
    )

    tempComplexRegexTrigger(
        "ad.gear.trigger.success",
        [[^.* is already blessed\.$]],
        [[]],
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, nil
    )

    tempComplexRegexTrigger(
        "ad.gear.trigger.success",
        [[^You cover .* with mud\.$]],
        [[]],
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, nil
    )

    tempComplexRegexTrigger(
        "ad.gear.trigger.success",
        [[^.* is already protected\.$]],
        [[]],
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, nil
    )

    tempComplexRegexTrigger(
        "ad.gear.trigger.success",
        [[^You are not carrying that\.$]],
        [[]],
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, nil
    )

    tempComplexRegexTrigger(
        "ad.gear.trigger.success",
        [[^You don't see that here\.$]],
        [[
            local character = gmcp.login_data.name

            -- Disable triggers
            disableTrigger("ad.gear.trigger.success")
            disableTrigger("ad.gear.trigger.fail")
            disableTrigger(ad.gear.trigger.dontKnow)
            
            -- Enable the "wear" trigger
            enableTrigger(ad.gear.trigger.wear)
            
            -- Simplify conditions
            if ad.data[character].gear["held"] and ad.gear.currItem == ad.data[character].gear["held"].name and ad.gear.command == "zap" then
                disableTrigger(ad.gear.trigger.wear)
                ad.gear.nextItem()
            else
                if ad.data[character].gear["sheathed"] and ad.gear.currItem == ad.data[character].gear["sheathed"].name then
                    send(f("sheath {ad.gear.currItem}"))
                elseif ad.data[character].gear["secondary weapon"] and ad.gear.currItem == ad.data[character].gear["secondary weapon"].name then
                    send(f("second {ad.gear.currItem}"))
                else
                    send(f("wear {ad.gear.currItem}"))
                end
            end
        ]],
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, nil
    )
end
disableTrigger("ad.gear.trigger.success")

-- Ensure the trigger is set up only once
if exists("ad.gear.trigger.fail", "trigger") == 0 then
    tempComplexRegexTrigger(
        "ad.gear.trigger.fail",
        [[^You lost your concentration\.$]],
        [[]],
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, nil
    )
    
    tempComplexRegexTrigger(
        "ad.gear.trigger.fail",
        [[^Your efforts with .* produce only smoke and sparks\.$]],
        [[]],
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, nil
    )
    
    tempComplexRegexTrigger(
        "ad.gear.trigger.fail",
        [[The mud is too wet and runs off\.$]],
        [[
            send(f("{ad.gear.command} {ad.gear.currItem}"))
        ]],
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, nil
    )
end
disableTrigger("ad.gear.trigger.fail")

-- Ensure the trigger is set up only once
if exists("ad.gear.trigger.wand", "trigger") == 0 then
    tempComplexRegexTrigger(
        "ad.gear.trigger.wand",
        [[^Your (.*) explodes into fragments\.$]],
        [[]],
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, nil
    )
    
    tempComplexRegexTrigger(
        "ad.gear.trigger.wand",
        [[^You hold nothing in your hand\.$]],
        [[]],
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, nil
    )
    
    tempComplexRegexTrigger(
        "ad.gear.trigger.wand",
        [[^You can zap only with a wand\.$]],
        [[
            send("wear 'elm wand'")
        ]],
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, nil
    )
end
disableTrigger("ad.gear.trigger.wand")

if not ad.gear.trigger.dontKnow then
    ad.gear.trigger.dontKnow = tempBeginOfLineTrigger(
        "You don't know any spells of that name.",
        function()
            hecho(f("{ad.colors.lightBlack}[ AUTODARK ] -#r This won't work.\n"))
        end
    )
end
disableTrigger(ad.gear.trigger.dontKnow)

if not ad.gear.trigger.noWands then
    ad.gear.trigger.noWands = tempBeginOfLineTrigger(
        "You do not have that item.",
        function()
            hecho(f("{ad.colors.lightBlack}[ AUTODARK ] -#r Must be out of wands. Stopping.\n"))
            if ad.data[character].gear["held"] and ad.gear.currItem == ad.data[character].gear["held"].name and ad.gear.command == "zap" then
                send(f("wear {ad.gear.currItem}"))
            else
                if ad.data[character].gear["sheathed"] and ad.gear.currItem == ad.data[character].gear["sheathed"].name then
                    send(f("sheath {ad.gear.currItem}"))
                elseif ad.data[character].gear["secondary weapon"] and ad.gear.currItem == ad.data[character].gear["secondary weapon"].name then
                    send(f("second {ad.gear.currItem}"))
                else
                    send(f("wear {ad.gear.currItem}"))
                end
            end
            ad.gear.currItem = nil
            ad.gear.equipped = {}
            ad.gear.command = nil
            disableTrigger(ad.gear.trigger.remove)
            disableTrigger(ad.gear.trigger.wear)
            disableTrigger("ad.gear.trigger.success")
            disableTrigger("ad.gear.trigger.fail")
            disableTrigger("ad.gear.trigger.wand")
            disableTrigger(ad.gear.trigger.dontKnow)
            disableTrigger(ad.gear.trigger.noWands)
        end
    )
end
disableTrigger(ad.gear.trigger.noWands)

-- Create trigger if not already initialized
if not ad.gear.trigger.collect then
    ad.gear.trigger.collect = tempRegexTrigger(
        "^<([a-z\\s]+)>\\s*(\\(.*?\\)\\s*)?(.*)$",
        function()
            local slot = matches[2]:trim()
            local mods = matches[3] and matches[3]:trim() or ""  -- If mods is nil, set it to an empty string
            local item = matches[4]:trim()
            ad.gear.processGear(slot, item, mods)
        end
    )
end
disableTrigger(ad.gear.trigger.collect)

-- Create trigger if not already initialized
if not ad.gear.trigger.stop then
    ad.gear.trigger.stop = tempRegexTrigger(
        "^$",
        function()
            disableTrigger(ad.gear.trigger.collect)
            disableTrigger(ad.gear.trigger.stop)
        end
    )
end
disableTrigger(ad.gear.trigger.stop)

-- Ensure the trigger is set up only once
if exists("ad.gear.trigger.weaponDisarm", "trigger") == 0 then
    tempComplexRegexTrigger(
        "ad.gear.trigger.weaponDisarm",
        [[^.+ DISARMS you and sends your weapon flying!]],
        [[]],
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, nil
    )
    
    tempComplexRegexTrigger(
        "ad.gear.trigger.weaponDisarm",
        [[^.+ grabs your weapon, and sends it flying!]],
        [[]],
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, nil
    )
    
    tempComplexRegexTrigger(
        "ad.gear.trigger.weaponDisarm",
        [[^.+ controls your weapon, and sends it flying!]],
        [[
            ad.gear.weaponDisarm()
        ]],
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, nil
    )
end

-- Ensure the trigger is set up only once
if exists("ad.gear.trigger.shieldDisarm", "trigger") == 0 then
    tempComplexRegexTrigger(
        "ad.gear.trigger.shieldDisarm",
        [[^.+ knocked loose from their hands by .*]],
        [[]],
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, nil
    )
    
    tempComplexRegexTrigger(
        "ad.gear.trigger.shieldDisarm",
        [[^.+ sends your shield flying with a powerful kick!]],
        [[]],
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, nil
    )
    
    tempComplexRegexTrigger(
        "ad.gear.trigger.shieldDisarm",
        [[^.+ swings \w+ weapon viciously at your shield and sends it flying!]],
        [[
            ad.gear.shieldDisarm()
        ]],
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, nil
    )
end

if not ad.gear.alias.eq then
    ad.gear.alias.eq = tempAlias("^eq$", function()
        enableTrigger(ad.gear.trigger.collect)
        enableTrigger(ad.gear.trigger.stop)
        send("eq", false)
    end)
end

if not ad.gear.alias.gear then
    ad.gear.alias.gear = tempAlias([[^gear (\S*)(?:\s*)?(\S*)?$]], function()
        ad.gear.processCommand(matches[2], matches[3])
    end)
end

if not ad.gear.alias.wield then
    ad.gear.alias.wield = tempAlias("^wield (.*)$", function()
        send(f("wield {matches[2]}"), false)
        ad.gear.processCommand("wield", matches[2])
    end)
end

if not ad.gear.alias.second then
    ad.gear.alias.second = tempAlias("^second (.*)$", function()
        send(f("second {matches[2]}"), false)
        ad.gear.processCommand("second", matches[2])
    end)
end

if not ad.gear.alias.sheath then
    ad.gear.alias.sheath = tempAlias("^sheath (.*)$", function()
        send(f("sheath {matches[2]}"), false)
        ad.gear.processCommand("sheath", matches[2])
    end)
end

function ad.gear.processGear(slot, item, mods)
    -- Ensure all tables are initialized
    local character = gmcp.login_data.name
    ad.data[character] = ad.data[character] or {}
    ad.data[character].gear = ad.data[character].gear or {}
    ad.gear.slotCounters = ad.gear.slotCounters or {}
    local updated = false

    -- Handle repeated slots
    if slot == "worn on finger" or slot == "worn around neck" or slot == "worn around wrist" then
        local baseSlot = slot:match("^[^%s]+") -- Base slot name (e.g., "worn on finger")
        ad.gear.slotCounters[baseSlot] = ad.gear.slotCounters[baseSlot] or 1
        slot = slot .. " " .. ad.gear.slotCounters[baseSlot]
        ad.gear.slotCounters[baseSlot] = (ad.gear.slotCounters[baseSlot] % 2) + 1
    end

    -- Ensure slot entry exists
    ad.data[character].gear[slot] = ad.data[character].gear[slot] or { name = nil, manual = false }

    -- Only update automatically set items
    if not ad.data[character].gear[slot].manual then
        if ad.data[character].gear[slot].name ~= item:match("[^%s]+$") then
            ad.data[character].gear[slot].name = item:match("[^%s]+$") -- Last word of the item
            ad.data[character].gear[slot].manual = false
            updated = true
            hecho(f("{ad.colors.cyan} - Auto set to \"{ad.data[character].gear[slot].name}\"#r"))
        end
    end

    ad.save()
end

-- Function to manually set a gear slot
function ad.gear.processCommand(slot, item)
    -- Ensure all tables are initialized
    local character = gmcp.login_data.name
    ad.data[character] = ad.data[character] or {}
    ad.data[character].gear = ad.data[character].gear or {}
    
    if slot == "report" then
        ad.gear.report()
        return
    end
    
    local longSlot = ad.gear.slots[slot]

    -- Validate slot
    if not longSlot and slot ~= "bless" and slot ~= "fireproof" then
        hecho(f("{ad.colors.lightBlack}[ AUTODARK ] -#r Not a valid slot name.\n"))
        return
    end

    -- Handle reset case
    if item == "reset" then
        if longSlot then
            ad.data[character].gear[longSlot] = { name = "", manual = false }
            hecho(f("{ad.colors.lightBlack}[ AUTODARK ] -#r <{longSlot}> reset.\n"))
            ad.save()
        else
            hecho(f("{ad.colors.lightBlack}[ AUTODARK ] -#r Cannot reset slot \"{slot}\".\n"))
        end
        return
    end

    -- Handle special slot: bless
    if slot == "bless" then
        if item == "cast" or item == "wand" then
            ad.data[character].bless = item
            hecho(f("{ad.colors.lightBlack}[ AUTODARK ] -#r Blessing set to {item}.\n"))
            ad.save()
        elseif item == "" then
            ad.gear.prep("bless")
        else
            hecho(f("{ad.colors.lightBlack}[ AUTODARK ] -#r Not a valid bless command. Use 'cast' or 'wand'.\n"))
        end
        return
    end
    
    -- Handle special slot: fireproof
    if slot == "fireproof" then
        if item == "cast" or item == "mud" then
            ad.data[character].fireproof = item
            hecho(f("{ad.colors.lightBlack}[ AUTODARK ] -#r Fireproof set to {item}.\n"))
            ad.save()
        elseif item == "" then
            ad.gear.prep("fireproof")
        else
            hecho(f("{ad.colors.lightBlack}[ AUTODARK ] -#r Not a valid fireproof command. Use 'cast' or 'mud'.\n"))
        end
        return
    end

    -- Handle regular gear slots
    if longSlot then
        ad.data[character].gear[longSlot] = { name = item, manual = true }
        hecho(f("{ad.colors.lightBlack}[ AUTODARK ] -#r <{longSlot}> manually set to \"{item}\".\n"))
        ad.save()
    else
        hecho(f("{ad.colors.lightBlack}[ AUTODARK ] -#r Slot \"{slot}\" not handled.\n"))
    end
end

function ad.gear.prep(command)
    -- Ensure all tables are initialized
    local character = gmcp.login_data.name
    ad.data[character] = ad.data[character] or {}
    ad.data[character].gear = ad.data[character].gear or {}
    ad.gear.equipped = {}
    
    if command == "bless" then
        if ad.data[character].bless == "wand" then
            ad.gear.command = "zap"
            send("wear 'elm wand'")
        else
            ad.gear.command = "c 'bless'"
        end
    elseif command == "fireproof" then
        if ad.data[character].fireproof == "mud" then
            ad.gear.command = "c 'mudcoat'"
        else
            ad.gear.command = "c 'fireproof'"
        end
    end

    for _, key in ipairs(ad.gear.orderedKeys) do
        local longSlot = ad.gear.slots[key]
        local otherSlot = ""
        local gearEntry = ad.data[character].gear[longSlot]
        local otherEntry = ""
        
        if key:match("1$") then 
            local otherKey = key:gsub("1", "2")
            otherSlot = ad.gear.slots[otherKey]
            otherEntry = ad.data[character].gear[otherSlot]
            
            -- If otherEntry.name is nil, we still insert gearEntry.name
            if otherSlot and otherEntry and gearEntry.name == otherEntry.name then
                local number = key:match("(%d+)$")
                local name = number .. "." .. gearEntry.name
                table.insert(ad.gear.equipped, name)
            elseif gearEntry.name then
                -- If gearEntry.name is not nil, insert it without number prefix
                table.insert(ad.gear.equipped, gearEntry.name)
            end
            
        elseif key:match("2$") then
            local otherKey = key:gsub("2", "1")
            otherSlot = ad.gear.slots[otherKey]
            otherEntry = ad.data[character].gear[otherSlot]
            
            -- If otherEntry.name is nil, we still insert gearEntry.name
            if otherSlot and otherEntry and gearEntry.name == otherEntry.name then
                local number = key:match("(%d+)$")
                local name = number .. "." .. gearEntry.name
                table.insert(ad.gear.equipped, name)
            elseif gearEntry.name then
                -- If gearEntry.name is not nil, insert it without number prefix
                table.insert(ad.gear.equipped, gearEntry.name)
            end
            
        elseif gearEntry then
            -- For cases where the key doesn't end in 1 or 2
            table.insert(ad.gear.equipped, gearEntry.name)
        end
    end
    
    if ad.gear.equipped ~= {} then
        hecho(f("{ad.colors.lightBlack}[ AUTODARK ] -#r Starting to {command} gear.\n"))
        ad.gear.nextItem()
    end
end

function ad.gear.nextItem()
    -- Ensure all tables are initialized
    local character = gmcp.login_data.name
    ad.data[character] = ad.data[character] or {}
    ad.data[character].gear = ad.data[character].gear or {}
    
    if #ad.gear.equipped > 0 then
        ad.gear.currItem = table.remove(ad.gear.equipped, 1)
        if ad.data[character].gear["held"] and ad.gear.currItem == ad.data[character].gear["held"].name and ad.gear.command == "zap" then
            disableTrigger(ad.gear.trigger.remove)
            enableTrigger("ad.gear.trigger.success")
            enableTrigger("ad.gear.trigger.fail")
            enableTrigger("ad.gear.trigger.wand")
            enableTrigger(ad.gear.trigger.dontKnow)
            ad.gear.currItem = ad.gear.currItem:gsub("^[0-9]+%.", "")
            send(f("{ad.gear.command} {ad.gear.currItem}"))
        elseif ad.data[character].gear["secondary weapon"] and ad.gear.currItem == ad.data[character].gear["secondary weapon"].name then
            disableTrigger(ad.gear.trigger.remove)
            enableTrigger("ad.gear.trigger.success")
            enableTrigger("ad.gear.trigger.fail")
            enableTrigger("ad.gear.trigger.wand")
            enableTrigger(ad.gear.trigger.dontKnow)
            ad.gear.currItem = ad.gear.currItem:gsub("^[0-9]+%.", "")
            send(f("{ad.gear.command} {ad.gear.currItem}"))
        else
            enableTrigger(ad.gear.trigger.remove)
            send(f("remove {ad.gear.currItem}"))
        end
    else
        if ad.data[character].gear["held"] and ad.gear.currItem == ad.data[character].gear["held"].name and ad.gear.command == "zap" then
            send(f("wear {ad.data[character].gear[\"held\"].name}"))
        end
        ad.gear.currItem = nil
        ad.gear.equipped = {}
        ad.gear.command = nil
        disableTrigger(ad.gear.trigger.remove)
        disableTrigger(ad.gear.trigger.wear)
        disableTrigger("ad.gear.trigger.success")
        disableTrigger("ad.gear.trigger.fail")
        disableTrigger("ad.gear.trigger.wand")
        disableTrigger(ad.gear.trigger.dontKnow)
        disableTrigger(ad.gear.trigger.noWands)
        hecho(f("\n{ad.colors.lightBlack}[ AUTODARK ] -#r Completed.\n"))
        send("wimpy")
    end
end

function ad.gear.weaponDisarm()
    local character = gmcp.login_data.name
    local blind = ad.prompt.info.room and ad.prompt.info.room == "darkness" or false
    local combat = gmcp.char_data.is_fighting and true or false
    send("~")
    
    local function getGear(slot)
        local gearEntry = ad.data[character].gear[slot]
        return gearEntry and gearEntry.name or false
    end

    local wielded = getGear("wielded")
    local secondary = getGear("secondary weapon")
    local sheathed = getGear("sheathed")

    if combat then
        if blind then
            if secondary and sheathed then
                send(f("second {sheathed}"))
            elseif sheathed then
                send(f("wield {sheathed}"))
            end
        else
            if wielded then
                send(f("get {wielded}"))
                send(f("wield {wielded}"))
            end
            if secondary then
                send(f("second {secondary}"))
            end
        end
    else
        if wielded then
            send(f("get {wielded}"))
            send(f("wield {wielded}"))
        end
        if sheathed then
            send(f("sheath {sheathed}"))
        end
        if secondary then
            send(f("second {secondary}"))
        end
    end
end

function ad.gear.shieldDisarm()
    local character = gmcp.login_data.name
    local blind = ad.prompt.info.room and ad.prompt.info.room == "darkness" or false
    local combat = gmcp.char_data.is_fighting and true or false
    send("~")

    -- Get the shield gear name
    local function getShield()
        local shieldEntry = ad.data[character].gear["worn as shield"]
        return shieldEntry and shieldEntry.name or false
    end

    local shield = getShield()

    if combat then
        if not blind and shield then
            send(f("get {shield}"))
            send(f("wear {shield}"))
        end
    elseif shield then
        send(f("get {shield}"))
        send(f("wear {shield}"))
    end
end

function ad.gear.report()
    local border = f("{ad.colors.lightBlack}+") .. string.rep("-", 36) .. "+#r"
    local title = f("{ad.colors.lightBlack}|#r" .. string.rep(" ", 8) .. "AUTODARK GEAR REPORT" .. string.rep(" ", 8) .. "{ad.colors.lightBlack}|#r")
    local header = f("{ad.colors.lightBlack}|#r Slot" .. string.rep(" ", 7) .. "Name"  .. string.rep(" ", 12) .. "Manual"   .. string.rep(" ", 2) .. "{ad.colors.lightBlack}|#r")
    local report = { border, title, border, header, border }

    local character = gmcp.login_data.name
    ad.data[character] = ad.data[character] or {}
    ad.data[character].gear = ad.data[character].gear or {}

    -- Generate the report
    for _, key in ipairs(ad.gear.orderedKeys) do
        local longSlot = ad.gear.slots[key]
        local gearEntry = ad.data[character].gear[longSlot]
        
        if gearEntry then
            -- Use default values for nil fields
            local tempSlot = string.format("%-10s", "<" .. (key or "") .. ">")
            local tempName = string.format("%-15s", gearEntry.name or "")
            local tempSet = string.format("%-7s", tostring(gearEntry.manual or false))
        
            local row
            if tempSet == "false  " then
                row = f("{ad.colors.lightBlack}|#r {tempSlot} {tempName} {ad.colors.cyan}{tempSet} {ad.colors.lightBlack}|#r")
            else
                row = f("{ad.colors.lightBlack}|#r {tempSlot} {tempName} {tempSet} {ad.colors.lightBlack}|#r")
            end
        
            table.insert(report, row)
        end
    end

    -- Add closing border and print the report
    table.insert(report, border)
    hecho(table.concat(report, "\n") .. "\n")
end