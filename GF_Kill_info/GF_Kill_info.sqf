//________________  Author : Mashdor ___________ 20.04.2022 _____________




//diag_log "//________________ GF Kill info Script ________________";


//	TIP :	You can disable the default arma systemChat
//________________ imports ________________
#define SCALEFACTOR getNumber( configFile >> "uiScaleFactor" )
#define GRID_X( gridType, gridScale, num ) ( pixelW * gridType * ((( num ) * ( gridScale )) / SCALEFACTOR ))
#define GRID_Y( gridType, gridScale, num ) ( pixelH * gridType * ((( num ) * ( gridScale )) / SCALEFACTOR ))

#define GRID_SCALE 8
//________________ Settings ________________
//________________ Set true or false  ________________

_parsetext_notification			= false;			//	parsetext hint notification
_BIS_fnc_dynamicText			= true;			//	BIS_fnc_dynamicText notification

_systemChat_notification		= false;
_sideChat_notification			= false;			//	Show hint notification
_side_of_sideChat				= playerside;	//	https://community.bistudio.com/wiki/Side	or	ex: west
_identity_of_sideChat			= "HQ";			//	https://community.bistudio.com/wiki/sideChat




if(!local player) exitWith {};
private _Killed = _this select 0;
private _Killer = _this select 1;

private _Distance = _Killed distance2D _Killer;
private _Weapon = getText(configFile >> "CfgWeapons" >> currentWeapon (vehicle _Killer) >> "displayname");
_Killed_Color = (side group _Killed call BIS_fnc_sideColor) call BIS_fnc_colorRGBtoHTML;
_Killer_Color = (side group _Killer call BIS_fnc_sideColor) call BIS_fnc_colorRGBtoHTML;

_Weapon = currentWeapon _Killer;
_pictureweapon = gettext (configFile >> "cfgWeapons" >> _Weapon >> "picture");
if (_pictureweapon == "") then {
_Weapon = typeOf (vehicle _Killer);
_pictureweapon = (getText (configFile >> "cfgVehicles" >> _Weapon >> "picture"));
};




diag_log format ["________________	Killed	: %1	Killer : %2	________________",_Killed,_Killer];


//________________ isNull _Killer ________________

if(isNull _Killer) then {

	// if (_systemChat_notification) then {
	// [format["%1    K  .  I  .  A  .", _Killed]] remoteExec ["systemChat", 0, true];
	// };
	if (_BIS_fnc_dynamicText) then {
	//________________	2. Left Corner up display	________________
	_BIS_fnc_dynamicText_info = [["%1    K  .  I  .  A  .", _Killed ,1080,20,10,0,0,7016] remoteExec ["BIS_fnc_dynamicText"]];
	};

};


	//________________ isPlayer _Killer ________________

if(isPlayer _Killer) then {
		if((vehicle _Killer) == _Killer) then {
			private _Killer_name = name _Killer;
			if(name _Killed == _Killer_name) then {

					// if (_systemChat_notification) then {
					// [format["%1    K  .  I  .  A  .", _Killed]] remoteExec ["systemChat", 0, true];
					// };

					// if (_sideChat_notification) then {
					// [[_side_of_sideChat,_identity_of_sideChat],format["%1    K  .  I  .  A  .", _Killed]]remoteExec ["sideChat", 0, true];
					// };
					if (_BIS_fnc_dynamicText) then {
					_kill_info = format[" <t color='%2'>%1  <t color='#FFD700'>K. I. A.",_Killer_name,_Killed_Color];
					//________________	2. Left Corner up display	________________
					_BIS_fnc_dynamicText_info = [["<t size='0.5' align='left' with  %4 >" + _kill_info + "</t>" ,safeZoneX,safeZoneY,10,0,0,7016] remoteExec ["BIS_fnc_dynamicText"]];
					};

			}else{
			private _Weapon = getText(configFile >> "CfgWeapons" >> currentWeapon (vehicle _Killer) >> "displayname");
			if(_Weapon != "") then {



		//________________	3. 2 Different notification types	________________
		_kill_info = format[" <t color='%4'> %2  Killed  <t color='%3'>  %4  <t color='#FFD700'> from   %5 m   with  <t color='#FF0000'> %6 </t>",_pictureweapon,_Killer_name,_Killed_Color,_Killer_Color,_Killed,floor _Distance,_Weapon];


		if (_BIS_fnc_dynamicText) then {
		//________________	2. Left Corner up display	________________
			// _BIS_fnc_dynamicText_info=[["<t size='0.5' align='left' with  %4 >" + _kill_info + "</t>",safeZoneX,safeZoneY,10,0,0,7016] remoteExec ["BIS_fnc_dynamicText"]]
		_BIS_fnc_dynamicText_info=[["<t size='0.5' align='left' with  %4 >" + _kill_info + "</t>",1080,20,60,0,0,0] remoteExec ["BIS_fnc_dynamicText"]];
		};


					};
				};
		};


		if((vehicle _Killer) != _Killer) then {
			_Killer_name = name _Killer;
			_Weapon = getText(configFile >> "CfgWeapons" >> currentWeapon (vehicle _Killer) >> "displayname");
			private _Vehicle_Killer = getText (configFile >> "CfgVehicles" >> typeof (vehicle _Killer) >> "Displayname");
			if(_Weapon != "") then {




// <img size='1' shadow='1' image='%1'/>

		//________________	3. 2 Different notification types	________________
		_kill_info = format["  %2  Killed <t color='%3'>  %4  <t color='#FFD700'>   from   %5 m   with  <t color='#FF0000'> %6   %7 </t>",_pictureweapon,_Killer_name,_Killed_Color,_Killed,floor _Distance,_Vehicle_Killer,_Weapon];


		if (_BIS_fnc_dynamicText) then {
		//________________	2. Left Corner up display	________________
		_BIS_fnc_dynamicText_info=[["<t size='0.6' align='left' align='bottom' with  %4 >" + _kill_info + "</t>",safeZoneX,safeZoneY,10,0,0,7016] remoteExec ["BIS_fnc_dynamicText"]];
		};

				};
			};
};


