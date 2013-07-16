local addon, data = ...

if not Library then Library = {} end
if not Library.libZoneChange then Library.libZoneChange = {} end

LIBZONECHANGE = {}

local _libZoneChange = {}

local LZ = _libZoneChange

if addon.toc.Version == "9.99r99" then
	function LZ.Debug(m, h)
		if h then
			_HEADLINES.Event_Chat_Notify(0,{message=m})
		else
			print(m)
		end
	end
else
	function LZ.Debug(m)
	end
end

local _esub_last = 0
local playerID = Inspect.Unit.Lookup("player")

local lzZONE = {}
local lzQZONE = {
	-- Chronicles
	["q2144167A0987645A"] = { qt="CHR", qn = "The Fallen Prince", qz = "Chronicle: Greenscale's Blight" },
	["q5EB3877F6405F1A9"] = { qt="CHR", qn = "Runes of Corruption", qz = "Hammerknell Fortress: Runes of Corruption" },
	["q5C975261188C5B9C"] = { qt="CHR", qn = "Runes of Corruption", qz = "Hammerknell Fortress: Runes of Corruption" },
	["q3A296526271E1DCD"] = { qt="CHR", qn = "Chains of Death", qz = "River of Souls: Chains of Death" },
	["q40BC7EED44142BD9"] = { qt="CHR", qn = "Chains of Death", qz = "Hive Kaaz'Gfuu: Queen's Gambit" },
	-- 10 man slivers
	["q6F5D39887D8A8ED3"] = { qt="SLV", qn = "The Drowned Halls", qz = "The Drowned Halls" },
	["q5DA5F06F782205B9"] = { qt="SLV", qn = "The Gilded Prophecy", qz = "Gilded Prophecy" },
	["q2ADE7614AA401E84"] = { qt="SLV", qn = "Rise of the Phoenix", qz = "Rise of the Phoenix" },
	["q31470E266B4D4A1C"] = { qt="SLV", qn = "Feast of Heroes", qz = "Primeval Feast" },
	["qFDB8CA5333942688"] = { qt="SLV", qn = "Revenge of the Ascended", qz = "Triumph of the Dragon Queen" },
	-- PVP areas
	["q5FAF0EB42AC65A22"] = { qt="CQS", qn = "Conquest: Stillmoor", qz = "Conquest: Stillmoor" },
	["q604C357A13A50C61"] = { qt="CQS", qn = "Conquest: Stillmoor", qz = "Conquest: Stillmoor" },
}

