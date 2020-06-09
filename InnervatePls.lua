innervatepls = { } 

SLASH_INNERVATEPLSTEST1 = "/innervatepls"
SLASH_INNERVATEPLSTEST2 = "/ipls"
SlashCmdList["INNERVATEPLSTEST"] = function(msg)
   if msg == "lock" then
      InnervatePlsButtonFrame_Resize_Button:Hide()
      InnervatePlsButtonFrame:SetBackdrop(nil)
      InnervatePls_Frame_Locked = true
   elseif msg == "unlock" then
      InnervatePlsButtonFrame_Resize_Button:Show()
      InnervatePls_Frame_Locked = false
      InnervatePlsButtonFrame:SetBackdrop( { 
         bgFile = [[Interface\TutorialFrame\TutorialFrameBackground]], 
         edgeFile = [[Interface\Tooltips\UI-Tooltip-Border]], tile = true, tileSize = 16, edgeSize = 16, 
         insets = { left = 4, right = 3, top = 4, bottom = 3 }
       });
   elseif msg == "toggle" then
      if InnervatePls_Frame_Hidden == false then 
         InnervatePlsButtonFrame:Hide() 
         InnervatePls_Frame_Hidden = true
         
      else 
         InnervatePlsButtonFrame:Show() 
         InnervatePls_Frame_Hidden = false
      end
   -- elseif msg == "test" then 

   else
      print("|cff00ccffInnervatePls Version 1.0 Loaded|r")
      print("|cffff0000This is an early test version|r")
      print("Type '/ipls lock' to lock the button")
      print("Type '/ipls unlock' to unlock the button")
      print("Type '/ipls toggle' to hide/show the button")
   end
end

function InnervatePls_ButtonFrame_OnMouseDown() 
   if  InnervatePls_Frame_Locked == false then InnervatePlsButtonFrame:StartMoving() end
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
   if event == "ADDON_LOADED" and arg1 == "InnervatePls" then
      InnervatePlsButtonFrame:SetClampedToScreen(true)
      print("|cff00ccffInnervatePls loaded - /ipls|r")
      InnervatePls_Button_Width_Scale = InnervatePlsButtonFrame:GetWidth() / 75
      InnervatePls_Button_Height_Scale = InnervatePlsButtonFrame:GetHeight() / 75
      C_Timer.After(0.05,InnervatePls_Timer_Resize_Button)
      C_ChatInfo.RegisterAddonMessagePrefix("INNERVATEPLS")
   elseif event == "CHAT_MSG_ADDON" and arg1 == "INNERVATEPLS" then
      print("RECEIVED MESSAGE FROM INNERVATEPLS: ")
      print("arg1 - prefix: \"" .. arg1 .. "\"")
      print("arg2 - text: \"" .. arg2 .. "\"")
      print("arg3 - channel: \"" .. arg3 .. "\"")
      print("arg4 - sender: \"" .. arg4 .. "\"")
      print("arg5 - target: \"" .. arg5 .. "\"")
      print("arg6 - zoneChannelID: \"" .. arg6 .. "\"")
      print("arg7 - localID: \"" .. arg7 .. "\"")
      print("arg8 - name: \"" .. arg8 .. "\"")
      print("arg9 - instanceID: \"" .. arg9 .. "\"")
-- 1. prefix 
-- 2. text 
-- 3. channel 
-- 4. sender 
-- 5. target 
-- 6. zoneChannelID 
-- 7. localID 
-- 8. name 
-- 9. instanceID 
   end
end

function InnervatePls_Timer_Resize_Button()
   InnervatePlsButtonFrame_Resize_Button:SetWidth(25 * InnervatePls_Button_Width_Scale)
   InnervatePlsButtonFrame_Resize_Button:SetHeight(25 * InnervatePls_Button_Height_Scale)
end

function InnervatePls_ButtonFrame_Resize_Button_OnUpdate()
   if InnervatePlsButtonFrame_Make_Square == true then
      InnervatePlsButtonFrame:SetHeight(InnervatePlsButtonFrame:GetWidth())
      InnervatePlsButtonFrame_Resize_Button:SetWidth(25 * InnervatePls_Button_Width_Scale)
      InnervatePlsButtonFrame_Resize_Button:SetHeight(25 * InnervatePls_Button_Height_Scale)
   end
end

function InnervatePls_ButtonFrame_Resize_Button_OnMouseDown()
   InnervatePlsButtonFrame:StartSizing()
   InnervatePlsButtonFrame_Make_Square = true

end

function InnervatePls_ButtonFrame_Resize_Button_OnMouseUp()
   InnervatePlsButtonFrame:StopMovingOrSizing()
   InnervatePlsButtonFrame_Make_Square = false
end

function InnervatePls_Button_OnUpdate()
   InnervatePls_Button_Width_Scale = InnervatePlsButtonFrame:GetWidth() / 75
   InnervatePls_Button_Height_Scale = InnervatePlsButtonFrame:GetHeight() / 75
   InnervatePlsButtonFrame_Button:SetWidth(35 * InnervatePls_Button_Width_Scale)
   InnervatePlsButtonFrame_Button:SetHeight(35 * InnervatePls_Button_Height_Scale)
end

function InnervatePls_Button_OnClick()
   InnervatePls_SendAddonMsg(UnitName("player") .. " wants innervate")

   -- TO-DO: move code below to the function where the druid receives the addon message
   --
   -- InnervatePlsButtonFrame_Druid_Mana_Check = true 
   -- InnervatePlsButtonFrame_Druid:Show()
   -- InnervatePlsButtonFrame_Druid_Class_Text:SetText(UnitName("player"))
   -- if UnitClass("player") == "Druid" then InnervatePlsButtonFrame_Druid_Class_Text:SetTextColor(1,0.49,0.04)
   -- elseif UnitClass("player") == "Paladin" then InnervatePlsButtonFrame_Druid_Class_Text:SetTextColor(0.96, 0.55, 0.73)
   -- elseif UnitClass("player") == "Shaman" then InnervatePlsButtonFrame_Druid_Class_Text:SetTextColor(0, 0.44, 0.87)
   -- else InnervatePlsButtonFrame_Druid_Class_Text:SetTextColor(1,1,1)
   -- end
end

function InnervatePlsButtonFrame_Druid_OnLoad()
   InnervatePlsButtonFrame_Druid:Hide()
end

function InnervatePlsButtonFrame_Druid_OnUpdate()
   if InnervatePlsButtonFrame_Druid_Mana_Check == true then
      InnervatePls_Percent_Mana = string.format ("%.0f%%",UnitPower("player", mana)/UnitPowerMax("player", mana)*100)
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
