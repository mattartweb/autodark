-- Initialize the "ad.affects" table with default values if not already set
-- Adds a nested table "trigger" for temp items
ad.affects = ad.affects or { trigger = {}, alias = {} }

-- Define a table to store details about various spells or effects.
-- Each spell has 'on' (activation message), 'off' (deactivation message), and 'statusType' (buff or debuff) properties.
ad.affects.spells = {
    amnesia = {
        on = "Your mind becomes fuzzy; you have problems remembering one of your spells...",
        off = "Your amnesia subsides.",
        statusType = "debuff"
    },
    armor = {
        on = "You feel someone protecting you.",
        off = "You feel less armored.",
        statusType = "buff"
    },
	beastform = {
        on = "",
        off = "",
        statusType = "buff"
    },
    berserk = {
        on = "Your pulse races as you are consumed by rage!",
        off = "You feel your pulse slow down.",
        statusType = "buff"
    },
    bleeding = {
        on = "slashes at your body, opening up a nasty wound!",
        off = "The flow of blood ceases.",
        statusType = "debuff"
    },
    bless = {
        on = "You feel righteous.",
        off = "You feel less righteous.",
        statusType = "buff"
    },
    blindness = {
        on = "You are blinded!",
        off = "You can see again.",
        statusType = "debuff"
    },
    blur = {
        on = "The outline of your form becomes blurred, shifting and wavering.",
        off = "Your body image clears up.",
        statusType = "buff"
    },
    caltraps = {
        on = "Small spikes fall to the ground, painfully digging into your feet.",
        off = "You painfully pluck the last caltrap.",
        statusType = "debuff"
    },
    charm = {
        on = "",
        off = {"You feel more self-confident.", "You regain your free will."
    },
        statusType = "debuff"
    },
    courage = {
        on = "You feel more courageous.",
        off = "Your command of your skills returns.",
        statusType = "buff"
    },
    curse = {
        on = "You feel unclean.",
        off = "The curse wears off.",
        statusType = "debuff"
    },
    disembowl = {
        on = "You swing your weapon powerfully into .*'s stomach!",
        off = "",
        statusType = "debuff"
    },
    disorientation = {
        on = "you feel the movement disorient you!",
        off = "",
        statusType = "debuff"
    },
    distortion = {
        on = "You begin to feel very distorted as your vision becomes blurry.",
        off = "Your mind is no longer distorted.",
        statusType = "debuff"
    },
    endurance = {
        on = "You feel a holy endurance run through your veins.",
        off = "You feel the divine strength leave your body.",
        statusType = "buff"
    },
    enlarge = {
        on = "Your body trembles and shivers in pain as you grow larger!",
        off = "You feel smaller!",
        statusType = "buff"
    },
    entwine = {
        on = "You swing your flails entwining .*!",
        off = "",
        statusType = "debuff"
    },
    fervor = {
        on = "You are filled with righteous fervor.",
        off = "",
        statusType = "buff"
    },
    flurry = {
        on = "You spin your swords in a flurry on .*!",
        off = "",
        statusType = "buff"
    },
    fly = {
        on = "Your feet rise off the ground.",
        off = {"You float gently to the ground.", "You slowly float to the ground."
    },
        statusType = "buff"
    },
    forget = {
        on = "Your skills feel clumsy and unpracticed.",
        off = "",
        statusType = "debuff"
    },
    frenzy = {
        on = "You are filled with holy wrath!",
        off = "Your rage ebbs.",
        statusType = "buff"
    },
    furnace = {
        on = "You are protected from fire.",
        off = "Your rune of furnace protection has expired.",
        statusType = "buff"
    },
    fury = {
        on = "An inner anger takes over your emotions!",
        off = "The fury within you wears off.",
        statusType = "buff"
    },
    haste = {
        on = "You feel yourself moving more quickly.",
        off = {"You feel yourself slow down.", "You feel yourself slowing down."
    },
        statusType = "buff"
    },
    haze = {
        on = "Your mind becomes hazy as your thoughts begin to race.",
        off = "Your struggle to break from the haze succeeds.",
        statusType = "debuff"
    },
    infravision = {
        on = "Your eyes glow red.",
        off = "You no longer see in the dark.",
        statusType = "buff"
    },
    inspire = {
        on = { "The zeal of the crusader infects his allies.", "Your zeal infects your allies!"
        },
        off = "The zeal of the crusader wears off.",
        statusType = "buff"
    },
    invisibility = {
        on = "You fade out of existence.",
        off = "You are no longer invisible.",
        statusType = "buff"
    },
    jawbind = {
        on = "net closes over your jaws holding them closed!",
        off = "The snare around your jaw breaks free.",
        statusType = "debuff"
    },
    leprosy = {
        on = "You scream in agony as your skin begins to rot.",
        off = "Your skin ceases to decay.",
        statusType = "debuff"
    },
    litany = {
        on = "Your litany inspires you, infusing you with",
        off = "",
        statusType = "buff"
    },
    nondetect = {
        on = "You are immune to detection.",
        off = "Your detection immunity wears off.",
        statusType = "buff"
    },
    plague = {
        on = "You scream in agony as plague sores erupt from your skin.",
        off = "Your sores vanish.",
        statusType = "debuff"
    },
    poison = {
        on = {"You choke and gag.", "You feel very sick."
    },
        off = {"A warm feeling runs through your body.", "You feel less sick."
    },
        statusType = "debuff"
    },
    prayer = {
        on = "A feeling of divinity overtakes your presence.",
        off = "",
        statusType = "buff"
    },
    purity = {
        on = "The purity of your purpose is countenanced.",
        off = "",
        statusType = "buff"
    },
    rebuke = {
        on = "You are inspired to a righteous wrath!",
        off = "",
        statusType = "buff"
    },
    reduce = {
        on = "Your body twists and shivers as you shrink to a smaller size!",
        off = "You feel larger!",
        statusType = "buff"
    },
    riot = {
        on = "You are filled with a terrible fury!",
        off = "You no longer feel so angry.",
        statusType = "buff"
    },
    sanctuary = {
        on = "You are surrounded by a white aura.",
        off = "The white aura around your body fades.",
        statusType = "buff"
    },
    shadowform = {
        on = "You fade into the darkened form of a shadow.",
        off = "You return to your material form.",
        statusType = "buff"
    },
    shield = {
        on = "You are surrounded by a force shield.",
        off = "Your force shield shimmers then fades away.",
        statusType = "buff"
    },
	silence = {
        on = "",
        off = "",
        statusType = "debuff"
    },
    sleep = {
        on = "You feel very sleepy ..... zzzzzz.",
        off = "",
        statusType = "debuff"
    },
    slow = {
        on = "You feel yourself slowing d o w n...",
        off = "You feel yourself speed up.",
        statusType = "debuff"
    },
    sneak = {
        on = "",
        off = "You no longer feel stealthy.",
        statusType = "buff"
    },
    soulsight = {
        on = "You can now see souls.",
        off = "You no longer see soul auras",
        statusType = "buff"
    },
    taunt = {
        on = "shouts a harsh string of insults at you! That little pipsqueak! KILL!! KILL!!",
        off = "You begin to relax.",
        statusType = "debuff"
    },
    warcry = {
        on = "You yell out a loud warcry!",
        off = "Your warcry wears off.",
        statusType = "buff"
    },
    weaken = {
        on = "You feel your strength slip away.",
        off = "You feel stronger.",
        statusType = "debuff"
    },
    wingbind = {
        on = "Your wings are tangled in a rope.",
        off = "The rope entangling your wings breaks free.",
        statusType = "debuff"
    },
    yank = {
        on = "You head out of the room, dragging .*\\.",
        off = "",
        statusType = "debuff"
    },
    ["abandon hope"] = {
        on = "You feel a wave of depression surround you as you abandon all hope.",
        off = "You regain your hope in life.",
        statusType = "debuff"
    },
    ["antimagic shell"] = {
        on = "You feel safe as a mystical shield surrounds your body.",
        off = "You no longer feel safe as the mystical shield fades away.",
        statusType = "buff"
    },
    ["bark skin"] = {
        on = "Your skin is protected by bark.",
        off = "The bark protecting your skin vanishes.",
        statusType = "buff"
    },
    ["bind soul"] = {
        on = "You feel a mystical force bind your movement!",
        off = "You feel the binding force fade away.",
        statusType = "debuff"
    },
    ["bone blight"] = {
        on = "You feel a terrible pain in your limbs.",
        off = "Your limbs feel strong once more.",
        statusType = "debuff"
    },
    ["bugbear bite"] = {
        on = "",
        off = "",
        statusType = "debuff"
    },
    ["change sex"] = {
        on = "You feel different.",
        off = "Your body feels familiar again.",
        statusType = "buff"
    },
    ["cut eyes"] = {
        on = "slashes at your face, opening up a cut above your eyes!",
        off = "You wipe the blood out of your eyes.",
        statusType = "debuff"
    },
    ["dark essence"] = {
        on = "You are surrounded by a blackened essence.",
        off = "The dark essence subsides from your soul.",
        statusType = "debuff"
    },
    ["detect evil"] = {
        on = "",
        off = "The red in your vision disappears.",
        statusType = "buff"
    },
    ["detect good"] = {
        on = "",
        off = "The gold in your vision disappears.",
        statusType = "buff"
    },
    ["detect hidden"] = {
        on = "Your awareness improves.",
        off = "You feel less aware of your surroundings.",
        statusType = "buff"
    },
    ["detect invis"] = {
        on = "",
        off = "You no longer see invisible objects.",
        statusType = "buff"
    },
    ["detect magic"] = {
        on = "",
        off = "The detect magic wears off.",
        statusType = "buff"
    },
    ["dirt kicking"] = {
        on = "kicks dirt in your eyes!",
        off = "You rub the dirt out of your eyes.",
        statusType = "debuff"
    },
    ["divine protection"] = {
        on = "You are granted divine protection.",
        off = "Your divine protection wears off.",
        statusType = "buff"
    },
    ["enchanting touch"] = {
        on = {"You glow with a blue aura.", "You glow with a bright blue aura.", "You glow with a brilliant white aura.", "You glow with a gleaming white aura.", "You glow with a brilliant golden aura."
    },
        off = "Your enchantment fades.",
        statusType = "buff"
    },
    ["enhanced recovery"] = {
        on = "You feel blessed with a vitalizing aura.",
        off = "You feel the divine vitalization leave your body.",
        statusType = "buff"
    },
    ["faerie fire"] = {
        on = "You are surrounded by a pink outline.",
        off = "The pink aura around you fades away.",
        statusType = "debuff"
    },
    ["fake illness"] = {
        on = {"Your tongue turns black.", ""
    },
        off = "Your illness subsides.",
        statusType = "debuff"
    },
    ["favor of the gods"] = {
        on = "",
        off = "The feeling of righteousness fades.",
        statusType = "buff"
    },
    ["find familiar"] = {
        on = {"A black cat slinks into the light and rubs against your leg.", "A black raven flutters down from above and lands on your shoulder."
    },
        off = {"A black cat stops following you.", "A raven stops following you."
    },
        statusType = "buff"
    },
    ["flash bomb"] = {
        on = "You've been blinded!!",
        off = "You rub your eyes. Hey!! All the little flashing spots are gone!",
        statusType = "debuff"
    },
    ["focus aggression"] = {
        on = "Your thoughts become concise and focused on killing!",
        off = "You are no longer focused on your aggression.",
        statusType = "buff"
    },
    ["giant strength"] = {
        on = "Your muscles surge with heightened power!",
        off = "You feel weaker.",
        statusType = "buff"
    },
    ["holy flame"] = {
        on = "Holy flames erupt all about you!",
        off = "The holy flames about your body subside.",
        statusType = "debuff"
    },
    ["holy presence"] = {
        on = "You feel a holy presence protecting you.",
        off = "You feel the holy presence leave your body.",
        statusType = "buff"
    },
	["improved invisibil"] = {
        on = "",
        off = "",
        statusType = "buff"
    },
    ["influence confidence"] = {
        on = "Your confidence in yourself grows stronger.",
        off = "You are no longer confident in your hitting ability.",
        statusType = "buff"
    },
    ["killing rage"] = {
        on = "Screaming a battle cry, you fly into a rage!",
        off = "You calm down as the battlerage leaves you.",
        statusType = "buff"
    },
    ["know languages"] = {
        on = "You broaden your language horizons.",
        off = "Your ability to understand all words fades.",
        statusType = "buff"
    },
    ["nature growth"] = {
        on = "The forces of nature grow inside of you!",
        off = "The forces of nature leave your body.",
        statusType = "buff"
    },
    ["pass door"] = {
        on = "You turn translucent.",
        off = "You feel solid again.",
        statusType = "buff"
    },
	["possess familiar"] = {
        on = "You feel your mind merging with that of your familiar.",
        off = "",
        statusType = "buff"
    },
    ["prevent recovery"] = {
        on = "Your body feels very weak as your ability to heal is drained.",
        off = "You feel the strain on your health lifted.",
        statusType = "debuff"
    },
    ["protection evil"] = {
        on = "You feel holy and pure.",
        off = "You feel less protected.",
        statusType = "buff"
    },
    ["protection good"] = {
        on = "You feel aligned with darkness.",
        off = "You feel less protected.",
        statusType = "buff"
    },
    ["protection neutral"] = {
        on = "You are protected from neutral people.",
        off = "You feel less protected.",
        statusType = "buff"
    },
	["random"] = {
        on = "",
        off = "",
        statusType = "buff"
    },
    ["self projection"] = {
        on = "Your image projects out slightly in front of you.",
        off = "Your projected image suddenly disappears.",
        statusType = "buff"
    },
    ["shield of words"] = {
        on = "You feel protected.",
        off = "Your protection fades away.",
        statusType = "buff"
    },
    ["song of war"] = {
        on = "The melody of the Song of War fills your mind.",
        off = "You no longer hear the melody of the Song of War in your mind.",
        statusType = "buff"
    },
    ["stone skin"] = {
        on = "Your skin turns to stone.",
        off = "Your skin feels soft again.",
        statusType = "buff"
    },
    ["sure striking"] = {
        on = "You strike more surely.",
        off = "Your ever sure strikes falter.",
        statusType = "buff"
    },
    ["water breathing"] = {
        on = "You feel strange as you start having trouble breathing air.",
        off = "You start gasping for air as you can breath normally again!",
        statusType = "buff"
    },
    ["we come, we come"] = {
        on = {"The song enrages your groupmates and demoralizes your enemies.", "Your song enrages your groupmates and demoralizes your enemies."
    },
        off = "The bard's ally song leaves your mind.",
        statusType = "buff"
    },
    ["withstand death"] = {
        on = "Death has no power over you.",
        off = "You shiver as you become susceptible to death again.",
        statusType = "buff"
    },
}

