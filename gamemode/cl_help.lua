function showHelp()
	local DermaPanel = vgui.Create("DFrame")
	DermaPanel:SetSize(600,400)
	DermaPanel:SetPos(25,ScrH()/4)
	DermaPanel:SetTitle("Hide and Seek - Help")
	DermaPanel:SetScreenLock(true)
	DermaPanel:ShowCloseButton(false)
	DermaPanel:SetMouseInputEnabled(true)
	DermaPanel:SetKeyboardInputEnabled(true)
	DermaPanel:MakePopup()
	local DermaPropSheet = vgui.Create("DPropertySheet",DermaPanel)
	DermaPropSheet:SetSize(580,326)
	DermaPropSheet:SetPos(10,30)
	local DermaButton1 = vgui.Create("DButton",DermaPanel)
	DermaButton1:SetSize(200,30)
	DermaButton1:SetPos(10,360)
	DermaButton1:SetText("Let's play!")
	DermaButton1.DoClick = function(DermaButton)
		DermaPanel:Close()
		surface.PlaySound("garrysmod/save_load3.wav")
	end

	local DermaTab1 = vgui.Create("DPanel",DermaPropSheet)
	DermaTab1:SetPos(5,20)
	DermaTab1:SetSize(570,281)
	DermaTab1.Paint = function()
		surface.SetDrawColor(50,50,50,255)
		surface.DrawRect(0,0,DermaTab1:GetWide(),DermaTab1:GetTall())
	end
	local DermaLabel1_1 = vgui.Create("DLabel",DermaTab1)
	DermaLabel1_1:SetPos(10,10)
	DermaLabel1_1:SetColor(Color(255,255,255,255))
	DermaLabel1_1:SetFont("DermaLarge")
	DermaLabel1_1:SetText("Welcome to Hide and Seek!")
	DermaLabel1_1:SizeToContents()
	local DermaLabel1_2 = vgui.Create("DLabel",DermaTab1)
	DermaLabel1_2:SetPos(10,50)
	DermaLabel1_2:SetColor(Color(255,255,255,255))
	DermaLabel1_2:SetFont("DermaDefault")
	DermaLabel1_2:SetText("You've probably heard of the classic game of 'Hide and Seek', right? It's pretty much those very same rules!\n\nThere are two teams, the hiding and the seekers.\nHiding players have to hide away from the seekers and seeking players have to find the hiding players, simple!\nNow go catch some sillys.\n\n\nHide and Seek buttons -\nF1 = Opens this help-box, click other tabs for more help!\nRELOAD = Taunt.\n\nPossible requirements -\n'Team Fortress 2' to fully hear gamemode audio.\n'Counter-Strike: Source' for maps that servers could host.\n'Left 4 Dead' to have a nice landing sound, not so important.")
	DermaLabel1_2:SizeToContents()
	local DermaTab2 = vgui.Create("DPanel",DermaPropSheet)
	DermaTab2:SetPos(5,20)
	DermaTab2:SetSize(570,281)
	DermaTab2.Paint = function()
		surface.SetDrawColor(50,50,50,255)
		surface.DrawRect(0,0,DermaTab2:GetWide(),DermaTab2:GetTall())
	end
	local DermaLabel2_1 = vgui.Create("DLabel",DermaTab2)
	DermaLabel2_1:SetPos(10,10)
	DermaLabel2_1:SetColor(Color(255,255,255,255))
	DermaLabel2_1:SetFont("DermaLarge")
	DermaLabel2_1:SetText("Hiding!")
	DermaLabel2_1:SizeToContents()
	local DermaLabel2_2 = vgui.Create("DLabel",DermaTab2)
	DermaLabel2_2:SetPos(10,50)
	DermaLabel2_2:SetColor(Color(255,255,255,255))
	DermaLabel2_2:SetFont("DermaDefault")
	DermaLabel2_2:SetText("Hiding players are marked with blue name tags and blue clothes. Fellow hiders\nwill also have blue markers over their heads, so keep track which arrow is your friend!\n\nUse clever spots to keep out of seeker's sights!\nTry not to waste your sprint when escaping seekers!\nWatch teammates' arrows, if one disappears, they could have been caught!\nTry to trick seekers that are chasing you as they can run slightly faster than you!\n\n\nLanding after jumping will cause a short slowdown. But be careful, falling a\ngreat feet will make you let out a yelp, giving seekers an idea of your position!\nFalling from even bigger heights will affect your stamina too!")
	DermaLabel2_2:SizeToContents()
	local DermaModel1 = vgui.Create("DModelPanel",DermaTab2)
	DermaModel1:SetSize(250,250)
	DermaModel1:SetPos(360,8)
	DermaModel1:SetModel("models/player/group01/male_0"..math.random(1,9)..".mdl")
	DermaModel1:SetAnimated(true)
	DermaModel1:SetAnimSpeed(1)
	function DermaModel1:LayoutEntity() self:RunAnimation() end
	function DermaModel1.Entity:GetPlayerColor() return Vector(0,0.2,0.6) end
	local DermaTab3 = vgui.Create("DPanel",DermaPropSheet)
	DermaTab3:SetPos(5,20)
	DermaTab3:SetSize(570,281)
	DermaTab3.Paint = function()
		surface.SetDrawColor(50,50,50,255)
		surface.DrawRect(0,0,DermaTab3:GetWide(),DermaTab3:GetTall())
	end
	local DermaLabel3_1 = vgui.Create("DLabel",DermaTab3)
	DermaLabel3_1:SetPos(10,10)
	DermaLabel3_1:SetColor(Color(255,255,255,255))
	DermaLabel3_1:SetFont("DermaLarge")
	DermaLabel3_1:SetText("Seeking!")
	DermaLabel3_1:SizeToContents()
	local DermaLabel3_2 = vgui.Create("DLabel",DermaTab3)
	DermaLabel3_2:SetPos(10,50)
	DermaLabel3_2:SetColor(Color(255,255,255,255))
	DermaLabel3_2:SetFont("DermaDefault")
	DermaLabel3_2:SetText("Seeking players are marked with red name tags and red clothes.\nFellow seekers will also have red markers over their heads!\nYou can catch hiding by running into them or clicking them while close!\n\nCheck simple hiding spots as well as hard-to-reach places!\nUse your sprint when you're chasing hiders!\nWatch your teammates' arrows, if they are all in one spot,\nthey could be chasing someone! Team up with other seekers to quickly cover an area!\nDon't give up chasing someone, you have a slight speed advantage over hiders!\n\n\nLanding after jumping will cause a short slowdown. But be careful, falling a\ngreat feet will make you let out a yelp, giving seekers an idea of your position!\nFalling from even bigger heights will affect your stamina too!\nYou are also able to use a flashlight to find hiders in dark areas.")
	DermaLabel3_2:SizeToContents()
	local DermaModel2 = vgui.Create("DModelPanel",DermaTab3)
	DermaModel2:SetSize(250,250)
	DermaModel2:SetPos(360,8)
	DermaModel2:SetModel("models/player/group01/male_0"..math.random(1,9)..".mdl")
	DermaModel2:SetAnimated(true)
	DermaModel2:SetAnimSpeed(1)
	function DermaModel2:LayoutEntity() self:RunAnimation() end
	function DermaModel2.Entity:GetPlayerColor() return Vector(0.6,0.2,0) end
	--[[
	local DermaTab4 = vgui.Create("DPanel",DermaPropSheet)
	DermaTab4:SetPos(5,20)
	DermaTab4:SetSize(570,281)
	DermaTab4.Paint = function()
		surface.SetDrawColor(50,50,50,255)
		surface.DrawRect(0,0,DermaTab4:GetWide(),DermaTab4:GetTall())
	end
	local DermaLabel4_1 = vgui.Create("DLabel",DermaTab4)
	DermaLabel4_1:SetPos(10,10)
	DermaLabel4_1:SetColor(Color(255,255,255,255))
	DermaLabel4_1:SetFont("DermaLarge")
	DermaLabel4_1:SetText("Spectating!")
	DermaLabel4_1:SizeToContents()
	local DermaLabel4_2 = vgui.Create("DLabel",DermaTab4)
	DermaLabel4_2:SetPos(10,50)
	DermaLabel4_2:SetColor(Color(255,255,255,255))
	DermaLabel4_2:SetFont("DermaDefault")
	DermaLabel4_2:SetText("You can't see other players spectating, although that would be cool...\n\nSpectating is for when you want to take a break and want to stay in the server.\nIn some servers, you would have to spectate when you're caught and\nwait for the next round to start playing again.\n\nWhile spectating, you can... I don't know... think about future hiding spots?\nBut don't ghost for other players. Because that's a silly move...")
	DermaLabel4_2:SizeToContents()
	local DermaModel3 = vgui.Create("DModelPanel",DermaTab4)
	DermaModel3:SetSize(250,250)
	DermaModel3:SetPos(360,8)
	DermaModel3:SetModel("models/tools/camera/camera.mdl")
	DermaModel3:SetCamPos(Vector(25,25,0))
	DermaModel3:SetLookAt(Vector(0,0,0))
	function DermaModel3:LayoutEntity() end
	]]
	local DermaButtonXX = vgui.Create("DButton",DermaTab1)
	DermaButtonXX:SetSize(2,2)
	DermaButtonXX:SetPos(562,288)
	DermaButtonXX:SetText("")
	DermaButtonXX.Paint = function()
		draw.RoundedBox(0,0,0,DermaButtonXX:GetWide(),DermaButtonXX:GetTall(),Color(0,0,0,0))
	end
	DermaButtonXX.DoClick = function(DermaButton)
		return
	end

	DermaPropSheet:AddSheet("Welcome",DermaTab1,"icon16/cake.png",false,false,"1 - Welcome to Hide and Seek!")
	DermaPropSheet:AddSheet("Hiding",DermaTab2,"icon16/user.png",false,false,"2 - About hiding players.")
	DermaPropSheet:AddSheet("Seeking",DermaTab3,"icon16/user_red.png",false,false,"3 - About seeking players.")
	--DermaPropSheet:AddSheet("Spectating",DermaTab4,"icon16/camera.png",false,false,"4 - About spectating?")
end

net.Receive("HS.ShowHelp", function()
	HS.OnInitPostEntity(showHelp)
end)