local lzZoneInfo = {
	["z11173F9D259DAADE"] =		{pvp=false,	city=true,	group=false},	-- Tempest Bay
	["z487C9102D2EA79BE"] =		{pvp=false,	city=true,	group=false},	-- Sanctum
	["z6BA3E574E9564149"] =		{pvp=false,	city=true,	group=false},	-- Meridian

	["z0000000CB7B53FD7"] =		{pvp=false,	city=false,	group=false},	-- Silverwood		x
	["z00000013CAF21BE3"] =		{pvp=false,	city=false,	group=false},	-- Freemarch		x
	["z0000001B2BB9E10E"] =		{pvp=false,	city=false,	group=false},	-- Gloamwood		x
	["z585230E5F68EA919"] =		{pvp=false,	city=false,	group=false},	-- Stonefield		x
	["z019595DB11E70F58"] =		{pvp=false,	city=false,	group=false},	-- Scarlet Gorge	x
	["z000000142C649218"] =		{pvp=false,	city=false,	group=false},	-- Scarwood Reach	x
	["z1416248E485F6684"] =		{pvp=false,	city=false,	group=false},	-- Droughtlands		x
	["z0000001804F56C61"] =		{pvp=false,	city=false,	group=false},	-- Moonshade Highlands	x
	["z00000016EB9ECBA5"] =		{pvp=false,	city=false,	group=false},	-- Iron Pine Peak	x
	["z000000069C1F0227"] =		{pvp=false,	city=false,	group=false},	-- Shimmersand		x
	["z0000001A4AF8CD7A"] =		{pvp=false,	city=false,	group=false},	-- Stillmoor		x
	["z76C88A5A51A38D90"] =		{pvp=false,	city=false,	group=false},	-- Ember Isle		x
	
	["z698CB7B72B3D69E9"] =		{pvp=false,	city=false,	group=false},	-- Cape Jule		50-52
	["z754553DD46F46371"] =		{pvp=false,	city=false,	group=false},	-- City Core		52-53
	["z48530386ED2EA5AD"] =		{pvp=false,	city=false,	group=false},	-- Eastern Holdings	54-56
	["z563CB77E4A32233F"] =		{pvp=false,	city=false,	group=false},	-- Ardent Domain	57-58
	["z4D8820D7EF52685C"] =		{pvp=false,	city=false,	group=false},	-- Kingsward		59-60
	["z2F1E4708BEC6A608"] =		{pvp=false,	city=false,	group=false},	-- Ashora			60
	["z10D7E74AB6D7B293"] =		{pvp=false,	city=false,	group=false},	-- Dendrome			60
	
	
	["z1C938C07F41C83CC"] =		{pvp=false,	city=false,	group=false},	-- Pelladane		50-52
	["z59124F7DD7F15825"] =		{pvp=false,	city=false,	group=false},	-- Seratos			53-56
	["z39095BA75AD7DC03"] =		{pvp=false,	city=false,	group=false},	-- Morban			57-59
	["z2F9C9E1FF91F9293"] =		{pvp=false,	city=false,	group=false},	-- Steppes of Infinity	60
	
	["z0000001A4AF8CD7A.CQS"] =	{pvp=true,	city=false,	group=false},	-- CQ Stillmoor
	["z6B5AD834EA25B8F0"] =		{pvp=true,	city=false,	group=false},	-- WFSteppes
	["z44D26A0CDAC02569"] =		{pvp=true,	city=false,	group=false},	-- Karthan Ridge
	["z05F5E1003F3825C9"] =		{pvp=true,	city=false,	group=false},	-- Black Garden
	["z60A9C9C1C7D80AD0"] =		{pvp=true,	city=false,	group=false},	-- Library
	["z3E4D09700894552E"] =		{pvp=true,	city=false,	group=false},	-- Codex
	["z3C5A92DE2A358F7F"] =		{pvp=true,	city=false,	group=false},	-- Port Scion

	["z6C80171E0E43B26E"] =		{pvp=false,	city=false,	group=20},		-- GSB
	["z6D63DC5B332895AC"] =		{pvp=false,	city=false,	group=20},		--River of Souls
	["hk"] =		{pvp=false,	city=false,	group=20},
	["z45C3EDA9368AE611"] =		{pvp=false,	city=false,	group=20},		-- EE
	["z3686B447B0FA3A1C"] =		{pvp=false,	city=false,	group=20},		-- FT
	["id"] =		{pvp=false,	city=false,	group=20},

	["z000000069C1F0227.SLV"] =		{pvp=false,	city=false,	group=10},		-- Gilded Prophecy
	["z000000142C649218.SLV"] =		{pvp=false,	city=false,	group=10},		-- Drowned Halls
	["rotp"] =		{pvp=false,	city=false,	group=10},
	["pf"] =		{pvp=false,	city=false,	group=10},
	["z4D8820D7EF52685C.SLV"] =		{pvp=false,	city=false,	group=10},		-- Triumph of the Dragon Queen
	["zFF5E6FA7E533EF4C"] =		{pvp=false, city=false, group=10},		-- Grim Awakening

	["it"] =		{pvp=false,	city=false,	group=5},
	["z22CFAB0A21D523EE"] =		{pvp=false,	city=false,	group=5},	-- The Realm of the Fae
	["dsm"] =		{pvp=false,	city=false,	group=5},
	["dd"] =		{pvp=false,	city=false,	group=5},
	["fc"] =		{pvp=false,	city=false,	group=5},
	["kb"] =		{pvp=false,	city=false,	group=5},
	["rd"] =		{pvp=false,	city=false,	group=5},
	["lh"] =		{pvp=false,	city=false,	group=5},
	["ap"] =		{pvp=false,	city=false,	group=5},
	["cc"] =		{pvp=false,	city=false,	group=5},
	["cr"] =		{pvp=false,	city=false,	group=5},
	["z44FC282F5C8B4976"] =		{pvp=false,	city=false,	group=5},		-- Empyrean Core
	["z3AB6CEC7BB32B6BA"] =		{pvp=false,	city=false,	group=5},		-- Golem Foundry
	["eotsq"] =		{pvp=false,	city=false,	group=5},
	["z2C8E81C0EF33A72B"] =		{pvp=false,	city=false,	group=5},		-- Unhallowed Boneforge
	["aof"] =		{pvp=false,	city=false,	group=5},
	["z534FB8BD5326DA9D"] =		{pvp=false,	city=false,	group=5},		-- Tower of the Shattered
	["z5DB9395EDCEB6971"] =		{pvp=false,	city=false,	group=5},		-- SBP
	
}

