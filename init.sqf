if ((!isServer) && (player != player)) then {
waitUntil {player == player};
};

enableSaving [false, false];



activeControls = [];
control = 2000;

WEST addScoreSide  0;
EAST addScoreSide  0;


[]execVM "GF_Kill_info\GF_Kill_info.sqf";

player addEventHandler ["Killed",{
	unit = _this select 0 ;
	killer = _this select 1;
	if (!isServer) then {
	hint "is server";	
	[[control, unit, killer], "kill_feed.sqf" ] call BIS_fnc_execVM;
	}else{
	hint "is not server";
	[control, unit, killer] execVM "kill_feed.sqf";
	};
	
}];

_endmission = false;
while {NOT _endmission} do {
	{
		if ((scoreSide WEST >= 10) || (scoreSide EAST >= 10)) then {
			_endmission = true;
	};

	} forEach allUnits;
};

"END1" call BIS_fnc_endMission;