ad.affects.songs = {
    ["song of war"] = true,
    ["no eyes"] = true,
    ["weakness within"] = true,
    ["we come, we come"] = true,
    ["lullaby"] = true,
    ["nightmare"] = true,
    ["shield of words"] = true,
    ["song of charm"] = true,
    ["green leaf"] = true,
}

ad.affects.skills = {
    berserk = true,
    sneak = true,
}

ad.affects.potions = {
    off = "haste",
	anti = "invisibility",
	glistening = "sanctuary",
	glittering = "detect invis",
	glimmering = "frenzy",
	chunky = "sanctuary",
	sanc = "sanctuary",
	nectar = "sanctuary",
	divine = "sanctuary",
	yellow = "haste",
	underwater = "water breathing",
	fly = "fly"
}

-- Ensure the first shielded regex trigger for parsing affects is set up only once
if exists("ad.affects.trigger.spellsOne", "trigger") == 0 then
    -- Trigger for detecting the beginning of the affects information
    tempComplexRegexTrigger("ad.affects.trigger.spellsOne", [[^S(pell|ong ): ]], [[]], 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, nil)
    -- Main trigger for parsing and refreshing the affects values
    tempComplexRegexTrigger("ad.affects.trigger.spellsOne", [[^S(pell|ong ): ([a-zA-Z\s]*?)(\s*): modifies .* for ([0-9]*) cycles]],
        [=[
            if ad.affects.spells[string.trim(multimatches[2][3])] then
                ad.affects.add(multimatches[2][3], ad.affects.spells[string.trim(multimatches[2][3])].statusType or "buff", tonumber(multimatches[2][5]))
            elseif ad.affects.songs[string.trim(multimatches[2][3])] then 
                ad.affects.add(multimatches[2][3], ad.affects.songs[string.trim(multimatches[2][3])].statusType or "buff", tonumber(multimatches[2][5]))
            else
                ad.affects.add(multimatches[2][3], "buff", tonumber(multimatches[2][5]))
            end
        ]=], 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, nil)
