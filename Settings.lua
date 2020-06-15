-- SLASH COMMANDS BEGIN

SLASH_INNERVATEPLS1 = "/innervatepls"
SLASH_INNERVATEPLS2 = "/ipls"
SlashCmdList["INNERVATEPLS"] = function(msg)
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
         print("InnervatePls hidden, type '/ipls toggle' to show")
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

-- SLASH COMMANDS END
-- BUTTON FRAME STATE BEGIN

function InnervatePls_ButtonFrame_Initialize()
   InnervatePlsButtonFrame:SetClampedToScreen(true)

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

   C_Timer.After(0.05, InnervatePls_ButtonFrame_Resize)
end

function InnervatePls_ButtonFrame_OnMouseDown() 
   InnervatePlsButtonFrame:StartMoving()
end

function InnervatePls_ButtonFrame_OnMouseUp()
   InnervatePlsButtonFrame:StopMovingOrSizing()
end

-- BUTTON FRAME STATE END
-- BUTTON FRAME RESIZING BEGIN

function InnervatePls_ButtonFrame_Resize_Button_OnMouseDown()
   InnervatePlsButtonFrame:SetScript("OnSizeChanged", InnervatePls_ButtonFrame_Resize)
   InnervatePlsButtonFrame:StartSizing()
   InnervatePlsButtonFrame_Resize_Button:SetHighlightTexture(nil)
end

function InnervatePls_ButtonFrame_Resize()
   local frame_width = InnervatePlsButtonFrame:GetWidth()
   local frame_scale = frame_width / 75

   InnervatePlsButtonFrame:SetHeight(frame_width)
   InnervatePlsButtonFrame_Button:SetWidth(35 * frame_scale)
   InnervatePlsButtonFrame_Button:SetHeight(35 * frame_scale)
end

function InnervatePls_ButtonFrame_Resize_Button_OnMouseUp()
   InnervatePlsButtonFrame:StopMovingOrSizing()
   InnervatePlsButtonFrame_Resize_Button:SetHighlightTexture("Interface\\CHATFRAME\\UI-ChatIM-SizeGrabber-Highlight")
   InnervatePlsButtonFrame:SetScript("OnSizeChanged", nil)
end

-- BUTTON FRAME RESIZING END
-- DRUID FRAME MOVING START 

function InnervatePlsDruidFrame_OnMouseDown()
   InnervatePlsDruidFrame:StartMoving()
end

function InnervatePlsDruidFrame_OnMouseUp()
   InnervatePlsDruidFrame:StopMovingOrSizing()
end

-- DRUID FRAME MOVING END
