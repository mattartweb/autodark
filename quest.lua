ad.quest = ad.quest or { trigger = {}, alias = {}, }

local basePaths = {
    ["New Thalos"] = {
        ["Return"] = "recall,2n", -- directions from recall back to the Quest Master
        ["Arkane Port"] = "5s,3e,nw,open nw,nw,n,ne,s,e,enter ark",
        ["Middle of a Huge Field"] = "5s,3e,nw,open nw,nw,n,ne,s,e,enter ark,5e",
        ["Crossroads"] = "5s,11w",
        ["Icewall Port"] = "5s,3e,nw,open nw,nw,n,ne,s,e,enter ice",
        ["NT Square"] = "5s,4e",
        ["Tropica Port"] = "5s,3e,nw,open nw,nw,n,ne,s,e,enter trop",
        ["Outside the West Gate of Althainia"] = "5s,12w,u,2w,d,open west,7w,open west,w",
        ["Hidden Trail Through a Thick Forest"] = "5s,3e,nw,open nw,nw,n,ne,s,e,enter ark,7e,2n,ne,2e,ne,7n,open e,e,n",
    }
}

-- Table of areas, the directions to them, and the rooms for quests
local questAreas = {
    -- Gahboom Hill area
    ["Gahboom Hill"] = {
        start = "Middle of a Huge Field",
        dirs = "3s,e,2s,2w,4s,e,s,e,4n,3w,s,se,e,2se,n,ne,nw,sw,s,e,6n",
        rooms = {
            ["An Uneven, Hot Corridor"] = "2d,2n,2se,3e,w,2n,2w,se",
            ["Philosophy Guild"] = "d,2e,n,3e,s",
            ["A Long Bare Hallway"] = "d,4e",
            ["A Stone Slab Platform in Fling-fall Cavern"] = "2d",
            ["A Chainlink Platform in Fling-fall Cavern"] = "d",
            ["A Grated Platform in Fling-fall Cavern"] = "look",
            ["Laboratory E538F"] = "2d,2n,open west,w",
            ["Laboratory C536D"] = "2d,2n,2se,e,nw,open west,w",
            ["Laboratory F539G"] = "2d,2n,2se,e,2nw,open west,w",
            ["A Room of Mirrors"] = "pull flinger,d,w,w,w,nw,s,n,e,sw,ne,n",
        },
    },
    
    -- A Blazing Aurora area
    ["A Blazing Aurora"] = {
        start = "Hidden Trail Through a Thick Forest",
        dirs = "enter aurora",
        rooms = {
            --["A Blazing Aurora"] = "",
            ["The Silver Ascent"] = "2nw,3n,2e,u,ne,u",
        },
    },

    -- The Siege area
    ["The Siege"] = {
        start = "Middle of a Huge Field",
        dirs = "2e,2n,ne,2e,ne,7n,open east,e,n,5e",
        rooms = {
            ["Entrance to the Battlefield"] = "e",
            ["Southern edge of the Battlefield"] = "3e",
            ["Southeast corner of the Battlefield"] = "4e",
            ["Middle of the Battlefield"] = "2e,2n,e,s",
            ["West edge of the Battlefield"] = "e,2n",
            ["Northwest corner of the Battlefield"] = "e,3n",
            ["Northern edge of the Battlefield"] = "e,3n,2e",
            ["Northeast corner of the Battlefield"] = "e,3n,3e",
            ["Eastern edge of the Battlefield"] = "4e,2n",
        },
    },
    
    -- Within the Great Tree area
    ["Within the Great Tree"] = {
        start = "Arkane Port",
        dirs = "ne,n,ne,nw,n,ne,2e",
        rooms = {
            ["Climbing the Great Tree"] = "2u",
            ["On the Trunk of the Great Tree"] = "2u,nw,ne,se",
            ["Further Up the Trunk"] = "2u,nw,u,ne,se",
            ["A Knot On the Trunk"] = "2u,nw,u,se",
            ["Top of the Trunk"] = "2u,nw,u,ne,u,se,sw,nw",
            ["On a Thick Branch"] = "2u,nw,u,ne,u,sw,w,nw,se,sw,ne,e,ne,se,e,ne,sw,se",
        },
    },
    
    --Jovar area
    ["Jovar"] = {
        start = "Icewall Port",
        dirs = "2nw,2w,nw,n,nw,e,n,2u,w,2u",
        rooms = {
            ["Bakery"] = "2n,w",
            ["Residence"] = "3n,w,2e",
            ["Mystic Shop"] = "4n,w",
            ["Smithy"] = "5n,2e,n",
            ["The Believer"] = "5n,2e,n,open w,w,n",
            ["The Planning Room"] = "5n,2e,n,open w,w",
            ["Armoury"] = "5n,2e,s",
            ["Weapon Shop"] = "5n,3e",
            ["An Icy Outcropping"] = "look",
            ["Entrance To The City Of Jovar"] = "n",
            ["J'haras Street"] = "4n",
            ["Before the Palace Gates"] = "5n",
            ["Jh'oru Street"] = "5n,2e",
            ["Beyond the Gates"] = "6n",
            ["Eastern Wing"] = "6n,2e,n",
            ["Stable"] = "6n,2e,2n",
            ["Western Wing"] = "6n,2w,n",
            ["Kitchen"] = "6n,2w,2n",
            ["Guest Quarters"] = "6n,3e,6w",
            ["Storage Room"] = "6n,2e,s,n,4w,s",
            ["Throne Room"] = "7n",
            ["Stairway"] = "8n",
            ["Second Floor"] = "8n,u",
            ["Northern Hall"] = "8n,u,n",
            ["Eastern Hall"] = "8n,u,e",
            ["Southern Hall"] = "8n,u,s",
            ["Western Hall"] = "8n,u,w",
            ["Bed Room"] = "8n,u,2n,4s,2n,2e,4w",
        },
    }, 
    
    -- Silversand area
    ["Silversand Garrison"] = {
        start = "NT Square",
        dirs = "11s,w,s,sw",
        rooms = {
            ["Silversand Garrison"] = "e",
        },
    },
    
    -- Hell area
    ["Hell"] = {
        start = "NT Square",
        dirs = "11s,w,sw,s,sw,w,nw,7n,e,enter gate,quaff anti;look",
        rooms = {
            ["Administration of Hell"] = "5w,2d,e,s,2e,n,2e,s,2e,n,e,2d,s,2w,n,w,s,4w,n,2w,2d,e,s,3e,n,e,s,3e,n,e,2s",
            ["A Large Hallway"] = "5w,2d,e,s,2e,n,2e,s,2e,n,e,2d,s,2w,n,w,s,4w,n,2w,2d,e,s,3e,n,e,s,3e,n,e,4s,w",
            ["The End Of A Large Hallway"] = "5w,2d,e,s,2e,n,2e,s,2e,n,e,2d,s,2w,n,w,s,4w,n,2w,2d,e,s,3e,n,e,s,3e,n,e,4s,w,s",
            ["Break Room"] = "5w,2d,e,s,2e,n,2e,s,2e,n,e,2d,s,2w,n,w,s,4w,n,2w,2d,e,s,3e,n,e,s,3e,n,e,4s,w,s,e",
            ["Office of The Leader Of Hell"] = "5w,2d,e,s,2e,n,2e,s,2e,n,e,2d,s,2w,n,w,s,4w,n,2w,2d,e,s,3e,n,e,s,3e,n,e,4s,w,s,e,s",
            ["Storage Room"] = "5w,2d,e,s,2e,n,2e,s,2e,n,e,2d,s,2w,n,w,s,4w,n,2w,2d,e,s,3e,n,e,s,3e,n,e,4s,w,2s",
            ["Near The Hearth of Hell"] = "5w,2d,e,s,2e,n,2e,s,2e,n,e,2d,s,2w,n,w,s,4w,n,2w,2d,e,s,3e,n,e,s,3e,n,e,4s,w,s,w,s",
            ["The Hearth of Hell"] = "5w,2d,e,s,2e,n,2e,s,2e,n,e,2d,s,2w,n,w,s,4w,n,2w,2d,e,s,3e,n,e,s,3e,n,e,4s,w,s,w,s,w",
            ["Blackened Hall"] = "5w,2d,e,s,2e,n,2e,s,2e,n,e,2d,s,2w,n,w,s,4w,n,2w,2d,e,s,3e,n,e,s,3e,n,e,2s,2w,s,2w,n",
            ["Office of the High Priest"] = "5w,2d,e,s,2e,n,2e,s,2e,n,e,2d,s,2w,n,w,s,4w,n,2w,2d,e,s,3e,n,e,s,3e,n,e,2s,2w,s,2w,n,open east,e",
            ["The Market of Hell"] = "5w,2d,e,s,2e,n,2e,s,2e,n,e,2d,s,2w,n,w,s,4w,n,2w,2d,e,s,3e,n,e,s,3e,n,e,2s,2w,s,2w,s,w,2s",
            ["Pawn Shop"] = "5w,2d,e,s,2e,n,2e,s,2e,n,e,2d,s,2w,n,w,s,4w,n,2w,2d,e,s,3e,n,e,s,3e,n,e,2s,2w,s,2w,s,2w",
            ["The Office of Big Mouth"] = "5w,2d,e,s,2e,n,2e,s,2e,n,e,2d,s,2w,n,w,s,4w,n,2w,2d,e,s,3e,n,e,s,3e,n,e,2s,2w,s,2w,s,e",
            ["Beneath the Desk of Big Mouth"] = "5w,2d,e,s,2e,n,2e,s,2e,n,e,2d,s,2w,n,w,s,4w,n,2w,2d,e,s,3e,n,e,s,3e,n,e,2s,2w,s,2w,s,e,d",
            ["Halls of Judgement"] = "5w,2d,e,s,2e,n,2e,s,2e,n,e,2d,s,2w,n,w,s,4w,n,2w,2d,e,s,3e,n,e,s,3e,n,e,2s,2w,s,6w",
            ["Records Hall"] = "5w,2d,e,s,2e,n,2e,s,2e,n,e,2d,s,2w,n,w,s,4w,n,2w,2d,e,s,3e,n,e,s,3e,n,e,2s,2w,s,5w,n,w,3e",
            ["Court Room"] = "5w,2d,e,s,2e,n,2e,s,2e,n,e,2d,s,2w,n,w,s,4w,n,2w,2d,e,s,3e,n,e,s,3e,n,e,2s,2w,s,6w,s",
            ["Judge's Chambers"] = "5w,2d,e,s,2e,n,2e,s,2e,n,e,2d,s,2w,n,w,s,4w,n,2w,2d,e,s,3e,n,e,s,3e,n,e,2s,2w,s,6w,2s",
            ["Office of Complaints"] = "5w,2d,e,s,2e,n,2e,s,2e,n,e,2d,s,2w,n,w,s,4w,n,2w,2d,e,s,3e,n,e,s,3e,n,e,2s,2w,s,5w,s",
            ["Lawyer's Office"] = "5w,2d,e,s,2e,n,2e,s,2e,n,e,2d,s,2w,n,w,s,4w,n,2w,2d,e,s,3e,n,e,s,3e,n,e,2s,2w,s,5w,s,w",
            ["Courtyard"] = "5w,2d,e,s,2e,n,2e,s,2e,n,e,2d,s,2w,n,w,s,4w,n,2w,2d,e,s,3e,n,e,s,3e,n,e,2s,2w,s,5w,s,w,2s,e,n",
            ["Hell's Kitchen"] = "5w,2d,e,s,2e,n,2e,s,2e,n,e,2d,s,2w,n,w,s,4w,n,2w,2d,e,s,3e,n,e,s,3e,n,e,2s,2w,s,5w,s,w,2s,w",
            ["Stanley's Magical Steeds"] = "5w,2d,e,s,2e,n,2e,s,2e,n,e,2d,s,2w,n,w,s,4w,n,2w,2d,e,s,3e,n,e,s,3e,n,e,2s,2w,s,5w,s,w,s,2e",
            ["Hallway of the Mall from Hell"] = "5w,2d,e,s,2e,n,2e,s,2e,n,e,2d,s,2w,n,w,s,4w,n,2w,2d,e,s,3e,n,e,s,3e,n,e,2s,2w,s,5w,s,w,s,2e,s",
        },
    },

    -- Ghost Lake area
    ["Ghost Lake"] = {
        start = "Outside the West Gate of Althainia",
        dirs = "9w,2s",
        rooms = {
            ["A Foggy Forest"] = "sw,nw",
            ["A Foggy Cliff Overlooking a Lake"] = "sw,nw,n",
            ["On a Trail Down to the Lake"] = "sw,nw,n,d",
            ["Opening in the trail"] = "sw,nw,n,d,n",
            ["A Hill in the Mist Filled Woods"] = "sw,nw,n,d,2n,se",
            ["At the Edge of a Murky Lake"] = "sw,nw,n,d,2n,w,nw,3n,2nw,2n,ne,e,ne,2e,se,s,2e,se,s,sw,2s,sw,2w,2s",
            ["In The Ghostly Mist"] = "sw,nw,n,d,2n,w,n,e,n,w,n,4e,n,4w,nw,5e,ne,7w,n,7e,n,7w,n,4e",
            ["In the Ghostly Mist"] = "sw,nw,n,d,2n,w,n,e,n,w,n,4e,n,4w,nw,5e,ne,7w,n,7e,n,7w,n,4e",
            ["On an Island Overlooking A Ghostly Lake"] = "sw,nw,n,d,6n,2e",
            ["Deep In a Mist Filled Lake"] = "sw,nw,n,d,5n,d,2n,w,2e,2n,s,w",
            ["A Sheer Drop"] = "sw,nw,n,d,5n,e,d,w,n,",
            ["A Deep Crevice"] = "sw,nw,n,d,6n,2d,se",
            ["In Front of a Large Sigil Marked Door"] = "sw,nw,n,d,5n,e,2d,e",
        },
    },
    
        -- Arena of the Bull Dancers area
    ["Arena of the Bull Dancers"] = {
        start = "Outside the West Gate of Althainia",
        dirs = "9w,2n,e,2n,",
        rooms = {
            ["Trail to the Arena"] = "e",
            ["Before the Arena"] = "2e",
            ["Entryway of the Arena"] = "3e",
            ["Under the Arena Stands"] = "3e,3n,s,2se,e,n,e,2n,2nw,w",
            ["Entrance to the Arena"] = "3e,3n,2ne,e,se",
            ["White Sands of the Arena"] = "3e,3n,ne,open south,2s,se,e,ne,2w,nw,3e,nw,w",
            ["Bull Pen"] = "3e,5n,5e,s",
            ["The Stairwell"] = "3e,3n,s,2se,2e",
            ["The Stairwell leading down"] = "3e,3n,s,2se,2e,u",
            ["The Arena Stands"] = "3e,3n,s,2se,2e,u,nw,e,4n,sw,n,4w,se,w,4s,ne,s,3e",
        },
    },

--    ["Glonnoil Fjord"] = {
--                ["test"] = "test",
--        },

    -- A Lost Catacomb area
    ["A Lost Catacomb"] = {
        start = "Tropica Port",
        dirs = "sw,w,nw,w,nw,4w,sw,se,e,s,3w,s,3e,s,4w,s,w,2s,w,enter stone",
        rooms = {
            ["Entrance To The Catacombs"] = "look",
            ["A Passage in the Catacombs"] = "4e,2s,d,2e,2s,2w,n",
            ["A Room Lined With Coffins"] = "2e,n,2s,n,e,n,2s,n,2e,w,n,3s,d,e,n,s,2e,w,n,2s,e,w,s,e,2w,s,n,2w,e,s",
            ["A Carefully Carved Tunnel"] = "4e,2s,d,2e,2s,2w,n,d,3s,e",
            ["Guard Room"] = "4e,2s,d,2e,2s,2w,n,d,s,w,2e,w,s,w,2e",
            ["Main Bedroom"] = "4e,2s,d,2e,2s,2w,n,d,3s,2e",
            ["A Large Library"] = "4e,2s,d,2e,2s,2w,n,d,3s,2e,n",
            ["A Large Lab"] = "4e,2s,d,2e,2s,2w,n,d,3s,2e,s",
            ["A Treasure Room"] = "4e,2s,d,2e,2s,2w,n,d,3s,2e,open east,e",
        },
    },

    -- Crystal Bay area
    ["Crystal Bay"] = {
        start = "Tropica Port",
        dirs = "sw,w,nw,w,nw,w",
        rooms = {
                ["A sandy pass"] = "s",
                ["A Sandy Shoreline"] = "2s",
                ["A shoreline"] = "2s,2se",
                ["A sandy shoreline"] = "2s,4se,4sw,4nw,2ne",
                ["A bend in the shoreline"] = "2s,4se,4sw,4nw",
                ["The shoreline"] = "2s,4se,sw",
                ["A rising path up the mountain"] = "2s,4se,sw,se",
                ["A rocky shoreline"] = "2s,4se,4sw,3nw",
                ["A bend in the rocky shoreline"] = "2s,4se,4sw",
                ["A hidden cave"] = "2s,4se,4sw,nw,sw",
                ["An old shack"] = "2s,4se,4sw,4nw,2ne,nw",
        },
    },

    -- Elemental Planes area
    ["Elemental Planes"] = {
        start = "NT Square",
        dirs = "11s,w,sw,s,sw,w,nw,7n,e,enter gate,5w,2d,e,s,2e,n,2e,s,2e,n,e,2d,s,2w,n,w,s,4w,n,2w,2d,e,s,3e,n,e,s,3e,n,e,2s,2d,2w,4d",
        rooms = {
            ["Gateway to the Elemental Planes"] = "look",
            ["On the Elemental Plane of Fire"] = "2ne,3n,e,3s,e,3n,e,3s",
            ["On the Elemental Plane of Earth"] = "2se,3s,e,3n,e,3s,e,3n",
            ["On the Elemental Plane of Water"] = "2sw,3s,w,3n,w,3s,w,3n",
            ["On the Elemental Plane of Air"] = "2nw,3n,w,3s,w,3n,w,3s",
        },
    },

    -- New Thalos area
    ["New Thalos"] = {
        start = "NT Square",
        dirs = "d,5e",
        rooms = {
            ["The House of Training"] = "s",
        },
    },

    -- Forbidden Forest area
    ["Forbidden Forest"] = {
        start = "Icewall Port",
        dirs = "ne,e,ne,2n,ne,5n",
        rooms = {
            ["A Snow Covered Field"] = "w",
            ["The Forest Entrance"] = "2w",
            ["A Forested Grove"] = "2w,nw",
            ["A Sheer Ice Wall"] = "2w,nw,n",
            ["A Hollow Tree"] = "2w,nw,n,e",
            ["A Crumbling Ice Wall"] = "2w,nw,n,w",
            ["A Broken Ice Field"] = "2w,nw,w",
            ["A Jumbled Pile Of Ice"] = "2w,nw,2w",
            ["A Broken Wall Of Ice"] = "2w,nw,2w,nw",
            ["A Glacier Wall"] = "2w,nw,2w,nw,w",
            ["A Stone Filled Crevice"] = "2w,nw,2w,nw,2w",
            ["Snow Fields"] = "2w,nw,3w",
            ["A Refuse Pile"] = "2w,nw,4w",
            ["A Blue Tent"] = "2w,nw,5w",
            ["A Rock Covered Field"] = "2w,nw,6w",
            ["A Stone Walled Box Canyon"] = "2w,nw,7w",
            ["An Old Pine Forest"] = "3w",
            ["A Bloody Battlefield"] = "4w",
            ["A Few Stunted Pine"] = "5w",
            ["A Shallow Depression Filled With Snow"] = "6w",
            ["A Field Of Corpses"] = "7w",
            ["A Thick Tangle Of Weeds"] = "8w",
            ["A Field Of Tall Grass"] = "9w",
            ["A Dark Forest"] = "2w,sw",
            ["A Deserters Camp"] = "2w,sw,w",
            ["Some Drifts Of Snow"] = "2w,sw,2w",
            ["Ice Covered Fields"] = "2w,sw,3w",
            ["Some Snow Covered Vegetation"] = "2w,sw,4w",
            ["A Snow Covered Hill"] = "2w,sw,5w",
            ["A Corner Made Of Ice and Stone"] = "2w,sw,6w",
            ["An Abandoned Campsite"] = "2w,sw,s",
            ["A Moss Covered Rock"] = "2w,sw,se",
            ["A Small Deer Path"] = "2w,sw,s,w",
            ["A Slush Filled Marsh"] = "2w,sw,s,2w",
            ["A Clearing In The Woods"] = "2w,sw,s,3w",
            ["A Slushy Field"] = "2w,sw,s,4w",
            ["Some Ice Covered Trees"] = "2w,sw,s,5w",
            ["A Smooth Stone Wall"] = "2w,sw,2se",
            ["A Boulder Strewn Field"] = "2w,sw,se,s",
            ["Rolling Hills Of Fog"] = "2w,sw,2s",
            ["A Barely Noticable Deer Path"] = "2w,sw,2s,w",
            ["Small Pine Filled Valley"] = "2w,sw,2s,2w",
            ["A Forest Clearing"] = "2w,sw,2s,3w",
            ["A Cloud Filled Forest"] = "2w,sw,2s,4w",
            ["Dark Mists"] = "2w,sw,2s,5w",
            ["A Thin Passage In The Rock"] = "2w,sw,2s,6w",
            ["A Sharp Dropoff"] = "2w,sw,2se,s",
            ["A Wall Of Fog"] = "2w,sw,se,2s",
            ["A Fog Filled Forest"] = "2w,sw,3s",
            ["A Great Pine Tree"] = "2w,2sw,2s",
            ["A Deer Path"] = "2w,3sw,s",
            ["Some Snow Covered Pines"] = "2w,4sw",
            ["Clouds Of Steam"] = "3w,4sw",
            ["The Steam Pools"] = "4w,4sw",
            ["A Large Camp"] = "2w,sw,2se,2s",
            ["A Scarred Field"] = "2w,sw,se,3s",
            ["A Clear Field"] = "2w,sw,4s",
            ["A Thick Knot Of Pine"] = "2w,2sw,3s",
            ["A Overgrown Deer Path"] = "2w,3sw,2s",
            ["A Meadow with Scattered Trees"] = "2w,4sw,s",
            ["Towering Pines"] = "2w,5sw",
            ["A Cloudy Campsite"] = "3w,5sw",
            ["A Group Of Small Tents"] = "3w,5sw,w",
            ["A Red Tent"] = "2w,sw,2se,3s",
            ["A Pile Of Refuse"] = "2w,sw,se,4s",
            ["Some Old Burned Stumps"] = "2w,sw,5s",
            ["A Pile Of Rotten Logs"] = "2w,2sw,4s",
            ["A Wide Path For Deer"] = "2w,3sw,3s",
            ["A Thick Forest"] = "2w,4sw,2s",
            ["Moss Covered Trees"] = "2w,5sw,1s",
            ["A Refuse Pile"] = "2w,6sw",
            ["A Green Tent"] = "3w,6sw",
            ["Some Young Pine Trees"] = "2w,sw,6s",
            ["A Green Meadow"] = "2w,2sw,5s",
            ["A Solid Wall Of Timber"] = "2w,3sw,4s",
            ["A Group Of Snow Covered Bushes"] = "2w,4sw,3s",
            ["A Gravesite"] = "2w,5sw,2s",
            ["A Sunny Glade"] = "2w,6sw,s",
        },
    },
    
    -- Glonnoil Fjord area
    ["Glonnoil Fjord"] = {
        start = "Arkane Port",
        dirs = "ne,n,ne,nw,n,ne,nw,5n",
        rooms = {
            ["Rocky Outcrop"] = "quaff breath;e,ne,nw,s,w,enter hole,e,2ne,3e,3ne,enter break,n,se,sw,nw,e,enter hole,3nw,7w,nw,enter break,ne,2w,ne",
        },
    },
}