end

-- Ensure the second shielded regex trigger for parsing affects is set up only once
if exists("ad.affects.trigger.spellsTwo", "trigger") == 0 then
    -- Trigger for detecting the beginning of the affects information
    tempComplexRegexTrigger("ad.affects.trigger.spellsTwo", [[^S(pell|ong ): ]], [[]], 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, nil)
    -- Main trigger for parsing and refreshing the affects values
    tempComplexRegexTrigger("ad.affects.trigger.spellsTwo", [[^S(pell|ong ): ([a-zA-Z\s]*?)(\s*): modifies .* (permanently)]],
        [=[
            if ad.affects.spells[string.trim(multimatches[2][3])] then
                ad.affects.add(multimatches[2][3], ad.affects.spells[string.trim(multimatches[2][3])].statusType or "buff", "**")
            elseif ad.affects.songs[string.trim(multimatches[2][3])] then 
                ad.affects.add(multimatches[2][3], ad.affects.songs[string.trim(multimatches[2][3])].statusType or "buff", "**")
            else
                ad.affects.add(multimatches[2][3], "buff", "**")
            end
        ]=], 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, nil)
end

-- Ensure the third shielded regex trigger for parsing affects is set up only once
if exists("ad.affects.trigger.spellsThree", "trigger") == 0 then
    -- Trigger for detecting the beginning of the affects information
    tempComplexRegexTrigger("ad.affects.trigger.spellsThree", [[^S(pell|ong ): ]], [[]], 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, nil)
    -- Main trigger for parsing and refreshing the affects values
    tempComplexRegexTrigger("ad.affects.trigger.spellsThree", [[^S(pell|ong ): ([a-zA-Z\s]*)$]],
        [=[
            if ad.affects.spells[string.trim(multimatches[2][3])] then
                ad.affects.add(string.trim(multimatches[2][3]), ad.affects.spells[string.trim(multimatches[2][3])].statusType or "buff", "??")
            elseif ad.affects.songs[string.trim(multimatches[2][3])] then 
                ad.affects.add(string.trim(multimatches[2][3]), ad.affects.songs[string.trim(multimatches[2][3])].statusType or "buff", "??")
            else
                ad.affects.add(string.trim(multimatches[2][3]), "buff", "??")
            end            
        ]=], 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, nil)
