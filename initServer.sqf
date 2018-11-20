diag_log "[INIT] ---------------------------";
diag_log "[INIT] -> STARTED SERVER SET UP <-";

RELO_var_missionPath = [(str missionConfigFile), 0, -16] call BIS_fnc_trimString;

if (!hasInterface) then // load external config if is server, no interface
{
	RELO_var_externalConfigFolder = "\reloadedsettings";
	if (loadFile (RELO_var_externalConfigFolder + "\init.sqf") != "") then
	{
		[] execVM (RELO_var_externalConfigFolder + "\init.sqf");
		diag_log "[INIT] -> External Configuration Initiated";
	};
};

RELO_var_whiteListedHelicopterPilots = [];
RELO_var_whiteListedFighterPilots = [];
RELO_var_whiteListedSpectate = [];
RELO_var_whiteListedZeus = [];

if (hasInterface && isServer) then // if testing within EDEN
{
	RELO_var_internalConfigFolder = "reloadedsettings";
	RELO_var_whiteListedHelicopterPilots = call compileFinal preprocessFileLineNumbers (RELO_var_internalConfigFolder + "\configs\whitelist\RELO_var_whiteListedHelicopterPilots.sqf");
	RELO_var_whiteListedFighterPilots = call compileFinal preprocessFileLineNumbers (RELO_var_internalConfigFolder + "\configs\whitelist\RELO_var_whiteListedFighterPilots.sqf");
	RELO_var_whiteListedSpectate = call compileFinal preprocessFileLineNumbers (RELO_var_internalConfigFolder + "\configs\whitelist\RELO_var_whiteListedSpectate.sqf");
	RELO_var_whiteListedZeus = call compileFinal preprocessFileLineNumbers (RELO_var_internalConfigFolder + "\configs\whitelist\RELO_var_whiteListedZeus.sqf");
};

["Initialize"] call BIS_fnc_dynamicGroups; // Initializes the Dynamic Groups framework

RELO_var_locationExpansion = 0.6; // min is 0.1, 0.6 is default

RELO_var_locationSetupInProgress = false;

RELO_var_locationMkrsExempt = [];
RELO_var_locationMkrsTask = [];
RELO_var_locationMrksDebug = [];
RELO_var_locationMkrPreviousSectorPrevious = "";
RELO_var_locationMkrPreviousSector = "";
RELO_var_locationMkrPreviousPrevious = "";
RELO_var_locationMkrPrevious = "";

RELO_var_locationMkrCurr = ""; // overall (marker shown)
RELO_var_locationMkrCurrInner = ""; // actual terrain scan area
RELO_var_locationMkrCurrOuter = ""; // for use with plane patrol

RELO_var_locationObjects = [];

RELO_var_locationTasksMain = [];
RELO_var_locationTasksActive = [];
RELO_var_locationTasksFinished = [];

RELO_var_locationCSATProgress = 0; // first side to 100 = winner of AO. based on # of units within AO and number of killed units and location multiplier.
RELO_var_locationNATOProgress = 0; // first side to 100 = winner of AO. based on # of units within AO and number of killed units and location multiplier.
RELO_var_locationMultiplier = 0; // 0 to 1.

RELO_var_locationGroups = [];

RELO_var_locationPatrolTroopINIT = 48;
RELO_var_locationCOBTroopINIT = 12; // COB has 24 ground troop spawn, and now 12 troop deployed, = 36 initial patrol for the COB for defending.

RELO_var_locationPatrolTroop = RELO_var_locationPatrolTroopINIT;
RELO_var_locationCOBTroop = RELO_var_locationCOBTroopINIT;

// RELO_var_locationCOBTitle = "";

RELO_var_locationEnemyCasualties = 0;
RELO_var_locationFriendlyCasualties = 0;

RELO_var_locationLandArr = [];
RELO_var_locationForestArr = [];
RELO_var_locationShallowWaterArr = [];
RELO_var_locationWaterArr = [];
RELO_var_locationDeepWaterArr = [];
RELO_var_locationShoreArr = [];
RELO_var_locationRoadArr = [];
RELO_var_locationBridgeArr = [];
RELO_var_locationPathArr = [];
RELO_var_locationRunwayArr = [];
RELO_var_locationRailWayArr = [];
RELO_var_locationShipwreckArr = [];
RELO_var_locationFuelstationArr = [];
RELO_var_locationTransmitterArr = [];
RELO_var_locationWaterTowerArr = [];

