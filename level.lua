ad.level = ad.level or { trigger = {}, alias = {}, tempArea = nil }

ad.level.areas = {
    -- Ghost Lake area
    ghostlake = {
        name = "Ghost Lake",
        directions = "Crossroads - 3w,nw,2n,4w,2s,sw,8w,2s,sw",
        levels = "43-51",
        path = {
            "sw","nw","n","d","n","n","w","e","e","n","w","w","w","n","e","e","e","e","e","ne","w",
            "w","w","w","w","w","n","e","e","e","e","e","e","n","w","w","w","w","w","w","w","nw",
            "e","e","e","e","e","e","e","e","e","n","w","w","w","w","w","w","w","w","w","n","e","e",
            "e","e","e","e","e","e","w","w","n","w","w","w","w","w","e","ne","e","e","s","s","s",
            "s","s","s","s","s","s","s","w","s","s","u","s","se","ne",
        },
        mobs = {
            fem = "A female ghost is here, singing a ghostly serenade.",
            mal = "A male ghost is here, tending to their business.",
        },
        check = {
            "sw;where ghost","ne",
        },
    },
    
    -- The Dreadwood Forest area
    dreadwood = {
        name = "The Dreadwood Forest",
        directions = "Tropica dock - 2se,3s,2sw,w,sw,3s,sw,5w,nw,2n,ne,2n,3sw,3w",
        levels = "38-51",
        path = {
            "n","n","w","nw","w","w","e","nw","w","w","w","sw","ne","e","e","e","se","ne","e","se",
            "ne","e","se","e","w","ne","e","e","e","se","nw","w","w","w","sw","w","sw","sw","s",
        },
        mobs = {
            warrior = "Lumbering along before you is a large bipedal bear, snarling and growling at your presence.",
            tracker = "An agile bipedal bear, sneaks about the forest, quietly watching and waiting.",
        },
        check = {
            "n;where warrior","s",
        },
    },
    
    -- The Fissure area
    fissure = {
        name = "The Fissure",
        directions = "Althainia dock - w,2s,11w,u",
        levels = "25-35",
        path = {
            "enter fissure","d","d","s","s","n","n","n","n","n","ne","n","n","s","s","sw","s","s",
            "s","u","u","u",
        },
        mobs = {
            ikhthye = "A white-spotted ikhthyes is here, swimming within the powerful current.",
            ikhthy = "A black-spotted ikhthyes is here, swimming within the powerful current.",
        },
        check = {
            "enter fissure;where ikhthye","u",
        },
    },
    
    -- New Zyra area
    newzyra = {
        name = "New Zyra",
        directions = "Tropica dock - sw,2w,se",
        levels = "30-35",
        path = {
            "nw","n","u","u","s","n","w","e","n","s","e","e","se","nw","ne","sw","n","n","n","s",
            "w","n","u","u","d","d","s","d","w","n","s","s","n","w","w","s","n","n","n","e","w","w",
            "e","s","s","open west;w","w","e","s","w","w","e","e","n","e","e","e","e","u","e","s",
            "s","w","w","u","e","s","w","n","d","d","d","s","se",
        },
        mobs = {
            jaguar = "A spotted jaguar slinks around here.",
            boa = "A long boa constrictor sleeps here in a coil.",
            bird = "A bird of paradise shrieks harshly from its branch.",
            sloth = "A two-toed sloth hangs from a nearby tree branch and peers lazily at you.",
            toucan = "A black and red toucan is here, peering at you from the treetops.",
        },
        check = {
            "nw;where sloth","se",
        },
    },
    
    -- The Bastille area
    bastille = {
        name = "The Bastille",
        directions = "Arkane dock - 5e,2s",
        levels = "15-20",
        path = {
            "w","w","open north;n","s","open south;s","w","w","w","s","ne","n","ne",
            "unlock down;open down;d","unlock north;open north;n","unlock east;open east;e","w",
            "unlock west;open west;w","e","unlock north;open north;n","s","s","e",
            "unlock down;open down;d","u","w","u","sw","s","e","e","n","open northeast;ne","u","d",
            "sw","unlock southeast;open southeast;se","u","d","nw","e",
            "e;drop 10 cross;drop 10 halberd;drop 10 scourge",
        },
        mobs = {
            woman = "A servant woman wanders around here.",
            cook = "A fairly large woman stands here.",
            gua = "A Marauder guard stands on duty here.",
            guar = "A Marauder guard is sitting here.",
            guard = "A fairly large Marauder guard sits here playing cards.",
            marauder = "A fairly large Marauder guard is sleeping here.",
            mara = "A Marauder Sergeant is here.",
            liber = "A Sons of Liberty soldier is tied to the rack.",
            liberty = "A Son of Liberty soldier is shackled here.",
            tortur = "The torturer of the Marauders stands here.",
            wom = "A young woman lies here shackled.",
            boy = "A small boy sits here weeping.",
            man = "An old man sits here shackled.",
        },
        check = {
            "w;where guard","e",
        },
    },
    
    -- The Venerable Forest area
    yeti = {
        name = "The Venerable Forest (Yetis)",
        directions = "Icewall dock - 2n",
        levels = "45-51",
        path = {
            "open east;e","e","e","e","e","e","e","e","e","e","s","w","w","w","w","w","w","w","w",
            "w","s","e","e","e","e","e","e","e","e","e","s","w","w","w","w","w","w","w","w","w","s",
            "e","e","e","e","e","e","e","e","e","s","w","w","w","w","w","w","w","w","w","s","e","e",
            "e","e","e","e","e","e","e","s","w","w","w","w","w","w","w","w","w","s","e","e","e","e",
            "e","e","e","e","e","nw","nw","nw","nw","nw","nw","nw","nw","w","open west;w",
        },
        mobs = {
            yeti = "A large Yeti stands here trying to blend into its surroundings.",
        },
        check = {
            "open e;e;where yeti","w",
        },
    },
    
    -- The Crystal Bay area
    crystalbay = {
        name = "The Crystal Bay",
        directions = "Tropica Dock - sw,w,nw,w,nw,w",
        levels = "38-43",
        path = {
            "s","s","se","se","se","se","sw","sw","sw","sw","nw","sw","s","n","ne","nw","nw","nw",
            "ne","ne","nw","se","sw","sw","se","se","se","se","ne","ne","ne","ne","nw","nw","nw",
            "nw","n","n"
        },
        mobs = {
            crab = "A large red crab sits here.",
            fish = "A large fisherman stands here fishing.",
            clam = "A small clam is laying here in the sand.",
            man = "A charmed man stands here gazing into nothingness.",
            sea = "A sea-worn fisherman rests here.",
        },
        check = {
            "s;where fisherman","n",
        },
    },
    
    -- The Bloodshackle area
    bloodshackle = {
        name = "The Bloodshackle Fortress",
        directions = "Arkane dock - ne,n,ne,nw,n,ne,e",
        levels = "10-25",
        path = {
            "s","s","w","w","n","s","e","e","e","e","n","s","s","w","w","w","w","s","open west;w",
            "n","n","s","s","e","e","e","e","e","w","w","s","w","w","w","w","n","n","n","n","u","s",
            "s","s","s","e","e","e","e","e","e","e","e","n","n","n","n","d","s","s","s","s","w","w",
            "w","w","d","w","w","w","w","open north;open south;n","n","n","e","w","s","s","s","s",
            "s","s","n","n","n","e","open north;open south;n","n","e","s","w","s","s","s","s","e",
            "w","n","n","n","e","e","open north;open south;n","n","n","w","e","s","s","s","s","s",
            "w","n","e","n","e","e","open north;open south;n","n","e","s","w","s","s","s","s","e",
            "w","n","n","n","e","e","open north;open south;n","n","n","w","e","s","s","s","s","s",
            "w","n","e","n","e","open north;open south;n","n","n","s","s","s","s","s","s","w","e",
            "n","n","n","w","w","w","w","u","n","n","n",	
        },
        mobs = {
            filth = "A filthy slave is here, glad to be unloaded from the ship.",
            book = "A half elf with a book records slaves coming in and being traded.",
            slaver = "a pirate slaver, right here.",
            brute = "A hulking Bloodshackle brute is here.",
            merch = "A wealthy slave merchant is here.",
            yellow = "A slaver wearing a yellow sash is here.",
            red = "A slaver wearing a red sash is here.",
            green = "A slaver is here wearing a green sash.",
            blue = "A slaver is here wearing a blue sash.",
            white = "A slaver is here wearing a white sash.",
            guard = "A Bloodshackle prison guard is here.",
            bowm = "A bowman slaver is here keeping an eye out for troublesome slaves.",
            elite = "A Bloodshackle elite guard is here.",
            gnome = "A tinker gnome slave is here.",
            sea = "A sea elf slave is here.",
            mul = "An enslaved mul thief is here.",
            shaman = "A shaman slave is here.",
            angry = "An angry ogre slave is here thrashing about.",
            giant = "A giant ogre slave is here.",
            gladi = "An enslaved gladiator is here.",
            wemic = "A wemic slave is here.",
            hobgob = "An enslaved hobgoblin is here.",
            young = "An enslaved young human is here.",
            half = "A half elven slave is here.",
            old = "An old human slave is here.",
            dwarf = "A stout hill dwarf slave is here.",
            strap = "A strapping human slave is here.",
            felar = "A felar slave is here.",
            chain = "A heavily chained half-ogre slave is here.",
            mage = "An enslaved mage is here.",
            cannibal = "An enslaved tribal cannibal is here.",
            kobol = "A muzzled kobold slave is here.",
            wild = "An enslaved wild elf is here.",		
        },
        check = {
            "s;where filth","n",
        },
    },
    
    -- Winterhaven Funeral Home area
    winterhaven = {
        name = "Winterhaven Funeral Home",
        directions = "Arkane dock - 6e,ne,n,nw,2e,ne,n,3e",
        levels = "30-40",
        path = {
            "s","sw","se","sw","s","open south;s","s","w","w","e","e","e","e","w","w","s","s","w",
            "w","e","e","e","e","w","w","s","s","w","w","take all urn;e","e","e","e","w","w",
            "unlock south;open south;s","s","d","n","w","e","e","w","n","w","e","e","w","n","w","e",
            "e","w","n","w","e","e","w","open north;north;open down;d","s","e","e","e","s","s","w",
            "w","w","w","w","w","n","n","e","e","e","n","u","s","s","s","s","s","u","n","n","n","n",
            "n","n","n","n","n","ne","nw","ne","n",
        },
        mobs = {
              recept = "The spirit of a receptionist is here, busily writing on scrolls.",
              widow = "The spirit of a grieving widow is here.",
              male = "The spirit of a male mourner is here, his head bowed in silence.",
              female = "The spirit of a female mourner is here, quietly weeping.",
              mort = "The spirit of an apprentice mortician is here.",
              leech = "A black leech slithers along the sewer wall, engorged with blood.",
        },
        check = {
            "s;where recept","n",
        },
    },
    
    -- Within the Great Tree area
    greattree = {
        name = "Within the Great Tree",
        directions = "Arkane dock - ne,n,ne,nw,n,ne,2e",
        levels = "23-30",
        path = {
            "u","u","nw","ne","se","u","sw","nw","ne","u","sw","w","sw","ne","nw","se","e","ne",
            "se","e","ne","sw","se","nw","w","sw","nw","ne","d","sw","d","se","d","d",
        },
        mobs = {
            squirrel = "An enlarged squirrel scurries about here.",
            wren = "An enormous wren flits about the branches.",
            chipmunk = "An oversized chipmunk crouches here.",
            swallow = "An extremely large bird perches here.",
        },
        check = {
            "u;where wren","d",
        },
    },
    
    -- The Hedgemaze area
    hedgemaze = {
        name = "The Hedgemaze",
        directions = "Crossroads - 3w,nw,2n,4w,2s,sw,8w,2n,e,2n,w,n",
        levels = "15-25",
        path = {
            "u","n","n","e","e","e","w","w","w","w","w","w","n","n","n","e","n","w","n","n","n","e",
            "e","s","w","s","s","e","s","s","w","s","s","e","e","e","n","w","n","e","e","n","n","w",
            "w","n","w","n","n","n","e","s","s","e","e","n","w","n","n","e","e","s","s","w","n","n",
            "n","e","e","e","n","w","e","s","w","w","w","s","s","s","e","n","n","w","w","s","s","e",
            "s","w","w","n","n","w","s","s","s","e","s","e","e","s","s","w","w","s","e","s","w","w",
            "w","n","n","e","n","n","w","n","n","e","n","w","w","s","s","s","e","s","w","s","s","s",
            "e","e","e","e","e","e","w","w","w","s","s","d"
        },
        mobs = {
            bluebird = "A bluebird flies about here.",
            man = "A confused looking man wanders here.",
            woman = "A woman wanders here, looking lost.",
            --follower = "A Zandreyan follower wanders here.",    
        },
        check = {
            "u","n;where bluebird","s","d",
        },
    },
    
    -- The Hedgemaze area, Bluebirds only
    bluebird = {
        name = "The Hedgemaze (Bluebirds only)",
        directions = "Crossroads - 3w,nw,2n,4w,2s,sw,8w,2n,e,2n,w,n",
        levels = "12-17",
        path = {
            "u","n","n","e","e","e","w","w","w","w","w","w","n","n","n","e","n","w","n","n","n","e",
            "e","s","w","s","s","e","s","s","w","s","s","e","e","e","n","w","n","e","e","n","n","w",
            "w","n","w","n","n","n","e","s","s","e","e","n","w","n","n","e","e","s","s","w","n","n",
            "n","e","e","e","n","w","e","s","w","w","w","s","s","s","e","n","n","w","w","s","s","e",
            "s","w","w","n","n","w","s","s","s","e","s","e","e","s","s","w","w","s","e","s","w","w",
            "w","n","n","e","n","n","w","n","n","e","n","w","w","s","s","s","e","s","w","s","s","s",
            "e","e","e","e","e","e","w","w","w","s","s","d"
        },
        mobs = {
            bluebird = "A bluebird flies about here.",
        },
        check = {
            "u","n;where bluebird","s","d",
        },
    },
    
    -- Centaur Village area, Weeds
    weeds = {
        name = "Centaur Village (Weeds)",
        directions = "Arkane dock - 6e,se,s,se,6e,ne,n,ne,4e,n",
        levels = "5-12",
        path = {
            "s","e","n","n","w","e","e","n","w","w","n","n","w","n","e","e","open east;e","w","w",
            "n","open north;n","n","n","n","s","s","s","s","s","s","s","s","e","e","s","w","s","s",
            "w","n",
        },
        mobs = {
            weed = "A small prickly weed shoots up from the ground.",
            ranger = "A centaur ranger eyes you warily.",
            cent = "A pretty centaur filly giggles with her friends. ",
            polo = "A young centaur polo player runs past, sweating profusely. ",
            centaur = "An ornery centaur warrior glares at you as he flexes his bow.",
            elder = "A smiling elderly centaur stands here, dusting the counter.",
            drunk = "A drunken centaur has passed out on a table.",
            bartender = "A surly centaur bartender glares at you. ",
        },
        check = {
            "s","e","n;where weed","s","w","n",
        },        
    },
    
    -- Centaur Village area, Centaurs
    centaurs = {
        name = "Centaur Village (Centaurs)",
        directions = "Arkane dock - 6e,se,s,se,6e,ne,n,ne,4e,n",
        levels = "9-15",
        path = {
            "s","e","n","n","w","e","e","n","w","w","n","n","n","n","open north;n","n","n","n","s",
            "s","s","s","s","e","open east;e","w","w","w","s","e","s","s","e","e","s","w","s","s",
            "w","n",
        },
        mobs = {
            ranger = "A centaur ranger eyes you warily.",
            drunk = "A drunken centaur has passed out on a table.",
            cent = "A pretty centaur filly giggles with her friends. ",
            polo = "A young centaur polo player runs past, sweating profusely. ",
            warrior = "An ornery centaur warrior glares at you as he flexes his bow.",
            elder = "A smiling elderly centaur stands here, dusting the counter.",
            centaur = "A surly centaur bartender glares at you. ",
        },
        check = {
            "s","e","n;where polo","s","w","n",
        },
    },
    
    -- The Hidden Temple of Evil area
    toe = {
        name = "The Hidden Temple of Evil",
        directions = "Arkane dock - 6e,ne,n,ne,2e,ne,9n,e",
        levels = "17-25",
        path = {
            "w","s","s","s","s;open west","w","u","n","e","w","n","w","w","e","e","e","e","w",
            "w;unlock north;open north","n","w","e","e","w","u","d","n","n","s","w","w","n","s","e",
            "e","s;unlock south;open south","s","s","s","d;open east","e","n","n","n","n","e",
        },
        mobs = {
            pilgrim = "A lonely figure walks along the steps, searching for salvation.",
            acolyte = "A young priest in training walks by you.",
            acol = "An acolyte is here, fighting YOU!",
            plant = "A large plant sits here, soaking up nutrients.",
            demon = "A hair covered demon sits here, howling into the darkness.",
            guard = "A temple guard is here, patrolling the grounds.",
            gua = "A demonic looking guard stands here.",
        },
        check = {
            "w;where pilgrim","e",
        },
    },
    
    -- The Sh'lanira Trench area
    trench = {
        name = "The Sh'lanira Trench",
        directions = "The bottom and northern most room with exits Up and South",
        levels = "43-51",
        path = {
          "s","s","s","e","s","s","w","w","n","n","se","u","u","n","e","s","s","w","w","n","n",
          "nw;nw","n","n","s","s","se;se","s","s","e","e","n","n","w","s","d","d","ne","s","s","w",
          "w","n","n","e","n","n","n",
        },
        mobs = {
            yellow = "A yellowish tube worm is here lapping up gunk out of the water.",
            purple = "A purple tube worm is here lapping up gunk out of the water.",
            clam = "A giant white clam rests here pondering its calamity.",
            ball = "A ball of light draws your attention as it bounces up and down before you.",
        },
        check = {
            "s;where yellow","n",
        },
    },
    
    -- Yaenni Refuge area
    yaennirefuge = {
        name = "Yaenni Refuge",
        directions = "Icewall dock - 2nw,2w,nw,n,nw,n,nw,n,nw,w,nw,n,nw,w,2n,ne,6e,se,2e,4s,w,s,e,3s,d,9s,sw",					
        levels = "15-30",
        path = {
            "open north;n","n","n","e","open east;e","s","n","w","n","w","s","w","w","e","n","n",
            "w","open west;w","e","e","e","e","s","e","e","e","s","n","e","w","n","n","e","w","n",
            "n","n","e","w","w","w","n","n","e","w","n","s","w","w","w","w","w","w","open south;s",
            "n","e","e","s","s","s","w","e","n","e","e","e","w","s","s","s","s","s","s","s",
            "open south;s",
        },
        mobs = {
            guard = "A large, armed yinn stands guard here.",
            elder = "An elderly yinn stands here.",
            woman = "A yinn woman walks about here.",
            male = "A male yinn stands here.",
            butcher = "A yinn butcher is here, cleaving meat.",
            leader = "The yinn leader is here, resting on a pile of furs.",
        },
        check = {
            "open north;n;where guard","s",
        },
    },
    
    -- The Training Ground area
    trainingground = {
        name = "The Training Ground",
        directions = "Arkane dock - 6e,se,s,se,2e,se,8s,w,sw,s,2w,2s,e,n,2e,3s,3e,4n,ne",
        levels = "5-15",
        path = {
            "n","w","w","e","e","e","e","n","w","w","w","w","n","e","e","e","e","n","w","w","w","w",
            "n","e","e","e","e","w","w","s","s","s","s","s",
        },
        mobs = {
            green = "A practice dummy wearing green clothing is affixed to a pole here.",
            yellow = "A practice dummy wearing yellow clothing is affixed to a pole here.",
            red = "A practice dummy wearing red clothing is affixed to a pole here.",
            purple = "A practice dummy wearing purple clothing is affixed to a pole here.",
            black = "A practice dummy wearing black clothing is affixed to a pole here.",
            white = "A recruit with a white sash is here, training.",
            cyan = "A recruit with a cyan sash is here, training.",
            blue = "A recruit with a blue sash is here, training.",
            jade = "A recruit with a jade sash is here, training.",
            brown = "A recruit with a long sash is here, training.",
            magenta = "A recruit with a magenta sash is here, training.",
        },
        check = {
            "n;where green","s",
        },
    },
    
    -- Asylum area
    asylum = {
        name = "Asylum",
        directions = "Crossroads - 4s,2e,s,2e,d,w,s,2d,w,s,3w,3n",
        levels = "25-33",
        path = {
            "e","u","u","open north;n","w","w","w","w","w","open north;n","open south;s","e",
            "open north;n","open south;s","e","open north;n","open south;s","e","open north;n",
            "open south;s","e","open north;n","open south;s","e","e","open north;n","open south;s",
            "e","open north;n","open south;s","e","open north;n","open south;s","e","open north;n",
            "open south;s","e","open north;n","open south;s","w","w","w","w","w","open north;n","d",
            "open south;s","nw","nw","nw","open north;n","u","u","open west;w","open west;w","e",
            "n","open east;e","open west;w","n","open west;w","e","n","s","s","s","open east;e","u",
            "open north;n","n","n","e","open north;n","s","open east;e","open west;w",
            "open south;s","open north;n","w","n","east","open north;n","open south;s",
            "open east;e","open west;w","open south;s","open north;n","w","w","open north;n",
            "open south;s","open west;w","open east;e","open south;s","open north;n","e","s","s",
            "s","open south ;s","d","d","open south;s","open south;s","d","d","open west;w",
        },
        mobs = {
            office = "A distinguished looking elven woman stands here.",
            half = "A raving half elf is sitting cross legged in the center of the room.",
            sea = "An insane Sea-elf is dangling from the ceiling, bound in shackles.",
            janitor = "A dark elvish man wanders around cleaning up.",
            male = "A male Shalonesti elf is shackled to the floor.",
            female = "A female Shalonesti elf is curled up in the corner.",
            fem = "A female wild elf is curled up in the corner.",
            wild = "A wild elf is shackled to the wall.",
            cleric = "A heavily robed cleric roams the halls.",
        },
        check = {
            "e;where half","w",
        },
    },
    
    -- Algoron Threadworks area
    threadworks = {
        name = "Algoron Threadworks",
        directions = "Shokono port - 6w,6s,3w,2s,se,ne,e",
        levels = "43-51",
        path = {
            "e","se","e","se","e","e","e","se","se","e","e","ne","ne","n","nw","n","n","n","n","ne",
            "e","e","se","s","s","s","s","sw","s","sw","sw","w","w","nw","nw","w","w","w","nw","w",
            "nw","w"
        },
        mobs = {
            gnome = "A tinkergnome businessman is here checking vendor passes.",
            vend = "A thread vendor dressed in an exquisitely woven kimono walks past.",
        },
        check = {
            "e;where vend","w",
        },
    },
    
    -- Jixpk Village area
    jixpk = {
        name = "Jixpk Village",
        directions = "Icewall dock - 6n,2nw,w,2n,nw,2w,nw,2w,3n,4e",
        levels = "30-40",
        path = {
            "e","e","open east;e","e","e","e","s","s","s","w","w","w","w","e","n","n","n",
            "open west;w","w","w",
        },
        mobs = {
            child = "A young minotaur child plays with a wooden sword.",
            mino = "A strong minotaur tends to his duties.",
            elder = "An aged minotaur stands here lecturing about being a minotaur.",
            minot = "A minotaur youth surveys the area.",
            minota = "A small minotaur child with rusty fur plays with some sticks.",
            youth = "A rather young minotaur youth runs some errands."
        },
        check = {
            "e;where youth","w",
        },
    },
    
    -- Silversand Garrison area
    silversand = {
        name = "Silversand Garrison",
        directions = "Althainia dock - w,2s,4w,sw,3s,sw,3s,w,s,sw",
        levels = "45-51",
        path = {
            "e","unlock north; open north;n","w","e","n","s","e","w","u","d",
            "s","w",
        },
        mobs = {
            sold = "A soldier of Silversand Garrison is here.",
            longb = "A Silversand longbowman is here.",
            senti = "A Silversand sentinel is patrolling here."
        },
        check = {
            "e;where soldier","w",
        },
    },
    
    -- Silversand Garrison area, Soldiers only
    silversoldier = {
        name = "Silversand Garrison (Soldiers only)",
        directions = "Althainia dock - w,2s,4w,sw,3s,sw,3s,w,s,sw",
        levels = "43-48",
        path = {
            "e","unlock north;open north;n","w","e","n","s","e","w","u","d",
            "s","w",
        },
        mobs = {
            sold = "A soldier of Silversand Garrison is here.",
        },
        check = {
            "e;where soldier","w",
        },
    },
    
    -- Temple of Good area
    tog = {
        name = "Temple of Good",
        directions = "Tropica dock - 2sw,3s,2sw,w,sw,3s,sw,3w",
        levels = "23-30",
        path = {
            "n","n","d","n","n","unlock north;open north;north","w","w","n","n","n","n","e","e","e",
            "e","s","s","s","s","w","w","n","n","w","e","e","w","n","s","s","s","s","s","s","u","s",
            "s",
        },
        mobs = {
            kanti = "A follower of Kantilles is wandering around here.",
            nadri = "A follower of Nadrik is here.",
            kadiy = "A follower of Kadiya is walking around here.",
            aust = "A follower of Austinian is wandering around here.",
            sicc = "A follower of Siccara is here.",
            tali = "A follower of Taliena is walking around here."
        },
        check = {
            "n;where kanti","s",
        },
    },
    
    -- Ancient Forest area, Sasquatch only
    sassies = {
        name = "The Ancient Forest (Sasquatch)",
        directions = "Arkane dock - 6e,se,s,se,6e,ne,n,ne,3e,22n",
        levels = "45-51",
        path = {
            "open west;w","w","n","w","w","w","nw","e","e","e","n","w","w","w","ne","e","e","e",
            "n","w","w","w","nw","n","ne","e","e","se","w","w","w","s","e","e","e","e","e","ne",
            "ne","e","se","w","w","sw","e","e","e","e","sw","sw","w","nw","w","e","e","e","n","w",
            "w","w","w","w","w","s","s","s","s","s","e","s","e","open east;e",
        },
        mobs = {
            sasquatch = "A large furred creature tries to hide in the forest.",
        },
        check = {
            "open west;w;where sasquath","e",
        },
    },
    
    -- Glonnoil Fjord area
    fjord = {
        name = "Glonnoil Fjord",
        directions = "Entrance of the hole. East and northwest of the Dock of the Crystal Spire.",
        levels = "43-51",
        path = {
            "e","ne","w","w","w","nw","e","e","e","e","e","e","e","e","e","n","w","w","w","w","w",
            "w","w","w","w","n","e","e","nw","w","w","nw","e","e","e","e","e","se","s","se","e",
            "ne","e","e","e","ne","nw","s","nw","s","nw","s","nw","s","nw","w","nw","w","w","w","w",
            "ne","e","e","e","e","se","e","e","e","n","n","sw","n","sw","n","sw","n","nw","ne","ne",
            "nw","nw","sw","e","se","w","w","w","se","e","s","sw","w","w","w","w","se","s","s","s",
            "s","s","s","s","se",
        },
        mobs = {
            salmon = "A king salmon swims through the water.",
            selkie = "A selkie swims about here.",
            bowhead = "A bowhead whale swims by near the surface.",
            killer = "A killer whales swims effortlessly here looking for food.",
        },
    },
    
    -- Gahboom Hill area
    gahboom = {
        name = "Gahboom Hill",
        directions = "Arkane dock - 5e,3s,w,2s,2w,4s,e,s,e,4n,3w",
        levels = "43-51",
        path = {
            "open north;n","n","se","se","e","nw","nw","e","e","s","s","e","w","n","n","w","w","se",
            "se","w","nw","nw","s","open south;s","pull flinger;open south;s","e","s","w","w","s",
            "e","e","n","w","w","n","e","open north;n","d;open east;e","e","n","e","e","e","s","w",
            "w","w","w","open west;w","d",
        },
        mobs = {
            excavator = "A gnome stone excavator is here.",
            heat = "A gnome in a protective heat suit is studying here.",
            hunter = "A gnome gem hunter is here.",
            janitor = "A tinker gnome janitor is picking up trash here.",
            student = "A gnome student is here.",
            instruct = "A gnome philosophy instructor is here.",
            mach = "A gnome machinist is here, replacing parts where needed.",
            arch = "A gnome is here, sketching out plans for new structures.",
            greas = "A gnome with a large paint brush and a can of grease is here, keeping the gears lubricated.",
        },
        check = {
            "where excavator;look",
        },
    },
    
    -- Gahboom Hill area, Philosophy Guild only
    philosophy = {
        name = "Gahboom Hill, Philosophy Guild only",
        directions = "Within Gahboom Hill, on the chainlink platform near Philosophy guild.",
        levels = "42-46",
        path = {
            "open e;e","e","n","e","e","e","s","w","w","w","w","open west;w",
        },
        mobs = {
            hunter = "A gnome gem hunter is here.",
            janitor = "A tinker gnome janitor is picking up trash here.",
            student = "A gnome student is here.",
            instruct = "A gnome philosophy instructor is here.",
        },
        check = {
            "where philo;look",
        },
    },
    
    -- Gahboom Hill area, Excavators only
    excavators = {
        name = "Gahboom Hill, Excavators only",
        directions = "Within Gahboom Hill, on the stone slab. Will do JUST the that floor.",
        levels = "43-51",
        path = {
            "open north;n","n","se","se","e","nw","nw","e","e","s","s","e","w","n","n","w","w","se",
            "se","w","nw","nw","s","open south;s;drop 10 pick;drop 10 pant",
        },
        mobs = {
            excavator = "A gnome stone excavator is here.",
            heat = "A gnome in a protective heat suit is studying here.",
        },
        check = {
            "where excavator;look",
        },
    },
    
    --The Gahboom Hill area, Bathers only
    gahbather = {
        name = "Gahboom Hill, Bath House",
        directions = "Arkane dock - 6e,3s,e,2s,2w,4s,e,s,e,4n,3w",
        levels = "40-48",
        path = {
            "s;se;e;open north;n;n;e;ne;n","w","open north;open southwest","nw","open southwest",
            "n","s","sw","se","open south","s","n","open northeast","ne",
            "e;s;sw;w;s;open south;s;w;nw;n",
        },
        mobs = {
            towel = "A gnome towel boy is here, nearly completely covered in towels of all sizes and color.",
            bath = "A beautiful gnome girl bather is here.",
            girl = "A gnome girl is here, floating on the water's surface.",
            male = "A male gnome bather is here.",
            bather = "A male gnome bather is here.",
        },
        check = {
            "s;where bather","n",
        },
    },
    
    -- Dwarven Training Camp area
    dwarventrain = {
        name = "Dwarven Training Camp",
        directions = "Althainia dock - 5w,nw,w,2nw,4w,s",
        levels = "1-15",
        path = {
            "d","d","d","open north;n","e","e","e","e","n","w","e","n","w","w","w","w","w","w","w",
            "w","s","e","w","s","e","e","e","e","u","e","e","e","e","n","w","w","w","w","w","w","w",
            "w","w","s","s","e","e","e","e","d","open south;s","u","u","u",
        },
        mobs = {
            guard = "A dwarven guard stands here, guarding the entrance.",
            sword = "A dwarven swordsman stands here prepared for battle.",
            cleric = "A dwarven cleric stands here tending the wounded.",
            pike = "A dwarvan pikeman stands here firmly gripping his pike.",
            axe = "A stout dwarf stands here, his hand tightly gripped around his axe.",
            scout = "A dwarven lass stands here, her eyes shifting about.",
            assassin = "A dark clad dwarven woman stands here, slipping in and out of the shadows.",
            mage = "A dwarven mage stands here crackling with energy.",
            crusader = "A dwarven crusader is here, resting upon his mount.",
            priest = "A heavily robed dwarven figure stands here, holding a book of prayers reverently in her hands.",
        },
        check = {
            "d;where sword","u",
        },
    },
    
    -- Arena of the Bull Dancers area
    bullarena = {
        name = "Arena of the Bull Dancers",
        directions = "Crossroads - 3w,nw,2n,4w,2s,sw,8w,2n,e,2n",
        levels = "25-35",
        path = {
            "e","e","e","e","e","e","e","e","u","n","n","n","n","n","sw","n","w","w","w","w","se",
            "w","s","s","s","s","ne","s","e","e","e","e","d","w;w;w;w;w;w;w;w"
        },
        mobs = {
            gobl = "A grotesque green goblin wanders around here.",
            huma = "A middle-aged man walks past.",
            elf = "A young elven man walks by.",
        },
        check = {
            "e;where human","w",
        },
    },
    
    -- Mystic Crystal Fields area
    crystfield = {
        name = "Mystic Crystal Fields",
        directions = "Arkane dock - 6e,se,s,se,6e,ne,n,ne,4e,n",
        levels = "5-12",
        path = {
            "e","e","e","e","n","n","n","n","se","w","u","nw","w","w","n","n","e","s","n","e","s",
            "s","se","ne","n","n","e","s","n","e","s","s","w","w","sw","sw","w","w","s","e","w","s",
            "e","e","n","n","ne","se","e","e","s","w","e","s","w","w","n","n","nw","d","w","w","w",
            "w","w",
        },
        mobs = {
            falcon = "A blue crystal falcon is here.",
            buffal = "A blue crystalline water buffalo is here.",
            kanga = "A crystalline kangaroo is here.",
            mystic = "A faerie mystic is here.",
            pegas = "A crystalline pegasus is here.",
            keeper = "A keeper of the blue crystal is here.",
            gopher = "A crystal gopher is here.",
            mant = "A red crystalline mantis is here.",
            snake = "A mystic crystal snake is here.",
            grass = "A giant crystal grasshopper is here.",
            humm = "A crystal hummingbird is here.",
            keeper = "A keeper of the red crystal is here.",
            beet = "A green crystal beetle is here.",
            biso = "A green crystal bison is here.",
            troll = "A crystalline troll is here.",
            flan = "A squishy crystal flan is here.",
            keeper = "A keeper of the green crystal is here.",
            centipe = "A yellow crystal centipede is here.",
            horn = "An angry crystal hornet is here.",
            flami = "A crystal flamingo is here.",
            unico = "A yellow crystal unicorn is here.",
            keepe = "A keeper of the yellow crystal is here.",
            scarec = "A crystal scarecrow is here.",
        },
        check = {
            "e;where falcon","w",
        },
    },
    
    -- The Sinkhole area
    sinkhole = {
        name = "The Sinkhole",
        directions = "Crossroads - w,u,2w,d,3n,2w,4n",
        levels = "35-43",
        path = {
            "e","d","e","s","d","n","sw","se","ne","nw","s","d","n","sw","se","ne","nw","s","d",
            "ne","w","se","d","e","d","d","u","u","w","u;u;u;u;n;w;u;w",
        },
        mobs = {
            gremlin = "An impish creature gnashes its teeth together as it looks at you and grins.",
        },
        check = {
            "e;d;where gremlin","u;w",
        },
    },
    
    -- A Rip in the Sky area
    rip = {
        name = "A Rip in the Sky",
        directions = "Althania dock - w,2s,7w",
        levels = "43-51",
        path = {
            "enter rip;n","e","e","e","w","w","w","w","w","w","e","u","e","e","e","e","w","w","u",
            "w","w","e","e","e","e","w","u","w","w","e","e","u","w","w","e","u","d","e","d",
            "d","w","d","w","w","d","e","e","dismount;s;d",
        },
        mobs = {
            diab = "A slender figure dances to an unheard reverie.",
        },
        check = {
            "enter rip;where diab","d",
        },
    },
    
    -- Amethyst Falls area
    fullamethyst = {
        name = "Amethyst Falls",
        directions = "Arkane dock - 6e,se,s,se,6e,ne,n,ne,11e,se,e,2ne,e,se,2e",
        levels = "32-36",
        path = {
            "n","e","e","n","nw","n","n","n","e","e","s","s","w","w","s","buy 2*breath;quaff breath;d","n","n",
            "w","w","s","s","w","e","u","w","w","e","e","e","e","sw","w","w","s","e","e","n","w",
            "n","quaff breath;d","e","nw","n","e","e","s","s","u","se","s","w",
            "w","s",
        },
        mobs = {
            slug = "A purple cave slug is here.",
            visitor = "A lost visitor is here.",
            bat = "An Amethyst Falls cave bat is here.",
            frog = "An Amethyst Falls cave frog is here.",
            ant = "A cave ant is here.",
            mosq = "An unacceptably large mosquito is here.",
            tourist = "A tourist is here.",
            cucumber = "A freshwater cave cucumber is here.",
            feeder = "A small mauve bottom feeder is here.",
            starfish = "A violet starfish is here.",
            coral = "A piece of amethyst coral is here.",
            arch = "An Amethyst Falls archaeologist is here.",
            bee = "A purple-striped bee is here.",
            owl = "An Amethyst Falls plains owl is here.",
            buffalo = "A purple-horned buffalo is here.",
            deer = "An Amethyst Falls deer is here.",
            fox = "An Amethyst Falls fox is here, begging for scraps.",
            cat = "A short-haired Amethyst Falls plains cat is here.",
            peacock = "A violet peacock is here.",
            artist = "An AFHS artist is here, painting portraits of tourists.",
        },
        check = {
            "n;where slug","s",
        },
    },
    
    -- Amethyst Falls area, No underwater mobs
    dryamethyst = {
        name = "Amethyst Falls, Dry land mobs only",
        directions = "Arkane dock - 6e,se,s,se,6e,ne,n,ne,11e,se,e,2ne,e,se,2e",
        levels = "32-36",
        path = {
            "n","e","e","n","nw","n","n","n","e","e","s","s","w","w","s","buy 2*breath;quaff breath;d","n","n",
            "w","w","s","s","w","e","u","w","w","e","e","e","e","sw","w","w","s","e","e","n","w",
            "n","quaff breath;d","e","nw","n","e","e","s","s","u","se","s","w",
            "w","s",
        },
        mobs = {
            slug = "A purple cave slug is here.",
            visitor = "A lost visitor is here.",
            bat = "An Amethyst Falls cave bat is here.",
            frog = "An Amethyst Falls cave frog is here.",
            ant = "A cave ant is here.",
            mosq = "An unacceptably large mosquito is here.",
            tourist = "A tourist is here.",
            arch = "An Amethyst Falls archaeologist is here.",
            bee = "A purple-striped bee is here.",
            owl = "An Amethyst Falls plains owl is here.",
            fox = "An Amethyst Falls fox is here, begging for scraps.",
            cat = "A short-haired Amethyst Falls plains cat is here.",
            peacock = "A violet peacock is here.",
            artist = "An AFHS artist is here, painting portraits of tourists.",
        },
        check = {
            "n;where slug","s",
        },
    },
    
    -- The Mud School area
    mudschool = {
        name = "The Mud School",
        directions = "Starting at Brahmens Training and Practice",
        levels = "1-5",
        path = {
            "e","n","n","e","e","open southeast;se","open northwest;nw","n","w","w","w","s","w",
            "open southwest;sw","open northeast;ne","n","n","open west;w","open east;e","e","e","e",
            "e","open east;e","open west;w","n","w","w","w","w","n","e","e","open north;n",
            "open south;s","e","e","open northeast;ne","nw","enter hole;look","d","se","se","nw",
            "ne","nw","ne","nw","sw","nw","sw","se","sw","se","sw","ne","se","ne","nw","d",
            "open north;n","open south;s","open northeast;ne","open southwest;sw","open east;e",
            "open west;w","open southeast;se","open northwest;nw","open south;s","open north;n",
            "open southwest;sw","open northeast;ne","open west;w","open east;e","open northwest;nw",
            "open southeast;se","u","u","nw","nw","open northwest;nw",
            "unlock northeast;open northeast;ne","enter hole;look","n","w",
        },
        mobs = {
            beast = "A caged beast is here, shackled to the wall.",
            mage = "A tinker gnome mage wanders here.",
            kender = "A curious looking kender stands here, staring at some shackles.",
            orc = "An orc stands here, firmly shackled to the wall.",
            ogre = "A large giant ogre stands here, staring at a sign.",
            topiary = "A topiary stands here.",
            wolf = "A gray wolf cub wanders here.",
            dwarf = "A gully dwarf rummages around here.",
            nymph = "A nymph flies about here.",
            boar = "A boar tries to run you over.",
            rabbit = "A rabbit is bouncing around here.",
            bear = "A bear is here growling at you.",
            lizard = "A small green lizard wanders here.",
            kobold = "A small kobold stands here waiting.",
            crusader = "A human crusader wanders here, noble and proud.",
            weasel = "A snow weasel scurries around here.",
            bard = "A human bard wanders here, strumming a lyre.",
            warrior = "A mountain dwarf warrior wanders here.",
            fox = "A fox is here staring at you.",
            cleric = "A shalonesti elf cleric wanders gracefully here.",
            thief = "A goblin thief skulks around in the shadows.",
            ranger = "A ranger wanders here, seeming lost.",
            bea = "A hideous beast is here, growling and snarling.",
        },
        check = {
            "e;where kobold","w",
        },
    },
    
    -- A Blazing Aurora area
    aurora = {
        name = "A Blazing Aurora",
        directions = "Arkane dock - 6e,ne,n,ne,2e,ne,7n,e,n",
        levels = "43-51",
        path = {
            "enter aurora","nw","nw","e","e","e","e","n","w","w","w","w","n","e","e","e","e","n",
            "w","w","w","w","n","n","e","e","e","e","n","w","w","w","w","n","e","e","e","e","n",
            "w","w","w","w","ne","se","se",
        },
        mobs = {
            seraph = "A seraphic witness searches out signs of the wicked and corrupt.",
        },
        check = {
            "enter aurora;where seraph","se",
        },
    },
    
    -- The Burial Grounds area
    burialgrounds = {
        name = "The Burial Grounds",
        directions = "Crossroads - w,u,2w,d,2s,se,n,nw",
        levels = "25-35",
        path = {
            "se","n","nw","nw","n","w","w","e","e","e","e","n","e","w","w","w","w","w","w","n","w",
            "e","e","e","e","e","e","e","e","w","n","w","w","w","w","w","w","e","n","e","e","e","e",
            "s","s","s","s","w","w","s","se","se","s","nw"
        },
        mobs = {
            warrior = "A ghostly apparition of a warrior floats here.",
   		    knight = "A ghostly apparition of a Knight floats here.",
   		    girl = "A ghostly apparition of a young girl floats here.",
   		    minotaur = "A ghostly apparition of a minotaur warrior floats here.",
   		    elf = "A ghostly apparition of a lost elf floats here.",
   		    male = "A ghostly apparition of a male aristocrat floats here.",
            female = "A ghostly apparition of a female aristrocrat floats here.",
   		    wraith = "A wraith floats here.",
        },
        check = {
            "se;where ghost", "nw",
        },
    },
}   -- End areas list

