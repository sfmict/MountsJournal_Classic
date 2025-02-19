if GetLocale() ~= "deDE" then
	return
end

local _, ns = ...
local L = ns.L

L["author"] = "Autor"
-- L["Main"] = ""
L["ConfigPanelTitle"] = "Globale Einstellungen"
L["Class settings"] = "Klasseneinstellungen"
L["Modifier"] = "Modifikator"
L["Normal mount summon"] = "Normale Reittierbeschwörung."
L["SecondMountTooltipTitle"] = "Wenn der Modifikator ist oder \"%s 2\" verwendet wird:"
L["SecondMountTooltipDescription"] = "Wenn du im Wasser bist, wird ein Nicht-Wasservogel-Reittier beschworen.\n\nWenn du an Land bist und fliegen kannst, wird ein Boden-Reittier beschworen."
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
L["ZoneSettingsTooltip"] = "Merkmale der Zoneneinstellungen"
L["ZoneSettingsTooltipDescription"] = "Erstellen einer Liste von Mounts für die Zone.\n\nKonfigurieren der Zonenflags.\n\nEinrichten von Relationen zur Verwendung einer Liste von Mounts in verschiedenen Zonen."
L["ButtonsSelectedTooltipDescription"] = "Die Schaltflächen an der Seite wählt Reittiere nach Typ aus, um sie unter den entsprechenden Bedingungen zu beschwören.\n\nFavoriten haben keinen Einfluss auf die Beschwörung von Reittieren mit %s."
L["ProfilesTooltipDescription"] = "Profileinstellungen, das Profil verwaltet die Listen der ausgewählten Reittiere, die Einstellungen der Zonen und der Haustiere."
-- L["SettingsTooltipDescription"] = "Check settings, create macros or bind keys to use %s."
L["Handle a jump in water"] = "Einen Sprung ins Wasser meistern"
L["WaterJumpDescription"] = "Nachdem Sie ins Wasser gesprungen sind, wird nicht unter Wasser Reittier beschworen"
-- L["UseHerbMounts"] = "Use Mount for Herbalism"
-- L["UseHerbMountsDescription"] = "If Herbalism is learned, a suitable mount is used if available."
-- L["UseHerbMountsOnZones"] = "Only in Herb Gathering Zones"
-- L["Herb Gathering"] = "Herb Gathering"
-- L["HerbGatheringFlagDescription"] = "Used to configure use of Mount to Herbalism."
L["If item durability is less than"] = "Wenn die Haltbarkeit des Items geringer ist als"
L["In flyable zones"] = "In flugfähigen Zonen"
L["UseRepairMountsDescription"] = "Wenn die Haltbarkeit mindestens eines Gegenstandes unter dem angegebenen Prozentsatz liegt, wird das ausgewählte Reittier beschworen."
-- L["If the number of free slots in bags is less"] = ""
-- L["Random available mount"] = "Random available mount"
L["Use %s"] = "Benutze %s"
-- L["Use automatically"] = "Use automatically"
L["UseMagicBroomTitle"] = "Zauberbesen verwenden"
L["UseMagicBroomDescription"] = "Wenn das \"Hallow's End\"-Ereignis aktiv ist, wird ein \"Zauberbesen\" verwendet, wenn du einen hast."
-- L["UseUnderlightAnglerDescription"] = "Use Underlight Angler instead of underwater mounts."
L["A macro named \"%s\" already exists, overwrite it?"] = "Ein Makro mit dem Namen \"%s\" existiert bereits, willst du es überschreiben?"
L["CreateMacro"] = "Makro erstellen"
L["CreateMacroTooltip"] = "Das erstellte Makro wird verwendet, um die ausgewählten Reittiere aufzurufen."
L["or key bind"] = "oder Tastenbindung"
-- L["ERR_MOUNT_NO_SELECTED"] = ""
L["Collected:"] = "Gesammelt"
L["Shown:"] = "Abgebildet:"
-- L["With multiple models"] = "With only multiple models"
L["hidden for character"] = "Versteckt für Charakter"
L["only hidden"] = "Nur versteckte"
L["Hidden by player"] = "Vom Spieler versteckt"
-- L["Only new"] = "Only new"
L["types"] = "Typen"
L["selected"] = "Ausgewählte"
L["MOUNT_TYPE_1"] = "Fliegen"
L["MOUNT_TYPE_2"] = "Boden"
L["MOUNT_TYPE_3"] = "Unter Wasser"
L["MOUNT_TYPE_4"] = "Nicht ausgewählt"
-- L["Specific"] = ""
-- L["repair"] = ""
-- L["passenger"] = ""
-- L["transform"] = ""
-- L["additional"] = ""
-- L["rest"] = ""
L["factions"] = "Fraktionen"
L["MOUNT_FACTION_1"] = "Horde"
L["MOUNT_FACTION_2"] = "Allianz"
L["MOUNT_FACTION_3"] = "Beide"
L["sources"] = "Quellen"
L["PET_1"] = "Mit zufälligem Lieblingshaustier"
L["PET_2"] = "Mit zufälligem Haustier"
L["PET_3"] = "Mit Haustier"
L["PET_4"] = "Ohne Haustier"
L["expansions"] = "Erweiterungen"
-- L["Travel time"] = ""
-- L["Travel distance"] = ""
-- L["Avg. speed"] = ""
L["Chance of summoning"] = "Chance auf Beschwörung"
L["Any"] = "Alle"
L["> (more than)"] = "> (mehr als)"
L["< (less than)"] = "< (weniger als)"
L["= (equal to)"] = "= (gleich)"
L["sorting"] = "Sortieren"
-- L["Then Sort By"] = ""
L["Reverse Sort"] = "Umgekehrte Sortierung"
-- L["Collected First"] = ""
L["Favorites First"] = "Favoriten zuerst"
-- L["Additional First"] = ""
L["Set current filters as default"] = "Aktuelle Filter als Standard festlegen"
L["Restore default filters"] = "Standardfilter wiederherstellen"
L["Enable Acceleration around the X-axis"] = "Aktivieren die Beschleunigung um die X-Achse"
L["Initial x-axis accseleration"] = "Anfangsbeschleunigung der X-Achse"
L["X-axis accseleration"] = "X-Achse Beschleunigung"
L["Minimum x-axis speed"] = "Mindestgeschwindigkeit der X-Achse"
L["Enable Acceleration around the Y-axis"] = "Aktivieren die Beschleunigung um die Y-Achse"
L["Initial y-axis accseleration"] = "Anfangsbeschleunigung der Y-Achse"
L["Y-axis accseleration"] = "Y-Achse Beschleunigung"
L["Minimum y-axis speed"] = "Mindestgeschwindigkeit der Y-Achse"
L["Model"] = "Modell"
L["Map"] = "Karte"
-- L["Map flags"] = ""
L["Settings"] = "Einstellungen"
L["Dungeons and Raids"] = "Dungeons und Raids"
L["Current Location"] = "Aktueller Standort"
L["Enable Flags"] = "Flags aktivieren"
L["Ground Mounts Only"] = "Nur Boden Reittiere"
L["Water Walking"] = "Wasser wandeln"
L["WaterWalkFlagDescription"] = "Wird zum Konfigurieren einiger Klassen verwendet."
L["ListMountsFromZone"] = "Liste die Reittiere aus der Zone aus"
L["No relation"] = "Keine Verbindung"
L["Zones with list"] = "Zonen mit Liste"
L["Zones with relation"] = "Zonen mit Beziehung"
L["Zones with flags"] = "Zonen mit Flaggen"
L["CHARACTER_CLASS_DESCRIPTION"] = "(Charaktereinstellungen überschreiben Klasseneinstellungen)"
L["HELP_MACRO_MOVE_FALL"] = "Dieses Makro wird ausgeführt, wenn Du dich in einem Gebäude befindest oder dich bewegst und Du keinen Zauberbesen hast oder dieser ausgeschaltet ist."
L["HELP_MACRO_COMBAT"] = "Dieses Makro wird ausgeführt, wenn Du dich im Kampf befindest."
L["CLASS_USEWHENCHARACTERFALLS"] = "Verwenden das %s, wenn das Charakter fällt"
L["CLASS_USEWATERWALKINGSPELL"] = "Verwende die %s beim Beschwören von Bodenreittieren"
L["CLASS_USEONLYWATERWALKLOCATION"] = "Nur in Wasserlaufzonen verwenden"
L["PALADIN_USECRUSADERAURA"] = "Benutze die %s beim Beschwören von Reittieren"
L["PALADIN_RETURNLASTAURA"] = "Zuletzt genutzte Aura beim Absteigen aktivieren"
L["DRUID_USELASTDRUIDFORM"] = "Benutzte die letzte Form wenn man entmountet"
L["DRUID_USETRAVELIFCANTFLY"] = "%s statt Makro verwenden, wenn der Charakter nicht fliegen kann"
-- L["DRUID_USEDRUIDFORMSPECIALIZATION"] = "Return a specialization form"
L["DRUID_USEMACROALWAYS"] = "Verwenden diese Makros anstelle von Reittieren"
-- L["DRUID_USEMACROONLYCANFLY"] = ""
L["Summonable Battle Pet"] = "Beschwörbares Kampfhaustier"
L["Summon Random Battle Pet"] = "Zufälliges Kampfhaustier beschwören"
L["No Battle Pet"] = "Kein Kampfhaustier"
L["Summon a pet every"] = "Haustier beschwören alle"
L["min"] = "min"
L["Summon only favorites"] = "Nur Favoriten beschwören"
L["NoPetInRaid"] = "Kein Kampfhaustier in der Schlachtzugsgruppe beschwören"
L["NoPetInGroup"] = "Kein Kampfhaustier in der Gruppe beschwören"
L["CopyMountTarget"] = "Versuche, das Reittier deines Ziels zu kopieren"
L["Enable arrow buttons to browse mounts"] = "Aktivieren die Pfeiltasten zum Durchsuchen der Reittiere"
L["Open links in %s"] = "Links öffnen in %s"
L["Click opens in"] = "Klick öffnet in"
-- L["Show wowhead link in mount preview"] = ""
-- L["Enable statistics collection"] = ""
-- L["STATISTICS_DESCRIPTION"] = ""
L["Show Minimap Button"] = "Minimap Button anzeigen"
L["Lock Minimap Button"] = "Minimap Button sperren"
L["|cffff7f3fClick|r to open %s"] = "|cffff7f3fKlick|r um %s zu öffnen"
-- L["Rule Sets"] = ""
-- L["New rule set"] = ""
-- L["A rule set with the same name exists."] = ""
-- L["Are you sure you want to delete rule set %s?"] = ""
-- L["Set as default"] = ""
-- L["Rules"] = ""
-- L["RULES_TITLE"] = ""
-- L["Add Rule"] = ""
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
-- L["A snippet with the same name exists."] = ""
-- L["Are you sure you want to delete snippet %s?"] = ""
-- L["Line"] = ""
-- L["Examples"] = ""
-- L["Tab Size"] = ""
-- L["Do you want to save changes?"] = ""
L["About"] = "Über"
L["Help with translation of %s. Thanks."] = "Hilfe bei der Übersetzung von %s. Danke."
L["Localization Translators:"] = "Lokalisierung Übersetzer:"
-- L["ABBR_YARD"] = ""
-- L["ABBR_MILE"] = ""
-- L["ABBR_METER"] = ""
-- L["ABBR_KILOMETER"] = ""
-- L["ABBR_HOUR"] = ""
-- ANIMATIONS
L["Default"] = "Standard"
L["Mount special"] = "Mount Spezial"
L["Walk"] = "Gehen"
L["Walk backwards"] = "Rückwärts gehen"
L["Run"] = "rennen"
L["Swim idle"] = "Schwimmen im Ruhezustand"
L["Swim"] = "Schwimmen"
L["Swim backwards"] = "Rückwärts schwimmen"
L["Fly stand"] = "Fliegerhorst"
L["Fly"] = "Fliegen"
L["Fly backwards"] = "Rückwärts fliegen"
L["Loop"] = "Schleife"
L["Are you sure you want to delete animation %s?"] = "Bist du sicher das du die Animation \"%s\" löschen möchtest?"
-- PROFILES
L["Profiles"] = "Profile"
L["New profile"] = "Neues Profil"
L["Create"] = "Erstellen"
L["Copy current"] = "Kopieren aktuelles"
L["A profile with the same name exists."] = "Es existiert ein Profil mit demselben Namen."
-- L["HOLIDAY_ACTIVE"] = ""
L["Profile settings"] = "Profileinstellungen"
L["Pet binding from default profile"] = "Haustierbindung aus Standardprofil"
L["Zones settings from default profile"] = "Zoneneinstellungen aus dem Standardprofil"
L["Auto add new mounts to selected"] = "Automatisches hinzufügen von neuen Reittieren zu den ausgewählten"
L["Select all favorite mounts by type in the selected zone"] = "Auswahl aller bevorzugten Reittiere nach Typ in der ausgewählten Zone"
L["Select all mounts by type in selected zone"] = "Auswahl aller Reittiere nach Typ in der ausgewählten Zone"
L["Unselect all mounts in selected zone"] = "Alle Reittiere in der ausgewählten Zone abwählen"
L["Are you sure you want to delete profile %s?"] = "Bist du sicher das du die Profile \"%s\" löschen möchtest?"
L["Are you sure you want %s?"] = "Sicher das du \"%s\" möchtest?"
-- TAGS
L["tags"] = "Tags"
L["No tag"] = "Kein Tag"
L["With all tags"] = "Mit allen Tags"
L["Add tag"] = "Tag hinzufügen"
L["Tag already exists."] = "Tag existiert bereits."
L["Are you sure you want to delete tag %s?"] = "Sind Sie sicher, dass Sie den Tag löschen möchten %s?"
-- FAMILY
L["Family"] = "Familie"
L["Airplanes"] = "Flugzeuge"
L["Airships"] = "Luftschiffe"
-- L["Albatross"] = ""
L["Alpacas"] = "Alpakas"
L["Amphibian"] = "Amphibien"
L["Animite"] = "Animilbe"
L["Aqir Flyers"] = "Aqir-Flieger"
L["Arachnids"] = "Spinnentiere"
L["Armoredon"] = "Panzerdon"
L["Assault Wagons"] = "Angriffswagen"
L["Basilisks"] = "Basilisken"
L["Bats"] = "Fledermäuse"
L["Bears"] = "Bären"
L["Beetle"] = "Käfer"
L["Bipedal Cat"] = "Zweibeinige Katze"
L["Birds"] = "Vögel"
L["Blood Ticks"] = "Blutschwärmer"
L["Boars"] = "Eber"
L["Book"] = "Buch"
L["Bovids"] = "Hornträger"
L["Broom"] = "Besen"
L["Brutosaurs"] = "Brutosaurier"
L["Camels"] = "Kamele"
L["Carnivorans"] = "Raubtiere"
L["Carpets"] = "Teppiche"
L["Cats"] = "Katzen"
L["Cervid"] = "Cervid"
L["Chargers"] = "Streitrosse"
L["Chickens"] = "Hühner"
L["Clefthooves"] = "Spalthufe"
L["Cloud Serpents"] = "Wolkenschlangen"
L["Core Hounds"] = "Kernhunde"
L["Crabs"] = "Krabben"
L["Cranes"] = "Kraniche"
L["Crawgs"] = "Kroggs"
L["Crocolisks"] = "Krokilisk"
L["Crows"] = "Krähen"
L["Demonic Hounds"] = "Dämonische Hunde"
L["Demonic Steeds"] = "Dämonische Pferde"
L["Demons"] = "Dämonen"
L["Devourer"] = "Verschlinger"
L["Dinosaurs"] = "Dinosaurier"
L["Dire Wolves"] = "Terrorwölfe"
L["Direhorns"] = "Terrorhörner"
L["Discs"] = "Flugscheiben"
L["Dragonhawks"] = "Drachenfalken"
L["Drakes"] = "Drachen"
L["Dread Ravens"] = "Schreckensraben"
L["Dreamsaber"] = "Traumsäbler"
L["Eagle"] = "Adler"
L["Elekks"] = "Elekks"
L["Elementals"] = "Elementare"
L["Falcosaurs"] = "Falkosaurier"
L["Fathom Rays"] = "Tiefenrochen"
L["Feathermanes"] = "Federmähnen"
L["Felsabers"] = "Teufelssäbler"
L["Fish"] = "Fische"
L["Flies"] = "Fliegen"
L["Flying Steeds"] = "Fliegende Pferde"
L["Foxes"] = "Füchse"
L["Gargon"] = "Gargon"
L["Gargoyle"] = "Gargoyle"
L["Goats"] = "Ziegen"
L["Gorger"] = "Verschlinger"
L["Gorm"] = "Gorm"
L["Grand Drakes"] = "Großdrachen"
L["Gronnlings"] = "Gronnlinge"
L["Gryphons"] = "Greifen"
L["Gyrocopters"] = "Gyrokopter"
L["Hands"] = "Hände"
L["Hawkstriders"] = "Falkenschreiter"
L["Hippogryphs"] = "Hippogryphen"
L["Horned Steeds"] = "Behornte Pferde"
L["Horses"] = "Pferde"
L["Hounds"] = "Hunde"
L["Hovercraft"] = "Luftkissenfahrzeug"
L["Humanoids"] = "Humanoide"
L["Hyenas"] = "Hyänen"
L["Infernals"] = "Höllenbestien"
L["Insects"] = "Insekten"
L["Jellyfish"] = "Quallen"
L["Jet Aerial Units"] = "Lufteinheiten"
L["Kites"] = "Flugdrachen"
L["Kodos"] = "Kodos"
L["Krolusks"] = "Krolusk"
L["Larion"] = "Larion"
L["Lions"] = "Löwen"
L["Lupine"] = "Lupin"
L["Mammoths"] = "Mammuts"
L["Mana Rays"] = "Manarochen"
L["Manasabers"] = "Manasäbler"
L["Mauler"] = "Zerfleischer"
L["Mechanical Animals"] = "Mechanische Tiere"
L["Mechanical Birds"] = "Mechanische Vögel"
L["Mechanical Cats"] = "Mechanische Katzen"
L["Mechanical Steeds"] = "Mechanische Pferde"
L["Mechanostriders"] = "Roboschreiter"
L["Mecha-suits"] = "Mecha"
L["Mollusc"] = "Weichtiere"
L["Moose"] = "Elche"
L["Moth"] = "Motte"
L["Motorcycles"] = "Motorräder"
L["Mountain Horses"] = "Bergpferde"
L["Murloc"] = "Murloc"
L["Mushan"] = "Mushans"
L["Nether Drakes"] = "Netherdrachen"
L["Nether Rays"] = "Netherrochen"
L["N'Zoth Serpents"] = "N'Zoth-Schlangen"
L["Others"] = "Andere"
L["Ottuk"] = "Ottuk"
L["Owl"] = "Eule"
L["Owlbear"] = "Eulenbär"
L["Ox"] = "Ochse"
L["Pandaren Phoenixes"] = "Pandarenphönixe"
L["Parrots"] = "Papageien"
L["Peafowl"] = "Pfau"
L["Phoenixes"] = "Phönixe"
L["Proto-Drakes"] = "Protodrachen"
L["Pterrordaxes"] = "Pterrordaxe"
L["Quilen"] = "Qilen"
L["Rabbit"] = "Hase"
L["Rams"] = "Widder"
L["Raptora"] = "Raptora"
L["Raptors"] = "Raptoren"
L["Rats"] = "Ratten"
L["Rays"] = "Rochen"
L["Razorwing"] = "Klingenschwinge"
L["Reptiles"] = "Reptilien"
L["Rhinos"] = "Rhinozerosse"
L["Riverbeasts"] = "Flussbestien"
L["Roc"] = "Roc"
L["Rockets"] = "Raketen"
L["Rodent"] = "Nagetier"
L["Ruinstriders"] = "Ruinprescher"
L["Rylaks"] = "Rylaks"
L["Sabers"] = "Säbler"
L["Scorpions"] = "Skorpione"
L["Sea Serpents"] = "Seeschlangen"
L["Seahorses"] = "Seepferde"
L["Seat"] = "Wiege"
-- L["Shardhides"] = ""
L["Silithids"] = "Qirajipanzerdrohnen"
L["Slug"] = "Nacktschnecke"
L["Snail"] = "Schnecke"
L["Snapdragons"] = "Schnappdrachen"
L["Spider Tanks"] = "Mechaspinnen"
L["Spiders"] = "Spinnen"
L["Sporebat"] = "Sporensegler"
L["Stag"] = "Hirsch"
L["Steeds"] = "Pferde"
L["Stingrays"] = "Stachelrochen"
L["Stone Cats"] = "Steinkatzen"
L["Stone Drakes"] = "Steindrachen"
-- L["Surfboard"] = ""
L["Talbuks"] = "Talbuks"
L["Tallstriders"] = "Schreiter"
L["Talonbirds"] = "Raben"
L["Tauralus"] = "Tauralus"
L["Thunder Lizard"] = "Donnerechse"
L["Tigers"] = "Tiger"
L["Toads"] = "Kröten"
L["Turtles"] = "Schildkröten"
L["Undead Drakes"] = "Untote Drachen"
L["Undead Steeds"] = "Untote Pferde"
L["Undead Wolves"] = "Untote Wölfe"
L["Ungulates"] = "Huftiere"
L["Ur'zul"] = "Ur'zul"
L["Vehicles"] = "Fahrzeuge"
L["Vombata"] = "Vombata"
L["Vulpin"] = "Vulpin"
L["Vultures"] = "Geier"
L["War Wolves"] = "Kriegswölfe"
L["Wasp"] = "Wespe"
L["Water Striders"] = "Wasserschreiter"
L["Wilderlings"] = "Wildling"
L["Wind Drakes"] = "Winddrachen"
L["Wolfhawks"] = "Wolfsfalken"
L["Wolves"] = "Wölfe"
L["Wyverns"] = "Wyvern"
L["Yaks"] = "Yaks"
L["Yetis"] = "Yetis"