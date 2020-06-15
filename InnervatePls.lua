innervatepls = { } 

SLASH_INNERVATEPLSTEST1 = "/innervatepls"
SLASH_INNERVATEPLSTEST2 = "/ipls"
SlashCmdList["INNERVATEPLSTEST"] = function(msg)
   if msg == "lock" then
      if InnervatePls_Frame_Locked == true then
         print("InnervatePls is already locked, type '/ipls unlock' to unlock the frames")
      else
         InnervatePlsButtonFrame_Resize_Button:Hide()
         InnervatePlsButtonFrame:SetBackdrop(nil)
         InnervatePls_Frame_Locked = true
      end
   elseif msg == "unlock" then
      if InnervatePls_Frame_Locked == true then
         InnervatePlsButtonFrame_Resize_Button:Show()
         InnervatePls_Frame_Locked = false
         InnervatePlsButtonFrame:SetBackdrop( { 
            bgFile = [[Interface\TutorialFrame\TutorialFrameBackground]], 
            edgeFile = [[Interface\Tooltips\UI-Tooltip-Border]], tile = true, tileSize = 16, edgeSize = 16, 
            insets = { left = 4, right = 3, top = 4, bottom = 3 }
         });
      else
         print("InnervatePls is already unlocked, type '/ipls lock' to lock the frames")
      end
   elseif msg == "toggle" then
      if InnervatePls_Frame_Hidden == false then 
         InnervatePlsButtonFrame:Hide() 
         InnervatePls_Frame_Hidden = true
      else 
         InnervatePlsButtonFrame:Show() 
         InnervatePls_Frame_Hidden = false
      end

   else
      print("|cff00ccffInnervatePls Version 1.0 Loaded|r")
      print("|cffff0000This is an early test version|r")
      print("Type '/ipls lock' to lock the frames")
      print("Type '/ipls unlock' to unlock the frames")
      print("Type '/ipls toggle' to hide/show the button")
   end
end

function InnervatePls_ButtonFrame_OnMouseDown() 
   if InnervatePls_Frame_Locked == false then InnervatePlsButtonFrame:StartMoving() end
end

function InnervatePls_ButtonFrame_OnMouseUp()
   InnervatePlsButtonFrame:StopMovingOrSizing()
end

function InnervatePls_ButtonFrame_OnUpdate()
   if InnervatePls_Frame_Hidden == nil then InnervatePls_Frame_Hidden = false end
   if InnervatePls_Frame_Locked == nil then InnervatePls_Frame_Locked = false end


   if InnervatePls_Frame_Hidden == true then InnervatePlsButtonFrame:Hide()
   elseif InnervatePls_Frame_Hidden == false then InnervatePlsButtonFrame:Show()
   end

   if InnervatePls_Frame_Locked == true then       
         InnervatePlsButtonFrame_Resize_Button:Hide()
         InnervatePlsButtonFrame:SetBackdrop(nil)

   elseif InnervatePls_Frame_Locked == false then       
         InnervatePlsButtonFrame_Resize_Button:Show()
         InnervatePlsButtonFrame:SetBackdrop( { 
            bgFile = [[Interface\TutorialFrame\TutorialFrameBackground]], 
            edgeFile = [[Interface\Tooltips\UI-Tooltip-Border]], tile = true, tileSize = 16, edgeSize = 16, 
            insets = { left = 4, right = 3, top = 4, bottom = 3 }
         })
   end
end

function InnervatePls_ButtonFrame_OnEvent(event, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12, arg13, arg14, arg15, arg16, arg17)

   -- If the addon is loaded
   if event == "ADDON_LOADED" and arg1 == "InnervatePls" then
      InnervatePlsButtonFrame:SetClampedToScreen(true)
      print("|cff00ccffInnervatePls loaded - /ipls|r")
      InnervatePls_Button_Width_Scale = InnervatePlsButtonFrame:GetWidth() / 75
      InnervatePls_Button_Height_Scale = InnervatePlsButtonFrame:GetHeight() / 75
      C_ChatInfo.RegisterAddonMessagePrefix("INNERVATEPLS")

   -- If a message from the addon is received
   elseif event == "CHAT_MSG_ADDON" and arg1 == "INNERVATEPLS" then
      message = arg2
      from = arg4

      -- Remove servername from receiver
      if string.find(from, "-") then
         from = string.sub(from, 0, string.find(arg4, "-")-1);
      end

      InnervatePls_HandleAddonMsg(message, from)
   end
