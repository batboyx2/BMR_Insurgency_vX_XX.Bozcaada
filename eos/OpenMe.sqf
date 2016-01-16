/* EOS 1.98 by BangaBob 
GROUP SIZES
 0 = 1
 1 = 2,4
 2 = 4,8
 3 = 8,12
 4 = 12,16
 5 = 16,20

EXAMPLE CALL - EOS
 null = [["MARKERNAME","MARKERNAME2"],[2,1,70],[0,1],[1,2,30],[2,60],[2],[1,0,10],[1,0,250,WEST]] call EOS_Spawn;
 null=[["M1","M2","M3"],[HOUSE GROUPS,SIZE OF GROUPS,PROBABILITY],[PATROL GROUPS,SIZE OF GROUPS,PROBABILITY],[LIGHT VEHICLES,SIZE OF CARGO,PROBABILITY],[ARMOURED VEHICLES,PROBABILITY], [STATIC VEHICLES,PROBABILITY],[HELICOPTERS,SIZE OF HELICOPTER CARGO,PROBABILITY],[FACTION,MARKERTYPE,DISTANCE,SIDE,HEIGHTLIMIT,DEBUG]] call EOS_Spawn;

EXAMPLE CALL - BASTION
 null = [["BAS_zone_1"],[3,1],[2,1],[2],[0,0],[0,0,EAST,false,false],[10,2,120,TRUE,TRUE]] call Bastion_Spawn;
 null=[["M1","M2","M3"],[PATROL GROUPS,SIZE OF GROUPS],[LIGHT VEHICLES,SIZE OF CARGO],[ARMOURED VEHICLES],[HELICOPTERS,SIZE OF HELICOPTER CARGO],[FACTION,MARKERTYPE,SIDE,HEIGHTLIMIT,DEBUG],[INITIAL PAUSE, NUMBER OF WAVES, DELAY BETWEEN WAVES, INTEGRATE EOS, SHOW HINTS]] call Bastion_Spawn;
*/

private ["_side","_fac1","_fac2"];
_side = _this select 0;
_fac1 = _this select 1;//minor
_fac2 = _this select 2;//major

EOS_Spawn = compile preprocessfilelinenumbers "eos\core\eos_launch.sqf";
Bastion_Spawn=compile preprocessfilelinenumbers "eos\core\b_launch.sqf";
null=[] execVM "eos\core\spawn_fnc.sqf";
if (isServer) then {["updateEOSmkrs","onplayerConnected", {[] execVM "eos\Functions\EOS_Markers.sqf";}] call BIS_fnc_addStackedEventHandler;};
//onplayerConnected {[] execVM "eos\Functions\EOS_Markers.sqf";};

VictoryColor="colorGreen";	// Colour of marker after completion
hostileColor="colorRed";	// Default colour when enemies active
bastionColor="colorOrange";	// Colour for bastion marker
EOS_KILLCOUNTER=false;		// Counts killed units

//null = [["m_1"],[1,2,InfPb],[1,2,InfPb],[0,0],[0],[0],[0,0],[_fac2,0,AI_SpawnDis,_side,true]] call EOS_Spawn;

for "_i" from 1 to 1473 do {
	_max = (InfPb / 25) + 1; //2-5 = 1-4 groups
	_maxA = (MecArmPb / 25) + 1;
	_par = [
		[("m_" + (str _i))],
		[floor (random _max),floor (random 2),InfPb], //1 in 8 zones populated with 1 to 4 infantry, to 4 in 5 zones populated with 1 to 16 infantry
		[floor (random _max),floor (random 2),InfPb], //1 in 8 zones populated with 1 to 4 infantry, to 4 in 5 zones populated with 1 to 16 infantry
		[round (random 0.6),ceil (random 6),MecArmPb], //1 in 5 to 1 in 20
		[round (random 0.525),MecArmPb], //1 in 20 to 1 in 80
		[round (random 0.6),ceil (random 6),MecArmPb], //1 in 5 to 1 in 20
		[0,0,0],
		[_fac2,0,AI_SpawnDis,_side,true]
	];
	_par call EOS_Spawn;
};