-- Create trigger if not already initialized
if not ad.level.trigger.roomExits then
    ad.level.trigger.roomExits = tempBeginOfLineTrigger(
        " [Exits: ",
        function()
            enableTrigger("ad.level.trigger.roomMobs")
            enableTrigger(ad.level.trigger.roomEnd)
            ad.level.mobsHere = {}
            disableTrigger(ad.level.trigger.roomExits)
        end
    )
end
disableTrigger(ad.level.trigger.roomExits)

-- Ensure the trigger is set up only once
if exists("ad.level.trigger.roomMobs", "trigger") == 0 then
    -- Trigger for detecting normal mobs
    tempComplexRegexTrigger("ad.level.trigger.roomMobs", [[^([A-Z].*)$]], [[ad.level.addMob(matches[2])]], 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, nil)
    -- Trigger for detecting normal mobs with prefixes like (Translucent) or (Red Aura)
    tempComplexRegexTrigger("ad.level.trigger.roomMobs", [[^\([A-Z].*\) ([A-Z].*)$]], [[ad.level.addMob(matches[2])]], 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, nil)
end
disableTrigger("ad.level.trigger.roomMobs")

-- Create trigger if not already initialized
if not ad.level.trigger.roomEnd then
    ad.level.trigger.roomEnd = tempRegexTrigger(
        [[^$]],
        function()
            disableTrigger("ad.level.trigger.roomMobs")
            disableTrigger(ad.level.trigger.roomEnd)
            ad.level.processRoom()
        end
    )