LZ.p_curZone = nil
LZ.p_prvZone = nil
LZ.p_ZQActive = false
LZ.p_ZQqID = false
LZ.p_qRetry = {}

function LZ.RaiseZoneChange(zn, zid)
	LZ.p_curZone = zid
	if LZ.p_curZone ~= LZ.p_prvZone then
		LIBZONECHANGE.currentZoneID = zid
		LIBZONECHANGE.currentZoneName = zn
		if lzZoneInfo[zid] then
			if lzZoneInfo[zid].pvp then
				LIBZONECHANGE.currentzonePVP = true
			else
				LIBZONECHANGE.currentzonePVP = false
			end
			if lzZoneInfo[zid].group then
				LIBZONECHANGE.currentzoneGRP = lzZoneInfo[zid].group
			else
				LIBZONECHANGE.currentzoneGRP = 0
			end
			LIBZONECHANGE.currentzoneCTY = lzZoneInfo[zid].city
		else
			LIBZONECHANGE.currentzonePVP = false
			LIBZONECHANGE.currentzoneCTY = false
			LIBZONECHANGE.currentzoneGRP = 0
		end

		LIBZONECHANGE_Settings[zid] = zn
		
		LZ.Debug(string.format("ZC: %s -> %s", tostring(lzZONE[LZ.p_prvZone]), tostring(lzZONE[zid])), true)
		LZ.p_prvZone = zid
		LZ.handle(zn, zid)
	end
end

function LZ.Event_System_Update_Begin(h)
	if LZ.p_curZone == nil then
		local pd = Inspect.Unit.Detail("player")
		if pd and pd.zone then
			if lzZONE[pd.zone] == nil then
				local zd = Inspect.Zone.Detail(pd.zone)
				if zd and zd.name then
					lzZONE[pd.zone] = zd.name
				end
			end
			if lzZONE[pd.zone] and pd.zone ~= LZ.p_prvZone then
				LIBZONECHANGE.actualZoneID = pd.zone
				LIBZONECHANGE.actualZoneName = lzZONE[pd.zone]
				LZ.RaiseZoneChange(lzZONE[pd.zone], pd.zone)
			end
		end
	end
	LZ.Event_Quest_Accept(0, LZ.p_qRetry)
	if LZ.p_ZQqID ~= false then
		local _esub_crnt = Inspect.Time.Real()
		if _esub_crnt - _esub_last > 5 then
			local ql = Inspect.Quest.List()
			if ql and ql[LZ.p_ZQqID] == nil then
				LZ.Event_Quest_Complete(0,{[LZ.p_ZQqID] = true})
			end
			_esub_last = _esub_crnt
		end
	end
end