ad.quest.questItems = {
    ["a bright green emerald"] = "emerald",
    ["a Blue diamond shard"] = "shard",
    ["a valuable painting"] = "painting",
    ["the Crown Jewels"] = "jewels",
    ["the King's sceptre"] = "sceptre",
}

-- Create trigger if not already initialized
if not ad.quest.trigger.request then
    ad.quest.trigger.request = tempRegexTrigger(
        [[^You ask [\w\s]+ for a quest.$]],
        function()
            enableTrigger(ad.quest.trigger.target)
            enableTrigger(ad.quest.trigger.location)
            disableTrigger(ad.quest.trigger.request)
        end
    )
end
disableTrigger(ad.quest.trigger.request)

-- Create trigger if not already initialized
if not ad.quest.trigger.target then
    ad.quest.trigger.target = tempRegexTrigger(
        [[^[\w\s]+ says 'Vile (?:pilferers|thieves) have stolen (.+) from the royal treasury!'$]],
        function()
            disableTrigger(ad.quest.trigger.later)
            disableTrigger(ad.quest.trigger.target)
            ad.quest.tempItem = matches[2]
        end
    )
end
disableTrigger(ad.quest.trigger.target)

-- Create trigger if not already initialized
if not ad.quest.trigger.location then
    ad.quest.trigger.location = tempRegexTrigger(
        [[^[\w\s]+ says 'Look in the general (?:area|vicinity) of (.+) for (.+)!'$]],
        function()
            disableTrigger(ad.quest.trigger.location)
            ad.quest.tempArea = matches[2]
            ad.quest.tempRoom = matches[3]
            if not questAreas[ad.quest.tempArea] then
                -- probably need something more here to handle the triggers
                hecho(f("\n{ad.colors.lightBlack}[ AUTODARK ] -#r Quest area not found.\n"))
                local questData = f("{ad.colors.lightBlack}[ AUTODARK ] - {ad.colors.red}AREA NOT FOUND:#r {ad.quest.tempArea}, {ad.quest.tempRoom}\n")
                hecho("chat", questData)
                hecho("chatBuffer", questData)
                tempTimer(math.random(11, 24), [[ send("pq clear") ]])
                tempTimer(math.random(87, 129), [[ ad.quest.processCommands("start") ]])
            else
                ad.quest.buildareaPath(questAreas[ad.quest.tempArea].start, ad.quest.tempArea, ad.quest.tempRoom)
            end
        end
    )
