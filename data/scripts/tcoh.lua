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
	if WinningRandom == 1 then
		SetVar("WinningNumber", 1)
		println("Random: 1")

		local F1 = CreateVehicleEx("UralRace00", "Formula1", CVector(getPos("RaceStart4_loc"))+CVector(0,1,0), 1100)
		if F1 then 
			F1:SetRotation(Quaternion(0.000, -0.999, 0.000, 0.050))
			F1:SetRandomSkin()
			F1:SetForcedMaxTorque(500)
			F1:SetMaxSpeed(83.4)
			F1:SetCruisingSpeed(65)
		end

		local F2 = CreateVehicleEx("UralRace01", "Formula2", CVector(getPos("RaceStart1_loc"))+CVector(0,1,0), 1100)
		if F2 then 
			F2:SetRotation(Quaternion(0.000, -0.999, 0.000, 0.050))
			F2:SetRandomSkin()
			F2:SetForcedMaxTorque(500)
			F2:SetMaxSpeed(83.4)
			F2:SetCruisingSpeed(65)
		end

		local F3 = CreateVehicleEx("UralMansurRace", "Formula3", CVector(getPos("RaceStart2_loc"))+CVector(0,1,0), 1100)
		if F3 then 
			F3:SetRotation(Quaternion(0.000, -0.999, 0.000, 0.050))
			F3:SetSkin(1)
			F3:SetForcedMaxTorque(500)
			F3:SetMaxSpeed(83.4)
			F3:SetCruisingSpeed(65)
		end

		local F4 = CreateVehicleEx("UralRace00", "Formula4", CVector(getPos("RaceStart3_loc"))+CVector(0,1,0), 1100)
		if F4 then 
			F4:SetRotation(Quaternion(0.000, -0.999, 0.000, 0.050))
			F4:SetRandomSkin()
			F4:SetForcedMaxTorque(500)
			F4:SetMaxSpeed(83.4)
			F4:SetCruisingSpeed(65)
		end
	elseif WinningRandom == 2 then
		SetVar("WinningNumber", 2)
		println("Random: 2")

		local F1 = CreateVehicleEx("UralRace00", "Formula1", CVector(getPos("RaceStart1_loc"))+CVector(0,1,0), 1100)
		if F1 then 
			F1:SetRotation(Quaternion(0.000, -0.999, 0.000, 0.050))
			F1:SetRandomSkin()
			F1:SetForcedMaxTorque(500)
			F1:SetMaxSpeed(83.4)
			F1:SetCruisingSpeed(65)
		end

		local F2 = CreateVehicleEx("UralRace01", "Formula2", CVector(getPos("RaceStart4_loc"))+CVector(0,1,0), 1100)
		if F2 then 
			F2:SetRotation(Quaternion(0.000, -0.999, 0.000, 0.050))
			F2:SetRandomSkin()
			F2:SetForcedMaxTorque(500)
			F2:SetMaxSpeed(83.4)
			F2:SetCruisingSpeed(65)
		end

		local F3 = CreateVehicleEx("UralMansurRace", "Formula3", CVector(getPos("RaceStart2_loc"))+CVector(0,1,0), 1100)
		if F3 then 
			F3:SetRotation(Quaternion(0.000, -0.999, 0.000, 0.050))
			F3:SetSkin(1)
			F3:SetForcedMaxTorque(500)
			F3:SetMaxSpeed(83.4)
			F3:SetCruisingSpeed(65)
		end

		local F4 = CreateVehicleEx("UralRace00", "Formula4", CVector(getPos("RaceStart3_loc"))+CVector(0,1,0), 1100)
		if F4 then 
			F4:SetRotation(Quaternion(0.000, -0.999, 0.000, 0.050))
			F4:SetRandomSkin()
			F4:SetForcedMaxTorque(500)
			F4:SetMaxSpeed(83.4)
			F4:SetCruisingSpeed(65)
		end
	elseif WinningRandom == 3 then
		SetVar("WinningNumber", 3)
		println("Random: 3")

		local F1 = CreateVehicleEx("UralRace00", "Formula1", CVector(getPos("RaceStart1_loc"))+CVector(0,1,0), 1100)
		if F1 then 
			F1:SetRotation(Quaternion(0.000, -0.999, 0.000, 0.050))
			F1:SetRandomSkin()
			F1:SetForcedMaxTorque(500)
			F1:SetMaxSpeed(83.4)
			F1:SetCruisingSpeed(65)
		end

		local F2 = CreateVehicleEx("UralRace01", "Formula2", CVector(getPos("RaceStart2_loc"))+CVector(0,1,0), 1100)
		if F2 then 
			F2:SetRotation(Quaternion(0.000, -0.999, 0.000, 0.050))
			F2:SetRandomSkin()
			F2:SetForcedMaxTorque(500)
			F2:SetMaxSpeed(83.4)
			F2:SetCruisingSpeed(65)
		end

		local F3 = CreateVehicleEx("UralMansurRace", "Formula3", CVector(getPos("RaceStart4_loc"))+CVector(0,1,0), 1100)
		if F3 then 
			F3:SetRotation(Quaternion(0.000, -0.999, 0.000, 0.050))
			F3:SetSkin(1)
			F3:SetForcedMaxTorque(500)
			F3:SetMaxSpeed(83.4)
			F3:SetCruisingSpeed(65)
		end

		local F4 = CreateVehicleEx("UralRace00", "Formula4", CVector(getPos("RaceStart3_loc"))+CVector(0,1,0), 1100)
		if F4 then 
			F4:SetRotation(Quaternion(0.000, -0.999, 0.000, 0.050))
			F4:SetRandomSkin()
			F4:SetForcedMaxTorque(500)
			F4:SetMaxSpeed(83.4)
			F4:SetCruisingSpeed(65)
		end
	elseif WinningRandom == 4 then
		SetVar("WinningNumber", 4)
		println("Random: 4")

		local F1 = CreateVehicleEx("UralRace00", "Formula1", CVector(getPos("RaceStart1_loc"))+CVector(0,1,0), 1100)
		if F1 then 
			F1:SetRotation(Quaternion(0.000, -0.999, 0.000, 0.050))
			F1:SetRandomSkin()
			F1:SetForcedMaxTorque(500)
			F1:SetMaxSpeed(83.4)
			F1:SetCruisingSpeed(65)
		end

		local F2 = CreateVehicleEx("UralRace01", "Formula2", CVector(getPos("RaceStart3_loc"))+CVector(0,1,0), 1100)
		if F2 then 
			F2:SetRotation(Quaternion(0.000, -0.999, 0.000, 0.050))
			F2:SetRandomSkin()
			F2:SetForcedMaxTorque(500)
			F2:SetMaxSpeed(83.4)
			F2:SetCruisingSpeed(65)
		end

		local F3 = CreateVehicleEx("UralMansurRace", "Formula3", CVector(getPos("RaceStart2_loc"))+CVector(0,1,0), 1100)
		if F3 then 
			F3:SetRotation(Quaternion(0.000, -0.999, 0.000, 0.050))
			F3:SetSkin(1)
			F3:SetForcedMaxTorque(500)
			F3:SetMaxSpeed(83.4)
			F3:SetCruisingSpeed(65)
		end

		local F4 = CreateVehicleEx("UralRace00", "Formula4", CVector(getPos("RaceStart4_loc"))+CVector(0,1,0), 1100)
		if F4 then 
			F4:SetRotation(Quaternion(0.000, -0.999, 0.000, 0.050))
			F4:SetRandomSkin()
			F4:SetForcedMaxTorque(500)
			F4:SetMaxSpeed(83.4)
			F4:SetCruisingSpeed(65)
		end
	end

	TActivate("RaceStartSpec_cs")
end

function RaceCutsceneCams()
	local winnum = GetVar("WinningNumber").AsInt

	local FVeh1 = GetEntityByName("Formula1")
	local FVeh1ID = FVeh1:GetId()

	local FVeh2 = GetEntityByName("Formula2")
	local FVeh2ID = FVeh2:GetId()

	local FVeh3 = GetEntityByName("Formula3")
	local FVeh3ID = FVeh3:GetId()

	local FVeh4 = GetEntityByName("Formula4")
    local FVeh4ID = FVeh4:GetId()

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
	Fly("RaceSpec_cam02", CINEMATIC_AIM_TO_ID, FVeh4ID, 9.5, 0, 1 )
--	FlyLinked("RaceSpec_cam03", FVeh4ID, 5, 0, 0, FVeh3ID)
--	Fly("RaceSpec_cam04", CINEMATIC_NO_AIM, nil, 5, 0, 0 )
--	Fly("RaceSpec_cam05", CINEMATIC_NO_AIM, nil, 5, 0, 1 )

	StartCinematic()
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