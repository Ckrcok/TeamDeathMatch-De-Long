if (side group player == west) then {"ticketsWest"} else {"ticketsEast"};
player setVariable ["BIS_fnc_respawnTickets_var",_var];

[] execVM "GF_Kill_info\GF_Kill_info_init.sqf";

this addEventHandler ["Killed",
{
	[control, _this select 0] execVM "kill_feed.sqf";
}];
