-- Initialize "ad.gui table if not already defined
ad.gui = ad.gui or { alias = {} }
setBorderTop(0) -- Removes the top border of the main window

-- Toggle layout style via the 'swapgui' alias
if not ad.gui.alias.swapGUI then
    ad.gui.alias.swapGUI = tempAlias([[^swapgui$]], function()
        ad.data.layout = not ad.data.layout -- Toggle layout style
		ad.save()
        ad.gui.load() -- Reload the GUI
        hecho(f("{ad.colors.lightBlack}[ AUTODARK ] -#r GUI layout changed. Main console window will sometimes stick, scroll to fix.\n"))
    end)
end

-- Function to load the GUI layout
function ad.gui.load()
    if ad.data.layout == true then
        -- Create the chat container for vertical layout
        ad.gui.chatContainer = Adjustable.Container:new({
            name = "chatContainer",
            x = "-30%", y = "0%", -- Position on the right side
            width = "30%", height = "60%", -- Takes 30% width and 60% height
            adjLabelstyle = "background-color:rgba(0,43,54,100%); border: 2px groove grey;", -- Style for the container's title label
            titleText = "", titleTxtColor = "#002b36",
            buttonsize = 0, autoLoad = false,
        })
        ad.gui.chatContainer:attachToBorder("right") -- Attach to the right border
        ad.gui.chatContainer:connectToBorder("right") -- Ensure it's aligned with the right border

        -- Create a MiniConsole within the chat container
        ad.gui.chatConsole = Geyser.MiniConsole:new({
            name = "chat",
            x = 0, y = 0, width = "100%", height = "100%", -- Fill the entire container
            fontSize = 12, autoWrap = true, scrollBar = true, -- Enable autowrap and scrollbar
        }, ad.gui.chatContainer)
        setBackgroundColor("chat", 0, 43, 54) -- Set the background color of the MiniConsole

        -- Create the map container for vertical layout
        ad.gui.mapContainer = Adjustable.Container:new({
            name = "mapContainer",
            x = "-30%", y = "60%", -- Positioned below the chat container
            width = "30%", height = "40%", -- Takes 30% width and 40% height
            adjLabelstyle = "background-color:rgba(0,43,54,100%); border: 2px groove grey;",
            titleText = "", titleTxtColor = "#002b36",
            buttonsize = 0, autoLoad = false,
        })
        ad.gui.mapContainer:attachToBorder("right")
        ad.gui.mapContainer:connectToBorder("right")
        
        ad.gui.wrapLines() -- Wrap chat lines
        ad.gui.wrapMain() -- Set main console wrapping
    else
        -- Horizontal layout: chat at the top, map on the right
        ad.gui.chatContainer = Adjustable.Container:new({
            name = "chatContainer",
            x = "0%", y = "0%", -- Positioned at the top
            width = "100%", height = "20%", -- Takes 60% width and 30% height
            adjLabelstyle = "background-color:rgba(0,43,54,100%); border: 2px groove grey;",
            titleText = "", titleTxtColor = "#002b36",
            buttonsize = 0, autoLoad = false,
        })
        ad.gui.chatContainer:attachToBorder("top")
        ad.gui.chatContainer:connectToBorder("top")

        ad.gui.chatConsole = Geyser.MiniConsole:new({
            name = "chat",
            x = 0, y = 0, width = "100%", height = "100%",
            fontSize = 12, autoWrap = true, scrollBar = true,
        }, ad.gui.chatContainer)
        setBackgroundColor("chat", 0, 43, 54)

        ad.gui.mapContainer = Adjustable.Container:new({
            name = "mapContainer",
            x = "100%", y = "0%", -- Positioned to the right of the chat container
            width = "0%", height = "20%",
            adjLabelstyle = "background-color:rgba(0,43,54,100%); border: 2px groove grey;",
            titleText = "", titleTxtColor = "#002b36",
            buttonsize = 0, autoLoad = false,
        })
        ad.gui.mapContainer:attachToBorder("top")
        ad.gui.mapContainer:connectToBorder("top")

        ad.gui.wrapLines()
        ad.gui.wrapMain()
    end
end

-- Function to copy lines from a buffer into the chat window
function ad.gui.wrapLines()
    local line = 0
    clearWindow("chat") -- Clear existing lines

    if not moveCursor("chatBuffer", 1, line) then 
        return 
    end 

    while true do
        selectCurrentLine("chatBuffer")
        copy("chatBuffer")
        appendBuffer("chat") -- Append the copied line to the chat console
        line = line + 1
        if not moveCursor("chatBuffer", 1, line) then 
            break 
        end
    end
end

-- Adjust constraints dynamically when a container is repositioned
function ad.gui.finishedRepositioning(eventName, containerName, width, height, x, y)
    local w, h = getMainWindowSize()

    if containerName == "chatContainer" then
        -- Adjust map container based on chat container's new size and position
        ad.gui.mapContainer:set_constraints({
            x = ad.data.layout and x or width,
            y = ad.data.layout and height or 0,
            width = ad.data.layout and width or w - width,
            height = ad.data.layout and h - height or height,
        })
        ad.gui.wrapLines()
        ad.gui.wrapMain()
    elseif containerName == "mapContainer" then
        -- Adjust chat container based on map container's new size and position
        ad.gui.chatContainer:set_constraints({
            x = ad.data.layout and x or 0,
            y = 0,
            width = ad.data.layout and width or w - width,
            height = ad.data.layout and h - height or height,
        })
        ad.gui.wrapLines()
        ad.gui.wrapMain()
    end
end

-- Update main console wrapping to fit around the GUI layout
function ad.gui.wrapMain()
    local w, h = getMainWindowSize()
    local wrap = ad.data.layout and (math.floor((w - ad.gui.chatContainer:get_width()) / calcFontSize(getFontSize())) - 2) 
                or (math.floor(w / calcFontSize(getFontSize())) - 2)
    setWindowWrap("main", wrap)
end

-- Load the GUI layout
ad.gui.load()

-- Register event handlers for container repositioning and window resizing
registerAnonymousEventHandler("AdjustableContainerRepositionFinish", "ad.gui.finishedRepositioning")
registerAnonymousEventHandler("sysWindowResizeEvent", "ad.gui.wrapMain")
registerAnonymousEventHandler("sysWindowResizeEvent", "ad.gui.wrapLines")