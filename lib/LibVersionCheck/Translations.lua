if not Translations then Translations = {} end
if not Translations.LibVersionCheck then Translations.LibVersionCheck = {} end

local translationTable = {
	["German"] = {
		["LibVersionCheck"]		   = "LibVersionCheck",
		["Addon "]			   = "Addon ",
		[" has version "]		   = " hat Version ",
		[" but "]			   = ", aber ",
		[" uses version "]		   = " verwendet Version ",
		
		["Addons are outdated"]		= "Addons sind veraltet",
		["Addon"]			= "Addon",
		["my Version"]			= "Meine Version",
		["newest Version"]		= "Neueste Version",
		["show again : "]		= "wieder zeigen : ",
		["next login"]			= "nächster Login",
		["tomorrow"]			= "morgen",
		["in a week"]			= "in 1 Woche",
		["in a month"]			= "in 1 Monat",
		["never"]			= "niemals",
	},
	["French"] = {
	},
	["Russian"] = {
	},
}

function Translations.LibVersionCheck.L(x)
	local lang=Inspect.System.Language()
	if  translationTable[lang]
	and translationTable[lang][x] then
		return translationTable[lang][x]
	elseif lang == "English"  then
		return x
	else
		if not translationTable[lang] then translationTable[lang]={} end
		translationTable[lang][x]=x
		print ("No translation yet for '" .. lang .. "'/'" .. x .. "'")
		return x
	end
end