end

-- Ensure the first no affects trigger is set up only once
if not ad.affects.trigger.notAffectedOne then
    ad.affects.trigger.notAffectedOne = tempBeginOfLineTrigger("You are affected by the following spells:", function() ad.affects.active = {} ad.affects.update() end)
end

-- Ensure the second no affects trigger is set up only once
if not ad.affects.trigger.notAffectedTwo then
    ad.affects.trigger.notAffectedTwo = tempBeginOfLineTrigger("You are not affected by any spells.", function() ad.affects.active = {} ad.affects.update() end)
end

-- Alias for respell
if not ad.affects.alias.respell then
    ad.affects.alias.respell = tempAlias("^respell(?:\s*)(.*)$", function() ad.affects.respell(matches[1], matches[2]) end)
end

-- Create an adjustable container for the affects GUI
ad.affects.adjContainer = Adjustable.Container:new({
    name = "ad.affects.adjContainer",  -- Unique name for the container
    x = 15, y = 15,                   -- Position of the container
    width = 250, height = "3c",       -- Dimensions of the container
    padding = 0,                      -- Padding inside the container
    fontSize = 10,                    -- Default font size
    titleText = "",                   -- No title text
    adjLabelstyle = "background-color: rgba(50,50,50,100%); border: 0px; border-radius: 5px;", -- Styling for the container
    buttonstyle = [[
        QLabel{ border-radius: 1px; background-color: rgba(0,0,0,0%);}
        QLabel::hover{ background-color: rgba(0,0,0,0%);}
    ]], -- Button styling
})

