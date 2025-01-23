-- The Chronicle of Hamza scripts --

function StartMoney()
	if GetVar("AddedStartMoney").AsInt==0 then
		local min = 800
		local max = 2500
		local randomMoney = math.random(min, max)
		g_Player:AddMoney( randomMoney )

		SetVar("AddedStartMoney", 1)
	else
		AddFadingMsgId( "fm_commandcantusetwice" )
    	AddImportantFadingMsgId( "fm_commandcantusetwice" )
	end
end

function CreateFirstAttackersCS()
	CreateVehicleEx("UralStartBez","FrstAttacker0",CVector(2572.051, 267.215, 3917.664), 1062)
	CreateVehicleEx("UralStartBez","FrstAttacker1",CVector(2572.051, 267.215, 3917.664), 1062)
	CreateVehicleEx("BezHunter","FrstAttacker2",CVector(2572.051, 267.215, 3917.664), 1062)
	CreateVehicleEx("UralStartBez","FrstAttacker3",CVector(2572.051, 267.215, 3917.664), 1062)

	local veh0 = getObj("FrstAttacker0")
	if veh0 then
		veh0:SetRotation(Quaternion(-0.055, -0.774, 0.005, 0.631))
		veh0:SetGamePositionOnGround(CVector(getPos("FirstDeb_spawnloc_0")))
		veh0:SetRandomSkin()
	end

	local veh1 = getObj("FrstAttacker1")
	if veh1 then
		veh1:SetRotation(Quaternion(-0.055, -0.774, 0.005, 0.631))
		veh1:SetGamePositionOnGround(CVector(getPos("FirstDeb_spawnloc_1")))
		veh1:SetRandomSkin()
	end

	local veh2 = getObj("FrstAttacker2")
	if veh2 then
		veh2:SetRotation(Quaternion(-0.055, -0.774, 0.005, 0.631))
		veh2:SetGamePositionOnGround(CVector(getPos("FirstDeb_spawnloc_2")))
		veh2:SetRandomSkin()
	end

	local veh3 = getObj("FrstAttacker3")
	if veh3 then
		veh3:SetRotation(Quaternion(-0.055, -0.774, 0.005, 0.631))
		veh3:SetGamePositionOnGround(CVector(getPos("FirstDeb_spawnloc_3")))
		veh3:SetRandomSkin()
	end

	local skin0 = GetEntityByName("FrstAttacker0"):GetSkin() 
	local skin1 = GetEntityByName("FrstAttacker1"):GetSkin() 
	local skin2 = GetEntityByName("FrstAttacker2"):GetSkin() 
	local skin3 = GetEntityByName("FrstAttacker3"):GetSkin() 

	SetVar("FirstAttackSkin0", tonumber(skin0))
	SetVar("FirstAttackSkin1", tonumber(skin1))
	SetVar("FirstAttackSkin2", tonumber(skin2))
	SetVar("FirstAttackSkin3", tonumber(skin3))
end

function CreateFirstAttackers()
	CreateTeam("StartDebyli",1062,CVector(2572.051, 267.215, 3917.664),{"UralStartBez","UralStartBez","BezHunter", "UralStartBez"},CVector(2594.501, 262.854, 3906.361), nil)

	local skin0 = GetVar("FirstAttackSkin0").AsInt
	local skin1 = GetVar("FirstAttackSkin1").AsInt
	local skin2 = GetVar("FirstAttackSkin2").AsInt
	local skin3 = GetVar("FirstAttackSkin3").AsInt

	local veh0cs = getObj("FrstAttacker0")
	if veh0cs then
		veh0cs:Remove()
	end

	local veh1cs = getObj("FrstAttacker1")
	if veh1cs then
		veh1cs:Remove()
	end

	local veh2cs = getObj("FrstAttacker2")
	if veh2cs then
		veh2cs:Remove()
	end

	local veh3cs = getObj("FrstAttacker3")
	if veh3cs then
		veh3cs:Remove()
	end

	local veh0 = getObj("StartDebyli_vehicle_0")
	if veh0 then
		veh0:SetRotation(Quaternion(-0.055, -0.774, 0.005, 0.631))
		veh0:SetGamePositionOnGround(CVector(getPos("FirstDeb_spawnloc_0")))
		veh0:SetSkin(skin0)
	end

	local veh1 = getObj("StartDebyli_vehicle_1")
	if veh1 then
		veh1:SetRotation(Quaternion(-0.055, -0.774, 0.005, 0.631))
		veh1:SetGamePositionOnGround(CVector(getPos("FirstDeb_spawnloc_1")))
		veh1:SetSkin(skin1)
	end

	local veh2 = getObj("StartDebyli_vehicle_2")
	if veh2 then
		veh2:SetRotation(Quaternion(-0.055, -0.774, 0.005, 0.631))
		veh2:SetGamePositionOnGround(CVector(getPos("FirstDeb_spawnloc_2")))
		veh2:SetSkin(skin2)
	end

	local veh3 = getObj("StartDebyli_vehicle_3")
	if veh3 then
		veh3:SetRotation(Quaternion(-0.055, -0.774, 0.005, 0.631))
		veh3:SetGamePositionOnGround(CVector(getPos("FirstDeb_spawnloc_3")))
		veh3:SetSkin(skin3)
	end
end

function CreateRacers()
	local WinningRandom = random(4)
	local positions = {
		{4,1,2,3},
		{1,4,2,3},
		{1,2,4,3},
		{1,3,2,4}
	}
	SetVar("WinningNumber", WinningRandom)
	println("Random: "..WinningRandom)

	local F = {}
	F[1] = CreateVehicleEx("UralRace00", "Formula1", CVector(getPos("RaceStart"..positions[WinningRandom][1].."_loc"))+CVector(0,1,0), 1100)
	F[2] = CreateVehicleEx("UralRace01", "Formula2", CVector(getPos("RaceStart"..positions[WinningRandom][2].."_loc"))+CVector(0,1,0), 1100)
	F[3] = CreateVehicleEx("UralMansurRace", "Formula3", CVector(getPos("RaceStart"..positions[WinningRandom][3].."_loc"))+CVector(0,1,0), 1100)
	F[4] = CreateVehicleEx("UralRace00", "Formula4", CVector(getPos("RaceStart"..positions[WinningRandom][4].."_loc"))+CVector(0,1,0), 1100)

	for i=1,4 do
		if F[i] then 
			F[i]:SetRotation(Quaternion(0.000, -0.999, 0.000, 0.050))
			if i==3 then
				F[i]:SetSkin(1)
			else
				F[i]:SetRandomSkin()
			end
			F[i]:SetForcedMaxTorque(500)
			F[i]:SetMaxSpeed(83.4)
			F[i]:SetCruisingSpeed(65)
		end
	end

	TActivate("RaceStartSpec_cs")

	local skin0 = GetEntityByName("Formula1"):GetSkin() 
	local skin1 = GetEntityByName("Formula2"):GetSkin() 
	local skin2 = GetEntityByName("Formula3"):GetSkin() 
	local skin3 = GetEntityByName("Formula4"):GetSkin() 

	SetVar("FormulaSkin0", tonumber(skin0))
	SetVar("FormulaSkin1", tonumber(skin1))
	SetVar("FormulaSkin2", tonumber(skin2))
	SetVar("FormulaSkin3", tonumber(skin3))

	local FVeh1 = CreateVehicleEx("UralRace00", "Formula1_1", CVector(getPos("RaceSpec_1L_loc"))+CVector(0,1,0), 1100)
	if FVeh1 then
		FVeh1:SetRotation(Quaternion(0.014, -0.011, -0.010, 1.000))
	end

	local FVeh2 = CreateVehicleEx("UralRace01", "Formula2_1", CVector(getPos("RaceSpec_1M_loc"))+CVector(0,1,0), 1100)
	if FVeh2 then
		FVeh2:SetRotation(Quaternion(0.014, -0.011, -0.010, 1.000))
	end

	local FVeh3 = CreateVehicleEx("UralMansurRace", "Formula3_1", CVector(getPos("RaceSpec_1R_loc"))+CVector(0,1,0), 1100)
	if FVeh3 then
		FVeh3:SetRotation(Quaternion(0.014, -0.011, -0.010, 1.000))
	end

	local FVeh4 = CreateVehicleEx("UralRace00", "Formula4_1", CVector(getPos("RaceSpec_1_1M_loc"))+CVector(0,1,0), 1100)
	if FVeh4 then
		FVeh4:SetRotation(Quaternion(0.014, -0.011, -0.010, 1.000))
	end
