disableSerialization;


{
	_ctrl = (findDisplay 46) displayCtrl _x;
	
	_pos = ctrlPosition _ctrl;
	_pos set [1, (_pos select 1) + 0.025];
	
	_ctrl ctrlSetPosition _pos;
	
	_ctrl ctrlCommit 0.25;
}forEach activeControls;

UISleep 0.25;

_ctrl = (findDisplay 46) ctrlCreate ["RscText", _this select 0];

_ctrl ctrlSetPosition [0.45, 0.7, 0.4, 0.1];
_ctrl ctrlSetTextColor [1, 0, 0, 1];


_Killed = _this select 1;
_Killed_name = name _Killed;

_ctrl ctrlSetText ("Killed "+ _Killed_name + " | +1 kill");


_ctrl ctrlCommit 0;

_ctrl ctrlSetFade 1;
_ctrl ctrlCommit 10;

0 = (_this select 0) spawn
{
	disableSerialization;
	_ctrl = (findDisplay 46) displayCtrl _this;
	
	UISleep 50;
	
	ctrlDelete _ctrl;
	activeControls = activeControls - [_this];	
};

activeControls = [_this select 0] + activeControls;
control = control + 1;