-- Create a Geyser container inside the adjustable container
ad.affects.geyserContainer = Geyser.Container:new({
    name = "ad.affects.geyserContainer", -- Unique name for the container
    x = "0%", y = "0%",                 -- Fill the entire adjustable container
    width = "100%", height = "100%"
}, ad.affects.adjContainer)

-- Add a border around the affects GUI
ad.affects.border = Geyser.Label:new({
    name = "ad.affects.border",   -- Unique name for the border
    x = 1, y = 1,                 -- Offset the border slightly inside the container
    width = -1, height = -1       -- Match the size of the container
}, ad.affects.geyserContainer)

-- Set the style of the border
ad.affects.border:setStyleSheet([[
    background-color: rgba(50,50,50,100%);
    border: 1px solid grey;
    border-radius: 5px;
]])
-- Enable clickthrough for the border to allow interaction with underlying elements
ad.affects.border:enableClickthrough()

-- Create a mini console inside the GUI for displaying affects information
ad.affects.console = Geyser.MiniConsole:new({
    name = "ad.affects.console",   -- Unique name for the mini console
    x = 7, y = 27,                -- Position within the container
    width = -7, height = -2,      -- Adjust to fit inside the border
    autoWrap = false,             -- Disable automatic line wrapping
    color = "black",              -- Console background color
    scrollBar = false,            -- Disable scrollbar
    fontSize = 11,                -- Font size for text
}, ad.affects.geyserContainer)

-- Set the background color of the console
ad.affects.console:setColor(50, 50, 50)

-- Add a title label to the affects GUI
ad.affects.title = Geyser.Label:new({
    name = "ad.affects.title",       -- Unique name for the title label
    x = 8, y = 8,                   -- Position within the container
    width = "100%-100", height = 18,-- Width adjusts dynamically with container size
    fgColor = "ansiLightBlack",     -- Foreground text color
    fontSize = 10,                  -- Font size for the title
    message = [[Affects]],          -- Title text
}, ad.affects.geyserContainer)