end

function RaceCutsceneCams()
	local winnum = GetVar("WinningNumber").AsInt
	local skin0 = GetVar("FormulaSkin0").AsInt
	local skin1 = GetVar("FormulaSkin1").AsInt
	local skin2 = GetVar("FormulaSkin2").AsInt
	local skin3 = GetVar("FormulaSkin3").AsInt

	local FVeh1 = GetEntityByName("Formula1")
	local FVeh1ID = FVeh1:GetId()

	local FVeh2 = GetEntityByName("Formula2")
	local FVeh2ID = FVeh2:GetId()

	local FVeh3 = GetEntityByName("Formula3")
	local FVeh3ID = FVeh3:GetId()

	local FVeh4 = GetEntityByName("Formula4")
    local FVeh4ID = FVeh4:GetId()

	local FVeh4_1 = GetEntityByName("Formula4_1")
	local FVeh4_1ID = FVeh4_1:GetId()

	if winnum == 1 then		
		Fly("RaceStart_cam04", CINEMATIC_AIM_TO_ID, FVeh1ID, 3, 1, 0 )
		Fly("RaceStart_cam01", CINEMATIC_AIM_TO_ID, FVeh2ID, 3, 0, 0 )
		Fly("RaceStart_cam02", CINEMATIC_AIM_TO_ID, FVeh3ID, 3, 0, 0 )
		Fly("RaceStart_cam03", CINEMATIC_AIM_TO_ID, FVeh4ID, 3, 0, 0 )
	elseif winnum == 2 then
		Fly("RaceStart_cam01", CINEMATIC_AIM_TO_ID, FVeh1ID, 3, 1, 0 )
		Fly("RaceStart_cam04", CINEMATIC_AIM_TO_ID, FVeh2ID, 3, 0, 0 )
		Fly("RaceStart_cam02", CINEMATIC_AIM_TO_ID, FVeh3ID, 3, 0, 0 )
		Fly("RaceStart_cam03", CINEMATIC_AIM_TO_ID, FVeh4ID, 3, 0, 0 )
	elseif winnum == 3 then
		Fly("RaceStart_cam01", CINEMATIC_AIM_TO_ID, FVeh1ID, 3, 1, 0 )
		Fly("RaceStart_cam02", CINEMATIC_AIM_TO_ID, FVeh2ID, 3, 0, 0 )
		Fly("RaceStart_cam04", CINEMATIC_AIM_TO_ID, FVeh3ID, 3, 0, 0 )
		Fly("RaceStart_cam03", CINEMATIC_AIM_TO_ID, FVeh4ID, 3, 0, 0 )
	elseif winnum == 4 then
		Fly("RaceStart_cam01", CINEMATIC_AIM_TO_ID, FVeh1ID, 3, 1, 0 )
		Fly("RaceStart_cam03", CINEMATIC_AIM_TO_ID, FVeh2ID, 3, 0, 0 )
		Fly("RaceStart_cam02", CINEMATIC_AIM_TO_ID, FVeh3ID, 3, 0, 0 )
		Fly("RaceStart_cam04", CINEMATIC_AIM_TO_ID, FVeh4ID, 3, 0, 0 )
	end

	Fly("RaceSpec_cam01", CINEMATIC_NO_AIM, nil, 3, 0, 0 )
	Fly("RaceSpec_cam02", CINEMATIC_AIM_TO_ID, FVeh4_1ID, 8.5, 0, 0 )
    Fly("RaceSpec_cam03", CINEMATIC_NO_AIM, nil, 3, 0, 0 )
	Fly("RaceSpec_cam04", CINEMATIC_NO_AIM, nil, 8, 0, 0 )
	Fly("RaceSpec_cam05", CINEMATIC_NO_AIM, nil, 8, 0, 0 )

	if winnum == 1 then		
		Fly("RaceSpec_cam06", CINEMATIC_AIM_TO_ID, FVeh1ID, 13, 0, 1 )
	elseif winnum == 2 then
		Fly("RaceSpec_cam06", CINEMATIC_AIM_TO_ID, FVeh2ID, 13, 0, 1 )
	elseif winnum == 3 then
		Fly("RaceSpec_cam06", CINEMATIC_AIM_TO_ID, FVeh3ID, 13, 0, 1 )
	elseif winnum == 4 then
		Fly("RaceSpec_cam06", CINEMATIC_AIM_TO_ID, FVeh4ID, 13, 0, 1 )
	end

	StartCinematic()

	local FVeh1 = getObj("Formula1_1")
	if FVeh1 then
		FVeh1:SetSkin(skin0)
	end

	local FVeh2 = getObj("Formula2_1")
	if FVeh2 then
		FVeh2:SetSkin(skin1)
	end

	local FVeh3 = getObj("Formula3_1")
	if FVeh3 then
		FVeh3:SetSkin(skin2)
	end

	local FVeh4 = getObj("Formula4_1")
	if FVeh4 then
		FVeh4:SetSkin(skin3)
	end
end