end
disableTrigger(ad.level.trigger.roomEnd)

-- Create trigger if not already initialized
if not ad.level.trigger.killed then
    ad.level.trigger.killed = tempRegexTrigger(
        [[^You receive ([0-9]*) experience points.$]],
        function()
            tempTimer(0.01, [[ ad.level.processKill() ]])
        end
    )
end
disableTrigger(ad.level.trigger.killed)

-- Create trigger if not already initialized
if not ad.level.trigger.noSteal then
    ad.level.trigger.noSteal = tempBeginOfLineTrigger(
        "Kill stealing is not permitted.",
        function()
            disableTrigger(ad.level.trigger.killed)
            disableTrigger(ad.level.trigger.noSteal)
            disableTrigger(ad.level.trigger.houdini)
            hecho(f("\n{ad.colors.lightBlack}[ AUTODARK ] -#r Someone else is here, moving on.\n"))
            ad.level.nextStep()
        end
    )
end
disableTrigger(ad.level.trigger.noSteal)

-- Create trigger if not already initialized
if not ad.level.trigger.houdini then
    ad.level.trigger.houdini = tempBeginOfLineTrigger(
        "They aren't here.",
        function()
            hecho(f("\n{ad.colors.lightBlack}[ AUTODARK ] -#r Uhh... Where did it go? Let's try again.\n"))
            ad.level.processKill()
        end
    )
