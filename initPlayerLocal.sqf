if (side group player == west) then {"ticketsWest"} else {"ticketsEast"};
player setVariable ["BIS_fnc_respawnTickets_var",_var];

[] execVM "GF_Kill_info\GF_Kill_info_init.sqf";
