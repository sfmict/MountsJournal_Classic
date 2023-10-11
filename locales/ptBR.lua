if GetLocale() ~= "ptBR" then
	return
end

local _, L = ...

L["author"] = "Autor"
-- L["%s Configuration"] = ""
L["ConfigPanelTitle"] = "Configurações globais"
L["Class settings"] = "Configurações por classe"
-- L["Modifier"] = ""
-- L["Normal mount summon"] = ""
-- L["SecondMountTooltipTitle"] = ""
-- L["SecondMountTooltipDescription"] = ""
-- L["ZoneSettingsTooltip"] = ""
-- L["ZoneSettingsTooltipDescription"] = ""
-- L["ButtonsSelectedTooltipDescription"] = ""
-- L["ProfilesTooltipDescription"] = ""
-- L["SettingsTooltipDescription"] = "Check settings, create macros or bind keys to use %s."
-- L["Handle a jump in water"] = "Handle a jump in water"
-- L["WaterJumpDescription"] = "After you jump in water will be summoned non underwater mount."
-- L["UseHerbMounts"] = "Use Mount for Herbalism"
-- L["UseHerbMountsDescription"] = "If Herbalism is learned, a suitable mount is used if available."
-- L["UseHerbMountsOnZones"] = "Only in Herb Gathering Zones"
-- L["Herb Gathering"] = "Herb Gathering"
-- L["HerbGatheringFlagDescription"] = "Used to configure use of Mount to Herbalism."
-- L["If item durability is less than"] = ""
-- L["In flyable zones"] = ""
-- L["UseRepairMountsDescription"] = ""
-- L["Random available mount"] = "Random available mount"
L["Use %s"] = "Usar %s"
-- L["Use automatically"] = "Use automatically"
-- L["UseMagicBroomTitle"] = ""
-- L["UseMagicBroomDescription"] = ""
-- L["UseUnderlightAnglerDescription"] = "Use Underlight Angler instead of underwater mounts."
L["A macro named \"%s\" already exists, overwrite it?"] = "Já existe uma macro chamada \"%s\", substituir ?"
L["CreateMacro"] = "Criar Macro"
L["CreateMacroTooltip"] = "A macro criada é usada para evocar as montagens selecionadas."
-- L["or key bind"] = ""
L["Collected:"] = "Coletada"
-- L["Settings"] = ""
L["Shown:"] = "Mostrando:"
-- L["With multiple models"] = "With only multiple models"
-- L["hidden for character"] = "Hidden For Character"
-- L["only hidden"] = ""
-- L["Hidden by player"] = ""
-- L["Only new"] = "Only new"
L["types"] = "Tipos"
-- L["selected"] = ""
-- L["MOUNT_TYPE_1"] = ""
-- L["MOUNT_TYPE_2"] = ""
-- L["MOUNT_TYPE_3"] = ""
-- L["MOUNT_TYPE_4"] = ""
L["factions"] = "Facções"
L["MOUNT_FACTION_1"] = "Horda"
L["MOUNT_FACTION_2"] = "Aliança"
-- L["MOUNT_FACTION_3"] = ""
-- L["sources"] = ""
-- L["PET_1"] = ""
-- L["PET_2"] = ""
-- L["PET_3"] = ""
-- L["PET_4"] = ""
-- L["expansions"] = ""
L["Chance of summoning"] = "Chance de evocar"
L["Any"] = "Qualquer"
L["> (more than)"] = "> (mais que)"
L["< (less than)"] = "< (menor que)"
L["= (equal to)"] = "= (igual a)"
L["sorting"] = "Organizar"
-- L["Reverse Sort"] = ""
-- L["Favorites First"] = ""
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
-- L["Map / Model"] = ""
L["Dungeons and Raids"] = "Masmorras e Raides"
L["Current Location"] = "Local atual"
-- L["Enable Flags"] = ""
-- L["Ground Mounts Only"] = ""
L["Water Walking"] = "Caminhando na água"
-- L["WaterWalkFlagDescription"] = ""
-- L["ListMountsFromZone"] = ""
-- L["No relation"] = ""
L["Zones with list"] = "Zona com lista"
-- L["Zones with relation"] = ""
-- L["Zones with flags"] = ""
L["CHARACTER_CLASS_DESCRIPTION"] = "(as configurações de personagem substituem as configurações de classe)"
-- L["HELP_MACRO_MOVE_FALL"] = ""
-- L["HELP_MACRO_COMBAT"] = ""
L["CLASS_USEWHENCHARACTERFALLS"] = "Use o %s quando o personagem estiver em queda"
L["CLASS_USEWATERWALKINGSPELL"] = "Use o %s ao evocar montaria terrestre"
-- L["CLASS_USEONLYWATERWALKLOCATION"] = ""
-- L["PALADIN_USECRUSADERAURA"] = ""
-- L["PALADIN_RETURNLASTAURA"] = ""
L["DRUID_USELASTDRUIDFORM"] = "Volta o último forma ao desmontar"
-- L["DRUID_USETRAVELIFCANTFLY"] = ""
-- L["DRUID_USEDRUIDFORMSPECIALIZATION"] = "Return a specialization form"
L["DRUID_USEMACROALWAYS"] = "Use essas macros em vez de montarias"
-- L["DRUID_USEMACROONLYCANFLY"] = ""
-- L["Summonable Battle Pet"] = ""
-- L["Summon Random Battle Pet"] = ""
-- L["No Battle Pet"] = ""
-- L["Summon a pet every"] = ""
-- L["min"] = ""
-- L["Summon only favorites"] = ""
-- L["NoPetInRaid"] = ""
-- L["NoPetInGroup"] = ""
L["CopyMountTarget"] = "Tente copiar a montaria do alvo"
L["Enable arrow buttons to browse mounts"] = "Ative os botões de seta para navegar pelas montarias"
-- L["Open links in %s"] = ""
-- L["Click opens in"] = ""
-- L["Show wowhead link in mount preview"] = ""
-- L["Show Minimap Button"] = ""
-- L["Lock Minimap Button"] = ""
-- L["|cffff7f3fClick|r to open %s"] = ""
-- L["|cffff7f3fRight-Click|r to open Settings"] = ""
L["About"] = "Sobre"
-- L["Help with translation of %s. Thanks."] = ""
-- L["Localization Translators:"] = ""
-- ANIMATIONS
L["Default"] = "Padrão"
-- L["Mount special"] = ""
L["Walk"] = "Andando"
L["Walk backwards"] = "Andar para trás"
-- L["Run"] = ""
-- L["Swim idle"] = ""
-- L["Swim"] = ""
-- L["Swim backwards"] = ""
-- L["Fly stand"] = ""
-- L["Fly"] = ""
-- L["Fly backwards"] = ""
-- L["Loop"] = ""
L["Are you sure you want to delete animation %s?"] = "Tem certeza de que deseja excluir a animação \"%s\" ?"
-- PROFILES
L["Profiles"] = "Perfis"
L["New profile"] = "Novo perfil"
L["Create"] = "Criar"
L["Copy current"] = "Copiar atual"
L["A profile with the same name exists."] = "Existe um perfil com o mesmo nome."
-- L["By Specialization"] = "By Specialization"
L["Areans and Battlegrounds"] = "Arenas e Campos de Batalha"
-- L["Profile settings"] = ""
-- L["Pet binding from default profile"] = ""
-- L["Zones settings from default profile"] = ""
L["Auto add new mounts to selected"] = "Adicionar automaticamente novas montarias ao selecionado"
-- L["Select all favorite mounts by type in the selected zone"] = ""
-- L["Select all mounts by type in selected zone"] = ""
-- L["Unselect all mounts in selected zone"] = ""
L["Are you sure you want to delete profile %s?"] = "Tem certeza de que deseja excluir o perfil \"%s\" ?"
L["Are you sure you want %s?"] = "Tem certeza de que deseja \"%s\" ?"
-- TAGS
L["tags"] = "Marcadores"
L["No tag"] = "Sem marcardor"
L["With all tags"] = "Com todos os marcadores"
L["Add tag"] = "Adicionar marcador"
L["Tag already exists."] = "Marcador já existe."
L["Are you sure you want to delete tag %s?"] = "Tem certeza de que deseja excluir o marcador \"%s\" ?"