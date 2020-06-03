innervatepls = { } 

SLASH_INNERVATEPLS1 = "/innervatepls"
SLASH_INNERVATEPLS2 = "/ipls"
SlashCmdList["INNERVATEPLS"] = function(msg)
   print("Chat Command Working")
   
end

function InnervatePls_ButtonFrame_OnMouseDown() 
   InnervatePlsButtonFrame:StartMoving()
end

function InnervatePls_ButtonFrame_OnMouseUp()
   InnervatePlsButtonFrame:StopMovingOrSizing()
end

function InnervatePls_ButtonFrame_OnUpdate()
   InnervatePlsButtonFrame:SetHeight(InnervatePlsButtonFrame:GetWidth())
end

function InnervatePls_ButtonFrame_OnLoad()
   InnervatePlsButtonFrame_Button:SetClampedToScreen(true)
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
    print("I WANT INNERVATE")
   print(UnitPower("player", mana)/UnitPowerMax("player", mana)*100 .."%")
   print(UnitClass("player"))
   print(UnitName("player"))
end

function InnervatePlsButtonFrame_Druid_OnLoad()
   InnervatePlsButtonFrame_Druid:Hide()
end

function InnervatePlsButtonFrame_Druid_Green_Button_OnClick()
   InnervatePlsButtonFrame_Druid:Hide()
   print("THERE YOU GO")
end

function InnervatePlsButtonFrame_Druid_Red_Button_OnClick()
   InnervatePlsButtonFrame_Druid:Hide()
   print("NONONONO")
end
