if GetLocale() ~= "frFR" then
	return
end

local _, ns = ...
local L = ns.L

L["author"] = "Auteur"
-- L["Main"] = ""
L["ConfigPanelTitle"] = "Paramètres généraux"
L["Class settings"] = "Paramètres de Classe"
L["Modifier"] = "Modificateur"
L["Normal mount summon"] = "Invocation de la monture normale"
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
L["ZoneSettingsTooltipDescription"] = "Création d'une liste de montures pour la zone. Configuration des marqueurs de zone. Configuration des relations pour utiliser une liste de montures dans différentes zones."
L["ButtonsSelectedTooltipDescription"] = "Les favoris n'affectent pas les montures d'invocation utilisant %s.\n\nVous devez sélectionner les montures par type pour les convoquer dans les conditions appropriées."
-- L["ProfilesTooltipDescription"] = ""
-- L["SettingsTooltipDescription"] = "Check settings, create macros or bind keys to use %s."
-- L["Handle a jump in water"] = ""
-- L["WaterJumpDescription"] = ""
-- L["UseHerbMounts"] = "Use Mount for Herbalism"
-- L["UseHerbMountsDescription"] = "If Herbalism is learned, a suitable mount is used if available."
-- L["UseHerbMountsOnZones"] = "Only in Herb Gathering Zones"
-- L["Herb Gathering"] = "Herb Gathering"
-- L["HerbGatheringFlagDescription"] = "Used to configure use of Mount to Herbalism."
L["If item durability is less than"] = "Si la durabilité de l'objet est inférieure à"
L["In flyable zones"] = "En zone de vol"
L["UseRepairMountsDescription"] = "Si la durabilité d'au moins un objet est inférieure au pourcentage spécifié, la monture sélectionnée sera invoquée."
-- L["If the number of free slots in bags is less"] = ""
-- L["Random available mount"] = "Random available mount"
L["Use %s"] = "Utiliser %s."
-- L["Use automatically"] = "Use automatically"
L["UseMagicBroomTitle"] = "Utiliser le Balai Magique"
-- L["UseMagicBroomDescription"] = ""
-- L["UseUnderlightAnglerDescription"] = "Use Underlight Angler instead of underwater mounts."
L["A macro named \"%s\" already exists, overwrite it?"] = "Une macro nommée \"%s\" existe déjà, l'écraser?"
L["CreateMacro"] = "Créer macro"
L["CreateMacroTooltip"] = "La macro créée est utilisée pour invoquer la monture sélectionnée"
L["or key bind"] = "ou raccourcis"
-- L["ERR_MOUNT_NO_SELECTED"] = ""
L["Collected:"] = "Collecté"
L["Shown:"] = "Montré:"
-- L["With multiple models"] = "With only multiple models"
-- L["hidden for character"] = ""
L["only hidden"] = "Uniquement caché"
L["Hidden by player"] = "Masqué par le joueur"
-- L["Only new"] = "Only new"
L["types"] = "Types"
L["selected"] = "Sélectionné"
-- L["SELECT_AS_TYPE_1"] = ""
-- L["SELECT_AS_TYPE_2"] = ""
-- L["SELECT_AS_TYPE_3"] = ""
L["MOUNT_TYPE_1"] = "Volante"
L["MOUNT_TYPE_2"] = "Terrestre"
L["MOUNT_TYPE_3"] = "Nageuse"
L["MOUNT_TYPE_4"] = "Non sélectionné"
-- L["Specific"] = ""
-- L["repair"] = ""
-- L["passenger"] = ""
-- L["transform"] = ""
-- L["additional"] = ""
-- L["rest"] = ""
L["factions"] = "Factions"
L["MOUNT_FACTION_1"] = "Horde"
L["MOUNT_FACTION_2"] = "Alliance"
L["MOUNT_FACTION_3"] = "Les deux"
L["sources"] = "Sources"
-- L["PET_1"] = ""
-- L["PET_2"] = ""
-- L["PET_3"] = ""
-- L["PET_4"] = ""
L["expansions"] = "Extensions"
-- L["Receipt date"] = ""
-- L["Travel time"] = ""
-- L["Travel distance"] = ""
-- L["Avg. speed"] = ""
L["Chance of summoning"] = "Chance d'Invocation"
L["Any"] = "Tous"
L["> (more than)"] = "> (plus que)"
L["< (less than)"] = "< (moins que)"
L["= (equal to)"] = "= (égal à)"
L["sorting"] = "Trier"
-- L["Then Sort By"] = ""
-- L["Reverse Sort"] = ""
-- L["Collected First"] = ""
L["Favorites First"] = "Favoris d'abord"
-- L["Additional First"] = ""
L["Set current filters as default"] = "Utiliser le filtre actuel par défaut"
L["Restore default filters"] = "Restaurer tri par défaut"
L["Enable Acceleration around the X-axis"] = "Activer l'accélération autour de l'axe X"
L["Initial x-axis accseleration"] = "Accélération initiale sur l'axe X"
L["X-axis accseleration"] = "Accélération sur l'axe X"
L["Minimum x-axis speed"] = "Vitesse minimale axe X"
L["Enable Acceleration around the Y-axis"] = "Activer l'accélération autour de l'axe Y"
L["Initial y-axis accseleration"] = "Accélération initiale sur l'axe Y"
L["Y-axis accseleration"] = "Accélération sur l'axe Y"
L["Minimum y-axis speed"] = "Vitesse minimal axe Y"
L["Model"] = "Modèle"
L["Map"] = "Carte"
-- L["Map flags"] = ""
L["Settings"] = "Réglages"
L["Dungeons and Raids"] = "Donjons et Raids"
L["Current Location"] = "Localisation actuelle"
L["Enable Flags"] = "Activer les drapeaux"
L["Ground Mounts Only"] = "Monture terrestre uniquement"
L["Water Walking"] = "Marche sur l'eau"
L["WaterWalkFlagDescription"] = "Utiliser pour configurer les classes"
L["ListMountsFromZone"] = "Utiliser la liste de montures de la zone"
L["No relation"] = "Pas de relation"
L["Zones with list"] = "Zones avec une liste"
-- L["Zones with relation"] = ""
-- L["Zones with flags"] = ""
L["CHARACTER_CLASS_DESCRIPTION"] = "(les paramètres du personnage remplacent les paramètres de classe)"
L["HELP_MACRO_MOVE_FALL"] = "Cette macro s'exécutera, en extérieur ou en mouvement, et que vous n'avez pas de balai magique ou qu'il est désactivé."
L["HELP_MACRO_COMBAT"] = "Cette macro s'exécutera, si vous êtes en combat"
L["CLASS_USEWHENCHARACTERFALLS"] = "Utiliser la monture %s quand le personnage tombe"
L["CLASS_USEWATERWALKINGSPELL"] = "Utiliser la monture %s lors de l'invocation d'une monture au sol"
L["CLASS_USEONLYWATERWALKLOCATION"] = "A n'utiliser que dans les zones aquatiques"
L["PALADIN_USECRUSADERAURA"] = "Utiliser l'%s lorsque vous invoquez la monture"
L["PALADIN_RETURNLASTAURA"] = "Remettre la précédente aura en descendant de la monture"
L["DRUID_USELASTDRUIDFORM"] = "Remettre la précédente forme en descendant de la monture"
L["DRUID_USETRAVELIFCANTFLY"] = "Utiliser %s au lieu de la macro si le personnage ne peut voler"
-- L["DRUID_USEDRUIDFORMSPECIALIZATION"] = "Return a specialization form"
L["DRUID_USEMACROALWAYS"] = "Utiliser cette macro au lieu des montures"
-- L["DRUID_USEMACROONLYCANFLY"] = ""
L["Summonable Battle Pet"] = "Compagnons de bataille invocable"
L["Summon Random Battle Pet"] = "Invoquer un compagnon de bataille au hasard"
L["No Battle Pet"] = "Pas de compagnon de bataille"
-- L["Summon a pet every"] = ""
-- L["min"] = ""
-- L["Summon only favorites"] = ""
L["NoPetInRaid"] = "Ne pas invoquer de compagnon en groupe raid"
L["NoPetInGroup"] = "Ne pas invoquer de compagnon en groupe"
L["Enable arrow buttons to browse mounts"] = "Activer les flèches du clavier pour parcourir les montures"
-- L["Show mount type selection buttons"] = ""
L["CopyMountTarget"] = "Essayez de copier la monture de la cible"
L["Open links in %s"] = "Ouvrir les liens dans %s"
L["Click opens in"] = "Cliquer sur ouvrir dans"
-- L["Show wowhead link in mount preview"] = ""
-- L["Enable statistics collection"] = ""
-- L["STATISTICS_DESCRIPTION"] = ""
-- L["Show mount in unit tooltip"] = ""
L["Show Minimap Button"] = "Afficher le bouton sur la Minimap"
L["Lock Minimap Button"] = "Verrouiller le bouton sur la minimap"
L["|cffff7f3fClick|r to open %s"] = "|cffff7f3fCliquer|r pour ouvrir %s"
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
L["About"] = "À propos de"
L["Help with translation of %s. Thanks."] = "Aide avec la translation de %s. Merci."
L["Localization Translators:"] = "Traducteurs:"
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
L["Default"] = "Par défaut"
L["Mount special"] = "Monture spéciale"
L["Walk"] = "Marcher"
L["Walk backwards"] = "marcher en arrière"
L["Run"] = "Courir"
L["Swim idle"] = "Nager au ralenti"
L["Swim"] = "Nager"
L["Swim backwards"] = "Nager en arrière"
L["Fly stand"] = "Vol stationnaire"
L["Fly"] = "Voler"
L["Fly backwards"] = "Voler en arrière"
L["Loop"] = "Boucle"
L["Are you sure you want to delete animation %s?"] = "Etes vous sûr de vouloir supprimer l'animation \"%s\"?"
-- PROFILES
-- L["Profile"] = ""
L["Profiles"] = "Profils"
L["New profile"] = "Nouveau profil"
L["Create"] = "Créer"
L["Copy current"] = "Copier des paramètres actuels"
-- L["Export"] = ""
-- L["Import"] = ""
L["A profile with the same name exists."] = "Il existe un profil du même nom."
-- L["HOLIDAY_ACTIVE"] = ""
L["Profile settings"] = "Réglages du profil"
-- L["Pet binding from default profile"] = ""
-- L["Zones settings from default profile"] = ""
L["Auto add new mounts to selected"] = "Ajouter automatiquement vos nouvelles montures à la sélection"
-- L["Select all favorite mounts by type in the selected zone"] = ""
-- L["Select all mounts by type in selected zone"] = ""
L["Unselect all mounts in selected zone"] = "Déselectionne toutes les montures dans une zone sélectionné."
L["Are you sure you want to delete profile %s?"] = "Etes vous sûr de vouloir supprimer le profil \"%s\"?"
L["Are you sure you want %s?"] = "Etes vous sur de vouloir \"%s\"?"
-- TAGS
L["tags"] = "Mots clés"
L["No tag"] = "Pas de mot clé"
L["With all tags"] = "Avec tous les mots clés"
L["Add tag"] = "Ajouter un tag"
L["Tag already exists."] = "Mot clé déjà existant"
L["Are you sure you want to delete tag %s?"] = "Etes vous sûr de vouloir supprimer le tag \"%s\"?"
-- FAMILY
L["Family"] = "Famille"
L["Airplanes"] = "Avions"
L["Airships"] = "Dirigeables"
-- L["Albatross"] = ""
L["Alpacas"] = "Alpagas"
L["Amphibian"] = "Amphibien"
L["Animite"] = "Animacarus"
L["Aqir Flyers"] = "Mouches Aqir"
L["Arachnids"] = "Arachnides"
L["Armoredon"] = "Armoredon"
L["Assault Wagons"] = "Chariots de combat"
L["Basilisks"] = "Basilics"
L["Bats"] = "Chauves-souris"
L["Bears"] = "Ours"
L["Beetle"] = "Scarabées"
L["Bipedal Cat"] = "Chats bipèdes"
L["Birds"] = "Oiseaux"
L["Blood Ticks"] = "Tiques de sang"
L["Boars"] = "Sangliers"
L["Book"] = "Livre"
L["Bovids"] = "Bovidés"
L["Broom"] = "Balai"
L["Brutosaurs"] = "Brutosaures"
L["Camels"] = "Dromadaires"
L["Carnivorans"] = "Carnivores"
L["Carpets"] = "Tapis"
L["Cats"] = "Félins"
L["Cervid"] = "Cervidés"
L["Chargers"] = "Destriers"
L["Chickens"] = "Poulets"
L["Clefthooves"] = "Sabot-fourchus"
L["Cloud Serpents"] = "Serpents-nuage"
L["Core Hounds"] = "Chien du magma"
L["Crabs"] = "Crabes"
L["Cranes"] = "Grues"
L["Crawgs"] = "Croggs"
L["Crocolisks"] = "Crocilisques"
L["Crows"] = "Corbeaux"
L["Demonic Hounds"] = "Molosses démoniaques"
L["Demonic Steeds"] = "Palefrois démoniaques"
L["Demons"] = "Démons"
L["Devourer"] = "Dévoreurs"
L["Dinosaurs"] = "Dinosaures"
L["Dire Wolves"] = "Loups redoutables"
L["Direhorns"] = "Navrecornes"
L["Discs"] = "Disques"
L["Dragonhawks"] = "Faucon-dragons"
L["Drakes"] = "Drakes"
L["Dread Ravens"] = "Corbeaux de l’effroi"
L["Dreamsaber"] = "Sabres de rêve"
L["Eagle"] = "Aigles"
L["Elekks"] = "Elekks"
L["Elementals"] = "Élémentaires"
L["Falcosaurs"] = "Falcosaures"
L["Fathom Rays"] = "Raies pélagiques"
L["Feathermanes"] = "Crins-de-plume"
L["Felsabers"] = "Gangresabres"
L["Fish"] = "Poissons"
L["Flies"] = "Mouches"
L["Flying Steeds"] = "Palefrois volants"
L["Foxes"] = "Renards"
L["Gargon"] = "Gargon"
L["Gargoyle"] = "Gargouilles"
L["Goats"] = "Chèvres"
L["Gorger"] = "Goinfre"
L["Gorm"] = "Gorm"
L["Grand Drakes"] = "Grands drakes"
L["Gronnlings"] = "Gronnlins"
L["Gryphons"] = "Griffons"
L["Gyrocopters"] = "Gyrocoptère"
L["Hands"] = "Mains"
L["Hawkstriders"] = "Faucon-pérégrins"
L["Hippogryphs"] = "Hippogriffes"
L["Horned Steeds"] = "Palefrois à cornes"
L["Horses"] = "Chevaux"
L["Hounds"] = "Molosses"
L["Hovercraft"] = "Aéroglisseurs"
L["Humanoids"] = "Humanoïdes"
L["Hyenas"] = "Hyènes"
L["Infernals"] = "Infernaux"
L["Insects"] = "Insectes"
L["Jellyfish"] = "Méduses"
L["Jet Aerial Units"] = "Unités aériennes à réaction"
L["Kites"] = "Cerfs-volants"
L["Kodos"] = "Kodos"
L["Krolusks"] = "Krolusks"
L["Larion"] = "Volion"
L["Lions"] = "Lions"
L["Lupine"] = "Lupins"
L["Mammoths"] = "Mammouths"
L["Mana Rays"] = "Raies de mana"
L["Manasabers"] = "Sabres-de-mana"
L["Mauler"] = "Marteleurs"
L["Mechanical Animals"] = "Animaux mécaniques"
L["Mechanical Birds"] = "Oiseaux mécaniques"
L["Mechanical Cats"] = "Félins mécaniques"
L["Mechanical Steeds"] = "Palefrois mécaniques"
L["Mechanostriders"] = "Mécanotrotteurs"
L["Mecha-suits"] = "Armures mécaniques"
L["Mollusc"] = "Mollusques"
L["Moose"] = "Élans"
L["Moth"] = "Phalènes"
L["Motorcycles"] = "Motos"
L["Mountain Horses"] = "Chevaux des montagnes"
L["Murloc"] = "Murloc"
L["Mushan"] = "Mushans"
L["Nether Drakes"] = "Drakes du Néant"
L["Nether Rays"] = "Raies du Néant"
L["N'Zoth Serpents"] = "Serpents de N'Zoth"
L["Others"] = "Autres"
L["Ottuk"] = "Loutrèkes"
L["Owl"] = "Chouettes"
L["Owlbear"] = "Chouettes-ours"
L["Ox"] = "Buffle"
L["Pandaren Phoenixes"] = "Phénix pandarens"
L["Parrots"] = "Psittaciformes"
L["Peafowl"] = "Paon"
L["Phoenixes"] = "Phénix"
L["Proto-Drakes"] = "Proto-drakes"
L["Pterrordaxes"] = "Pterreurdactyles"
L["Quilen"] = "Quilens"
L["Rabbit"] = "Lapins"
L["Rams"] = "Béliers"
L["Raptora"] = "Raptoras"
L["Raptors"] = "Raptors"
L["Rats"] = "Rats"
L["Rays"] = "Raies"
L["Razorwing"] = "Rasailes"
L["Reptiles"] = "Reptiles"
L["Rhinos"] = "Rhinocéros"
L["Riverbeasts"] = "Potamodontes"
L["Roc"] = "Rocs"
L["Rockets"] = "Fusées"
L["Rodent"] = "Rongeurs"
L["Ruinstriders"] = "Foules-ruines"
L["Rylaks"] = "Rylaks"
L["Sabers"] = "Smilodons"
L["Scorpions"] = "Scorpides"
L["Sea Serpents"] = "Serpents de mer"
L["Seahorses"] = "Hippocampes"
L["Seat"] = "Sièges"
-- L["Shardhides"] = ""
L["Silithids"] = "Silithides"
L["Slug"] = "Limaces"
L["Snail"] = "Escargots"
L["Snapdragons"] = "Mordragons"
L["Spider Tanks"] = "Chars araignée"
L["Spiders"] = "Araignées"
L["Sporebat"] = "Sporoptères"
L["Stag"] = "Cerfs"
L["Steeds"] = "Palefrois"
L["Stingrays"] = "Pastenagues"
L["Stone Cats"] = "Chats de pierre"
L["Stone Drakes"] = "Drakes de pierre"
-- L["Surfboard"] = ""
L["Talbuks"] = "Talbuks"
L["Tallstriders"] = "Trotteurs"
L["Talonbirds"] = "Rapaces"
L["Tauralus"] = "Tauralus"
L["Thunder Lizard"] = "Lézard-tonnerre"
L["Tigers"] = "Tigres"
L["Toads"] = "Crapauds"
L["Turtles"] = "Tortues"
L["Undead Drakes"] = "Drakes morts-vivants"
L["Undead Steeds"] = "Palefrois morts-vivants"
L["Undead Wolves"] = "Loups morts-vivants"
L["Ungulates"] = "Ongulés"
L["Ur'zul"] = "Ur'zul"
L["Vehicles"] = "Véhicules"
L["Vombata"] = "Vombata"
L["Vulpin"] = "Vulpins"
L["Vultures"] = "Vautours"
L["War Wolves"] = "Loups de guerre"
L["Wasp"] = "Guêpes"
L["Water Striders"] = "Trotteurs aquatiques"
L["Wilderlings"] = "Lycodracs"
L["Wind Drakes"] = "Drakes des vents"
L["Wolfhawks"] = "Loups-faucons"
L["Wolves"] = "Loups"
L["Wyverns"] = "Wyvernes"
L["Yaks"] = "Yacks"
L["Yetis"] = "Yétis"