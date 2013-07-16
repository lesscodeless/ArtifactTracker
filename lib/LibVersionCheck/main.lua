local AddonData, privateTable = ...


if LibVersionCheck then
	return
end

LibVersionCheck={}


local function L(x) return Translations.LibVersionCheck.L(x) end 
local debugMode=false

-- Function to hand over to Command.Message.Send when we're not really
-- interested in whether the message arrives or not.

local function ignoreme()
end


-- Called when variables are fully loaded. To avoid problems if some
-- addon calls us before our variables are there, we save the version
-- info of that addon in Temp...., and copy it to the real table here.

local TempLibVersionCheckVersions
local function varsLoaded(handle, identifier)
	if not LibVersionCheckSpy then
		LibVersionCheckSpy={}
	end
	if not LibVersionCheckSettings then
		LibVersionCheckSettings={}
	end
	if not LibVersionCheckSettings.showAgainAt then
		LibVersionCheckSettings.showAgainAt=0
	end
	if not LibVersionCheckVersions then
		LibVersionCheckVersions = {}
		if TempLibVersionCheckVersions then
			for k, v in pairs(TempLibVersionCheckVersions) do
				LibVersionCheckVersions[k]=tempLibVersionCheckVersions[k]
			end
		end
	end
end

-- Called when a unit becomes available. If we haven't queried them before
-- in this session, we send a query to them. They will only react if they
-- have LibVersionCheck loaded as well, so we keep the messages to a
-- player without this addon minimal.

local player=nil
local didQuery={}
local function unitAvailable(handle, units)
	if player==nil then
		player=Inspect.Unit.Detail("player")
	end
	if player==nil or player.availability==nil or player.availability ~= "full" then
		player=nil
		return
	end
	local now=Inspect.Time.Server()
	local k,v
	for k,v in pairs(units) do
		if k ~= nil and type(k) == "string" and k ~= player.id and not didQuery[k] then
			local unit = Inspect.Unit.Detail(k)
			if unit and unit.availability
			and unit.availability=="full"
			and unit.player==true
			then
				didQuery[k]=now
				if debugMode then print("querying "..unit.name) end
				Command.Message.Send(unit.name, "LibVersionCheck", "query", ignoreme)
			end
		end
	end
end

-- Called when we get a message. This can be a query from some other
-- player, in which case we put his name and our addon list to our
-- "need to tell them" list, or it might be a response, which means
-- we save it to our list. We do not send all version info immediately,
-- instead, we add it to a list, and process one list entry every 1/10
-- sec, to keep the neccesary bandwith down.

-- When we get a new version number, we also save the name of who sent
-- it to us, so we can find out who spreads bogus numbers, should someone
-- have "funny" ideas.

local sendToList={}
local lastSendProcessed=0

local function gotMessage(handle, from, type, channel, identifier, data)
	if identifier ~= "LibVersionCheck" then return end

	if debugMode then print (data) end

	if data:len()>=5 and data:sub(1,5) == "query" then
		if debugMode then
			print("Got Query from "..from)
		end
		if not LibVersionCheckSettings.developer then
			for k, v in pairs(LibVersionCheckVersions) do
				if v.myVersion and v.myVersion ~= 0 and v.myVersion ~= "0" then
					table.insert(sendToList, { from, k })
				end
			end
		end
	end
	
	if data:len()>=7 and data:sub(1,7) == "version" then
		if debugMode then print("got version info: "..data.." from "..from) end
		local token
		local tnum=1
		local parms={}
		for token in string.gmatch(data, "[^%s]+") do
			parms[tnum]=token
			tnum=tnum+1
		end
		if tnum==4 then
			if not LibVersionCheckVersions[parms[2]] then
				LibVersionCheckVersions[parms[2]] = { myVersion="0" }
			end

			if not LibVersionCheckVersions[parms[2]].newestVersion
			or     LibVersionCheckVersions[parms[2]].newestVersion < parms[3] then
			       LibVersionCheckVersions[parms[2]].newestVersion = parms[3]
			       LibVersionCheckVersions[parms[2]].sender = from
			end
			if LibVersionCheckSettings.spymode then
				if not LibVersionCheckSpy then LibVersionCheckSpy={} end
				if not LibVersionCheckSpy[from] then LibVersionCheckSpy[from]={} end
				LibVersionCheckSpy[from][parms[2]]=parms[3]
				LibVersionCheckSpy[from][parms[2].."_date"]=Inspect.Time.Server()
			end
		end
	end
end


-- Send information about my version to everyone who has requested it.
-- We send our version number, NOT the newest version number we found,
-- to avoid propagating bogus version numbers we got from others.