end
disableTrigger(ad.level.trigger.houdini)

-- Create trigger if not already initialized
if not ad.level.trigger.overweight then
    ad.level.trigger.overweight = tempBeginOfLineTrigger(
        "You are carrying too much to go anywhere.",
        function()
            hecho(f("\n{ad.colors.lightBlack}[ AUTODARK ] -#r Too much weight. Dropping silver and trying again.\n"))
            send("drop 1000 silver")
            ad.level.resetStep()
            ad.level.nextStep()
        end
    )
end
disableTrigger(ad.level.trigger.overweight)

-- Create trigger if not already initialized
if not ad.level.trigger.check then
    ad.level.trigger.check = tempBeginOfLineTrigger(
        "You didn't find any ",
        function()
            ad.level.found = nil
            disableTrigger(ad.level.trigger.check)
        end
    )
end
disableTrigger(ad.level.trigger.check)

-- Create trigger if not already initialized
if not ad.level.trigger.exhausted then
    ad.level.trigger.exhausted = tempBeginOfLineTrigger(
        "You are too exhausted.",
        function()
            hecho(f("\n{ad.colors.lightBlack}[ AUTODARK ] -#r Ran out of movement. That probably shouldn't have happened.\n"))
            ad.level.processCommands("stop")
        end
    )
