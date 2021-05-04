if ((!isServer) && (player != player)) then {
waitUntil {player == player};
};

enableSaving [false, false];

//Ends the mission when West or East have scored more than X - in this case 2
//Credit to Stapo for Ultimate Team Deathmatch code

_endmission = false;
while {NOT _endmission} do {
	{
		if ((scoreSide WEST >= 10) || (scoreSide EAST >= 10)) then {
			_endmission = true;
	};

	} forEach allUnits;
};

"END1" call BIS_fnc_endMission;