function CreateGadadAttackers()
	CreateTeam("GadadDebyli",1062,CVector(5525.333, 260.348, 6889.820),{"TankBez","UralShot","BelazShot1","TankBez","TankBez"},CVector(5587.709, 260.537, 6833.567), nil)

	local veh0 = getObj("GadadDebyli_vehicle_0")
	if veh0 then
		veh0:SetGamePositionOnGround(CVector(getPos("GadadMadSpawn1")))
		veh0:SetRotation(Quaternion(0.004, 0.903, -0.001, 0.431))
	end

	local veh1 = getObj("GadadDebyli_vehicle_1")
	if veh1 then
		veh1:SetGamePositionOnGround(CVector(getPos("GadadMadSpawn2")))
		veh1:SetRotation(Quaternion(0.003, 0.397, -0.003, 0.918))
		veh1:SetRandomSkin()
	end

	local veh2 = getObj("GadadDebyli_vehicle_2")
	if veh2 then
		veh2:SetGamePositionOnGround(CVector(getPos("GadadMadSpawn3")))
		veh2:SetRotation(Quaternion(0.003, 0.190, 0.006, 0.982))
		veh2:SetRandomSkin()
	end

	local veh3 = getObj("GadadDebyli_vehicle_3")
	if veh3 then
		veh3:SetGamePositionOnGround(CVector(getPos("GadadMadSpawn4")))
		veh3:SetRotation(Quaternion(0.003, 0.997, -0.003, -0.075))
	end

	local veh4 = getObj("GadadDebyli_vehicle_4")
	if veh4 then
		veh4:SetGamePositionOnGround(CVector(getPos("GadadMadSpawn5")))
		veh4:SetRotation(Quaternion(0.009, 0.986, -0.004, 0.167))
	end
end

function CreateHarakatDefenders()
	CreateTeam("GadadDefenders",1091,CVector(5480.567, 265.695, 6978.483),{"Hunter01","BelazShot","UralShot"},CVector(5436.812, 255.650, 7026.962), nil)

	local veh0 = getObj("GadadDefenders_vehicle_0")
	if veh0 then
		veh0:SetGamePositionOnGround(CVector(getPos("HaraDefSpawn1")))
		veh0:SetRotation(Quaternion(-0.014, -0.861, 0.003, 0.508))
		veh0:SetRandomSkin()
	end

	local veh1 = getObj("GadadDefenders_vehicle_1")
	if veh1 then
		veh1:SetGamePositionOnGround(CVector(getPos("HaraDefSpawn2")))
		veh1:SetRotation(Quaternion(0.007, -0.142, -0.013, 0.990))
		veh1:SetRandomSkin()
	end

	local veh2 = getObj("GadadDefenders_vehicle_2")
	if veh2 then
		veh2:SetGamePositionOnGround(CVector(getPos("HaraDefSpawn3")))
		veh2:SetRotation(Quaternion(0.003, -0.005, 0.003, 1.000))
		veh2:SetRandomSkin()
	end
end

function CreateAlfaranDefenders()
	CreateTeam("GadadAlfaDefenders",1092,CVector(5504.042, 274.573, 6686.349),{"BelazShot","Hunter01"},CVector(5479.855, 264.233, 6680.261), nil)

	local veh0 = getObj("GadadAlfaDefenders_vehicle_0")
	if veh0 then
		veh0:SetGamePositionOnGround(CVector(getPos("AlfaDefSpawn1")))
		veh0:SetRotation(Quaternion(0.000, 0.994, 0.007, -0.111))
		veh0:SetRandomSkin()
	end

	local veh1 = getObj("GadadAlfaDefenders_vehicle_1")
	if veh1 then
		veh1:SetGamePositionOnGround(CVector(getPos("HaraDefSpawn2")))
		veh1:SetRotation(Quaternion(0.003, 0.334, 0.002, 0.943))
		veh1:SetRandomSkin()
	end
end

function CreateTheKefAttackers()
    CreateTeam("BanditsTeam",1024,CVector(6125.474, 254.088, 5072.637),{"UralShot1", "UralShot1", "UralShot", "UralShot1"},CVector(6173.737, 255.168, 5089.908), nil)

    local veh0 = getObj("BanditsTeam_vehicle_0")
    if veh0 then
        veh0:SetGamePositionOnGround(CVector(getPos("BanditKefSpawn1")))
		veh0:SetRotation(Quaternion(-0.004, 0.572, 0.002, 0.821))
		veh0:SetRandomSkin()
    end

    local veh1 = getObj("BanditsTeam_vehicle_1")
    if veh1 then
        veh1:SetGamePositionOnGround(CVector(getPos("BanditKefSpawn2")))
		veh1:SetRotation(Quaternion(0.008, 0.385, -0.003, 0.923))
		veh1:SetRandomSkin()
    end

    local veh2 = getObj("BanditsTeam_vehicle_2")
    if veh2 then
        veh2:SetGamePositionOnGround(CVector(getPos("BanditKefSpawn3")))
		veh2:SetRotation(Quaternion(-0.000, 0.385, -0.001, 0.923))
		veh2:SetRandomSkin()
    end

	local veh3 = getObj("BanditsTeam_vehicle_3")
    if veh3 then
        veh3:SetGamePositionOnGround(CVector(getPos("BanditKefSpawn4")))
		veh3:SetRotation(Quaternion(-0.000, 0.385, -0.001, 0.923))
		veh3:SetRandomSkin()
    end
end

function CreateMansurAndParents()
	CreateVehicleEx("UralMansur", "MansurCar", CVector(5432.852, 251.100, 7027.151), 1090)
	CreateVehicleEx("UralShotParents", "ParentsCar", CVector(5466.223, 251.064, 7012.226), 1090)

	local Mansur = getObj("MansurCar")
	if Mansur then
		Mansur:SetRotation(Quaternion(0.002, -0.932, -0.003, -0.362))
		Mansur:SetSkin(1)
	end

	local Parents = getObj("ParentsCar")
	if Parents then
		Parents:SetRotation(Quaternion(0.001, 0.649, -0.003, -0.761))
		Parents:SetSkin(3)
	end
end

function CinematicMessageMSWP()
	AddCinematicMessage( 120, 0.5 )
	AddCinematicMessage( 121, 0.2 )
	AddCinematicMessage( 122, 0.2 )
	AddCinematicMessage( 123, 0.2 )
	AddCinematicMessage( 124, 0.2 )
	AddCinematicMessage( 125, 0.2 )
	AddCinematicMessage( 126, 0.2 )
	AddCinematicMessage( 127, 0.2 )
	AddCinematicMessage( 128, 0.2 )
	AddCinematicMessage( 129, 0.2 )
	AddCinematicMessage( 130, 0.2 )
	AddCinematicMessage( 131, 0.2 )
	AddCinematicMessage( 132, 0.2 )
	AddCinematicMessage( 133, 0.2 )
	AddCinematicMessage( 134, 0.2 )
end

function CinematicMessageMSWPCam01()
	AddCinematicMessage( 135, 0.2 )
	AddCinematicMessage( 136, 0.2 )
	AddCinematicMessage( 137, 0.2 )
	AddCinematicMessage( 138, 0.2 )
	AddCinematicMessage( 139, 0.2 )
	AddCinematicMessage( 140, 0.2 )
end

