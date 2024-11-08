-- The Chronicle of Hamza scripts --


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
	end

	local veh2 = getObj("GadadDebyli_vehicle_2")
	if veh2 then
		veh2:SetGamePositionOnGround(CVector(getPos("GadadMadSpawn3")))
		veh2:SetRotation(Quaternion(0.003, 0.190, 0.006, 0.982))
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
	end

	local veh1 = getObj("GadadDefenders_vehicle_1")
	if veh1 then
		veh1:SetGamePositionOnGround(CVector(getPos("HaraDefSpawn2")))
		veh1:SetRotation(Quaternion(0.007, -0.142, -0.013, 0.990))
	end

	local veh2 = getObj("GadadDefenders_vehicle_2")
	if veh2 then
		veh2:SetGamePositionOnGround(CVector(getPos("HaraDefSpawn3")))
		veh2:SetRotation(Quaternion(0.003, -0.005, 0.003, 1.000))
	end
end

function CreateAlfaranDefenders()
	CreateTeam("GadadAlfaDefenders",1092,CVector(5504.042, 274.573, 6686.349),{"BelazShot","Hunter01"},CVector(5479.855, 264.233, 6680.261), nil)

	local veh0 = getObj("GadadAlfaDefenders_vehicle_0")
	if veh0 then
		veh0:SetGamePositionOnGround(CVector(getPos("AlfaDefSpawn1")))
		veh0:SetRotation(Quaternion(0.000, 0.994, 0.007, -0.111))
	end

	local veh1 = getObj("GadadAlfaDefenders_vehicle_1")
	if veh1 then
		veh1:SetGamePositionOnGround(CVector(getPos("HaraDefSpawn2")))
		veh1:SetRotation(Quaternion(0.003, 0.334, 0.002, 0.943))
	end
end

function CreateTheKefAttackers()
    CreateTeam("BanditsTeam",1024,CVector(6125.474, 254.088, 5072.637),{"UralShot1", "UralShot1", "UralShot"},CVector(6173.737, 255.168, 5089.908), nil)

    local veh0 = getObj("BanditsTeam_vehicle_0")
    if veh0 then
        veh0:SetGamePositionOnGround(CVector(getPos("BanditKefSpawn1")))
		veh0:SetRotation(Quaternion(-0.004, 0.572, 0.002, 0.821))
    end

    local veh1 = getObj("BanditsTeam_vehicle_1")
    if veh1 then
        veh1:SetGamePositionOnGround(CVector(getPos("BanditKefSpawn2")))
		veh1:SetRotation(Quaternion(0.008, 0.385, -0.003, 0.923))
    end

    local veh2 = getObj("BanditsTeam_vehicle_2")
    if veh2 then
        veh2:SetGamePositionOnGround(CVector(getPos("BanditKefSpawn3")))
		veh2:SetRotation(Quaternion(-0.000, 0.385, -0.001, 0.923))
    end
end