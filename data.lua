-- Define the "ad.data" table if it doesn't already exist, initializing it as an empty table
ad.data = ad.data or { }

-- Define the file path for the JSON file
local filepath = getMudletHomeDir() .. "/autodark/data.json"

-- Load data from the JSON file into ad.data
function ad.load()
    local file = io.open(filepath, "r") -- Open the file in read mode
    if file then
        local jsonString = file:read("*a") -- Read the entire file content
        file:close() -- Close the file
        ad.data = yajl.to_value(jsonString) or {} -- Decode JSON to Lua table or default to an empty table
    end
end

-- Save the current ad.data table to the JSON file
function ad.save()
    local jsonString = yajl.to_string(ad.data) -- Convert the table to JSON
    local file = io.open(filepath, "w") -- Open the file in write mode
    if file then
        file:write(jsonString) -- Write the JSON string
        file:close() -- Close the file
    else
        error("Failed to open file for writing: " .. filepath)
    end
end

-- Automatically load data on script initialization
ad.load()

function ad.charProfile()
    local character = gmcp.login_data.name
	if not ad.data[character] then
	    ad.data[character] = {}
		ad.save()
	end
end

-- Register event handlers to save data on system exit and disconnection
registerAnonymousEventHandler("sysExitEvent", "ad.save")
registerAnonymousEventHandler("sysDisconnectionEvent", "ad.save")
registerAnonymousEventHandler("gmcp.login_data", "ad.charProfile")