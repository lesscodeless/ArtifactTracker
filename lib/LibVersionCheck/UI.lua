local myWindow

local function L(x) return Translations.LibVersionCheck.L(x) end 

function SetAction(button, time)
	button:EventAttach(Event.UI.Button.Left.Press, function ()
		LibVersionCheckSettings.showAgainAt=time
		myWindow:SetVisible(false)
	end, "LeftDown", -2)
end

function LibVersionCheck.createAndShowUI()
    local context=UI.CreateContext("LibVersionCheck")

    myWindow=UI.CreateFrame("RiftWindow", "LibVersionCheckMainFrame", context)
    myWindow:SetTitle(L("Addons are outdated"));
    myWindow:SetPoint("CENTER", UIParent, "CENTER", 0, 0)
    
    myWindow:SetWidth(500)
    
    local h1=UI.CreateFrame("Text", "H1", myWindow); h1:SetFontSize(24); h1:SetText(L("Addon")); h1:SetPoint("TOPLEFT", myWindow, "TOPLEFT", 30, 70);
    local h2=UI.CreateFrame("Text", "H2", myWindow); h2:SetFontSize(24); h2:SetText(L("my Version")); h2:SetPoint("TOPLEFT", myWindow, "TOPLEFT", 150, 70);
    local h3=UI.CreateFrame("Text", "H3", myWindow); h3:SetFontSize(24); h3:SetText(L("newest Version")); h3:SetPoint("TOPLEFT", myWindow, "TOPLEFT", 300, 70);

    local tf;
    local bf;
    local row=1;

    for k, v in pairs(LibVersionCheckVersions) do
	if v.myVersion and v.newestVersion
	and ""..v.myVersion ~= "0"
	and ""..v.myVersion < ""..v.newestVersion then
    	    tf=UI.CreateFrame("Text", "T1"..row, myWindow); tf:SetFontSize(16); tf:SetText(k); tf:SetPoint("TOPLEFT", myWindow, "TOPLEFT", 30, row*20+100)
	    tf=UI.CreateFrame("Text", "T2"..row, myWindow); tf:SetFontSize(16); tf:SetText(""..v.myVersion); tf:SetPoint("TOPLEFT", myWindow, "TOPLEFT", 150, row*20+100)
	    tf=UI.CreateFrame("Text", "T3"..row, myWindow); tf:SetFontSize(16); tf:SetText(""..v.newestVersion); tf:SetPoint("TOPLEFT", myWindow, "TOPLEFT", 300, row*20+100)
	    row=row+1
	end
    end

    myWindow:SetWidth(500)
    -- myWindow:SetHeight(row*20+100)
    
    tf=UI.CreateFrame("Text", "showagain", myWindow); tf:SetText(L("show again : ")); tf:SetPoint("TOPLEFT", myWindow, "BOTTOMLEFT", 30, -80);
    
    bf=UI.CreateFrame("RiftButton", "sanextlogin", myWindow); bf:SetText(L("next login")); bf:SetPoint("TOPLEFT", myWindow, "BOTTOMLEFT", 160, -80); SetAction(bf, 0);
    bf=UI.CreateFrame("RiftButton", "satomorrow",  myWindow); bf:SetText(L("tomorrow"));   bf:SetPoint("TOPLEFT", myWindow, "BOTTOMLEFT", 290, -80); SetAction(bf, Inspect.Time.Server()+12*3600)
    bf=UI.CreateFrame("RiftButton", "sainaweek",   myWindow); bf:SetText(L("in a week"));  bf:SetPoint("TOPLEFT", myWindow, "BOTTOMLEFT",  30, -50); SetAction(bf, Inspect.Time.Server()+7*86400-43200)
    bf=UI.CreateFrame("RiftButton", "sainamonth",  myWindow); bf:SetText(L("in a month")); bf:SetPoint("TOPLEFT", myWindow, "BOTTOMLEFT", 160, -50); SetAction(bf, Inspect.Time.Server()+30*86400-43200)
    bf=UI.CreateFrame("RiftButton", "sanever",     myWindow); bf:SetText(L("never"));      bf:SetPoint("TOPLEFT", myWindow, "BOTTOMLEFT", 290, -50); SetAction(bf, Inspect.Time.Server()+3650*86400-43200)

    myWindow:SetVisible(true)
end