RELO_var_locationBuildingPosArr = [];

missionNameSpace setVariable ["RELO_var_locationRespawnAvailable",false,true]; // server/client variable, switched server side.

[] spawn RELO_fnc_bluforBaseCleanupHandler;
[] spawn RELO_fnc_emptyGroupsHandler; // deletes empty groups for the entire duration the mission is running.
[] spawn RELO_fnc_zeusInitCurators;

[] call RELO_fnc_exemptMarkerSetup;
[] call RELO_fnc_bluforBaseSetup;
[] call RELO_fnc_bluforBaseObjectRemoval;
[] call RELO_fnc_grassCutter;
[] call RELO_fnc_helipadSetup;
[] call RELO_fnc_serviceHelicopterSetup;
[] call RELO_fnc_servicePlaneSetup;
[] call RELO_fnc_serviceLandVehicleSetup;
[] call RELO_fnc_serviceWaterVehicleSetup;
[] call RELO_fnc_serviceUAVSetup;
[] call RELO_fnc_serviceUGVSetup;
[] call RELO_fnc_respawnMarkerSetup;
[] call RELO_fnc_vehicleMarkerSetup;
[] call RELO_fnc_handleDisconnect;
[] call RELO_fnc_outOfBounds;
// [] call RELO_fnc_toTopMapMarkers; // error with this script... nfi why.

enableSaving [false,false];
enableEnvironment [false,false];

missionNameSpace setVariable ["RELO_var_radioChannelPilot",(radioChannelCreate [[1, 0.6, 0.1, 0.8], "Pilot channel", "%UNIT_GRP_NAME (%UNIT_NAME)", [], false]),true];
missionNameSpace setVariable ["RELO_var_radioChannelZeus",(radioChannelCreate [[1, 0.9, 0.6, 0], "Zeus channel", "%UNIT_GRP_NAME (%UNIT_NAME)", [], false]),true];
missionNameSpace setVariable ["RELO_var_radioChannelSpectate",(radioChannelCreate [[1, 0, 0.5, 0], "Spectate channel", "%UNIT_GRP_NAME (%UNIT_NAME)", [], false]),true];

setDate [2035, 6, 1, 12, 0]; // set date/time, make sure minutes are 0

[] execVM "functions\server\debugScripts.sqf"; // debug script to show how many scripts are running on the server every 60 seconds (systemChat spam).

// enable day/night cycle when all base compositions have lighting.
// [] spawn
// {
	// waitUntil {!isNil "BIS_fnc_Init"};
	// setDate [2035, 6, 1, (floor(random 23)), 0]; // set date/time.
	// sleep 1;
	// while {true} do
	// {
		// _multiplier = timeMultiplier;
		// _sunOrMoon = sunOrMoon;
		// switch (_sunOrMoon) do // 1 is day, 0 is night.
		// {
			// case 1: {_multiplier = (12/5);}; // day - 12 hours of daylight in 5 hours real time
			// case 0: {_multiplier = 12;}; // night - 12 hours of night in 1 hour real time
		// };
		// setTimeMultiplier _multiplier;
		// sleep 60;
	// };
// };

