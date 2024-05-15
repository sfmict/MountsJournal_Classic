if GetLocale() ~= "koKR" then
	return
end

local _, L = ...

-- L["author"] = ""
-- L["%s Configuration"] = ""
-- L["ConfigPanelTitle"] = ""
-- L["Class settings"] = ""
-- L["Modifier"] = ""
-- L["Normal mount summon"] = ""
-- L["SecondMountTooltipTitle"] = ""
-- L["SecondMountTooltipDescription"] = ""
-- L["ZoneSettingsTooltip"] = ""
-- L["ZoneSettingsTooltipDescription"] = ""
-- L["ButtonsSelectedTooltipDescription"] = ""
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
-- L["Settings"] = ""
-- L["Shown:"] = ""
-- L["With multiple models"] = "With only multiple models"
-- L["hidden for character"] = ""
-- L["only hidden"] = ""
-- L["Hidden by player"] = ""
-- L["Only new"] = "Only new"
-- L["types"] = ""
-- L["selected"] = ""
-- L["MOUNT_TYPE_1"] = ""
-- L["MOUNT_TYPE_2"] = ""
-- L["MOUNT_TYPE_3"] = ""
-- L["MOUNT_TYPE_4"] = ""
-- L["Specific"] = ""
-- L["repair"] = ""
-- L["passenger"] = ""
-- L["transform"] = ""
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
-- L["Chance of summoning"] = ""
-- L["Any"] = ""
-- L["> (more than)"] = ""
-- L["< (less than)"] = ""
-- L["= (equal to)"] = ""
-- L["sorting"] = ""
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
-- L["Map / Model"] = ""
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
-- L["CopyMountTarget"] = ""
-- L["Enable arrow buttons to browse mounts"] = ""
-- L["Open links in %s"] = ""
-- L["Click opens in"] = ""
-- L["Show wowhead link in mount preview"] = ""
-- L["Show Minimap Button"] = ""
-- L["Lock Minimap Button"] = ""
-- L["|cffff7f3fClick|r to open %s"] = ""
-- L["|cffff7f3fRight-Click|r to open Settings"] = ""
-- L["About"] = ""
-- L["Help with translation of %s. Thanks."] = ""
-- L["Localization Translators:"] = ""
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
-- L["Profiles"] = ""
-- L["New profile"] = ""
-- L["Create"] = ""
-- L["Copy current"] = ""
-- L["A profile with the same name exists."] = ""
-- L["By Specialization"] = ""
-- L["Areans and Battlegrounds"] = ""
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
L["Family"] = "종류"
L["Airplanes"] = "비행기"
L["Airships"] = "비행선"
-- L["Albatross"] = ""
L["Alpacas"] = "알파카"
L["Amphibian"] = "양서류"
L["Animite"] = "령진드기"
L["Aqir Flyers"] = "아퀴르 날벌레"
L["Arachnids"] = "거미"
-- L["Armoredon"] = ""
L["Assault Wagons"] = "공성차량"
L["Basilisks"] = "바실리스크"
L["Bats"] = "박쥐"
L["Bears"] = "곰"
-- L["Beetle"] = ""
-- L["Bipedal Cat"] = ""
L["Birds"] = "새"
L["Blood Ticks"] = "흡혈충"
L["Boars"] = "멧돼지"
L["Book"] = "책"
L["Bovids"] = "노루"
L["Broom"] = "빗자루"
L["Brutosaurs"] = "브루토사우루스"
L["Camels"] = "낙타"
L["Carnivorans"] = "육식동물"
L["Carpets"] = "카페트"
L["Cats"] = "고양이과"
L["Cervid"] = "원시사슴"
L["Chargers"] = "군마"
L["Chickens"] = "닭"
L["Clefthooves"] = "갈래발굽"
L["Cloud Serpents"] = "운룡"
L["Core Hounds"] = "심장부사냥개"
L["Crabs"] = "게"
L["Cranes"] = "학"
L["Crawgs"] = "크로그"
L["Crocolisks"] = "크로코리스크"
L["Crows"] = "까마귀"
L["Demonic Hounds"] = "지옥사냥개"
L["Demonic Steeds"] = "지옥군마"
L["Demons"] = "악마"
L["Devourer"] = "포식자"
L["Dinosaurs"] = "공룡"
L["Dire Wolves"] = "다이어울프"
L["Direhorns"] = "다이어혼"
L["Discs"] = "원반"
L["Dragonhawks"] = "용매"
L["Drakes"] = "비룡"
L["Dread Ravens"] = "지옥까마귀"
-- L["Dreamsaber"] = ""
L["Eagle"] = "독수리"
L["Elekks"] = "엘레크"
L["Elementals"] = "정령"
L["Falcosaurs"] = "팔코사우루스"
L["Fathom Rays"] = "심해 가오리"
L["Feathermanes"] = "뾰족갈기"
L["Felsabers"] = "지옥표범"
L["Fish"] = "물고기"
-- L["Flies"] = ""
L["Flying Steeds"] = "비행군마"
L["Foxes"] = "여우"
L["Gargon"] = "가르곤"
L["Gargoyle"] = "가고일"
L["Goats"] = "염소"
L["Gorger"] = "먹보"
L["Gorm"] = "게걸충"
L["Grand Drakes"] = "거대 비룡"
L["Gronnlings"] = "그론링"
L["Gryphons"] = "그리폰"
L["Gyrocopters"] = "자이로콥터"
L["Hands"] = "손"
L["Hawkstriders"] = "매타조"
L["Hippogryphs"] = "히포그리프"
L["Horned Steeds"] = "뿔 군마"
L["Horses"] = "말"
L["Hounds"] = "사냥개"
L["Hovercraft"] = "호버크래프트"
L["Humanoids"] = "휴머노이드"
L["Hyenas"] = "하이에나"
L["Infernals"] = "지옥불정령"
L["Insects"] = "곤충"
L["Jellyfish"] = "해파리"
L["Jet Aerial Units"] = "제트 비행기"
L["Kites"] = "연"
L["Kodos"] = "코도"
L["Krolusks"] = "크롤러스크"
L["Larion"] = "깃사자"
L["Lions"] = "사자"
L["Lupine"] = "원시늑대"
L["Mammoths"] = "매머드"
L["Mana Rays"] = "마나 가오리"
L["Manasabers"] = "마나호랑이"
L["Mauler"] = "싸움꾼"
L["Mechanical Animals"] = "기계형 야수"
L["Mechanical Birds"] = "기계형 새"
L["Mechanical Cats"] = "기계형 고양이"
L["Mechanical Steeds"] = "기계형 군마"
L["Mechanostriders"] = "기계타조"
L["Mecha-suits"] = "메카수트"
L["Mollusc"] = "연체동물"
L["Moose"] = "엘크"
L["Moth"] = "나방"
L["Motorcycles"] = "오토바이"
L["Mountain Horses"] = "산악마"
L["Murloc"] = "멀록"
L["Mushan"] = "무샨"
L["Nether Drakes"] = "황천의 비룡"
L["Nether Rays"] = "황천 가오리"
L["N'Zoth Serpents"] = "느조스 뱀"
L["Others"] = "기타"
L["Ottuk"] = "오투크"
-- L["Owl"] = ""
-- L["Owlbear"] = ""
-- L["Ox"] = ""
L["Pandaren Phoenixes"] = "판다렌 불사조"
L["Parrots"] = "앵무새"
-- L["Peafowl"] = ""
L["Phoenixes"] = "불사조"
L["Proto-Drakes"] = "원시 비룡"
L["Pterrordaxes"] = "테러닥스"
L["Quilen"] = "기렌"
L["Rabbit"] = "토끼"
L["Rams"] = "산양"
L["Raptora"] = "육식조"
L["Raptors"] = "랩터"
L["Rats"] = "쥐"
L["Rays"] = "가오리"
L["Razorwing"] = "칼날날개"
L["Reptiles"] = "파충류"
L["Rhinos"] = "코뿔소"
L["Riverbeasts"] = "강물하마"
L["Roc"] = "로크"
L["Rockets"] = "로켓"
L["Rodent"] = "설치류"
L["Ruinstriders"] = "파멸발굽"
L["Rylaks"] = "라일라크"
L["Sabers"] = "표범"
L["Scorpions"] = "전갈"
L["Sea Serpents"] = "바다뱀"
L["Seahorses"] = "해마"
-- L["Seat"] = ""
-- L["Shardhides"] = ""
L["Silithids"] = "실리시드"
L["Slug"] = "민달팽이"
L["Snail"] = "달팽이"
L["Snapdragons"] = "치악룡"
L["Spider Tanks"] = "거미 전차"
L["Spiders"] = "거미"
L["Sporebat"] = "포자박쥐"
-- L["Stag"] = ""
L["Steeds"] = "군마"
L["Stingrays"] = "독침가오리"
L["Stone Cats"] = "고양이 석상"
L["Stone Drakes"] = "비룡 석상"
-- L["Surfboard"] = ""
L["Talbuks"] = "탈부크"
L["Tallstriders"] = "타조"
L["Talonbirds"] = "탈론 버드"
L["Tauralus"] = "타우랄러스"
-- L["Thunder Lizard"] = ""
L["Tigers"] = "호랑이"
L["Toads"] = "두꺼비"
L["Turtles"] = "거북이"
L["Undead Drakes"] = "언데드 비룡"
L["Undead Steeds"] = "언데드 군마"
L["Undead Wolves"] = "언데드 늑대"
L["Ungulates"] = "유제류"
L["Ur'zul"] = "우르줄"
L["Vehicles"] = "차량"
L["Vombata"] = "봄바타"
L["Vulpin"] = "여우"
L["Vultures"] = "독수리"
L["War Wolves"] = "전투 늑대"
L["Wasp"] = "말벌"
L["Water Striders"] = "소금쟁이"
L["Wilderlings"] = "야생룡"
L["Wind Drakes"] = "바람 비룡"
L["Wolfhawks"] = "늑대매"
L["Wolves"] = "늑대"
L["Wyverns"] = "와이번"
L["Yaks"] = "야크"
L["Yetis"] = "예티"