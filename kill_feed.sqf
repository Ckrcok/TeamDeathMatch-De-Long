disableSerialization;
systemChat "inside kill feed";



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

killed =  _this select 1;
killed_name = name killed;
killer =  _this select 2;
killer_name = name killer;
 hint format ["killed , %1!", killed_name ];
 hint format ["killer , %1!", killer_name];

_ctrl ctrlSetText ("You killed  " + killed_name );

_ctrl ctrlCommit 0;

_ctrl ctrlSetFade 1;
_ctrl ctrlCommit 10;

0 = (_this select 0) spawn
{
	disableSerialization;
	_ctrl = (findDisplay 46) displayCtrl _this;
	
	UISleep 10;
	
	ctrlDelete _ctrl;
	activeControls = activeControls - [_this];	
};

activeControls = [_this select 0] + activeControls;
control = control + 1;