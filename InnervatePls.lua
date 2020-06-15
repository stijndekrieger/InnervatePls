function InnervatePls_ButtonFrame_OnEvent(event, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12, arg13, arg14, arg15, arg16, arg17)

   -- If the addon is loaded
   if event == "ADDON_LOADED" and arg1 == "InnervatePls" then
      C_ChatInfo.RegisterAddonMessagePrefix("INNERVATEPLS")
      print("|cff00ccffInnervatePls loaded - /ipls|r")
      InnervatePls_ButtonFrame_Initialize()

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

function InnervatePls_Button_OnClick()
   InnervatePls_SendAddonMsg("InnervateRequest;" .. UnitName("player"))
end

function InnervatePlsDruidFrame_Green_Button_PostClick()
   InnervatePlsDruidFrame_Hide()
end

function InnervatePlsDruidFrame_Red_Button_OnClick()
   print("Innervate Canceled")
   InnervatePlsDruidFrame_Hide()
end

function InnervatePlsDruidFrame_Show(innervate_target)
   InnervatePlsDruidFrame_Mana_Target = from
   InnervatePlsDruidFrame:SetScript("OnUpdate", InnervatePlsDruidFrame_UpdateManaText)
   InnervatePlsDruidFrame_Class_Text:SetText(innervate_target)

   -- Set correct class color
   -- TO-DO: support other classes
   if UnitClass("player") == "Druid" then InnervatePlsDruidFrame_Class_Text:SetTextColor(1,0.49,0.04)
   elseif UnitClass("player") == "Paladin" then InnervatePlsDruidFrame_Class_Text:SetTextColor(0.96, 0.55, 0.73)
   elseif UnitClass("player") == "Shaman" then InnervatePlsDruidFrame_Class_Text:SetTextColor(0, 0.44, 0.87)
   else InnervatePlsDruidFrame_Class_Text:SetTextColor(1,1,1)
   end

   InnervatePlsDruidFrame:Show()
end

function InnervatePlsDruidFrame_UpdateManaText()
   if InnervatePlsDruidFrame_Mana_Target ~= false then
      local mana_text = string.format("%.0f%%",UnitPower(InnervatePlsDruidFrame_Mana_Target, mana)/UnitPowerMax(InnervatePlsDruidFrame_Mana_Target, mana)*100)
      InnervatePlsDruidFrame_Mana_Text:SetText(mana_text)
   end
end

function InnervatePlsDruidFrame_Hide()
   InnervatePlsDruidFrame:Hide()
   InnervatePlsDruidFrame:SetScript("OnUpdate", nil)
   InnervatePlsDruidFrame_Mana_Target = false
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
   InnervatePlsDruidFrame_Show(from)
end