-- Enable clickthrough for the title to prevent blocking underlying interactions
ad.affects.title:enableClickthrough()

-- Set the style of the title label
ad.affects.title:setStyleSheet([[
    background-color: rgba(0,0,0,0%); -- Transparent background
    qproperty-alignment: AlignVCenter; -- Vertically center the text
]])

-- Table to store active affects
ad.affects.active = {}

-- Function to update the UI
function ad.affects.update()
    local affHeight = 0

    if next(ad.affects.active) == nil then
	    clearWindow("ad.affects.console")
        --ad.affects.adjContainer:hide() -- Hide if no affects
    else
	    clearWindow("ad.affects.console")
        local displayText = ""
		local affWidth = 10
		for affect, data in pairs(ad.affects.active) do
		    if (string.len(affect)) > affWidth then
			    affWidth = (string.len(affect))
			end
		end
        for affect, data in pairs(ad.affects.active) do
            local color = data.type == "buff" and "eee8d5" or data.type == "debuff" and "dc322f"
			local filler = string.rep(" ", (affWidth-string.len(affect)))
			if type(data.affTime) == "number" and data.affTime <= 3 and data.type == "buff" then
			    displayText = displayText .. string.format("#b5ac00,323232 %s%s : %s \n", affect, filler, data.affTime)
			else
			    displayText = displayText .. string.format("#%s,323232 %s%s : %s \n", color, affect, filler, data.affTime)
			end
			affHeight = affHeight + 1
        end
        ad.affects.console:hecho(displayText)
		ad.affects.resize(affHeight + 1, (affWidth * 11)) -- Resize to current list
        --ad.affects.adjContainer:show() -- Show with updated content
    end
end

-- Function to add or update an affect
function ad.affects.add(affName, affType, affTime)
    ad.affects.active[affName] = { type = affType, affTime = affTime }
    ad.affects.update()
end

-- Function to remove an affect
function ad.affects.remove(affName)
    ad.affects.active[affName] = nil
    ad.affects.update()
	
