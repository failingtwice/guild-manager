require "logic/enums";


HEIGHT_RANGES = setmetatable({
  [RACE.DRAGONBORN] = { min = 180, max = 220 },
  [RACE.DWARF]      = { min = 120, max = 160 },
  [RACE.ELF]        = { min = 170, max = 210 },
  [RACE.GNOME]      = { min = 80, max = 120 },
  [RACE.GOLIATH]    = { min = 180, max = 230 },
  [RACE.HALFLING]   = { min = 80, max = 110 },
  [RACE.HUMAN]      = { min = 160, max = 190 },
  [RACE.ORC]        = { min = 180, max = 230 },
  [RACE.TIEFLING]   = { min = 160, max = 190 }
}, {
  __index = function(t, key)
    error("Unknown race: " .. tostring(key))
  end
})

WEIGHT_TO_HEIGHT_RATIO = setmetatable({
  [RACE.DRAGONBORN] = 0.6,
  [RACE.DWARF]      = 0.7,
  [RACE.ELF]        = 0.5,
  [RACE.GNOME]      = 0.4,
  [RACE.GOLIATH]    = 0.65,
  [RACE.HALFLING]   = 0.45,
  [RACE.HUMAN]      = 0.45,
  [RACE.ORC]        = 0.65,
  [RACE.TIEFLING]   = 0.6,
}, {
  __index = function(t, key)
    error("Unknown race: " .. tostring(key))
  end
})