end
disableTrigger(ad.level.trigger.exhausted)

-- Create trigger if not already initialized
if not ad.level.trigger.fled then
    ad.level.trigger.fled = tempBeginOfLineTrigger(
        "You flee from combat!",
        function()
            hecho(f("\n{ad.colors.lightBlack}[ AUTODARK ] -#r You fled. That's the opposite of leveling...\n"))
            ad.level.processCommands("stop")
        end
    )
end
disableTrigger(ad.level.trigger.fled)

-- Create trigger if not already initialized
if not ad.level.trigger.haste then
    ad.level.trigger.haste = tempBeginOfLineTrigger(
        "You feel yourself slow down.",
        function()
            send(ad.level.tempHaste)
        end
    )
end
disableTrigger(ad.level.trigger.haste)

-- Create trigger if not already initialized
if not ad.level.trigger.sanc then
    ad.level.trigger.sanc = tempBeginOfLineTrigger(
        "The white aura around your body fades.",
        function()
            if string.match(ad.level.tempSanc, "^quaff(.*)") then
                send(ad.level.tempSanc)
            else
                if gmcp.char_data.is_fighting then
                    hecho(f("\n{ad.colors.lightBlack}[ AUTODARK ] -#r In combat, sanc added to PKA list.\n"))
                    table.insert(ad.level.pka, ad.level.tempSanc)
                else
                    send(ad.level.tempSanc)
                end
            end
        end
    )