function LZ.Event_Unit_Detail_Zone(h,u)
	if u[playerID] and LZ.p_ZQActive == false then
		LZ.p_curZone = nil
	end
end

function LZ.Event_Unit_Availability_Full(h,t)
	for k,v in pairs(t) do
		if v == "player" and LZ.p_ZQActive == false then
			LZ.p_curZone = nil
			break
		end
	end
end

function LZ.Event_Quest_Accept(h,t)
	for k,v in pairs(t) do
		if lzQZONE[k] ~= nil then
			local zid = Inspect.Unit.Detail("player").zone
			if zid then
				if lzZONE[zid] ~= nil then
					LIBZONECHANGE.actualZoneID = zid
					LIBZONECHANGE.actualZoneName = Inspect.Zone.Detail(LIBZONECHANGE.actualZoneID).name
					lzZONE[string.format("%s.%s", LIBZONECHANGE.actualZoneID, lzQZONE[k].qt)] = lzQZONE[k].qz
					LZ.p_ZQActive = true
					LZ.p_ZQqID = k
					LZ.p_qRetry[k] = nil
					LZ.RaiseZoneChange(lzQZONE[k].qz, string.format("%s.%s", LIBZONECHANGE.actualZoneID, lzQZONE[k].qt))
				else
					local zd = Inspect.Zone.Detail(zid)
					if zd and zd.name then
						lzZONE[zid] = zd.name
					end
					LZ.p_ZQActive = false
					LZ.p_qRetry[k] = true
				end
			else
				LZ.p_ZQActive = false
				LZ.p_qRetry[k] = true
			end
			break
		end
	end
end

function LZ.Event_Quest_Abandon(h,t)
	for k,v in pairs(t) do
		if lzQZONE[k] ~= nil then
			LZ.p_qRetry[k] = nil
			LZ.p_curZone = nil
			LZ.p_ZQActive = false
			LZ.p_ZQqID = false
			break
		end
	end
end

function LZ.Event_Quest_Change(h,t)
	for k,v in pairs(t) do
		if lzQZONE[k] ~= nil and LZ.p_ZQActive == false then
			LZ.Event_Quest_Accept(0,{[k] = true})
			LZ.p_ZQActive = true
			LZ.p_ZQqID = k
			break
		end
	end
end

function LZ.Event_Quest_Complete(h,t)
	for k,v in pairs(t) do
		if lzQZONE[k] ~= nil then
			LZ.p_ZQActive = false
			LZ.p_ZQqID = false
		end
	end
end

function LZ.Addon_SavedVariables_Load_End(h,a)
	if a == addon.identifier then
		if LIBZONECHANGE_Settings == nil then LIBZONECHANGE_Settings = {} end
	end
end

Command.Event.Attach(Event.System.Update.Begin, LZ.Event_System_Update_Begin, "Event.System.Update.Begin")
Command.Event.Attach(Event.Unit.Detail.Zone, LZ.Event_Unit_Detail_Zone, "Event.Unit.Detail.Zone")
Command.Event.Attach(Event.Unit.Availability.Full, LZ.Event_Unit_Availability_Full, "Event.Unit.Availability.Full")
Command.Event.Attach(Event.Quest.Accept, LZ.Event_Quest_Accept, "Event.Quest.Accept")
Command.Event.Attach(Event.Quest.Abandon, LZ.Event_Quest_Abandon, "Event.Quest.Abandon")
Command.Event.Attach(Event.Quest.Change, LZ.Event_Quest_Change, "Event.Quest.Change")
Command.Event.Attach(Event.Quest.Complete, LZ.Event_Quest_Complete, "Event.Quest.Complete")
Command.Event.Attach(Event.Addon.SavedVariables.Load.End, LZ.Addon_SavedVariables_Load_End, "Event.Addon.SavedVariables.Load.End")

LZ.handle, Library.libZoneChange.Player = Utility.Event.Create(addon.identifier, "Player")

print(string.format("v%s loaded.", addon.toc.Version))