local function systemUpdate(handle)

	if #sendToList<1 then return end

	local now=Inspect.Time.Real()
	if now < lastSendProcessed+0.1 then return end
	lastSendProcessed=now
	
	local toSend=sendToList[1]
	table.remove(sendToList, 1);
	if debugMode then
		print("Sending version "..LibVersionCheckVersions[toSend[2]].myVersion.." of "..toSend[2].." to "..toSend[1])
	end
	Command.Message.Send(toSend[1], "LibVersionCheck", "version "..toSend[2].." "..LibVersionCheckVersions[toSend[2]].myVersion, ignoreme)
end


local function allAddonsLoaded(handle)
	local anythingToShow=false
	for k, v in pairs(LibVersionCheckVersions) do
		if v.myVersion and v.newestVersion
		and ""..v.myVersion ~= "0"
		and ""..v.myVersion < ""..v.newestVersion then
			print(L("Addon ")..k..L(" has version ")..v.myVersion..L(" but ")..v.sender..L(" uses version ")..v.newestVersion..".")
			anythingToShow=true
		end
	end
	
	if anythingToShow and Inspect.Time.Server() > LibVersionCheckSettings.showAgainAt then
		Command.System.Watchdog.Quiet()
		LibVersionCheck.createAndShowUI()
	end
end


-- The command line interface.

local function slashHandler(h, args)
	local r = {}
	local numargs = 1
	local inquote = false
	local token, tmptoken
	for token in string.gmatch(args, "[^%s]+") do
		--print(token)
		if token:sub(1, 1) == "\"" then
			tmptoken=""
			token=token:sub(2) -- handle "abc" case
			inquote=true
			--print("start qoute token="..token)
		end
		if inquote then
			--print ("in quote, last char: "..token:sub(-1))
			if token:sub(-1) == "\"" then
				inquote=false
				token=token:sub(1, -2)
				token=tmptoken .. token
				--print ("combined string is "..token)
			else
				tmptoken=tmptoken .. token .. " "
				--print ("tmp token is "..token)
			end
		end
		if not inquote then
			r[numargs] = token
			numargs=numargs+1
		end
	end
	if numargs>1 then
		if r[1] == "list" then
			for k, v in pairs(LibVersionCheckVersions) do
				print(k);
				dump(LibVersionCheckVersions[k]);
			end
		elseif (r[1] == "query") and numargs>2 then
			print("querying "..r[2])
			Command.Message.Send(r[2], "LibVersionCheck", "query", ignoreme)
		elseif (r[1] == "debug") then
			debugMode=1
			print("libVersionCheck now debugging");
		elseif (r[1] == "reset") then
			didQuery={}
		elseif (r[1] == "spy" and numargs>2 and r[2] == "on") then
			LibVersionCheckSettings.spymode = true
			print("Spy mode enabled")
		elseif (r[1] == "spy") then
			LibVersionCheckSettings.spymode = false
			print("Spy mode disabled")
		elseif (r[1] == "developer" and numargs>2 and r[2] == "on") then
			LibVersionCheckSettings.developer = true
			print("Developer mode enabled")
		elseif (r[1] == "developer") then
			LibVersionCheckSettings.developer = false
			print("Developer mode disabled")
		else
			print(L("Usage") .. ": /LibVersionCheck list | debug | query <name>")
		end
	else
		print(L("Usage") .. ": /LibVersionCheck list | debug | query <name>")
	end
end

-- This is the only function other addons will ever need to know about.

function LibVersionCheck.register(addonName, addonVersion)
	local whereToStore
	if not LibVersionCheckVersions then
		TempLibVersionCheckVersions = {}
		whereToStore=TempLibVersionCheckVersions
	else
		whereToStore=LibVersionCheckVersions
	end
	if not whereToStore[addonName] then
		whereToStore[addonName]={}
	end
	whereToStore[addonName].myVersion=""..addonVersion
end



Command.Message.Accept(nil, "LibVersionCheck")
Command.Event.Attach(Event.Addon.SavedVariables.Load.End, varsLoaded,      "Event.Addon.SavedVariables.Load.End")
Command.Event.Attach(Event.Addon.Startup.End, 		  allAddonsLoaded, "Event.Addon.Startup.End")
Command.Event.Attach(Event.Unit.Availability.Full, 	  unitAvailable,   "Event.Unit.Availability.Full")
Command.Event.Attach(Event.Message.Receive, 	  	  gotMessage,      "Event.Message.Receive")
Command.Event.Attach(Event.System.Update.Begin,   	  systemUpdate,    "Event.System.Update.Begin")
Command.Event.Attach(Command.Slash.Register("LibVersionCheck"),
							  slashHandler,    "Command.Slash.Register")