function CreateBuharaAndAivanJrAttackers()
	local attm = CreateTeam("BuharaAttack", 1025, CVector(1706.407, 231.845, 6608.407),{"UralShot1","UralShot1","Ural01","Cruiser01"}, CVector(1587.880, 229.640, 6611.723), nil, Quaternion(-0.052, 0.996, 0.024, -0.061))
		if attm then
			AddVehicleGunsWithRandomAffix( attm:GetVehicle(0), "kpvt01", 3, 10)
			attm:GetVehicle(1):AddItemsToRepository("add_stability_and_speed", 1)
			AddVehicleGunsWithRandomAffix( attm:GetVehicle(2), "hunterSideGun",  3, 8+random(2))
			AddVehicleGunsWithRandomAffix( attm:GetVehicle(3), "vulcan01", 3, 10)
		end

	local veh0 = getObj("BuharaAttack_vehicle_0")
		if veh0 then
			veh0:SetGamePositionOnGround(CVector(getPos("BuharaAttackersSpawn0_loc")))
			veh0:SetRotation(Quaternion(-0.052, 0.996, 0.024, -0.061))
			veh0:SetRandomSkin()
		end

	local veh1 = getObj("BuharaAttack_vehicle_1")
		if veh1 then
			veh1:SetGamePositionOnGround(CVector(getPos("BuharaAttackersSpawn1_loc")))
			veh1:SetRotation(Quaternion(-0.052, 0.996, 0.024, -0.061))
			veh1:SetRandomSkin()
		end

	local veh2 = getObj("BuharaAttack_vehicle_2")
		if veh2 then
			veh2:SetGamePositionOnGround(CVector(getPos("BuharaAttackersSpawn2_loc")))
			veh2:SetRotation(Quaternion(-0.052, 0.996, 0.024, -0.061))
			veh2:SetRandomSkin()
		end

	local veh3 = getObj("BuharaAttack_vehicle_3")
		if veh3 then
			veh3:SetGamePositionOnGround(CVector(getPos("BuharaAttackersSpawn3_loc")))
			veh3:SetRotation(Quaternion(-0.052, 0.996, 0.024, -0.061))
			veh3:SetRandomSkin()
		end
end

function CreateBuharaAndAivanJr()
	CreateTeam("Buharers",1026, CVector(getPos("BuhSpawn_loc")),{"DemoUral1","DemoMolokovoz1"})
	CreateTeam("AivanJr", 1095, CVector(getPos("BuhSpawn_loc")),{"BelazShot1"})

	local buhara0 = getObj("Buharers_vehicle_0")
	if buhara0 then
		buhara0:SetGamePositionOnGround(CVector(getPos("BuhDefSpawn0_loc")))
		buhara0:SetRotation(Quaternion(-0.022, 0.083, -0.023, 0.996))
		buhara0:SetSkin(0)
	end

	local buhara1 = getObj("Buharers_vehicle_1")
	if buhara1 then
		buhara1:SetGamePositionOnGround(CVector(getPos("BuhDefSpawn1_loc")))
		buhara1:SetRotation(Quaternion(-0.022, 0.083, -0.023, 0.996))
		buhara1:SetSkin(0)
	end

	local aivanjr = getObj("AivanJr_vehicle_0")
	if aivanjr then
		aivanjr:SetGamePositionOnGround(CVector(getPos("AivanJrDefSpawn_loc")))
		aivanjr:SetRotation(Quaternion(-0.022, 0.083, -0.023, 0.996))
		aivanjr:SetSkin(3)
	end
end

function BuharaEvacutedCreateCars()
	local PlVeh = GetPlayerVehicle()
	if PlVeh then
		PlVeh:SetGamePositionOnGround(CVector(getPos("BuharaEvacuated_cs_Player_loc")))
		PlVeh:SetRotation(Quaternion(0.017, -0.297, 0.018, 0.954))
	end

	local vehB1 = CreateVehicleEx("DemoUral1","Buhara_0",CVector(getPos("BuhSpawn_loc")), 1026)
	if vehB1 then
		vehB1:SetGamePositionOnGround(CVector(getPos("BuharaEvacuated_cs_Buhara0_loc")))
		vehB1:SetRotation(Quaternion(0.020, 0.672, -0.008, 0.740))
		vehB1:SetSkin(0)
	end

	local veh2 = CreateVehicleEx("DemoMolokovoz1","Buhara_1",CVector(getPos("BuhSpawn_loc"))+CVector(7, 0, 7), 1026)
	if veh2 then
		veh2:SetGamePositionOnGround(CVector(getPos("BuharaEvacuated_cs_Buhara1_loc")))
		veh2:SetRotation(Quaternion(0.010, 0.880, 0.003, 0.475))
		veh2:SetSkin(0)
	end

	local ManCarCreate = CreateVehicleEx("UralMansur", "MansurCarCS", CVector(getPos("BuharaEvacuated_cs_Mansur_loc")), 1090)
	if ManCarCreate then
		ManCarCreate:SetRotation(Quaternion(0.023, -0.814, -0.019, 0.580))
		ManCarCreate:SetSkin(1)
	end

	local AivenCreate = CreateVehicleEx("BelazShot1", "MansurCarCS", CVector(getPos("BuharaEvacuated_cs_AivenJr_loc")), 1095)
	if AivenCreate then
		AivenCreate:SetRotation(Quaternion(-0.006, 0.922, 0.008, -0.387))
		AivenCreate:SetSkin(3)
	end
end

function CreateMadmanZarmek()
	CreateTeam("Bezumtsi",1062,CVector(2572.051, 267.215, 3917.664),{"TankBez","UralShot1","TankBez"},CVector(2594.501, 262.854, 3906.361), nil)

	local veh0 = getObj("Bezumtsi_vehicle_0")
	if veh0 then
		veh0:SetGamePositionOnGround(CVector(getPos("MadManSpawn_firstarrive0_loc")))
		veh0:SetRotation(Quaternion(0.002, -0.665, -0.001, 0.746))
	end

	local veh1 = getObj("Bezumtsi_vehicle_1")
	if veh1 then
		veh1:SetGamePositionOnGround(CVector(getPos("MadManSpawn_firstarrive1_loc")))
		veh1:SetRotation(Quaternion(0.002, -0.665, -0.001, 0.746))
		veh1:SetRandomSkin()
	end

	local veh2 = getObj("Bezumtsi_vehicle_2")
	if veh2 then
		veh2:SetGamePositionOnGround(CVector(getPos("MadManSpawn_firstarrive2_loc")))
		veh2:SetRotation(Quaternion(0.002, -0.665, -0.001, 0.746))
	end
end

function CreateMansurandAivenDefenders()
	CreateTeam("ManCar", 1090 ,CVector(2572.051, 267.215, 3917.664),{"UralMansur"},CVector(2594.501, 262.854, 3906.361), nil)
	CreateTeam("AivenCar", 1095 ,CVector(2572.051, 267.215, 3917.664),{"BelazShot1"},CVector(2594.501, 262.854, 3906.361), nil)

	local veh0 = getObj("ManCar_vehicle_0")
	if veh0 then
		veh0:SetGamePositionOnGround(CVector(getPos("MansurDefender_loc")))
		veh0:SetRotation(Quaternion(0.029, 0.831, 0.014, 0.555))
		veh0:SetSkin(1)
	end

	local veh1 = getObj("AivenCar_vehicle_0")
	if veh1 then
		veh1:SetGamePositionOnGround(CVector(getPos("AivenDefender_loc")))
		veh1:SetRotation(Quaternion(0.003, 0.864, 0.000, 0.504))
		veh1:SetSkin(3)
	end

	SetTolerance(1090, 1095, RS_ALLY)
	SetTolerance(1090, 1100, RS_ALLY)
	SetTolerance(1095, 1100, RS_ALLY)
	SetTolerance(1100, 1062, RS_ENEMY)
	SetTolerance(1090, 1062, RS_ENEMY)
	SetTolerance(1095, 1062, RS_ENEMY)
