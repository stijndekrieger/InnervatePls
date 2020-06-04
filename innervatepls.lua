innervatepls = { } 

InnervatePls_Frame_Locked = false
InnervatePls_Frame_Hidden = false

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
      print("Toggle button")
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
   InnervatePlsButtonFrame:SetHeight(InnervatePlsButtonFrame:GetWidth())
end

function InnervatePls_ButtonFrame_OnLoad()
   InnervatePlsButtonFrame:SetClampedToScreen(true)
   print("|cff00ccffInnervatePls loaded - /ipls|r")
end

function InnervatePls_ButtonFrame_Resize_Button_OnUpdate()
   InnervatePls_Button_Width_Scale = InnervatePlsButtonFrame:GetWidth() / 75
   InnervatePls_Button_Height_Scale = InnervatePlsButtonFrame:GetHeight() / 75
   InnervatePlsButtonFrame_Resize_Button:SetWidth(25 * InnervatePls_Button_Width_Scale)
   InnervatePlsButtonFrame_Resize_Button:SetHeight(25 * InnervatePls_Button_Height_Scale)
end

function InnervatePls_ButtonFrame_Resize_Button_OnMouseDown()
   InnervatePlsButtonFrame:StartSizing()
end

function InnervatePls_ButtonFrame_Resize_Button_OnMouseUp()
   InnervatePlsButtonFrame:StopMovingOrSizing()
end

function InnervatePls_Button_OnUpdate()
   InnervatePls_Button_Width_Scale = InnervatePlsButtonFrame:GetWidth() / 75
   InnervatePls_Button_Height_Scale = InnervatePlsButtonFrame:GetHeight() / 75
   InnervatePlsButtonFrame_Button:SetWidth(35 * InnervatePls_Button_Width_Scale)
   InnervatePlsButtonFrame_Button:SetHeight(35 * InnervatePls_Button_Height_Scale)
end

function InnervatePls_Button_OnClick() 
   InnervatePlsButtonFrame_Druid:Show()
   InnervatePls_Percent_Mana = string.format ("%.1f%%",UnitPower("player", mana)/UnitPowerMax("player", mana)*100)
   print(UnitClass("player").." ".. UnitName("player").." with "..InnervatePls_Percent_Mana.." Mana wants Innervate")
end

function InnervatePlsButtonFrame_Druid_OnLoad()
   InnervatePlsButtonFrame_Druid:Hide()
end

function InnervatePlsButtonFrame_Druid_Green_Button_OnClick()
   InnervatePlsButtonFrame_Druid:Hide()
   print("Innervate Given")
end

function InnervatePlsButtonFrame_Druid_Red_Button_OnClick()
   InnervatePlsButtonFrame_Druid:Hide()
   print("Innervate Canceled")
end