end
disableTrigger(ad.quest.trigger.location)

-- Create trigger if not already initialized
if not ad.quest.trigger.clear then
    ad.quest.trigger.clear = tempRegexTrigger(
        [[^You inform [\w\s]+ you can not complete (?:his|her) quest.$]],
        function()
            ad.quest.tempItem = nil
            ad.quest.tempArea = nil
            ad.quest.tempRoom = nil
            hecho(f("\n{ad.colors.lightBlack}[ AUTODARK ] -#r Quest data cleared.\n"))
            local questData = f("{ad.colors.lightBlack}[ AUTODARK ] -#r Quest cancelled.\n")
            hecho("chat", questData)
            hecho("chatBuffer", questData)
        end
    )
end
disableTrigger(ad.quest.trigger.clear)

-- Create trigger if not already initialized
if not ad.quest.trigger.again then
    ad.quest.trigger.again = tempRegexTrigger(
        [[^You can now quest again.$]],
        function()
            enableTrigger(ad.quest.trigger.request)
            hecho(f("\n{ad.colors.lightBlack}[ AUTODARK ] -#r Requesting quest.\n"))
            send("pq request find", false)
        end
    )
end
disableTrigger(ad.quest.trigger.again)

-- Create trigger if not already initialized
if not ad.quest.trigger.fail then
    ad.quest.trigger.fail = tempRegexTrigger(
        [[^You have run out of time for your quest!$]],
        function()
            ad.quest.tempItem = nil
            ad.quest.tempArea = nil
            ad.quest.tempRoom = nil
            hecho(f("\n{ad.colors.lightBlack}[ AUTODARK ] -#r Quest data cleared.\n"))
        end
    )
