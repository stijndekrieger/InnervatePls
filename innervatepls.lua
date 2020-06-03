innervatepls = { } 

SLASH_INNERVATEPLS1 = "/innervatepls"
SLASH_INNERVATEPLS2 = "/ipls"
SlashCmdList["INNERVATEPLS"] = function(msg)
   print("Chat Command Working")
end

--Need to find a way to both size and move
function InnervatePls_ButtonFrame_OnMouseDown()
   InnervatePlsButtonFrame:StartSizing() 
   -- InnervatePlsButtonFrame:StartMoving()
end

function InnervatePls_ButtonFrame_OnMouseUp()
   InnervatePlsButtonFrame:StopMovingOrSizing()
end

function InnervatePls_ButtonFrame_OnUpdate()
   InnervatePlsButtonFrame:SetHeight(InnervatePlsButtonFrame:GetWidth())
end

function InnervatePls_Button_OnLoad()
   print("Button loaded")
end

function InnervatePls_Button_OnUpdate()
   InnervatePls_Button_Width_Scale = InnervatePlsButtonFrame:GetWidth() / 75
   InnervatePls_Button_Height_Scale = InnervatePlsButtonFrame:GetHeight() / 75
   InnervatePlsButtonFrame_Button:SetWidth(35 * InnervatePls_Button_Width_Scale)
   InnervatePlsButtonFrame_Button:SetHeight(35 * InnervatePls_Button_Height_Scale)
end

function InnervatePls_Button_OnClick()
   InnervatePls_Class = UnitClass("player")
   print("You are a " .. InnervatePls_Class)
end
