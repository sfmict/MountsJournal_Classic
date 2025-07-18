if GetLocale() ~= "esES" then
	return
end

local _, ns = ...
local L = ns.L

-- L["author"] = ""
-- L["Main"] = ""
-- L["ConfigPanelTitle"] = ""
-- L["Class settings"] = ""
-- L["Modifier"] = ""
-- L["Normal mount summon"] = ""
-- L["SecondMountTooltipTitle"] = ""
-- L["SecondMountTooltipDescription"] = ""
-- L["Drag to create a summon panel"] = ""
-- L["UseBindingTooltip"] = ""
-- L["Summon panel"] = ""
-- L["Left-button to drag"] = ""
-- L["Strata of panel"] = ""
-- L["Fade out (opacity)"] = ""
-- L["Button size"] = ""
-- L["Reset size"] = ""
-- L["Target Mount"] = ""
-- L["Shows the mount of current target"] = ""
-- L["LMB"] = ""
-- L["RMB"] = ""
-- L["Select mount"] = ""
-- L["Auto select Mount"] = ""
-- L["ZoneSettingsTooltip"] = ""
-- L["ZoneSettingsTooltipDescription"] = ""
L["ButtonsSelectedTooltipDescription"] = "Los favoritos no afectan a los montajes de invocación con %s.\n\nPara convocarlas en las condiciones adecuadas, debe seleccionar las monturas por tipo."
-- L["ProfilesTooltipDescription"] = ""
-- L["SettingsTooltipDescription"] = "Check settings, create macros or bind keys to use %s."
-- L["Handle a jump in water"] = ""
-- L["WaterJumpDescription"] = ""
-- L["UseHerbMounts"] = "Use Mount for Herbalism"
-- L["UseHerbMountsDescription"] = "If Herbalism is learned, a suitable mount is used if available."
-- L["UseHerbMountsOnZones"] = "Only in Herb Gathering Zones"
-- L["Herb Gathering"] = "Herb Gathering"
-- L["HerbGatheringFlagDescription"] = "Used to configure use of Mount to Herbalism."
-- L["If item durability is less than"] = ""
-- L["In flyable zones"] = ""
-- L["UseRepairMountsDescription"] = ""
-- L["If the number of free slots in bags is less"] = ""
-- L["Random available mount"] = "Random available mount"
-- L["Use %s"] = ""
-- L["Use automatically"] = "Use automatically"
-- L["UseMagicBroomTitle"] = ""
-- L["UseMagicBroomDescription"] = ""
-- L["UseUnderlightAnglerDescription"] = "Use Underlight Angler instead of underwater mounts."
-- L["A macro named \"%s\" already exists, overwrite it?"] = ""
-- L["CreateMacro"] = ""
-- L["CreateMacroTooltip"] = ""
-- L["or key bind"] = ""
-- L["ERR_MOUNT_NO_SELECTED"] = ""
-- L["Collected:"] = ""
-- L["Shown:"] = ""
-- L["With multiple models"] = "With only multiple models"
-- L["hidden for character"] = ""
-- L["only hidden"] = ""
-- L["Hidden by player"] = ""
-- L["Only new"] = "Only new"
-- L["types"] = ""
-- L["selected"] = ""
-- L["SELECT_AS_TYPE_1"] = ""
-- L["SELECT_AS_TYPE_2"] = ""
-- L["SELECT_AS_TYPE_3"] = ""
-- L["MOUNT_TYPE_1"] = ""
-- L["MOUNT_TYPE_2"] = ""
-- L["MOUNT_TYPE_3"] = ""
-- L["MOUNT_TYPE_4"] = ""
-- L["Specific"] = ""
-- L["repair"] = ""
-- L["passenger"] = ""
-- L["transform"] = ""
-- L["Multiple Models"] = ""
-- L["additional"] = ""
-- L["rest"] = ""
-- L["factions"] = ""
-- L["MOUNT_FACTION_1"] = ""
-- L["MOUNT_FACTION_2"] = ""
-- L["MOUNT_FACTION_3"] = ""
-- L["sources"] = ""
-- L["PET_1"] = ""
-- L["PET_2"] = ""
-- L["PET_3"] = ""
-- L["PET_4"] = ""
-- L["expansions"] = ""
-- L["Receipt date"] = ""
-- L["Travel time"] = ""
-- L["Travel distance"] = ""
-- L["Avg. speed"] = ""
-- L["Chance of summoning"] = ""
-- L["Any"] = ""
-- L["ANY_GROUP"] = ""
-- L["> (more than)"] = ""
-- L["< (less than)"] = ""
-- L["= (equal to)"] = ""
-- L["sorting"] = ""
-- L["Then Sort By"] = ""
-- L["Reverse Sort"] = ""
-- L["Collected First"] = ""
-- L["Favorites First"] = ""
-- L["Additional First"] = ""
-- L["Set current filters as default"] = ""
-- L["Restore default filters"] = ""
-- L["Enable Acceleration around the X-axis"] = ""
-- L["Initial x-axis accseleration"] = ""
-- L["X-axis accseleration"] = ""
-- L["Minimum x-axis speed"] = ""
-- L["Enable Acceleration around the Y-axis"] = ""
-- L["Initial y-axis accseleration"] = ""
-- L["Y-axis accseleration"] = ""
-- L["Minimum y-axis speed"] = ""
-- L["Model"] = ""
-- L["Map"] = ""
-- L["Map flags"] = ""
-- L["Settings"] = ""
-- L["Dungeons and Raids"] = ""
-- L["Current Location"] = ""
-- L["Enable Flags"] = ""
-- L["Ground Mounts Only"] = ""
-- L["Water Walking"] = ""
-- L["WaterWalkFlagDescription"] = ""
-- L["ListMountsFromZone"] = ""
-- L["No relation"] = ""
-- L["Zones with list"] = ""
-- L["Zones with relation"] = ""
-- L["Zones with flags"] = ""
-- L["CHARACTER_CLASS_DESCRIPTION"] = ""
-- L["HELP_MACRO_MOVE_FALL"] = ""
-- L["HELP_MACRO_COMBAT"] = ""
-- L["CLASS_USEWHENCHARACTERFALLS"] = ""
-- L["CLASS_USEWATERWALKINGSPELL"] = ""
-- L["CLASS_USEONLYWATERWALKLOCATION"] = ""
-- L["PALADIN_USECRUSADERAURA"] = ""
-- L["PALADIN_RETURNLASTAURA"] = ""
-- L["DRUID_USELASTDRUIDFORM"] = ""
-- L["DRUID_USETRAVELIFCANTFLY"] = ""
-- L["DRUID_USEDRUIDFORMSPECIALIZATION"] = "Return a specialization form"
-- L["DRUID_USEMACROALWAYS"] = ""
-- L["DRUID_USEMACROONLYCANFLY"] = ""
-- L["Summonable Battle Pet"] = ""
-- L["Summon Random Battle Pet"] = ""
-- L["No Battle Pet"] = ""
-- L["Summon a pet every"] = ""
-- L["min"] = ""
-- L["Summon only favorites"] = ""
-- L["NoPetInRaid"] = ""
-- L["NoPetInGroup"] = ""
-- L["Enable arrow buttons to browse mounts"] = ""
-- L["Show mount type selection buttons"] = ""
-- L["CopyMountTarget"] = ""
-- L["Open links in %s"] = ""
-- L["Click opens in"] = ""
-- L["Show wowhead link in mount preview"] = ""
-- L["Enable statistics collection"] = ""
-- L["STATISTICS_DESCRIPTION"] = ""
-- L["Show mount in unit tooltip"] = ""
-- L["Show Minimap Button"] = ""
-- L["Lock Minimap Button"] = ""
-- L["|cffff7f3fClick|r to open %s"] = ""
-- L["Rule Set"] = ""
-- L["Rule Sets"] = ""
-- L["New rule set"] = ""
-- L["A rule set with the same name exists."] = ""
-- L["Are you sure you want to delete rule set %s?"] = ""
-- L["Set as default"] = ""
-- L["Rule"] = ""
-- L["Rules"] = ""
-- L["RULES_TITLE"] = ""
-- L["Add Rule"] = ""
-- L["Import Rule"] = ""
-- L["Reset Rules"] = ""
-- L["Remove Rule %d"] = ""
-- L["Alternative Mode"] = ""
-- L["NOT_CONDITION"] = ""
-- L["Conditions"] = ""
-- L["Action"] = ""
-- L["Edit Rule"] = ""
-- L["ANY_MODIFIER"] = ""
-- L["Macro condition"] = ""
-- L["Mouse button"] = ""
-- L["Zone type"] = ""
-- L["Nameless holiday"] = ""
-- L["Flyable area"] = ""
-- L["Have item"] = ""
-- L["Item is ready"] = ""
-- L["Item is equipped"] = ""
-- L["Spell is known"] = ""
-- L["Spell is ready"] = ""
-- L["Zone Name/Subzone Name"] = ""
-- L["The player has a buff"] = ""
-- L["The player has a debuff"] = ""
-- L["The player is falling"] = ""
-- L["The player is moving"] = ""
-- L["The player is indoors"] = ""
-- L["The player is swimming"] = ""
-- L["The player is mounted"] = ""
-- L["The player is within an vehicle"] = ""
-- L["The player is dead"] = ""
-- L["Sex"] = ""
-- L["Group Type"] = ""
-- L["Not Found"] = ""
-- L["Friend in Party"] = ""
-- L["Friend in Raid"] = ""
-- L["Get State"] = ""
-- L["Get a state that can be set in actions using \"Set State\""] = ""
-- L["Set State"] = ""
-- L["Set a state that can be read in conditions using \"Get State\""] = ""
-- L["Random Mount"] = ""
-- L["Random Mount of Selected Type"] = ""
-- L["Selected profile"] = ""
-- L["Mount"] = ""
-- L["Use Item"] = ""
-- L["Use Inventory Item"] = ""
-- L["Cast Spell"] = ""
-- L["Use macro before mounting"] = ""
-- L["PMACRO_DESCRIPTION"] = ""
-- L["Snippet"] = ""
-- L["Code Snippet"] = ""
-- L["Code Snippets"] = ""
-- L["Add Snippet"] = ""
-- L["Import Snippet"] = ""
-- L["A snippet with the same name exists."] = ""
-- L["Are you sure you want to delete snippet %s?"] = ""
-- L["Line"] = ""
-- L["Examples"] = ""
-- L["Tab Size"] = ""
-- L["Do you want to save changes?"] = ""
-- L["About"] = ""
-- L["Help with translation of %s. Thanks."] = ""
-- L["Localization Translators:"] = ""
-- L["ABBR_YARD"] = ""
-- L["ABBR_MILE"] = ""
-- L["ABBR_METER"] = ""
-- L["ABBR_KILOMETER"] = ""
-- L["ABBR_HOUR"] = ""
-- L["Right-click for more options"] = ""
-- L["Shift-click to create a chat link"] = ""
-- L["Requesting data from %s ..."] = ""
-- L["Error not receiving data from %s ..."] = ""
-- L["Malformed link"] = ""
-- L["Transmission error"] = ""
-- L["Receiving data from %s"] = ""
-- L["Received from"] = ""
-- ANIMATIONS
-- L["Default"] = ""
-- L["Mount special"] = ""
-- L["Walk"] = ""
-- L["Walk backwards"] = ""
-- L["Run"] = ""
-- L["Swim idle"] = ""
-- L["Swim"] = ""
-- L["Swim backwards"] = ""
-- L["Fly stand"] = ""
-- L["Fly"] = ""
-- L["Fly backwards"] = ""
-- L["Loop"] = ""
-- L["Are you sure you want to delete animation %s?"] = ""
-- PROFILES
-- L["Profile"] = ""
-- L["Profiles"] = ""
-- L["New profile"] = ""
-- L["Create"] = ""
-- L["Copy current"] = ""
-- L["Export"] = ""
-- L["Import"] = ""
-- L["A profile with the same name exists."] = ""
-- L["HOLIDAY_ACTIVE"] = ""
-- L["Profile settings"] = ""
-- L["Pet binding from default profile"] = ""
-- L["Zones settings from default profile"] = ""
-- L["Auto add new mounts to selected"] = ""
-- L["Select all favorite mounts by type in the selected zone"] = ""
-- L["Select all mounts by type in selected zone"] = ""
-- L["Unselect all mounts in selected zone"] = ""
-- L["Are you sure you want to delete profile %s?"] = ""
-- L["Are you sure you want %s?"] = ""
-- TAGS
-- L["tags"] = ""
-- L["No tag"] = ""
-- L["With all tags"] = ""
-- L["Add tag"] = ""
-- L["Tag already exists."] = ""
-- L["Are you sure you want to delete tag %s?"] = ""
-- FAMILY
L["Family"] = "Familia"
L["Airplanes"] = "Aviones"
L["Airships"] = "Naves de Guerra"
-- L["Albatross"] = ""
L["Alpacas"] = "Alpacas"
L["Amphibian"] = "Anfibios"
L["Animite"] = "Animácaros"
L["Aqir Flyers"] = "Voladores Aqir"
L["Arachnids"] = "Arácnidos"
L["Armoredon"] = "Rinoceronte Blindado"
L["Assault Wagons"] = "Catapultas de Asalto"
L["Basilisks"] = "Basiliscos"
L["Bats"] = "Murciélagos"
L["Bears"] = "Osos"
L["Beetle"] = "Escarabajos"
L["Bipedal Cat"] = "Raptors dientes de sable"
L["Birds"] = "Pájaros"
L["Blood Ticks"] = "Garrapatas de Sangre"
L["Boars"] = "Jabalies"
L["Book"] = "Libros"
L["Bovids"] = "Bóvidos"
L["Broom"] = "Escobas"
L["Brutosaurs"] = "Brutosaurios"
L["Camels"] = "Camellos"
L["Carnivorans"] = "Carnívoros"
L["Carpets"] = "Alfombras"
L["Cats"] = "Gatos"
L["Cervid"] = "Cérvidos"
L["Chargers"] = "Destreros"
L["Chickens"] = "Pollos"
L["Clefthooves"] = "Uñagrietas"
L["Cloud Serpents"] = "Dragones Nimbo"
L["Core Hounds"] = "Canes del Núcleo"
L["Crabs"] = "Cangrejos"
L["Cranes"] = "Grullas"
L["Crawgs"] = "Tragadones"
L["Crocolisks"] = "Crocoliscos"
L["Crows"] = "Cuervos"
L["Demonic Hounds"] = "Acechadores Viles"
L["Demonic Steeds"] = "Corceles Demoníacos"
L["Demons"] = "Demonios"
L["Devourer"] = "Devoradores"
L["Dinosaurs"] = "Dinosaurios"
L["Dire Wolves"] = "Lobos Temibles"
L["Direhorns"] = "Cuernoatroces"
L["Discs"] = "Discos"
L["Dragonhawks"] = "Dracohalcones"
L["Drakes"] = "Dracos"
L["Dread Ravens"] = "Cuervos Aterradores"
L["Dreamsaber"] = "Dientes de Sable de Ensueño"
L["Eagle"] = "Águilas"
L["Elekks"] = "Elekks"
L["Elementals"] = "Elementales"
L["Falcosaurs"] = "Falcosaurios"
L["Fathom Rays"] = "Rayas de las Profundidades"
L["Feathermanes"] = "Crinplumas"
L["Felsabers"] = "Sablesviles"
L["Fish"] = "Peces"
L["Flies"] = "Moscas"
L["Flying Steeds"] = "Corceles Voladores"
L["Foxes"] = "Zorros"
L["Gargon"] = "Gargones"
L["Gargoyle"] = "Gárgolas"
L["Goats"] = "Cabras"
L["Gorger"] = "Engullidores"
L["Gorm"] = "Gorms"
L["Grand Drakes"] = "Dracos Grandes"
L["Gronnlings"] = "Gronnitos"
L["Gryphons"] = "Grifos"
L["Gyrocopters"] = "Helicópteros"
L["Hands"] = "Manos"
L["Hawkstriders"] = "Halcones Zancudos"
L["Hippogryphs"] = "Hipogrifos"
L["Horned Steeds"] = "Corceles Cornudos"
L["Horses"] = "Caballos"
L["Hounds"] = "Canes"
L["Hovercraft"] = "Aerodeslizadores"
L["Humanoids"] = "Humanoides"
L["Hyenas"] = "Hienas"
L["Infernals"] = "Infernales"
L["Insects"] = "Insectos"
L["Jellyfish"] = "Medusas"
L["Jet Aerial Units"] = "Unidades Aéreas Propulsadas"
L["Kites"] = "Cometas"
L["Kodos"] = "Kodos"
L["Krolusks"] = "Croluscos"
L["Larion"] = "Lariones"
L["Lions"] = "Leones"
-- L["Lizards"] = ""
L["Lupine"] = "Lupinos"
L["Mammoths"] = "Mamuts"
L["Mana Rays"] = "Rayas de Maná"
L["Manasabers"] = "Sables de Maná"
L["Mauler"] = "Aplastadores"
L["Mechanical Animals"] = "Animales Mecánicos"
L["Mechanical Birds"] = "Pájaros Mecánicos"
L["Mechanical Cats"] = "Gatos Mecánicos"
L["Mechanical Steeds"] = "Corceles Mecánicos"
L["Mechanostriders"] = "Mecazancudos"
L["Mecha-suits"] = "Trajes Mecánicos"
L["Meeksi"] = "Meeksi"
L["Mollusc"] = "Moluscos"
L["Moose"] = "Alces"
L["Moth"] = "Polillas"
L["Motorcycles"] = "Motos"
L["Mountain Horses"] = "Caballos de Montaña"
L["Murloc"] = "Múrlocs"
L["Mushan"] = "Mushans"
L["Nether Drakes"] = "Dracos Abisales"
L["Nether Rays"] = "Rayas Abisales"
L["N'Zoth Serpents"] = "Serpientes de N'Zoth"
L["Others"] = "Otros"
L["Ottuk"] = "Nutriones"
L["Owl"] = "Búhos"
L["Owlbear"] = "Lechúcicos"
L["Ox"] = "Ox"
L["Pandaren Phoenixes"] = "Fénix Pandaren"
L["Parrots"] = "Loros"
L["Peafowl"] = "Pavo real"
L["Phoenixes"] = "Fénix"
L["Proto-Drakes"] = "Protodracos"
L["Pterrordaxes"] = "Pterrordáctilos"
L["Quilen"] = "Quilens"
L["Rabbit"] = "Conejos"
L["Rams"] = "Carneros"
L["Raptora"] = "Accipítridos"
L["Raptors"] = "Raptores"
L["Rats"] = "Ratas"
L["Rays"] = "Rayas"
L["Razorwing"] = "Alafiladas"
L["Reptiles"] = "Reptiles"
L["Rhinos"] = "Rinocerontes"
L["Riverbeasts"] = "Bestias Fluviales"
L["Roc"] = "Rocs"
L["Rockets"] = "Cohetes"
L["Rodent"] = "Roedores"
L["Ruinstriders"] = "Vagarruinas"
L["Rylaks"] = "Rylaks"
L["Sabers"] = "Sables"
L["Scorpions"] = "Escorpiones"
L["Sea Serpents"] = "Serpientes de Mar"
L["Seahorses"] = "Caballitos de Mar"
L["Seat"] = "Asientos"
-- L["Shardhides"] = ""
L["Silithids"] = "Silítidos"
-- L["Slitherdrakes"] = ""
L["Slug"] = "Limacos"
L["Snail"] = "Caracoles"
L["Snapdragons"] = "Bocadragones"
L["Spider Tanks"] = "Arañas Mecánicas"
L["Spiders"] = "Arañas"
L["Sporebat"] = "Esporiélagos"
L["Stag"] = "Venados"
L["Steeds"] = "Corceles"
L["Stingrays"] = "Rayas Manta"
L["Stone Cats"] = "Gatos de Piedra"
L["Stone Drakes"] = "Dracos de Piedra"
-- L["Surfboard"] = ""
L["Talbuks"] = "Talbuks"
L["Tallstriders"] = "Zancudos"
L["Talonbirds"] = "Pájaros Garra"
L["Tauralus"] = "Tauralus"
L["Thunder Lizard"] = "Truenagartos"
L["Tigers"] = "Tigres"
L["Toads"] = "Sapos"
L["Turtles"] = "Tortugas"
L["Undead Drakes"] = "Dracos no Muertos"
L["Undead Steeds"] = "Corceles no Muertos"
L["Undead Wolves"] = "Lobos no Muertos"
L["Ungulates"] = "Ungulados"
L["Ur'zul"] = "Ur'zul"
L["Vehicles"] = "Vehículos"
L["Vombata"] = "Vombatas"
L["Vulpin"] = "Vulpinos"
L["Vultures"] = "Buitres"
L["War Wolves"] = "Lobos de Guerra"
L["Wasp"] = "Avispas"
L["Water Striders"] = "Záncudos Acuáticos"
L["Wilderlings"] = "Salvajizos"
L["Wind Drakes"] = "Dracos del Viento"
L["Wolfhawks"] = "Lobohalcones"
L["Wolves"] = "Lobos"
L["Wyverns"] = "Dracoleones"
L["Yaks"] = "Yaks"
L["Yetis"] = "Yetis"