end
disableTrigger(ad.level.trigger.sanc)

-- Create trigger if not already initialized
if not ad.level.trigger.fly then
    ad.level.trigger.fly = tempBeginOfLineTrigger(
        "You float gently to the ground.",
        function()
            if string.match(ad.level.tempFly, "^quaff(.*)") then
                send(ad.level.tempFly)
            else
                if gmcp.char_data.is_fighting then
                    hecho(f("\n{ad.colors.lightBlack}[ AUTODARK ] -#r In combat, fly added to PKA list.\n"))
                    table.insert(ad.level.pka, ad.level.tempFly)
                else
                    send(ad.level.tempFly)
                end
            end
        end
    )
end
disableTrigger(ad.level.trigger.fly)

-- Create trigger if not already initialized
if not ad.level.trigger.deti then
    ad.level.trigger.deti = tempBeginOfLineTrigger(
        "You no longer see invisible objects.",
        function()
            if string.match(ad.level.tempDetI, "^quaff(.*)") then
                send(ad.level.tempDetI)
            else
                if gmcp.char_data.is_fighting then
                    hecho(f("\n{ad.colors.lightBlack}[ AUTODARK ] -#r In combat, detect invis added to PKA list.\n"))
                    table.insert(ad.level.pka, ad.level.tempDetI)
                else
                    send(ad.level.tempDetI)
                end
            end
        end
    )
end
disableTrigger(ad.level.trigger.deti)

-- Create trigger if not already initialized
if not ad.level.trigger.deth then
    ad.level.trigger.deth = tempBeginOfLineTrigger(
        "You feel less aware of your surroundings.",
        function()
            if string.match(ad.level.tempDetH, "^quaff(.*)") then
                send(ad.level.tempDetH)
            else
                if gmcp.char_data.is_fighting then
                    hecho(f("\n{ad.colors.lightBlack}[ AUTODARK ] -#r In combat, detect hidden added to PKA list.\n"))
                    table.insert(ad.level.pka, ad.level.tempDetH)
                else
                    send(ad.level.tempDetH)
                end
            end
        end
    )