end

function CreateMansurandAivenAttack()
	CreateTeam("ManCar", 1090 ,CVector(2572.051, 267.215, 3917.664),{"UralMansur"},CVector(2594.501, 262.854, 3906.361), nil)
	CreateTeam("AivenCar", 1095 ,CVector(2572.051, 267.215, 3917.664),{"BelazShot1"},CVector(2594.501, 262.854, 3906.361), nil)

	local veh0 = getObj("ManCar_vehicle_0")
	if veh0 then
		veh0:SetGamePositionOnGround(CVector(getPos("MansurAttacktoBase_startfight_loc")))
		veh0:SetRotation(Quaternion(-0.000, 0.669, -0.000, 0.744))
		veh0:SetSkin(1)
	end

	local veh1 = getObj("AivenCar_vehicle_0")
	if veh1 then
		veh1:SetGamePositionOnGround(CVector(getPos("AivenAttacktoBase_startfight_loc")))
		veh1:SetRotation(Quaternion(-0.000, 0.669, -0.000, 0.744))
		veh1:SetSkin(3)
	end

	SetTolerance(1090, 1095, RS_ALLY)
	SetTolerance(1090, 1100, RS_ALLY)
	SetTolerance(1095, 1100, RS_ALLY)
	SetTolerance(1100, 1062, RS_ENEMY)
	SetTolerance(1090, 1062, RS_ENEMY)
	SetTolerance(1095, 1062, RS_ENEMY)
end

function MadmanCutsceneSpawn()
	local Madman1 = CreateVehicleEx("UralShot","MadmanInvaders0",CVector(getPos("Madman_invasion_loc_0")), 1062)
	local Madman2 = CreateVehicleEx("BelazShot1","MadmanInvaders1",CVector(getPos("Madman_invasion_loc_1")), 1062)
	local Madman3 = CreateVehicleEx("UralShot","MadmanInvaders2",CVector(getPos("Madman_invasion_loc_2")), 1062)
	local Madman4 = CreateVehicleEx("BelazShot1","MadmanInvaders3",CVector(getPos("Madman_invasion_loc_3")), 1062)

	for i=0,3 do
		local MadmanCar = getObj("MadmanInvaders"..i)
		if MadmanCar then
			MadmanCar:SetRandomSkin()
			MadmanCar:SetRotation(Quaternion(-0.049, -0.545, -0.008, 0.837))
			MadmanCar:SetExternalPathByName("Madman_Invasion_Path")
			MadmanCar:SetCruisingSpeed(25)
			MadmanCar:SetMaxSpeed(25)
			MadmanCar:setGodMode(1)
		end
	end	

	local Askin0 = GetEntityByName("MadmanInvaders0"):GetSkin()
	local Askin1 = GetEntityByName("MadmanInvaders1"):GetSkin() 
	local Askin2 = GetEntityByName("MadmanInvaders2"):GetSkin() 
	local Askin3 = GetEntityByName("MadmanInvaders3"):GetSkin() 

	SetVar("GadadASkin1", tonumber(Askin0))
	SetVar("GadadASkin2", tonumber(Askin1))
	SetVar("GadadASkin3", tonumber(Askin2))
	SetVar("GadadASkin4", tonumber(Askin3))
end

function MadmanCutsceneNeftegradSpawn()
	local Attackers = CreateTeam("Neftegrad_attackers",1062,CVector(getPos("BuharAttack_loc")),{"UralShot","TankBez","UralShot"},CVector(getPos("BAEndPoint_loc")), nil, Quaternion(-0.037, 0.992, 0.016, 0.117))
	local Defenders = CreateTeam("Neftegrad_defend",1060,CVector(getPos("BuharAttack_loc")),{"UralShot","DemoMolokovoz1"},CVector(getPos("BAEndPoint_loc")), nil, Quaternion(-0.037, 0.992, 0.016, 0.117))

	for i=0,1 do
		local DVehs = getObj("Neftegrad_defend_vehicle_"..i)
		if DVehs then
			DVehs:SetGamePositionOnGround(getPos("Neftegrad_defend_loc_"..i))
			DVehs:SetRandomSkin()
			DVehs:SetRotation(Quaternion(-0.000, -0.181, -0.005, 0.984))
			DVehs:setGodMode(1)
		end
	end

	for i=0,2 do
		local AVehs = getObj("Neftegrad_attackers_vehicle_"..i)
		if AVehs then
			AVehs:SetGamePositionOnGround(getPos("Neftegrad_attack_loc_"..i))
			AVehs:SetRandomSkin()
			AVehs:SetRotation(Quaternion(0.014, -0.996, -0.056, 0.066))
			AVehs:setGodMode(1)
		end
	end

	local Dskin0 = GetEntityByName("Neftegrad_defend_vehicle_0"):GetSkin()
	local Dskin1 = GetEntityByName("Neftegrad_defend_vehicle_1"):GetSkin() 

	local Askin0 = GetEntityByName("Neftegrad_attackers_vehicle_0"):GetSkin()
	local Askin1 = GetEntityByName("Neftegrad_attackers_vehicle_1"):GetSkin() 
	local Askin2 = GetEntityByName("Neftegrad_attackers_vehicle_2"):GetSkin() 

	SetVar("NeftegradDSkin0", tonumber(Dskin0))
	SetVar("NeftegradDSkin1", tonumber(Dskin1))

	SetVar("NeftegradASkin1", tonumber(Askin0))
	SetVar("NeftegradASkin2", tonumber(Askin1))
	SetVar("NeftegradASkin3", tonumber(Askin2))
end

function MadmanCutsceneNeftegradRemove()
	for i=0,1 do
		local DVehs = getObj("Neftegrad_defend_vehicle_"..i)
		if DVehs then
			DVehs:Remove()
		end
	end

	for i=0,2 do
		local AVehs = getObj("Neftegrad_attackers_vehicle_"..i)
		if AVehs then
			AVehs:Remove()
		end
	end
end

