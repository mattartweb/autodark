-- ********************************************
-- * Autodark Package                         *
-- * v11212024                                *
-- * Created by mawgust                       *
-- * Based on work by:                        *
-- * https://github.com/jormox                *
-- * https://github.com/hex337                *
-- * https://github.com/gesslar               *
-- ********************************************

-- Creates the table ad if it does not exist.

ad = ad or { }

-- Creates a local table called "scripts" that defines which scripts
-- to load on startup. Comment out any that you do not want to run. 

ad.scripts = {
    "gui",
    "chat",
    "prompt",
    "affects",
    "damage",
    "roller",
    "void",
    "level",
    }

-- Colors!

ad.colors = {
    ["black"] = "#000000",
    ["red"] = "#c82929",
    ["green"] = "#5f9600",
    ["yellow"] = "#b5ac00",
    ["blue"] = "#1c71a6",
    ["magenta"] = "#b82f73",
    ["cyan"] = "#26988f",
    ["white"] = "#afafaf",
    ["lightBlack"] = "#646464",
    ["lightRed"] = "#f83734",
    ["lightGreen"] = "#86df00",
    ["lightYellow"] = "#eee600",
    ["lightBlue"] = "#2ca6f7",
    ["lightMagenta"] = "#f43e99",
    ["lightCyan"] = "#38dacd",
    ["lightWhite"] = "#ffffff",
    ["fg"] = "#eee8d5",
    ["clfg"] = "#808080",
    ["cfg"] = "#b5ac00",
    ["bg"] = "#002b36",
}

-- This takes the contents of the "ad.scripts" table, appends the appropriate
-- file naming convention to it, and loads it. If the file is not there it will
-- print an error.

function ad.loader()
    local path, err, msg
    local filePath = getMudletHomeDir() .. "/autodark/"
    hecho(f("{ad.colors.lightBlack}[ AUTODARK ] -#r Scripts now loading...\n"))
    if ad.scripts[1] ~= "data" then
        table.insert(ad.scripts, 1, "data")
    end
    for k, v in ipairs(ad.scripts) do
        path = filePath .. v .. ".lua"
        if io.exists(path) then
            hecho(f("{ad.colors.lightBlack}[ AUTODARK ] -#r Loading: {v}\n"))
            err, msg = pcall(dofile, path)
            if not err then
                hecho(f("{ad.colors.lightBlack}[ AUTODARK ] -#r ERROR: {v} failed to load. Error code follows.\n"))
                print(msg)
            end
        else
            hecho(f("{ad.colors.lightBlack}[ AUTODARK ] -#r ERROR: {v} does not exist.\n"))
        end
    end
    hecho(f("{ad.colors.lightBlack}[ AUTODARK ] -#r Loading completed.\n"))
    raiseEvent("onAutodarkLoad")
end

-- Registering the function to fire when the system connects.

registerAnonymousEventHandler("sysConnectionEvent","ad.loader")