end

function InnervatePls_ButtonFrame_Resize_Button_OnUpdate()
   if InnervatePlsButtonFrame_Make_Square == true then
      InnervatePlsButtonFrame:SetHeight(InnervatePlsButtonFrame:GetWidth())
   end
end

function InnervatePls_ButtonFrame_Resize_Button_OnMouseDown()
   InnervatePlsButtonFrame:StartSizing()
   InnervatePlsButtonFrame_Make_Square = true
   InnervatePlsButtonFrame_Resize_Button:SetHighlightTexture(nil)
end

function InnervatePls_ButtonFrame_Resize_Button_OnMouseUp()
   InnervatePlsButtonFrame:StopMovingOrSizing()
   InnervatePlsButtonFrame_Make_Square = false
   InnervatePlsButtonFrame_Resize_Button:SetHighlightTexture("Interface\\CHATFRAME\\UI-ChatIM-SizeGrabber-Highlight")
end

function InnervatePls_Button_OnUpdate()
   InnervatePls_Button_Width_Scale = InnervatePlsButtonFrame:GetWidth() / 75
   InnervatePls_Button_Height_Scale = InnervatePlsButtonFrame:GetHeight() / 75
   InnervatePlsButtonFrame_Button:SetWidth(35 * InnervatePls_Button_Width_Scale)
   InnervatePlsButtonFrame_Button:SetHeight(35 * InnervatePls_Button_Height_Scale)
end

function InnervatePls_Button_OnClick()
   InnervatePls_SendAddonMsg("InnervateRequest;" .. UnitName("player"))
end

function InnervatePlsButtonFrame_Druid_OnLoad()
   InnervatePlsButtonFrame_Druid:Hide()
end

function InnervatePlsButtonFrame_Druid_OnUpdate()
   if InnervatePlsButtonFrame_Druid_Mana_Check ~= false then
      InnervatePls_Percent_Mana = string.format ("%.0f%%",UnitPower(InnervatePlsButtonFrame_Druid_Mana_Check, mana)/UnitPowerMax(InnervatePlsButtonFrame_Druid_Mana_Check, mana)*100)
      InnervatePlsButtonFrame_Druid_Mana_Text:SetText(InnervatePls_Percent_Mana)
   end
end

function InnervatePlsButtonFrame_Druid_OnMouseDown()
   InnervatePlsButtonFrame_Druid:StartMoving()
end

function InnervatePlsButtonFrame_Druid_OnMouseUp()
   InnervatePlsButtonFrame_Druid:StopMovingOrSizing()
end

function InnervatePlsButtonFrame_Druid_Green_Button_PostClick()
   InnervatePlsButtonFrame_Druid:Hide()
   InnervatePlsButtonFrame_Druid_Mana_Check = false
end

function InnervatePlsButtonFrame_Druid_Red_Button_OnClick()
   InnervatePlsButtonFrame_Druid:Hide()
   InnervatePlsButtonFrame_Druid_Mana_Check = false
   print("Innervate Canceled")
end

-- Send an addon message in the correct channel (party or raid) with the correct prefix
function InnervatePls_SendAddonMsg(message)
	if IsInRaid("player") then
		C_ChatInfo.SendAddonMessage("INNERVATEPLS", message, "RAID")
	elseif GetNumGroupMembers() > 0 then
      C_ChatInfo.SendAddonMessage("INNERVATEPLS", message, "PARTY")
   end
end

function InnervatePls_HandleAddonMsg(message, from)
   InnervatePlsButtonFrame_Druid_Mana_Check = from 
   InnervatePlsButtonFrame_Druid:Show()
   InnervatePlsButtonFrame_Druid_Class_Text:SetText(from)
   if UnitClass("player") == "Druid" then InnervatePlsButtonFrame_Druid_Class_Text:SetTextColor(1,0.49,0.04)
   elseif UnitClass("player") == "Paladin" then InnervatePlsButtonFrame_Druid_Class_Text:SetTextColor(0.96, 0.55, 0.73)
   elseif UnitClass("player") == "Shaman" then InnervatePlsButtonFrame_Druid_Class_Text:SetTextColor(0, 0.44, 0.87)
   else InnervatePlsButtonFrame_Druid_Class_Text:SetTextColor(1,1,1)
   end
end