end
disableTrigger(ad.level.trigger.deth)

-- Alias to toggle leveling functionality
if not ad.level.alias.commands then
    ad.level.alias.commands = tempAlias("^level (.*)$", function()
        ad.level.processCommands(matches[2])
    end)
end

-- Start or stop the leveling process
function ad.level.processCommands(command)
    if command == "stop" then
        if ad.level.checkEvent then 
            killAnonymousEventHandler(ad.level.checkEvent)
        end
        ad.level.tempArea = nil
        ad.level.tempPath = {}
        ad.level.tempMobs = {}
        ad.level.prevStep = nil
        ad.level.mobsHere = {}
        ad.level.killTriggers()
        ad.level.check = nil
        ad.level.found = nil
        ad.level.pka = {}
        hecho(f("{ad.colors.lightBlack}[ AUTODARK ] -#r Leveling stopped.\n"))
    elseif command == "areas" then
        ad.level.areaReport()
    elseif command == "report" then
        ad.level.report()
    elseif string.match(command, "^[Pp][Kk][Aa]%s(.*)") then
        local cmd = string.match(command, "^[Pp][Kk][Aa]%s(.*)")
        ad.level.pka = ad.level.pka or {}
        table.insert(ad.level.pka, cmd)
        hecho(f("{ad.colors.lightBlack}[ AUTODARK ] -#r Post Kill Action added: {cmd}#r\n"))
    elseif string.match(command, "^[Ii][Nn][Ii][Tt](.*)") then
        local cmd = string.match(command, "^[Ii][Nn][Ii][Tt]%s(.*)")
        if cmd == "" or cmd == nil then
            ad.level.tempInit = nil
            hecho(f("{ad.colors.lightBlack}[ AUTODARK ] -#r Leveling custom init is off.#r\n"))
        else
            ad.level.tempInit = cmd
            hecho(f("{ad.colors.lightBlack}[ AUTODARK ] -#r Leveling custom init is set to \"{cmd}\"#r\n"))
        end
    elseif string.match(command, "^[Hh][Aa][Ss][Tt][Ee](.*)") then
        local cmd = string.match(command, "^[Hh][Aa][Ss][Tt][Ee]%s(.*)")
        if cmd == "" or cmd == nil then
            ad.level.tempHaste = nil
            disableTrigger(ad.level.trigger.haste)
            hecho(f("{ad.colors.lightBlack}[ AUTODARK ] -#r Leveling haste is off.#r\n"))
        else
            ad.level.tempHaste = cmd
            enableTrigger(ad.level.trigger.haste)
            hecho(f("{ad.colors.lightBlack}[ AUTODARK ] -#r Leveling haste is set to \"{cmd}\"#r\n"))
        end
    elseif string.match(command, "^[Ss][Aa][Nn][Cc](.*)") then
        local cmd = string.match(command, "^[Ss][Aa][Nn][Cc]%s(.*)")
        if cmd == "" or cmd == nil then
            ad.level.tempSanc = nil
            disableTrigger(ad.level.trigger.sanc)
            hecho(f("{ad.colors.lightBlack}[ AUTODARK ] -#r Leveling sanc is off.#r\n"))
        else
            ad.level.tempSanc = cmd
            enableTrigger(ad.level.trigger.sanc)
            hecho(f("{ad.colors.lightBlack}[ AUTODARK ] -#r Leveling sanc is set to \"{cmd}\"#r\n"))
        end
    elseif string.match(command, "^[Ff][Ll][Yy](.*)") then
        local cmd = string.match(command, "^[Ff][Ll][Yy]%s(.*)")
        if cmd == "" or cmd == nil then
            ad.level.tempFly = nil
            disableTrigger(ad.level.trigger.fly)
            hecho(f("{ad.colors.lightBlack}[ AUTODARK ] -#r Leveling fly is off.#r\n"))
        else
            ad.level.tempFly = cmd
            enableTrigger(ad.level.trigger.fly)
            hecho(f("{ad.colors.lightBlack}[ AUTODARK ] -#r Leveling fly is set to \"{cmd}\"#r\n"))
        end
    elseif string.match(command, "^[Dd][Ee][Tt][Ii](.*)") then
        local cmd = string.match(command, "^[Dd][Ee][Tt][Ii]%s(.*)")
        if cmd == "" or cmd == nil then
            ad.level.tempDetI = nil
            disableTrigger(ad.level.trigger.deti)
            hecho(f("{ad.colors.lightBlack}[ AUTODARK ] -#r Leveling detect invis is off.#r\n"))
        else
            ad.level.tempDetI = cmd
            enableTrigger(ad.level.trigger.deti)
            hecho(f("{ad.colors.lightBlack}[ AUTODARK ] -#r Leveling detect invis is set to \"{cmd}\"#r\n"))
        end
    elseif string.match(command, "^[Dd][Ee][Tt][Hh](.*)") then
        local cmd = string.match(command, "^[Dd][Ee][Tt][Hh]%s(.*)")
        if cmd == "" or cmd == nil then
            ad.level.tempDetH = nil
            disableTrigger(ad.level.trigger.deth)
            hecho(f("{ad.colors.lightBlack}[ AUTODARK ] -#r Leveling detect hidden is off.#r\n"))
        else
            ad.level.tempDetH = cmd
            enableTrigger(ad.level.trigger.deth)
            hecho(f("{ad.colors.lightBlack}[ AUTODARK ] -#r Leveling detect hidden is set to \"{cmd}\"#r\n"))
        end
    else
        ad.level.initArea(command)
    end
end

-- Initialize area-specific data
function ad.level.initArea(area)
    -- Clear existing temp tables
    if ad.level.checkEvent then 
        killAnonymousEventHandler(ad.level.checkEvent)
    end
    ad.level.tempPath = {}
    ad.level.tempMobs = {}
    ad.level.tempArea = area
    ad.level.prevStep = nil
    ad.level.mobsHere = {}
    ad.level.killInitTriggers()
    ad.level.check = nil
    ad.level.found = nil
    ad.level.pka = {}
    
    -- Populate tempPath and tempMobs
    local areaData = ad.level.areas[area]
    if areaData then
        for _, step in ipairs(ad.level.areas[area].path) do
            table.insert(ad.level.tempPath, step)
        end
        ad.level.tempMobs = table.deepcopy(areaData.mobs)
        enableTrigger(ad.level.trigger.overweight)
        enableTrigger(ad.level.trigger.exhausted)
        enableTrigger(ad.level.trigger.fled)
        ad.level.nextStep()
    else
        hecho(f("{ad.colors.lightBlack}[ AUTODARK ] - {ad.colors.lightRed}Error:#r Invalid area '{area}'.\n"))
    end
end

-- Handle the next step in the leveling path
function ad.level.nextStep()
    if #ad.level.tempPath > 0 then
        ad.level.prevStep = table.remove(ad.level.tempPath, 1)
        enableTrigger(ad.level.trigger.roomExits)
        if not ad.level.check then
            hecho(f("{ad.colors.lightBlack}[ AUTODARK ] - {ad.colors.yellow}{#ad.level.tempPath + 1} #rrooms left.\n"))
        end
        send(ad.level.prevStep)
    else
        if ad.level.found then
            local hp = gmcp.char_data.hp / gmcp.char_data.max_hp
            local mv = gmcp.char_data.move / gmcp.char_data.max_move
            if hp > .5 and mv > .5 then
                hecho(f("\n{ad.colors.lightBlack}[ AUTODARK ] -#r Mobs respawned, restarting.\n"))
                ad.level.check = nil
                ad.level.found = nil
                disableTrigger(ad.level.trigger.check)
                if ad.level.checkEvent then 
                    killAnonymousEventHandler(ad.level.checkEvent)
                end
                ad.level.initArea(ad.level.tempArea)
            else
                hecho(f("\n{ad.colors.lightBlack}[ AUTODARK ] -#r Mobs respawned, but low on hp or movement. Waiting a tick.\n"))
            end
        else
            hecho(f("\n{ad.colors.lightBlack}[ AUTODARK ] -#r Area cleared. Waiting for tick.\n"))
            ad.level.check = true
            ad.level.found = true
            enableTrigger(ad.level.trigger.check)
            for _, step in ipairs(ad.level.areas[ad.level.tempArea].check) do
                table.insert(ad.level.tempPath, step)
            end
            ad.level.checkEvent = registerAnonymousEventHandler("onTick", "ad.level.nextStep")
        end
    end