function MadmanCutsceneKefSpawn()
	local Attackers = CreateTeam("Kef_Attack",1062,CVector(getPos("BuharAttack_loc")),{"UralShot","TankBez","UralShot","BelazShot1","TankBez"},CVector(getPos("BAEndPoint_loc")), nil, Quaternion(-0.037, 0.992, 0.016, 0.117))
	local Defenders = CreateTeam("Kef_Defend",1025,CVector(getPos("BuharAttack_loc")),{"BelazShot1","UralShot","PlayerStartCar","Hunter01"},CVector(getPos("BAEndPoint_loc")), nil, Quaternion(-0.037, 0.992, 0.016, 0.117))

	for i=0,4 do
		local AVehs = getObj("Kef_Attack_vehicle_"..i)
		if AVehs then
			AVehs:SetGamePositionOnGround(getPos("Kef_Attack_loc_"..i))
			AVehs:setGodMode(1)
			AVehs:SetRandomSkin()
			AVehs:SetRotation(Quaternion(-0.001, 0.417, 0.000, 0.909))
		end
	end

	for i=0,3 do
		local DVehs = getObj("Kef_Defend_vehicle_"..i)
		if DVehs then
			DVehs:setGodMode(1)
			DVehs:SetGamePositionOnGround(getPos("Kef_Defend_loc_"..i))
			if i==2 then
				local PSkin = GetVar("PlayerMilkSkin").AsInt
				DVehs:SetSkin(PSkin)
			else
				DVehs:SetRandomSkin()
			end
			DVehs:SetRotation(Quaternion(0.004, 0.909, -0.001, -0.417))
		end
	end

	local Dskin0 = GetEntityByName("Kef_Defend_vehicle_0"):GetSkin()
	local Dskin1 = GetEntityByName("Kef_Defend_vehicle_1"):GetSkin() 
	local Dskin3 = GetEntityByName("Kef_Defend_vehicle_3"):GetSkin() 

	local Askin0 = GetEntityByName("Kef_Attack_vehicle_0"):GetSkin()
	local Askin1 = GetEntityByName("Kef_Attack_vehicle_1"):GetSkin() 
	local Askin2 = GetEntityByName("Kef_Attack_vehicle_2"):GetSkin()
	local Askin3 = GetEntityByName("Kef_Attack_vehicle_3"):GetSkin() 
	local Askin4 = GetEntityByName("Kef_Attack_vehicle_4"):GetSkin() 

	SetVar("KefDSkin0", tonumber(Dskin0))
	SetVar("KefDSkin1", tonumber(Dskin1))
	SetVar("KefDSkin3", tonumber(Dskin3))

	SetVar("KefASkin0", tonumber(Askin0))
	SetVar("KefASkin1", tonumber(Askin1))
	SetVar("KefASkin2", tonumber(Askin2))
	SetVar("KefASkin3", tonumber(Askin3))
	SetVar("KefASkin3", tonumber(Askin4))
end

function MadmanCutsceneKefRemove()
	for i=0,4 do
		local AVehs = getObj("Kef_Attack_vehicle_"..i)
		if AVehs then
			AVehs:Remove()
		end
	end

	for i=0,3 do
		local DVehs = getObj("Kef_Defend_vehicle_"..i)
		if DVehs then
			DVehs:Remove()
		end
	end
end

function MadmanCutsceneAlihamSpawn()
	local Attackers = CreateTeam("Aliham_Attack",1062,CVector(getPos("BuharAttack_loc")),{"UralShot","TankBez","UralShot","Hunter01"},CVector(getPos("BAEndPoint_loc")), nil, Quaternion(-0.037, 0.992, 0.016, 0.117))
	local Defenders = CreateTeam("Aliham_Defend",1060,CVector(getPos("BuharAttack_loc")),{"UralShot","DemoMolokovoz1","Hunter01"},CVector(getPos("BAEndPoint_loc")), nil, Quaternion(-0.037, 0.992, 0.016, 0.117))

	for i=0,3 do
		local AVehs = getObj("Aliham_Attack_vehicle_"..i)
		if AVehs then
			AVehs:SetGamePositionOnGround(getPos("Aliham_attack_loc_"..i))
			AVehs:SetRandomSkin()
			AVehs:SetRotation(Quaternion(0.010, 0.810, -0.002, -0.586))
			AVehs:setGodMode(1)
		end
	end

	for i=0,2 do
		local DVehs = getObj("Aliham_Defend_vehicle_"..i)
		if DVehs then
			DVehs:SetGamePositionOnGround(getPos("Aliham_defend_loc_"..i))
			DVehs:SetRandomSkin()
			DVehs:SetRotation(Quaternion(-0.001, 0.483, 0.001, 0.875))
			DVehs:setGodMode(1)
		end
	end

	local Dskin0 = GetEntityByName("Aliham_Defend_vehicle_0"):GetSkin()
	local Dskin1 = GetEntityByName("Aliham_Defend_vehicle_1"):GetSkin()
	local Dskin2 = GetEntityByName("Aliham_Defend_vehicle_2"):GetSkin()

	local Askin0 = GetEntityByName("Aliham_Attack_vehicle_0"):GetSkin()
	local Askin1 = GetEntityByName("Aliham_Attack_vehicle_1"):GetSkin()
	local Askin2 = GetEntityByName("Aliham_Attack_vehicle_2"):GetSkin()
	local Askin3 = GetEntityByName("Aliham_Attack_vehicle_3"):GetSkin()

	SetVar("AlihamDskin0", tonumber(Dskin0))
	SetVar("AlihamDskin1", tonumber(Dskin1))
	SetVar("AlihamDskin2", tonumber(Dskin2))

	SetVar("AlihamAskin0", tonumber(Askin0))
	SetVar("AlihamAskin1", tonumber(Askin1))
	SetVar("AlihamAskin2", tonumber(Askin2))
	SetVar("AlihamAskin3", tonumber(Askin3))
end

function MadmanCutsceneAlihamRemove()
	for i=0,3 do
		local AVehs = getObj("Aliham_Attack_vehicle_"..i)
		if AVehs then
			AVehs:Remove()
		end
	end

	for i=0,2 do
		local DVehs = getObj("Aliham_Defend_vehicle_"..i)
		if DVehs then
			DVehs:Remove()
		end
	end
end

function SpawnBotsAliham()
	local Madman1 = CreateVehicleEx("UralShot","MadmanInvadersAliham0",CVector(getPos("Aliham_attack_loc_0")), 1062)
	local Madman2 = CreateVehicleEx("TankBez","MadmanInvadersAliham1",CVector(getPos("Aliham_attack_loc_1")), 1062)
	local Madman3 = CreateVehicleEx("UralShot","MadmanInvadersAliham2",CVector(getPos("Aliham_attack_loc_2")), 1062)
	local Madman4 = CreateVehicleEx("Hunter01","MadmanInvadersAliham3",CVector(getPos("Aliham_attack_loc_3")), 1062)

	local Defender1 = CreateVehicleEx("UralShot","MadmanDefendAliham0",CVector(getPos("Aliham_defend_loc_0")), 1060)
	local Defender2 = CreateVehicleEx("DemoMolokovoz1","MadmanDefendAliham1",CVector(getPos("Aliham_defend_loc_1")), 1060)
	local Defender3 = CreateVehicleEx("Hunter01","MadmanDefendAliham2",CVector(getPos("Aliham_defend_loc_2")), 1060)

	local Dskin0 = GetVar("AlihamDskin0").AsInt
	local Dskin1 = GetVar("AlihamDskin1").AsInt
	local Dskin2 = GetVar("AlihamDskin2").AsInt

	local Askin0 = GetVar("AlihamAskin0").AsInt
	local Askin1 = GetVar("AlihamAskin1").AsInt
	local Askin2 = GetVar("AlihamAskin2").AsInt
	local Askin3 = GetVar("AlihamAskin3").AsInt

	for i=0,2 do
		local DefendCar = getObj("MadmanDefendAliham"..i)
		if DefendCar then
			if i==0 then
				DefendCar:SetSkin(Dskin0)
			elseif i==1 then
				DefendCar:SetSkin(Dskin1)
			elseif i==2 then
				DefendCar:SetSkin(Dskin2)
			end
			DefendCar:SetRotation(Quaternion(-0.001, 0.483, 0.001, 0.875))
			DefendCar:setGodMode(1)
		end
	end	

	for i=0,3 do
		local MadmanCar = getObj("MadmanInvadersAliham"..i)
		if MadmanCar then
			if i==0 then
				MadmanCar:SetSkin(Askin0)
			elseif i==1 then
				MadmanCar:SetSkin(Askin1)
			elseif i==2 then
				MadmanCar:SetSkin(Askin2)
			elseif i==3 then
				MadmanCar:SetSkin(Askin3)
			end
			MadmanCar:SetRotation(Quaternion(0.010, 0.810, -0.002, -0.586))
			MadmanCar:setGodMode(1)
		end
	end	