// [] spawn
// {
	// waitUntil {sleep 1; (count allPlayers > 0)};

	// _dayHours = 5; // in-game day hours
	// _nightHours = 1; // in-game night hours

	// _restartEvery = _dayHours + _nightHours; // when the server will reset

	// _dayChange = 6; // 0600 hours
	// _nightChange = 5; // 1900 hours

	// setDate [2035, 9, 9, (floor(random 23)), 0]; // set date/time, make sure minutes are 0

	// 11 hrs of night time vs 1 hr real
	// 13 hrs of day time vs 5 hrs real
	// _timeOfDay = "unknown";
	// _amPm = "unknown";
	// while {sleep 1; true} do
	// {
		// switch (date select 3) do
		// {
			// case 0: {setTimeMultiplier (6 / 1); _timeOfDay = "night"; _amPm = "00:00am";};
			// case 1: {setTimeMultiplier (5 / 1); _timeOfDay = "night"; _amPm = "01:00am";};
			// case 2: {setTimeMultiplier (4 / 1); _timeOfDay = "night"; _amPm = "02:00am";};
			// case 3: {setTimeMultiplier (3 / 1); _timeOfDay = "night"; _amPm = "03:00am";};
			// case 4: {setTimeMultiplier (2 / 1); _timeOfDay = "night"; _amPm = "04:00am";};
			// case 5: {setTimeMultiplier (1 / 1); _timeOfDay = "night"; _amPm = "05:00am";};
			// case 6: {setTimeMultiplier (13 / 5); _timeOfDay = "day"; _amPm = "06:00am";}; // change here
			// case 7: {setTimeMultiplier (12 / 5); _timeOfDay = "day"; _amPm = "07:00am";};
			// case 8: {setTimeMultiplier (11 / 5); _timeOfDay = "day"; _amPm = "08:00am";};
			// case 9: {setTimeMultiplier (10 / 5); _timeOfDay = "day"; _amPm = "09:00am";};
			// case 10: {setTimeMultiplier (9 / 5); _timeOfDay = "day"; _amPm = "10:00am";};
			// case 11: {setTimeMultiplier (8 / 5); _timeOfDay = "day"; _amPm = "11:00am";};
			// case 12: {setTimeMultiplier (7 / 5); _timeOfDay = "day"; _amPm = "12:00pm";};
			// case 13: {setTimeMultiplier (6 / 5); _timeOfDay = "day"; _amPm = "13:00pm";};
			// case 14: {setTimeMultiplier (5 / 5); _timeOfDay = "day"; _amPm = "14:00pm";};
			// case 15: {setTimeMultiplier (4 / 5); _timeOfDay = "day"; _amPm = "15:00pm";};
			// case 16: {setTimeMultiplier (3 / 5); _timeOfDay = "day"; _amPm = "16:00pm";};
			// case 17: {setTimeMultiplier (2 / 5); _timeOfDay = "day"; _amPm = "17:00pm";};
			// case 18: {setTimeMultiplier (1 / 5); _timeOfDay = "day"; _amPm = "18:00pm";};
			// case 19: {setTimeMultiplier (11 / 1); _timeOfDay = "night"; _amPm = "19:00pm";}; // change here
			// case 20: {setTimeMultiplier (10 / 1); _timeOfDay = "night"; _amPm = "20:00pm";};
			// case 21: {setTimeMultiplier (9 / 1); _timeOfDay = "night"; _amPm = "21:00pm";};
			// case 22: {setTimeMultiplier (8 / 1); _timeOfDay = "night"; _amPm = "22:00pm";};
			// case 23: {setTimeMultiplier (7 / 1); _timeOfDay = "night"; _amPm = "23:00pm";};
		// };
		// if (_timeOfDay isEqualTo "day") then
		// {
			// systemChat format ["time of day is %1 which is %2, set time multiplier to %3",_amPm,_timeOfDay,timeMultiplier];
			// waitUntil {sleep 1; (dayTime > 19.00)};
		// };
		// if (_timeOfDay isEqualTo "night") then
		// {
			// systemChat format ["time of day is %1 which is %2, set time multiplier to %3",_amPm,_timeOfDay,timeMultiplier];
			// if ((dayTime > 19.00) && (dayTime < 23.99)) then
			// {
				// waitUntil {sleep 1; (daytime > 23.99)};
				// sleep 1;
			// };
			// if ((dayTime > 0.00) && (dayTime < 6.00)) then
			// {
				// waitUntil {sleep 1; (daytime > 6.00)};
			// };
		// };
	// };
// };


// [] execVM "functions\server\fn_taskProcessor.sqf"; // task functions

// AR_DISABLE_SHOOTING_OVERRIDE = true;

// [] spawn
// {
	// while {true} do
	// {
		// waitUntil {sleep 1; (count allPlayers > 0)};
		// _script = [] execVM "functions\server\executeSyntax.sqf";
		// waitUntil {scriptDone _script};
		// sleep 10;
	// };
// };

diag_log "[INIT] -> COMPLETED SERVER SET UP <-";
diag_log "[INIT] -----------------------------";