end
disableTrigger(ad.quest.trigger.fail)

-- Create trigger if not already initialized
if not ad.quest.trigger.later then
    ad.quest.trigger.later = tempRegexTrigger(
        [[^[\w\s]+ says 'Come back later.'$]],
        function()
            ad.quest.finishKillTriggers()
            enableTrigger(ad.quest.trigger.again)
            hecho(f("\n{ad.colors.lightBlack}[ AUTODARK ] -#r Bah.\n"))
        end
    )
end
disableTrigger(ad.quest.trigger.later)

-- Create trigger if not already initialized
if not ad.quest.trigger.roomExits then
    ad.quest.trigger.roomExits = tempBeginOfLineTrigger(
        " [Exits: ",
        function()
            enableTrigger(ad.quest.trigger.roomItems)
            enableTrigger(ad.quest.trigger.roomEnd)
            ad.quest.itemsHere = {}
            disableTrigger(ad.quest.trigger.roomExits)
        end
    )
end
disableTrigger(ad.quest.trigger.roomExits)

-- Create trigger if not already initialized
if not ad.quest.trigger.roomItems then
    -- Trigger for detecting quest items
    ad.quest.trigger.roomItems = tempRegexTrigger(
        [[^(?:\(\s?\d+\)\s)?\s*\(Glowing\) (.*?) (of a puppy is here.|is here.|shines here.|sits here gleaming.|are here.)$]],
        function()
            ad.quest.itemFound = true
            ad.quest.checkItem(matches[2])
        end
    )