-- Large warning for Sanctuary dropping
	if affName == "sanctuary" then
	    hecho("\n" .. [[#c82929
░░░      ░░░      ░░   ░░░  ░░      ░░░░░░░       ░░░      ░░  ░░░░  ░   ░░░  ░░
▒▒  ▒▒▒▒▒▒▒  ▒▒▒▒  ▒    ▒▒  ▒  ▒▒▒▒  ▒▒▒▒▒▒  ▒▒▒▒  ▒  ▒▒▒▒  ▒  ▒  ▒  ▒    ▒▒  ▒▒
▓▓▓      ▓▓  ▓▓▓▓  ▓  ▓  ▓  ▓  ▓▓▓▓▓▓▓▓▓▓▓▓  ▓▓▓▓  ▓  ▓▓▓▓  ▓        ▓  ▓  ▓  ▓▓
████████  █        █  ██    █  ████  ██████  ████  █  ████  █   ██   █  ██    ██
███      ██  ████  █  ███   ██      ███████       ███      ██  ████  █  ███   ██
		#r]])
	end
	
-- Large warning for Haste dropping
	if affName == "haste" then
	    hecho("\n" .. [[#c82929
░░  ░░░░  ░░      ░░░      ░░        ░        ░░░░░░       ░░░      ░░  ░░░░  ░   ░░░  ░░
▒▒  ▒▒▒▒  ▒  ▒▒▒▒  ▒  ▒▒▒▒▒▒▒▒▒▒  ▒▒▒▒  ▒▒▒▒▒▒▒▒▒▒▒▒  ▒▒▒▒  ▒  ▒▒▒▒  ▒  ▒  ▒  ▒    ▒▒  ▒▒
▓▓        ▓  ▓▓▓▓  ▓▓      ▓▓▓▓▓  ▓▓▓▓      ▓▓▓▓▓▓▓▓  ▓▓▓▓  ▓  ▓▓▓▓  ▓        ▓  ▓  ▓  ▓▓
██  ████  █        ███████  ████  ████  ████████████  ████  █  ████  █   ██   █  ██    ██
██  ████  █  ████  ██      █████  ████        ██████       ███      ██  ████  █  ███   ██
		#r]])
	end
	 
end

-- Function to resize the affect window
function ad.affects.resize(affHeight, affWidth)
    affHeight = tonumber(affHeight) or 0 -- Ensure 'affHeight' is a number
	affWidth = tonumber(affWidth) or 80

    -- Resize the ad.affects.adjContainer using character dimensions
    local height = tostring(2 + affHeight) .. "c"
	local width = 5 + affWidth + 80
    ad.affects.adjContainer:resize(width, height)
    
	if ad.data.layout == true then
        -- Reposition ad.affects.adjContainer using calculated pixel
	    local targetX = ad.gui.chatContainer:get_x() - width - 35
        ad.affects.adjContainer:move(targetX, 15)
	else
	    local targetX = 0 - width - 35
	    local targetY = ad.gui.chatContainer:get_height() + 35
        ad.affects.adjContainer:move(targetX, targetY)
	end
end

-- Function to move the affect window back into it's anchor position
function ad.affects.reset()
	if ad.data.layout == true then
        -- Reposition ad.affects.adjContainer using calculated pixel
	    local targetX = ad.gui.chatContainer:get_x() - ad.affects.adjContainer:get_width() - 35
        ad.affects.adjContainer:move(targetX, 15)
	else
	    local targetX = 0 - ad.affects.adjContainer:get_width() - 35
	    local targetY = ad.gui.chatContainer:get_height() + 35
        ad.affects.adjContainer:move(targetX, targetY)
	end
end

-- Reset the affects window position
ad.affects.reset()

-- Show the affects window
ad.affects.adjContainer:show()

-- Table to store all dynamically created triggers
ad.affects.triggers = ad.affects.triggers or {}

-- Function to create triggers for all affects
function ad.affects.makeTriggers()
    for spell, data in pairs(ad.affects.spells) do
        -- Clean the spell name to create unique trigger names
        local base_name = spell:gsub("%s+", ""):gsub("%W", "")
        
        -- Default type to 'buff' if it's not specified
        local
        statusType = data.statusType or "buff"

        -- Handle nested tables for 'on' (can be a table of multiple strings)
        if data.on and type(data.on) == "table" then
            for k, v in pairs(data.on) do
                if v and v ~= "" then
                    local trigger_name_on = "AffectOn" .. base_name .. k  -- Adding 'k' to differentiate triggers if needed
                    ad.affects.triggers[trigger_name_on] = tempBeginOfLineTrigger(v, function() ad.affects.add(spell,
        statusType, "??") end)
                end
            end
        elseif data.on and data.on ~= "" then
            -- Handle 'on' as a single string if it's not a table
            local trigger_name_on = "AffectOn" .. base_name
            ad.affects.triggers[trigger_name_on] = tempBeginOfLineTrigger(data.on, function() ad.affects.add(spell,
        statusType, "??") end)
        end

        -- Handle nested tables for 'off' (can be a table of multiple strings)
        if data.off and type(data.off) == "table" then
            for k, v in pairs(data.off) do
                if v and v ~= "" then
                    local trigger_name_off = "AffectOff" .. base_name .. k  -- Adding 'k' to differentiate triggers if needed
                    ad.affects.triggers[trigger_name_off] = tempBeginOfLineTrigger(v, function() ad.affects.remove(spell) end)
                end
            end
        elseif data.off and data.off ~= "" then
            -- Handle 'off' as a single string if it's not a table
            local trigger_name_off = "AffectOff" .. base_name
            ad.affects.triggers[trigger_name_off] = tempBeginOfLineTrigger(data.off, function() ad.affects.remove(spell) end)
        end
    end
end

-- Create all affects triggers
ad.affects.makeTriggers()

-- Function to decrement affects time
function ad.affects.updateAffTime()
    for name, data in pairs(ad.affects.active) do
	    if type(data.affTime) == "number" then 
            -- Decrease affTime by 1
            ad.affects.active[name].affTime = data.affTime - 1
			
			-- If affTime reaches 0, remove the effect
			if data.affTime < 0 then
                ad.affects.active[name] = nil
            end
		end
    end
	ad.affects.update()
end

function ad.affects.respell(_, affect)
    -- If no specific affect is provided, cast spells in the respell list
    if not affect or affect == "" then
        ad.affects.respellHandler()
        return
    end

    -- Remove the leading space from affect
    affect = affect:match("^%s*(.*)$") -- Removes leading whitespace

    -- Validate gmcp.login_data.name before using it
    if not gmcp then
           hecho(f("{ad.colors.lightBlack}[ AUTODARK ] -#r No gmcp data, cannot save respell data.\n"))
		   hecho(f("{ad.colors.lightBlack}[ AUTODARK ] -#r Please ensure gmcp is enabled and try relogging.\n"))
           return
    end

    if not gmcp.login_data then 
           hecho(f("{ad.colors.lightBlack}[ AUTODARK ] -#r No gmcp.login_data, cannot save respell data.\n"))
		   hecho(f("{ad.colors.lightBlack}[ AUTODARK ] -#r Please ensure gmcp is enabled and try relogging.\n"))
           return
	end

    -- Assign character name after validation
    local character = gmcp.login_data.name
	
	-- Ensure ad.data[character].respell exists
    ad.data[character].respell = ad.data[character].respell or {}

    -- Check if the affect already exists in the respell list
    local respellList = ad.data[character].respell
    local affectIndex = nil
	
	if affect == "list" then
	    if #respellList > 0 then
	        hecho(f("{ad.colors.lightBlack}[ AUTODARK ] -#r Respell list for {character}:\n"))
	        for i, existingAffect in ipairs(respellList) do
                hecho(f("{ad.colors.lightBlack}[ AUTODARK ] -#r {existingAffect}\n"))
            end
		else
		    hecho(f("{ad.colors.lightBlack}[ AUTODARK ] -#r Respell list is currently empty.\n"))
		end
	else
        for i, existingAffect in ipairs(respellList) do
            if existingAffect == affect then
                affectIndex = i
                break
            end
        end
	    
        if affectIndex and affect ~= "list" then
            -- Remove the affect if it already exists
            table.remove(respellList, affectIndex)
            hecho(f("{ad.colors.lightBlack}[ AUTODARK ] -#r '{affect}' has been removed from your respell list.\n"))
        else
            -- Add the affect if it doesn't exist
            table.insert(respellList, affect)
            hecho(f("{ad.colors.lightBlack}[ AUTODARK ] -#r '{affect}' has been added to your respell list.\n"))
        end
	    
        -- Save the data
        ad.save()
	end
end

function ad.affects.respellHandler()
    -- Get the character name from GMCP or fallback to a default value for testing
    local character = gmcp and gmcp.login_data and gmcp.login_data.name or ""

    -- Ensure ad.data[character].respell exists
    ad.data[character] = ad.data[character] or {}
    ad.data[character].respell = ad.data[character].respell or {}

    -- Retrieve the respell list
    local respellList = ad.data[character].respell

    if #respellList > 0 then
	    hecho(f("{ad.colors.lightBlack}[ AUTODARK ] -#r Initiating respell.\n"))
        for _, action in ipairs(respellList) do
            local actionPerformed = false

            -- Determine remaining time for the action
            local remainingTime = ad.affects.active[action] and ad.affects.active[action].affTime or 0

            -- Check if remainingTime is not a number
            if type(remainingTime) ~= "number" then
                -- If it's not numeric, assume it does not need reapplication
                remainingTime = math.huge -- Use math.huge to make the time effectively infinite
            end

            -- Check if the action is in ad.affects.songs
            if ad.affects.songs[action] then
                if remainingTime <= 4 then
                    send("sing " .. action) -- Send the song command
                    actionPerformed = true
                end
            end

            -- Check if the action is in ad.affects.skills
            if not actionPerformed and ad.affects.skills[action] then
                if remainingTime <= 4 then
                    send(action) -- Send the skill command
                    actionPerformed = true
                end
            end

            -- Check if the action starts with "quaff "
            if not actionPerformed and action:find("^quaff ") then
                local potionName = action:sub(7) -- Extract potion name after "quaff "
                if ad.affects.potions[potionName] then
                    local potionEffect = ad.affects.potions[potionName]
                    local potionTime = ad.affects.active[potionEffect] and ad.affects.active[potionEffect].affTime or 0

                    -- Check if potionTime is not a number
                    if type(potionTime) ~= "number" then
                        potionTime = math.huge
                    end

                    if potionTime <= 1 then
                        send(action) -- Send the quaff command
                        actionPerformed = true
                    end
                end
            end

            -- Assume it's a spell name if no other condition matched
            if not actionPerformed and not action:find("^quaff ") then
                if remainingTime <= 4 then
                    send("c '" .. action .. "'") -- Send the spell command
                end
            end
        end
		send("af")
    else
        -- Notify that the respell list is empty
        hecho(f("{ad.colors.lightBlack}[ AUTODARK ] -#r Respell list is empty.\n"))
    end
end


-- Register an event handler to decrement affects time on the "onTick" event
registerAnonymousEventHandler( "onTick", "ad.affects.updateAffTime" )
-- Register an event handler for container repositioning
registerAnonymousEventHandler("sysWindowResizeEvent", "ad.affects.reset")