//________________ !(isPlayer _Killer) ________________

if!(isPlayer _Killer) then {
		if((vehicle _Killer) == _Killer) then {
			_Killer_name = name _Killer;
			_Killed_name = name _Killed;
			_Weapon = getText(configFile >> "CfgWeapons" >> currentWeapon (vehicle _Killer) >> "displayname");
			if(_Weapon != "") then {


	if (_systemChat_notification) then {
	[format["%1  Killed  %2  from  %3 m  with  %4", _Killer_name,_Killed,floor _Distance,_Weapon]] remoteExec ["systemChat", 0, true];
	};


	//________________	3. 2 Different notification types	________________
	_kill_info = format["<t color='%4'>  %5  </t>  <img size='1'   transform='-1' shadow='1' image='%1'/>    <t color='%3'> %2 </t> from <t color='#FFD700'>%6 m</t>",_pictureweapon,_Killer_name,_Killer_Color,_Killed_Color,_Killed_name,floor _Distance,_Weapon];


	if (_BIS_fnc_dynamicText) then {
	//________________	2. Left Corner up display	________________
	_BIS_fnc_dynamicText_info=[["<t size='0.6' align='left' with  %4 >" + _kill_info + "</t>",	safeZoneXAbs + GRID_X( pixelGrid, GRID_SCALE, 2 ),safeZoneY + GRID_Y( pixelGrid, GRID_SCALE, 5 ),120,0,0,7016] remoteExec ["BIS_fnc_dynamicText"]];
	};

			};
		};



		if((vehicle _Killer) != _Killer) then {
			_ubivec = name _Killer;
			_Killer_name = format ["%1(%2)",_ubivec,getText(configFile>>"CfgVehicles">>typeOf (vehicle _Killer) >>"DisplayName")];
			_Weapon = getText(configFile >> "CfgWeapons" >> currentWeapon (vehicle _Killer) >> "displayname");
			_Vehicle_Killer = getText (configFile >> "CfgVehicles" >> typeof (vehicle _Killer) >> "Displayname");
			if(_Weapon != "") then {

	//________________	3. 2 Different notification types	________________
	_kill_info = format["<img size='1' shadow='1' image='%1'/>  %2  Killed <t color='%3'>  %4  <t color='#FFD700'> from   %5 m   with  <t color='#FF0000'> %6   %7 </t>",_pictureweapon,_Killer_name,_Killed_Color,_Killed,floor _Distance,_Vehicle_Killer,_Weapon];


	if (_BIS_fnc_dynamicText) then {
	//________________	2. Left Corner up display	________________
	_BIS_fnc_dynamicText_info=[["<t size='0.6' align='left' with  %4 >" + _kill_info + "</t>",safeZoneX + 30,safeZoneY + 30,10,0,0,7016] remoteExec ["BIS_fnc_dynamicText"]];
	};

			};
		};
};
