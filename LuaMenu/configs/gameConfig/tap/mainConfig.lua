local shortname = "tap"

local mapWhitelist       = VFS.Include(LUA_DIRNAME .. "configs/gameConfig/" .. shortname .. "/mapWhitelist.lua")
local aiBlacklist        = VFS.Include(LUA_DIRNAME .. "configs/gameConfig/" .. shortname .. "/aiBlacklist.lua")
local singleplayerConfig = VFS.Include(LUA_DIRNAME .. "configs/gameConfig/" .. shortname .. "/singleplayerMenu.lua")
local helpSubmenuConfig  = VFS.Include(LUA_DIRNAME .. "configs/gameConfig/" .. shortname .. "/helpSubmenuConfig.lua")
local skirmishDefault    = VFS.Include(LUA_DIRNAME .. "configs/gameConfig/" .. shortname .. "/skirmishDefault.lua")
local defaultModoptions  = VFS.Include(LUA_DIRNAME .. "configs/gameConfig/" .. shortname .. "/ModOptions.lua")
--local rankFunction       = VFS.Include(LUA_DIRNAME .. "configs/gameConfig/zk/rankFunction.lua")
local backgroundConfig   = VFS.Include(LUA_DIRNAME .. "configs/gameConfig/" .. shortname .. "/skinning/skinConfig.lua")

local link_homePage, link_replays, link_maps = VFS.Include(LUA_DIRNAME .. "configs/gameConfig/" .. shortname .. "/linkFunctions.lua")

local settingsConfig, settingsNames, settingsDefault = VFS.Include(LUA_DIRNAME .. "configs/gameConfig/" .. shortname .. "/settingsMenu.lua")
local springSettingsPath = LUA_DIRNAME .. "configs/gameConfig/" .. shortname .. "/springsettings.lua"

local headingLarge    = LUA_DIRNAME .. "configs/gameConfig/" .. shortname .. "/skinning/headingLarge.png"
local headingSmall    = LUA_DIRNAME .. "configs/gameConfig/" .. shortname .. "/skinning/headingSmall.png"
local backgroundImage = LUA_DIRNAME .. "configs/gameConfig/" .. shortname .. "/skinning/background.png"
local taskbarIcon     = LUA_DIRNAME .. "configs/gameConfig/" .. shortname .. "/taskbarLogo.png"

local background = {
	image           = backgroundImage,
	backgroundFocus = backgroundConfig.backgroundFocus,
}
-- random background
local loadscreens = VFS.DirList(LUA_DIRNAME .. "configs/gameConfig/" .. shortname .. "/skinning/loadpictures/")
local randomBackgroundImage = loadscreens[1+(math.floor((1000*os.clock())%#loadscreens))] -- hacky hotfix for http://springrts.com/mantis/view.php?id=4572
if VFS.FileExists(randomBackgroundImage) then
	background.image = randomBackgroundImage
end

-- MaDD: Trying to move in-game "Menu" button to the left
local interfaceHolder = WG.Chobby.interfaceRoot.GetIngameInterfaceHolder()
interfaceHolder.switchToMenuButton.right = 100 --2

local minimapOverridePath  = LUA_DIRNAME .. "configs/gameConfig/" .. shortname .. "/minimapOverride/"
local minimapThumbnailPath = LUA_DIRNAME .. "configs/gameConfig/" .. shortname .. "/minimapThumbnail/"

---------------------------------------------------------------------------------
-- Getters
---------------------------------------------------------------------------------

local externalFuncAndData = {
	dirName                = "tap",
	name                   = "Total Annihilation Prime",
	--_defaultGameArchiveName = "??", fill this in.
	_defaultGameRapidTag   = "tap:test", -- Do not read directly
	--editor                 = "rapid://sb-tap:test",
	--editor                 = "SpringBoard TAP $VERSION",
	defaultChatChannels    = {"main", "newbies"},
	mapWhitelist           = mapWhitelist,
	aiBlacklist            = aiBlacklist,
	settingsConfig         = settingsConfig,
	settingsNames          = settingsNames,
	settingsDefault        = settingsDefault,
	singleplayerConfig     = singleplayerConfig,
	helpSubmenuConfig      = helpSubmenuConfig,
	skirmishDefault        = skirmishDefault,
	defaultModoptions      = defaultModoptions,
	--rankFunction           = rankFunction,
	springSettingsPath     = springSettingsPath,
	headingLarge           = headingLarge,
	headingSmall           = headingSmall,
	skinName               = "Evolved", --"TAP",
    taskbarTitle           = "TA Prime",
	taskbarTitleShort      = "TAP",
	taskbarIcon            = taskbarIcon,
	background             = background,
	minimapOverridePath    = minimapOverridePath,
	minimapThumbnailPath   = minimapThumbnailPath,
	ignoreServerVersion    = true,
	--battleListOnlyShow     = "Total Annihilation Prime",
	disableBattleListHostButton = true, -- Hides "Host" button as this function is not working as one might imagine
	disableSteam 				 = true, -- removes settings related to steam
	disablePlanetwars 			 = true, -- removes settings related to planetwars
	disableMatchMaking 			 = true, -- removes match making
	disableCommunityWindow 		 = true, -- removes Community Window
	featuredMapsSelectionDisable= true, -- removes the setting to enable a filter that allows featured (by Zero-K) map
	link_homePage           = link_homePage,
	link_replays            = link_replays,
	link_maps               = link_maps,
	--openTrack = '',	-- dont leave empty
	randomTrackList = {
		"LuaMenu/configs/gameConfig/tap/lobbyMusic/The Secret of Ayers Rock.ogg",
		--"LuaMenu/configs/gameConfig/tap/lobbyMusic/RobRichert-AliasZero.ogg",
	},
	disableColorChoosing = true,
}

function externalFuncAndData.CheckAvailability()
	return true
end

return externalFuncAndData
