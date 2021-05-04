private["_wtickets","_etickets"];
_wtickets = scoreSide WEST ;
_etickets = scoreSide EAST;
if (side player == west) then {hint format ["NATO has %1/10 kills ",_wtickets];};
if (side player == east) then {hint format ["CSAT has %1/10 kills",_wtickets];};