end

-- Reset the previous step to the start of the tempPath
function ad.level.resetStep()
    if ad.level.prevStep then
        table.insert(ad.level.tempPath, 1, ad.level.prevStep)
        ad.level.prevStep = nil
    else
        hecho(f("{ad.colors.lightBlack}[ AUTODARK ] - {ad.colors.lightRed}Error:#r No previous step to reset.\n"))
    end
end

-- Add a mob to the current room's mob list
function ad.level.addMob(mob)
    if mob and ad.level.tempMobs then
        for name, desc in pairs(ad.level.tempMobs) do
            if desc == mob then
                table.insert(ad.level.mobsHere, name)
                break
            end
        end
    end
end

-- Handle processing the current room
function ad.level.processRoom()
    if ad.level.check == true then
        ad.level.nextStep()
    else
        if #ad.level.mobsHere == 0 then
            hecho(f("\n{ad.colors.lightBlack}[ AUTODARK ] -#r No mobs found, proceeding.\n"))
            ad.level.nextStep()
        else
            hecho(f("\n{ad.colors.lightBlack}[ AUTODARK ] -#r Mob found, attacking.\n"))
            local target = ad.level.mobsHere[1]
            enableTrigger(ad.level.trigger.killed)
            enableTrigger(ad.level.trigger.noSteal)
            enableTrigger(ad.level.trigger.houdini)
            if ad.level.tempInit ~= nil then
                send(f("{ad.level.tempInit} {target}"))
            else
                send(f("kill {target}"))
            end
        end
    end
end

-- Handle post-kill processing
function ad.level.processKill()
--    if gmcp.char_data.is_fighting then
--        hecho(f("\n{ad.colors.lightBlack}[ AUTODARK ] -#r Still in combat, continue fighting.\n"))
--    else
        while ad.level.pka and #ad.level.pka > 0 do
            local action = table.remove(ad.level.pka, 1)
            if action then
                hecho(f("\n{ad.colors.lightBlack}[ AUTODARK ] -#r Post Kill Action sent: {action}#r"))
                send(action)
            end
        end

        if #ad.level.pka == 0 then
            hecho(f("\n{ad.colors.lightBlack}[ AUTODARK ] -#r Post Kill Action queue is empty.#r"))
        end
        
        hecho(f("\n{ad.colors.lightBlack}[ AUTODARK ] -#r Looking for more mobs.\n"))
        disableTrigger(ad.level.trigger.killed)
        disableTrigger(ad.level.trigger.noSteal)
        disableTrigger(ad.level.trigger.houdini)
        enableTrigger(ad.level.trigger.roomExits)
        send("look")
--    end
end

function ad.level.areaReport()
    local border = f("{ad.colors.lightBlack}+") .. string.rep("-", 98) .. "+#r"
    local title = f("{ad.colors.lightBlack}|#r" .. string.rep(" ", 37) .. "AUTODARK LEVELING AREAS" .. string.rep(" ", 38) .. "{ad.colors.lightBlack}|#r")
    local report = { border, title, border }

    for areaName, areaData in pairs(ad.level.areas) do
        local name = string.format("%-90s", areaData.name) or string.format("%-90s", "Unknown Area")
        local command = string.format("%-20s", areaName) or string.format("%-20s", "Unknown Command (WTF?)")
        local levels = string.format("%-58s", areaData.levels) or string.format("%-58s", "N/A")
        local directions = string.format("%-84s", areaData.directions) or string.format("%-84s", "No directions available.")

        -- Format name line
        local commandLevelsLine = f("{ad.colors.lightBlack}|#r Name: {ad.colors.lightBlack}{name} {ad.colors.lightBlack}|#r")
        table.insert(report, commandLevelsLine)

        -- Format command and levels line
        local commandLevelsLine = f("{ad.colors.lightBlack}|#r Command: {ad.colors.cyan}{command}#r Levels: {ad.colors.cyan}{levels} {ad.colors.lightBlack}|#r")
        table.insert(report, commandLevelsLine)

        -- Format directions line
        local directionsLine = f("{ad.colors.lightBlack}|#r Directions: {ad.colors.cyan}{directions} {ad.colors.lightBlack}|#r")
        table.insert(report, directionsLine)

        -- Add a blank line after each area's info
        table.insert(report, f("{ad.colors.lightBlack}|#r" .. string.rep(" ", 98) .. "{ad.colors.lightBlack}|#r"))
    end

    if #report == 3 then
        -- No areas recorded
        hecho(f("{ad.colors.lightBlack}[ AUTODARK ] - #rNo areas? That doesn't seem right... Check the script.\n"))
    else
        -- Add closing border and print the report
        table.insert(report, border)
        hecho(table.concat(report, "\n") .. "\n")
    end
end

function ad.level.report()
    local border = f("{ad.colors.lightBlack}+") .. string.rep("-", 48) .. "+#r"
    local title = f("{ad.colors.lightBlack}|#r" .. string.rep(" ", 12) .. "AUTODARK LEVELING REPORT" .. string.rep(" ", 12) .. "{ad.colors.lightBlack}|#r")
    local report = { border, title, border }

    local area = string.format("%-46s", f("Area:          \"{ad.level.tempArea}\""))
    local areaLine = f("{ad.colors.lightBlack}|#r {area} {ad.colors.lightBlack}|#r")
    table.insert(report, areaLine)
    
    local init = string.format("%-46s", f("Init:          \"{ad.level.tempInit}\""))
    local initLine = f("{ad.colors.lightBlack}|#r {init} {ad.colors.lightBlack}|#r")
    table.insert(report, initLine)
    
    local haste = string.format("%-46s", f("Haste:         \"{ad.level.tempHaste}\""))
    local hasteLine = f("{ad.colors.lightBlack}|#r {haste} {ad.colors.lightBlack}|#r")
    table.insert(report, hasteLine)
    
    local sanc = string.format("%-46s", f("Sanc:          \"{ad.level.tempSanc}\""))
    local sancLine = f("{ad.colors.lightBlack}|#r {sanc} {ad.colors.lightBlack}|#r")
    table.insert(report, sancLine)
    
    local fly = string.format("%-46s", f("Fly:           \"{ad.level.tempFly}\""))
    local flyLine = f("{ad.colors.lightBlack}|#r {fly} {ad.colors.lightBlack}|#r")
    table.insert(report, flyLine)
    
    local deti = string.format("%-46s", f("Detect Invis:  \"{ad.level.tempDetI}\""))
    local detiLine = f("{ad.colors.lightBlack}|#r {deti} {ad.colors.lightBlack}|#r")
    table.insert(report, detiLine)
    
    local deth = string.format("%-46s", f("Detect Hidden: \"{ad.level.tempDetH}\""))
    local dethLine = f("{ad.colors.lightBlack}|#r {deth} {ad.colors.lightBlack}|#r")
    table.insert(report, dethLine)

    -- Add closing border and print the report
    table.insert(report, border)
    hecho(table.concat(report, "\n") .. "\n")
end

-- Disable all triggers
function ad.level.killInitTriggers()
    disableTrigger(ad.level.trigger.roomExits)
    disableTrigger("ad.level.trigger.roomMobs")
    disableTrigger(ad.level.trigger.roomEnd)
    disableTrigger(ad.level.trigger.killed)
    disableTrigger(ad.level.trigger.noSteal)
    disableTrigger(ad.level.trigger.houdini)
    disableTrigger(ad.level.trigger.overweight)
    disableTrigger(ad.level.trigger.exhausted)
    disableTrigger(ad.level.trigger.fled)
end

-- Disable all triggers
function ad.level.killTriggers()
    disableTrigger(ad.level.trigger.roomExits)
    disableTrigger("ad.level.trigger.roomMobs")
    disableTrigger(ad.level.trigger.roomEnd)
    disableTrigger(ad.level.trigger.killed)
    disableTrigger(ad.level.trigger.noSteal)
    disableTrigger(ad.level.trigger.houdini)
    disableTrigger(ad.level.trigger.overweight)
    disableTrigger(ad.level.trigger.exhausted)
    disableTrigger(ad.level.trigger.fled)
    disableTrigger(ad.level.trigger.haste)
    disableTrigger(ad.level.trigger.sanc)
    disableTrigger(ad.level.trigger.fly)
    disableTrigger(ad.level.trigger.deti)
    disableTrigger(ad.level.trigger.deth)
end