end
disableTrigger(ad.quest.trigger.roomItems)

-- Create trigger if not already initialized
if not ad.quest.trigger.roomEnd then
    ad.quest.trigger.roomEnd = tempRegexTrigger(
        [[^$]],
        function()
            if not ad.quest.itemFound then
                disableTrigger(ad.quest.trigger.roomItems)
                disableTrigger(ad.quest.trigger.roomEnd)
                ad.quest.nextStep()
--            else
--                disableTrigger(ad.quest.trigger.roomItems)
--                disableTrigger(ad.quest.trigger.roomEnd)
--                enableTrigger(ad.quest.trigger.noStealing)
--                enableTrigger(ad.quest.trigger.itemNotHere)
--                enableTrigger(ad.quest.trigger.gotItem)
--                send(f("get {ad.quest.questItems[ad.quest.tempItem]}"))
            end
        end
    )
end
disableTrigger(ad.quest.trigger.roomEnd)

-- Create trigger if not already initialized
if not ad.quest.trigger.noStealing then
    -- Trigger for detecting when quest item belongs to someone else
    ad.quest.trigger.noStealing = tempRegexTrigger(
        [[^Looting is not permitted.$]],
        function()
            ad.quest.tries = ad.quest.tries + 1
            hecho(f("\n{ad.colors.lightBlack}[ AUTODARK ] -#r Not that one.\n"))
            send(f("get {ad.quest.tries}.{ad.quest.questItems[ad.quest.tempItem]}"), false)
        end
    )