end

function DespawnBotsSpawnFightersAliham()
	local Attackers = CreateTeam("MadmanInvadersAliham",1062,CVector(getPos("BuharAttack_loc")),{"UralShot","TankBez","UralShot","Hunter01"},CVector(getPos("BAEndPoint_loc")), nil, Quaternion(-0.037, 0.992, 0.016, 0.117))
	local Defenders = CreateTeam("MadmanDefendAliham",1060,CVector(getPos("BuharAttack_loc")),{"UralShot","DemoMolokovoz1","Hunter01"},CVector(getPos("BAEndPoint_loc")), nil, Quaternion(-0.037, 0.992, 0.016, 0.117))

	local Dskin0 = GetVar("AlihamDskin0").AsInt
	local Dskin1 = GetVar("AlihamDskin1").AsInt
	local Dskin2 = GetVar("AlihamDskin2").AsInt

	local Askin0 = GetVar("AlihamAskin0").AsInt
	local Askin1 = GetVar("AlihamAskin1").AsInt
	local Askin2 = GetVar("AlihamAskin2").AsInt
	local Askin3 = GetVar("AlihamAskin3").AsInt

	for i=0,2 do
		local dBots = getObj("MadmanDefendAliham"..i)
		if dBots then
			dBots:Remove()
		end

		local DefendCar = getObj("MadmanDefendAliham_vehicle_"..i)
		if DefendCar then
			if i==0 then
				DefendCar:SetSkin(Dskin0)
			elseif i==1 then
				DefendCar:SetSkin(Dskin1)
			elseif i==2 then
				DefendCar:SetSkin(Dskin2)
			end
			DefendCar:SetRotation(Quaternion(-0.001, 0.483, 0.001, 0.875))
			DefendCar:SetGamePositionOnGround(getPos("Aliham_defend_loc_"..i))
		end
	end	

	for i=0,3 do
		local ABots = getObj("MadmanInvadersAliham"..i)
		if ABots then
			ABots:Remove()
		end

		local MadmanCar = getObj("MadmanInvadersAliham_vehicle_"..i)
		if MadmanCar then
			if i==0 then
				MadmanCar:SetSkin(Askin0)
			elseif i==1 then
				MadmanCar:SetSkin(Askin1)
			elseif i==2 then
				MadmanCar:SetSkin(Askin2)
			elseif i==3 then
				MadmanCar:SetSkin(Askin3)
			end
			MadmanCar:SetRotation(Quaternion(0.010, 0.810, -0.002, -0.586))
			MadmanCar:SetGamePositionOnGround(getPos("Aliham_attack_loc_"..i))
		end
	end	
end

function GadadBotSpawn()
	local Madman1 = CreateVehicleEx("UralShot","GMadmanInvaders0",CVector(getPos("Gadad_attack_loc_0")), 1062)
	local Madman2 = CreateVehicleEx("BelazShot1","GMadmanInvaders1",CVector(getPos("Gadad_attack_loc_1")), 1062)
	local Madman3 = CreateVehicleEx("UralShot","GMadmanInvaders2",CVector(getPos("Gadad_attack_loc_2")), 1062)
	local Madman4 = CreateVehicleEx("BelazShot1","GMadmanInvaders3",CVector(getPos("Gadad_attack_loc_3")), 1062)

	local skin0 = GetVar("GadadASkin1").AsInt
	local skin1 = GetVar("GadadASkin2").AsInt
	local skin2 = GetVar("GadadASkin3").AsInt
	local skin3 = GetVar("GadadASkin4").AsInt

	for i=0,3 do
		local A = getObj("GMadmanInvaders"..i)
		if A then
			A:setGodMode(1)
			A:SetRotation(Quaternion(-0.001, 0.145, 0.000, 0.989))
			if i==0 then
				A:SetSkin(skin0)
			elseif i==1 then
				A:SetSkin(skin1)
			elseif i==2 then
				A:SetSkin(skin2)
			elseif i==3 then
				A:SetSkin(skin3)
			end
		end
	end

	SetTolerance(1023, 1062, RS_NEUTRAL)
end

function DespawnBotsSpawnFightersGadad()
	local Attackers = CreateTeam("MadmanInvadersGadad",1062,CVector(getPos("BuharAttack_loc")),{"UralShot","BelazShot1","UralShot","BelazShot1"},CVector(getPos("BAEndPoint_loc")), nil, Quaternion(-0.037, 0.992, 0.016, 0.117))

	local Askin0 = GetVar("GadadASkin1").AsInt
	local Askin1 = GetVar("GadadASkin2").AsInt
	local Askin2 = GetVar("GadadASkin3").AsInt
	local Askin3 = GetVar("GadadASkin4").AsInt

	for i=0,3 do
		local ABots = getObj("GMadmanInvaders"..i)
		if ABots then
			ABots:Remove()
		end

		local MadmanCar = getObj("MadmanInvadersGadad_vehicle_"..i)
		if MadmanCar then
			if i==0 then
				MadmanCar:SetSkin(Askin0)
			elseif i==1 then
				MadmanCar:SetSkin(Askin1)
			elseif i==2 then
				MadmanCar:SetSkin(Askin2)
			elseif i==3 then
				MadmanCar:SetSkin(Askin3)
			end
			MadmanCar:SetRotation(Quaternion(-0.001, 0.145, 0.000, 0.989))
			MadmanCar:SetGamePositionOnGround(getPos("Gadad_attack_loc_"..i))
		end
	end	
end

