GM.Name = "Hide and Seek"
GM.Author = "TW1STaL1CKY"
GM.Email = "tw1stal1cky@gmail.com" --oh boy
GM.Website = ""

team.SetUp(1,"Hiding",Color(60,128,255))
team.SetUp(2,"Seeking",Color(220,80,80))
team.SetUp(3,"Spectating",Color(80,155,80))
team.SetUp(4,"Caught",Color(220,160,40))

notifsnds = {"None",				--OFF
	"player/geiger1.wav",			--HL2
	"ui/buttonclick.wav",
	"buttons/button15.wav",
	"buttons/button16.wav",
	"weapons/ar2/ar2_empty.wav",
	"friends/friend_join.wav",		--STEAM
	"friends/message.wav",
	"ui/item_acquired.wav",			--TF2
	"ui/menu_focus.wav",
	"weapons/ball_buster_bounce_02.wav",
	"weapons/draw_sapper_switch.wav",
	"weapons/rescue_ranger_charge_01.wav",
	"misc/halloween/spelltick_01.wav",
	"misc/doomsday_warhead.wav",
	"player/portal_enter1.wav",		--PORTAL
	"ui/helpful_event_1.wav",		--L4D
	"ui/beepclear.wav"
}
TimeRemaining = 0
SeekerBlinded = false

function TimeLimit(activ)
	if activ == true then
		if GetConVarNumber("has_timelimit") < 1 then return end
		hook.Add("Tick","TimerRunning",function() TimeRemaining = math.ceil((RoundTimeSave+RoundTimer+30)-CurTime()) end)
		if SERVER then timer.Simple(1,function() hook.Add("Tick","OutOfTimeCheck",function() if TimeRemaining <= 0 then RoundOutOfTime() end end) end) end
	else
		hook.Remove("Tick","TimerRunning")
		if SERVER then hook.Remove("Tick","OutOfTimeCheck") end
	end
end

function SeekerBK()
	colormod = {}
	colormod["$pp_colour_addr"]=0
	colormod["$pp_colour_addg"]=0
	colormod["$pp_colour_addb"]=0
	colormod["$pp_colour_brightness"]=-0.92
	colormod["$pp_colour_contrast"]=1.4
	colormod["$pp_colour_colour"]=0
	colormod["$pp_colour_mulr"]=0
	colormod["$pp_colour_mulg"]=0
	colormod["$pp_colour_mulb"]=0
	DrawColorModify(colormod)
end
function SeekerBlinding(activ)
	if activ == true then
		hook.Add("Move","SeekerRestrict",function(ply,mv)
			if ply:Team() != 2 then return end
			return true
		end)
		for k,v in pairs(player.GetAll()) do
			if v:Team() == 2 then
				v:SendLua([[hook.Add("RenderScreenspaceEffects","SeekerRestrict",SeekerBK)]])
			end
			v:SendLua([[SeekerBlinded = true]])
		end
		SeekerBlinded = true
	else
		hook.Remove("Move","SeekerRestrict")
		for k,v in pairs(player.GetAll()) do
			v:SendLua([[hook.Remove("RenderScreenspaceEffects","SeekerRestrict") SeekerBlinded = false]])
		end
		SeekerBlinded = false
		if not RoundActive then return end
		for k,v in pairs(player.GetAll()) do
			if v:Team() == 2 then v:EmitSound("coach/coach_attack_here.wav",90,100) end
			if v:Team() == 1 then v:SendLua([[LocalPlayer():EmitSound("coach/coach_attack_here.wav",26,100)]]) end
		end
	end
end