end
disableTrigger(ad.quest.trigger.noStealing)

-- Create trigger if not already initialized
if not ad.quest.trigger.itemNotHere then
    -- Trigger for detecting when the item isn't there
    ad.quest.trigger.itemNotHere = tempRegexTrigger(
        [[^I see no .* here.$]],
        function()
            ad.quest.tries = 1
            disableTrigger(ad.quest.trigger.noStealing)
            disableTrigger(ad.quest.trigger.itemNotHere)
            disableTrigger(ad.quest.trigger.gotItem)
            ad.quest.itemFound = nil
            hecho(f("\n{ad.colors.lightBlack}[ AUTODARK ] -#r Could not retrieve, moving on.\n"))
            ad.quest.nextStep()
        end
    )
end
disableTrigger(ad.quest.trigger.itemNotHere)

-- Create trigger if not already initialized
if not ad.quest.trigger.gotItem then
    -- Trigger for detecting when item is picked up
    ad.quest.trigger.gotItem = tempRegexTrigger(
        [[^You get (a|the) (bright green emerald|Blue diamond shard|valuable painting|Crown Jewels|King's sceptre).$]],
        function()
            ad.quest.tries = 1
            disableTrigger(ad.quest.trigger.noStealing)
            disableTrigger(ad.quest.trigger.itemNotHere)
            disableTrigger(ad.quest.trigger.gotItem)
            ad.quest.itemFound = nil
            hecho(f("\n{ad.colors.lightBlack}[ AUTODARK ] -#r Item retrieved, heading back.\n"))
            if not gmcp.char_data.is_fighting then
                ad.quest.recallFail = 1
                ad.quest.tempPath = ad.quest.returnPath
                ad.quest.finish = true
                ad.quest.nextStep()
            else
                ad.quest.recallFail = 1
                enableTrigger(ad.quest.trigger.recallFail)
                enableTrigger(ad.quest.trigger.recallSuccess)
                send("recall", false)
            end
        end
    )
end
disableTrigger(ad.quest.trigger.gotItem)

-- Create trigger if not already initialized
if not ad.quest.trigger.recallFail then
    ad.quest.trigger.recallFail = tempRegexTrigger(
        [[^You failed!.$]],
        function()
            if ad.quest.recallFail < 10 then
                ad.quest.recallFail = ad.quest.recallFail + 1
                send("recall", false)
            else
                disableTrigger(ad.quest.trigger.recallFail)
                hecho(f("\n{ad.colors.lightBlack}[ AUTODARK ] -#r This is not good. Let's try fleeing.\n"))
                disableTrigger(ad.quest.trigger.recallFail)
                disableTrigger(ad.quest.trigger.recallSuccess)
                ad.quest.fleeFail = 1
                enableTrigger("ad.quest.trigger.fleeFail")
                enableTrigger(ad.quest.trigger.fleeSuccess)
                send("flee")
            end
        end
    )
end
disableTrigger(ad.quest.trigger.recallFail)

-- Create trigger if not already initialized
if not ad.quest.trigger.recallSuccess then
    ad.quest.trigger.recallSuccess = tempRegexTrigger(
        [[^You recall from combat!  You lose 25 exps.$]],
        function()
            ad.quest.recallFail = 1 
            disableTrigger(ad.quest.trigger.recallFail)
            disableTrigger(ad.quest.trigger.recallSuccess)
            table.remove(ad.quest.returnPath, 1)
            ad.quest.tempPath = ad.quest.returnPath
            ad.quest.nextStep()
        end
    )
end
disableTrigger(ad.quest.trigger.recallSuccess)

if exists("ad.quest.trigger.fleeFail", "trigger") == 0 then
    tempComplexRegexTrigger("ad.quest.trigger.fleeFail", [[^PANIC! You couldn't escape!$]], [[]], 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, nil)
    tempComplexRegexTrigger("ad.quest.trigger.fleeFail", [[^You cannot escape from combat!!!$]],
        [[
            if ad.quest.fleeFail < 10 then 
                ad.quest.fleeFail = ad.quest.fleeFail + 1
                send("flee")
            else 
                hecho(f("\n{ad.colors.lightBlack}[ AUTODARK ] -#r ...fuck\n"))
                hecho(f("{ad.colors.lightBlack}[ AUTODARK ] -#r Stopping quester.\n"))
                ad.quest.killTriggers()
            end
        ]], 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, nil)
end
disableTrigger("ad.quest.trigger.fleeFail")

-- Create trigger if not already initialized
if not ad.quest.trigger.fleeSuccess then
    ad.quest.trigger.fleeSuccess = tempRegexTrigger(
        [[^You flee from combat!$]],
        function()
            ad.quest.fleeFail = 1 
            disableTrigger(ad.quest.trigger.fleeFail)
            disableTrigger(ad.quest.trigger.fleeSuccess)
            enableTrigger(ad.quest.trigger.forsaken)
            ad.quest.tempPath = ad.quest.returnPath
            ad.quest.nextStep()
        end
    )
end
disableTrigger(ad.quest.trigger.fleeSuccess)

-- Create trigger if not already initialized
if not ad.quest.trigger.forsaken then
    ad.quest.trigger.forsaken = tempRegexTrigger(
        [[^The Gods have forsaken you.$]],
        function()
            ad.quest.fleeFail = 1 
            hecho(f("\n{ad.colors.lightBlack}[ AUTODARK ] -#r Well shit...\n"))
            hecho(f("{ad.colors.lightBlack}[ AUTODARK ] -#r Stopping quester.\n"))
            ad.quest.killTriggers()
        end
    )
end
disableTrigger(ad.quest.trigger.forsaken)

-- Create trigger if not already initialized
if not ad.quest.trigger.completed then
    -- Trigger for detecting quest completion
    ad.quest.trigger.completed = tempRegexTrigger(
        [[^You inform [\w\s]+ you have completed (?:his|her) quest.$]],
        function()
            disableTrigger(ad.quest.trigger.completed)
            disableTrigger(ad.quest.trigger.forsaken)
            enableTrigger(ad.quest.trigger.again)
            local questData = f("{ad.colors.lightBlack}[ AUTODARK ] -#r Quest completed.\n")
            hecho("chat", questData)
            hecho("chatBuffer", questData)
        end
    )
end
disableTrigger(ad.quest.trigger.completed)


-- Alias for questing
if not ad.quest.alias.commands then
    ad.quest.alias.commands = tempAlias("^pq (.*)$", function()
        ad.quest.processCommands(matches[2])
    end)
end

function ad.quest.processCommands(command)
    if command == "start" then
        hecho(f("\n{ad.colors.lightBlack}[ AUTODARK ] -#r Starting quester.\n"))
        enableTrigger(ad.quest.trigger.later)
        enableTrigger(ad.quest.trigger.request)
        send("pq request find", false)
    elseif command == "stop" then
        hecho(f("\n{ad.colors.lightBlack}[ AUTODARK ] -#r Stopping quester.\n"))
        ad.quest.killTriggers()
    else
        send(f("pq {command}"), false)
    end
end

-- Helper function to parse commands and expand directions like "5s" to "s, s, s, s, s"
function ad.quest.parseDirections(dirs)
    local parsed = {}
    for dir in dirs:gmatch("[^,]+") do
        dir = dir:match("^%s*(.-)%s*$") -- Trim spaces
        local count, command = dir:match("^(%d+)(%a+)$") -- Match a number followed by letters
        if count and command then
            for _ = 1, tonumber(count) do
                table.insert(parsed, command)
            end
        else
            -- Add ;look if it starts with "open"
            if dir:match("^open") then
                dir = dir .. ";look"
            end
            table.insert(parsed, dir)
        end
    end
    return parsed
end

function ad.quest.buildareaPath(fromArea, questArea, targetRoom)
    -- Check for gmcp.char_data (example structure, replace as necessary for your actual gmcp data)
    if not gmcp or not gmcp.login_data then
        hecho(f("\n{ad.colors.lightBlack}[ AUTODARK ] - {ad.colors.lightRed}Error:#r GMCP isn't enabled.\n"))
        return
    end
    
    if gmcp.login_data.kingdom ~= nil then
        ad.quest.base = gmcp.login_data.kingdom
    elseif gmcp.login_data.clan ~= nil then
        ad.quest.base = gmcp.login_data.clan
    else
        hecho(f("\n{ad.colors.lightBlack}[ AUTODARK ] - {ad.colors.lightRed}Error:#r Couldn't find clan\kingdom paths.\n"))
        return
    end
    
     -- Retrieve the starting path from basePaths
    local startPath = nil
    if basePaths[ad.quest.base] and basePaths[ad.quest.base][fromArea] then
        startPath = basePaths[ad.quest.base][fromArea]
    else
        hecho(f("\n{ad.colors.lightBlack}[ AUTODARK ] - {ad.colors.lightRed}Error:#r Couldn't find clan\kingdom paths.\n"))
        return
    end

    -- Retrieve the quest area details from questAreas
    local questDetails = questAreas[questArea]
    if not questDetails then
        hecho(f("\n{ad.colors.lightBlack}[ AUTODARK ] -#r Quest area not found.\n"))
        local questData = f("{ad.colors.lightBlack}[ AUTODARK ] - {ad.colors.red}AREA NOT FOUND:#r {ad.quest.tempArea}, {ad.quest.tempRoom}\n")
        hecho("chat", questData)
        hecho("chatBuffer", questData)
        tempTimer(math.random(11, 24), [[ send("pq clear") ]])
        tempTimer(math.random(87, 129), [[ ad.quest.processCommands("start") ]])
        return
    end

    local areaPath = questDetails.dirs
    local roomPath = questDetails.rooms[targetRoom]
    if not roomPath then
        hecho(f("\n{ad.colors.lightBlack}[ AUTODARK ] -#r Quest room not found.\n"))
        local questData = f("{ad.colors.lightBlack}[ AUTODARK ] - {ad.colors.red}ROOM NOT FOUND:#r {ad.quest.tempArea}, {ad.quest.tempRoom}\n")
        hecho("chat", questData)
        hecho("chatBuffer", questData)
        tempTimer(math.random(11, 24), [[ send("pq clear") ]])
        tempTimer(math.random(87, 129), [[ ad.quest.processCommands("start") ]])
        return
    end

    -- Combine and parse all paths into a single sequence
    ad.quest.tempPath = {}
    for _, section in ipairs({startPath, areaPath, roomPath}) do
        for _, dir in ipairs(ad.quest.parseDirections(section)) do
            table.insert(ad.quest.tempPath, dir)
        end
    end
    
    ad.quest.returnPath = {}
    for _, dir in ipairs(ad.quest.parseDirections(basePaths[ad.quest.base]["Return"])) do
        table.insert(ad.quest.returnPath, dir)
    end
    
    ad.quest.tries = 1
    hecho(f("\n{ad.colors.lightBlack}[ AUTODARK ] -#r Quest area and room found, proceeding.\n"))
    local questData = f("{ad.colors.lightBlack}[ AUTODARK ] -#r FOUND: {questArea}, {targetRoom}\n")
    hecho("chat", questData)
    hecho("chatBuffer", questData)
    ad.affects.respellHandler()
    ad.quest.nextStep()
end

-- Handle the next step in the questing path
function ad.quest.nextStep()
    if #ad.quest.tempPath > 0 then
        ad.quest.prevStep = table.remove(ad.quest.tempPath, 1)
        enableTrigger(ad.quest.trigger.roomExits)
        if ad.quest.prevstep == "respell" then
            send("af")
            ad.affects.respell("respell")
            send("look")
        else
            send(ad.quest.prevStep)
        end
    else
        if not ad.quest.finish then
            hecho(f("\n{ad.colors.lightBlack}[ AUTODARK ] -#r Area searched, no item found...\n"))
        else
            ad.quest.finishKillTriggers()
            enableTrigger(ad.quest.trigger.completed)
            send("pq complete;af", false)
            --send("ride charger", false)
        end
    end
end

-- Reset the previous step to the start of the tempPath
function ad.quest.resetStep()
    if ad.quest.prevStep then
        table.insert(ad.quest.tempPath, 1, ad.quest.prevStep)
        ad.quest.prevStep = nil
        local hp = gmcp.char_data.hp / gmcp.char_data.max_hp
        local mv = gmcp.char_data.move / gmcp.char_data.max_move
        if hp > .5 and mv > .25 then
            ad.quest.nextStep()
        else
            hecho(f("{ad.colors.lightBlack}[ AUTODARK ] -#r Something isn't right... let's recall and stop.\n"))
            ad.quest.killTriggers()
            send("recall;recall;recall")
        end
    else
        hecho(f("{ad.colors.lightBlack}[ AUTODARK ] - {ad.colors.lightRed}Error:#r No previous step to reset.\n"))
    end
end

-- Add an item to the current room's item list
function ad.quest.checkItem(item)
    if item == string.title(ad.quest.tempItem) then
        disableTrigger(ad.quest.trigger.roomEnd)
        disableTrigger(ad.quest.trigger.roomItems)
        enableTrigger(ad.quest.trigger.noStealing)
        enableTrigger(ad.quest.trigger.itemNotHere)
        enableTrigger(ad.quest.trigger.gotItem)
        hecho(f("\n{ad.colors.lightBlack}[ AUTODARK ] -#r Item found, attempting retrieval.\n"))
        send(f("get {ad.quest.questItems[ad.quest.tempItem]}"), false)
    else
        ad.quest.itemFound = false
    end
end

function ad.quest.finishKillTriggers()
    disableTrigger(ad.quest.trigger.request)
    disableTrigger(ad.quest.trigger.target)
    disableTrigger(ad.quest.trigger.location)
    disableTrigger(ad.quest.trigger.clear)
    disableTrigger(ad.quest.trigger.fail)
    disableTrigger(ad.quest.trigger.later)
    disableTrigger(ad.quest.trigger.roomExits)
    disableTrigger(ad.quest.trigger.roomItems)
    disableTrigger(ad.quest.trigger.roomEnd)
    disableTrigger(ad.quest.trigger.noStealing)
    disableTrigger(ad.quest.trigger.itemNotHere)
    disableTrigger(ad.quest.trigger.gotItem)
    disableTrigger(ad.quest.trigger.recallFail)
    disableTrigger(ad.quest.trigger.recallSuccess)
    disableTrigger("ad.quest.trigger.fleeFail")
    disableTrigger(ad.quest.trigger.fleeSuccess)
    disableTrigger(ad.quest.trigger.forsaken)
end

function ad.quest.killTriggers()
    disableTrigger(ad.quest.trigger.request)
    disableTrigger(ad.quest.trigger.target)
    disableTrigger(ad.quest.trigger.location)
    disableTrigger(ad.quest.trigger.clear)
    disableTrigger(ad.quest.trigger.again)
    disableTrigger(ad.quest.trigger.fail)
    disableTrigger(ad.quest.trigger.later)
    disableTrigger(ad.quest.trigger.roomExits)
    disableTrigger(ad.quest.trigger.roomItems)
    disableTrigger(ad.quest.trigger.roomEnd)
    disableTrigger(ad.quest.trigger.noStealing)
    disableTrigger(ad.quest.trigger.itemNotHere)
    disableTrigger(ad.quest.trigger.gotItem)
    disableTrigger(ad.quest.trigger.completed)
    disableTrigger(ad.quest.trigger.recallFail)
    disableTrigger(ad.quest.trigger.recallSuccess)
    disableTrigger("ad.quest.trigger.fleeFail")
    disableTrigger(ad.quest.trigger.fleeSuccess)
    disableTrigger(ad.quest.trigger.forsaken)
end