function SpawnBotsKef()
	local A1 = CreateVehicleEx("UralShot","KMadmanInvaders0",CVector(getPos("Kef_Attack_loc_0")), 1062)
	local A2 = CreateVehicleEx("TankBez","KMadmanInvaders1",CVector(getPos("Kef_Attack_loc_1")), 1062)
	local A3 = CreateVehicleEx("UralShot","KMadmanInvaders2",CVector(getPos("Kef_Attack_loc_2")), 1062)
	local A4 = CreateVehicleEx("BelazShot1","KMadmanInvaders3",CVector(getPos("Kef_Attack_loc_3")), 1062)
	local A5 = CreateVehicleEx("TankBez","KMadmanInvaders4",CVector(getPos("Kef_Attack_loc_4")), 1062)

	local D1 = CreateVehicleEx("BelazShot1","KMadmanDefend0",CVector(getPos("Kef_Defend_loc_0")), 1025)
	local D2 = CreateVehicleEx("UralShot","KMadmanDefend1",CVector(getPos("Kef_Defend_loc_1")), 1025)
	local D3 = CreateVehicleEx("PlayerStartCar","KMadmanDefend2",CVector(getPos("Kef_Defend_loc_2")), 1025)
	local D4 = CreateVehicleEx("Hunter01","KMadmanDefend3",CVector(getPos("Kef_Defend_loc_3")), 1025)

	local Dskin0 = GetVar("KefDSkin0").AsInt
	local Dskin1 = GetVar("KefDSkin1").AsInt
	local Dskin2 = GetVar("PlayerMilkSkin").AsInt
	local Dskin3 = GetVar("KefDSkin3").AsInt

	local Askin0 = GetVar("KefASkin0").AsInt
	local Askin1 = GetVar("KefASkin1").AsInt
	local Askin2 = GetVar("KefASkin2").AsInt
	local Askin3 = GetVar("KefASkin3").AsInt
	local Askin4 = GetVar("KefASkin4").AsInt

	for i=0,4 do
		local AVehs = getObj("KMadmanInvaders"..i)
		if AVehs then
			AVehs:setGodMode(1)
			AVehs:SetRotation(Quaternion(-0.001, 0.417, 0.000, 0.909))
			if i==0 then
				AVehs:SetSkin(Askin0)
			elseif i==1 then
				AVehs:SetSkin(Askin1)
			elseif i==2 then
				AVehs:SetSkin(Askin2)
			elseif i==3 then
				AVehs:SetSkin(Askin3)
			elseif i==4 then
				AVehs:SetSkin(Askin4)
			end
		end
	end

	for i=0,3 do
		local DVehs = getObj("KMadmanDefend"..i)
		if DVehs then
			DVehs:setGodMode(1)
			if i==0 then
				DVehs:SetSkin(Dskin0)
			elseif i==1 then
				DVehs:SetSkin(Dskin1)
			elseif i==2 then
				DVehs:SetSkin(Dskin2)
			elseif i==3 then
				DVehs:SetSkin(Dskin3)
			end
			DVehs:SetRotation(Quaternion(0.004, 0.909, -0.001, -0.417))
		end
	end

	SetTolerance(1025,1062,RS_NEUTRAL)
end

function DespawnBotsSpawnFightersKef()
	local Attackers = CreateTeam("KefInvasionAttack",1062,CVector(getPos("BuharAttack_loc")),{"UralShot","BelazShot1","UralShot","BelazShot1"},CVector(getPos("BAEndPoint_loc")), nil, Quaternion(-0.037, 0.992, 0.016, 0.117))
	local Defenders = CreateTeam("KefInvasionDefend",1025,CVector(getPos("BuharAttack_loc")),{"BelazShot1","UralShot","PlayerStartCar","Hunter01"},CVector(getPos("BAEndPoint_loc")), nil, Quaternion(-0.037, 0.992, 0.016, 0.117))

	local Dskin0 = GetVar("KefDSkin0").AsInt
	local Dskin1 = GetVar("KefDSkin1").AsInt
	local Dskin2 = GetVar("PlayerMilkSkin").AsInt
	local Dskin3 = GetVar("KefDSkin3").AsInt

	local Askin0 = GetVar("KefASkin0").AsInt
	local Askin1 = GetVar("KefASkin1").AsInt
	local Askin2 = GetVar("KefASkin2").AsInt
	local Askin3 = GetVar("KefASkin3").AsInt
	local Askin4 = GetVar("KefASkin4").AsInt

	for i=0,3 do
		local dBots = getObj("KMadmanDefend"..i)
		if dBots then
			dBots:Remove()
		end

		local Defend = getObj("KefInvasionDefend_vehicle_"..i)
		if Defend then
			if i==0 then
				Defend:SetSkin(Dskin0)
			elseif i==1 then
				Defend:SetSkin(Dskin1)
			elseif i==2 then
				Defend:SetSkin(Dskin2)
				Defend:setGodMode(1)
			elseif i==3 then
				Defend:SetSkin(Dskin3)
			end
			Defend:SetRotation(Quaternion(0.004, 0.909, -0.001, -0.417))
			Defend:SetGamePositionOnGround(getPos("Kef_Defend_loc_"..i))
		end
	end	

	for i=0,4 do
		local aBots = getObj("KMadmanInvaders"..i)
		if aBots then
			aBots:Remove()
		end

		local AVehs = getObj("KefInvasionAttack_vehicle_"..i)
		if AVehs then
			AVehs:SetGamePositionOnGround(getPos("Kef_Attack_loc_"..i))
			AVehs:SetRotation(Quaternion(-0.001, 0.417, 0.000, 0.909))
			if i==0 then
				AVehs:SetSkin(Askin0)
			elseif i==1 then
				AVehs:SetSkin(Askin1)
			elseif i==2 then
				AVehs:SetSkin(Askin2)
			elseif i==3 then
				AVehs:SetSkin(Askin3)
			elseif i==4 then
				AVehs:SetSkin(Askin4)
			end
		end
	end
end

function NeftegradBotSpawn()
	local A1 = CreateVehicleEx("UralShot","NMadmanInvaders0",CVector(getPos("Neftegrad_attack_loc_0")), 1062)
	local A2 = CreateVehicleEx("TankBez","NMadmanInvaders1",CVector(getPos("Neftegrad_attack_loc_1")), 1062)
	local A3 = CreateVehicleEx("UralShot","NMadmanInvaders2",CVector(getPos("Neftegrad_attack_loc_2")), 1062)

	local D1 = CreateVehicleEx("UralShot","NMadmanDefend0",CVector(getPos("Neftegrad_defend_loc_0")), 1060)
	local D1 = CreateVehicleEx("DemoMolokovoz1","NMadmanDefend1",CVector(getPos("Neftegrad_defend_loc_1")), 1060)

	local Dskin0 = GetVar("NeftegradDSkin0").AsInt
	local Dskin1 = GetVar("NeftegradDSkin1").AsInt

	local Askin0 = GetVar("NeftegradASkin1").AsInt
	local Askin1 = GetVar("NeftegradASkin2").AsInt
	local Askin2 = GetVar("NeftegradASkin3").AsInt

	for i=0,1 do
		local DVehs = getObj("Neftegrad_defend_vehicle_"..i)
		if DVehs then
			if i==0 then
				DVehs:SetSkin(Dskin0)
			else
				DVehs:SetSkin(Dskin1)
			end
			DVehs:SetRotation(Quaternion(-0.000, -0.181, -0.005, 0.984))
			DVehs:setGodMode(1)
		end
	end

	for i=0,2 do
		local AVehs = getObj("NMadmanInvaders"..i)
		if AVehs then
			if i==0 then
				AVehs:SetSkin(Askin0)
			elseif i==1 then
				AVehs:SetSkin(Askin1)
			elseif i==2 then
				AVehs:SetSkin(Askin2)
			end
			AVehs:SetRotation(Quaternion(0.014, -0.996, -0.056, 0.066))
			AVehs:setGodMode(1)
		end
	end
end