NAMES = setmetatable({
  [RACE.DRAGONBORN] = {
    first_names = {
      "Arkrath", "Baresh", "Doveth", "Eryndor", "Fendrel",
      "Gareth", "Heskal", "Izzir", "Jalthor", "Koveth",
      "Lazrik", "Mordesh", "Nythrin", "Othran", "Phaldrak",
      "Quarith", "Rynsar", "Szareth", "Torveth", "Uryndor"
    },
    second_names = {
      "Brightscale", "Stormfang", "Firebrand", "Ironflame", "Shadowfang",
      "Goldtail", "Frostclaw", "Nightwhisper", "Dawnscale", "Thunderhide",
      "Emberstrike", "Steelhorn", "Darkblaze", "Skyshard", "Sunstorm",
      "Moonfang", "Coldspire", "Windtalon", "Earthshaker", "Horizonflare"
    }
  },
  [RACE.DWARF] = {
    first_names = {
      "Bramli", "Durgan", "Eldrin", "Farnor", "Glynn",
      "Helgar", "Ingmar", "Jorik", "Krag", "Luthar",
      "Mornir", "Norik", "Orsin", "Perrik", "Quendar",
      "Rurik", "Sigrun", "Thrain", "Urik", "Vondal"
    },
    second_names = {
      "Ironfist", "Stonehelm", "Deepdelver", "Stormforge", "Goldbeard",
      "Anvilborn", "Boulderheart", "Flamebraid", "Runebinder", "Thunderbrew",
      "Shieldbreaker", "Drakenshield", "Frostbeard", "Hammerstrike", "Blackrock",
      "Strongarm", "Mithrilvein", "Forgefire", "Emberhand", "Ironvein"
    }
  },
  [RACE.ELF] = {
    first_names = {
      "Aelrith", "Baelen", "Caelith", "Daeris", "Eldrin",
      "Faelar", "Gildor", "Haerith", "Ithil", "Jhaeros",
      "Kaelis", "Lorien", "Mythanis", "Nymari", "Oryndil",
      "Phaelor", "Quenaris", "Rilithar", "Sylvar", "Tarieth"
    },
    second_names = {
      "Moonwhisper", "Dawnshadow", "Eveningbreeze", "Silverleaf", "Goldpetal",
      "Starfire", "Nightgleam", "Autumnwind", "Sunshadow", "Windwalker",
      "Brightglade", "Stormpetal", "Skyweaver", "Emberwood", "Silentbrook",
      "Raincaller", "Thundersong", "Shadowvale", "Wildgrove", "Lighthollow"
    }
  },
  [RACE.GNOME] = {
    first_names = {
      "Bix", "Cork", "Dibble", "Elli", "Fizzi",
      "Gimble", "Hobs", "Izzy", "Jaxi", "Kip",
      "Lop", "Mop", "Nix", "Ozzie", "Pip",
      "Quib", "Razzle", "Snaps", "Trix", "Wizzle"
    },
    second_names = {
      "Brassgear", "Cobblepot", "Dizzlespark", "Fizzletop", "Gadgetwheel",
      "Jinglefizz", "Knockwhistle", "Muddlefoot", "Nimblecog", "Oddspinner",
      "Puddlejumper", "Quirkthrottle", "Rattlebrass", "Sprocketwhizz", "Tinkerflare",
      "Uproar", "Vortexsnap", "Whirlygig", "Zapperblast", "Zigglespanner"
    }
  },
  [RACE.GOLIATH] = {
    first_names = {
      "Akkar", "Bruk", "Chiran", "Dranak", "Egar",
      "Gron", "Harrak", "Igar", "Jarn", "Korrak",
      "Lugran", "Magnar", "Norrak", "Orrek", "Purn",
      "Quor", "Rath", "Skar", "Tornak", "Urgan"
    },
    second_names = {
      "Boulderstride", "Stonefist", "Ironridge", "Stormtamer", "Thundervoice",
      "Rockshatter", "Highclimb", "Cragborn", "Cloudwatcher", "Skyroar",
      "Frostpeak", "Mountainheart", "Runestone", "Windrunner", "Stormcaller",
      "Earthbinder", "Granitehide", "Silverpeak", "Tallwalker", "Peakborn"
    }
  },
  [RACE.HALFLING] = {
    first_names = {
      "Albie", "Benny", "Clover", "Dorrie", "Ellie",
      "Finn", "Grady", "Hobie", "Ivy", "Jory",
      "Kip", "Lyle", "Maggie", "Nell", "Ollie",
      "Penny", "Quinn", "Rory", "Tilly", "Wren"
    },
    second_names = {
      "Applewhisk", "Brandybuck", "Cobbledash", "Dewfoot", "Elderberry",
      "Fairbrook", "Gingerwhistle", "Hearthwise", "Ivyvale", "Jollyweather",
      "Kindlebranch", "Lemonleaf", "Merriwind", "Nutbrown", "Oakshade",
      "Puddlefoot", "Quillberry", "Rosethorn", "Tumblebrook", "Wanderlight"
    }
  },
  [RACE.HUMAN] = {
    first_names = {
      "Aldric", "Blaise", "Camden", "Darcy", "Ellis",
      "Finley", "Galen", "Harley", "Ivon", "Jules",
      "Kendall", "Linden", "Morgan", "Noel", "Oswin",
      "Perrin", "Quentin", "Robin", "Sasha", "Torrence"
    },
    second_names = {
      "Atwood", "Baxter", "Chandler", "Davenport", "Everton",
      "Fletcher", "Goodwin", "Hastings", "Ingram", "Jernigan",
      "Kendrick", "Langley", "Middleton", "Norfolk", "Ormsby",
      "Pembroke", "Quince", "Radcliffe", "Stafford", "Taverner"
    }
  },
  [RACE.ORC] = {
    first_names = {
      "Azgar", "Brok", "Drog", "Fang", "Grom",
      "Hulk", "Ikar", "Jor", "Kragg", "Lurk",
      "Mok", "Narg", "Orgin", "Pug", "Quar",
      "Rag", "Skar", "Tor", "Ugluk", "Zog"
    },
    second_names = {
      "Bonecrusher", "Bloodfang", "Ironhide", "Skullsplitter", "Darkfury",
      "Stormbringer", "Thunderclap", "Steeltooth", "Warbane", "Gorehowl",
      "Blightfang", "Doomhowl", "Firemane", "Grimclaw", "Nightaxe",
      "Savagerage", "Deathspine", "Frostfang", "Hellscar", "Shadowfury"
    }
  },
  [RACE.TIEFLING] = {
    first_names = {
      "Avern", "Blaze", "Cinder", "Dagger", "Ebon",
      "Fable", "Grim", "Havoc", "Inferna", "Jinx",
      "Kindle", "Lucid", "Mordai", "Nyx", "Onyx",
      "Pyris", "Rogue", "Sable", "Thorn", "Vex"
    },
    second_names = {
      "Blackflame", "Darkstar", "Doomcaller", "Fatebinder", "Graveborn",
      "Hellfire", "Infernal", "Nightshade", "Oathbreaker", "Phantomveil",
      "Ravencrest", "Shadowthorn", "Stormfang", "Twilight", "Underworld",
      "Venomheart", "Warlockborn", "Whisper", "Zephyrshade", "Voidborn"
    }
  }
}, {
  __index = function(t, key)
    error("Unknown race: " .. tostring(key))
  end
})
