
execVM (RELO_var_externalConfigFolder + "\scripts\serverRestartMessages\serverRestartMessages.sqf");

if (loadFile (RELO_var_externalConfigFolder + "\configs\whitelist\RELO_var_whiteListedHelicopterPilots.sqf") != "") then
{
	RELO_var_whiteListedHelicopterPilots = call compileFinal preprocessFileLineNumbers (RELO_var_externalConfigFolder + "\configs\whitelist\RELO_var_whiteListedHelicopterPilots.sqf");
	publicVariable "RELO_var_whiteListedHelicopterPilots";
};

if (loadFile (RELO_var_externalConfigFolder + "\configs\whitelist\RELO_var_whiteListedFighterPilots.sqf") != "") then
{
	RELO_var_whiteListedFighterPilots = call compileFinal preprocessFileLineNumbers (RELO_var_externalConfigFolder + "\configs\whitelist\RELO_var_whiteListedFighterPilots.sqf");
	publicVariable "RELO_var_whiteListedFighterPilots";
};

if (loadFile (RELO_var_externalConfigFolder + "\configs\whitelist\RELO_var_whiteListedSpectate.sqf") != "") then
{
	RELO_var_whiteListedSpectate = call compileFinal preprocessFileLineNumbers (RELO_var_externalConfigFolder + "\configs\whitelist\RELO_var_whiteListedSpectate.sqf");
	publicVariable "RELO_var_whiteListedSpectate";
};

if (loadFile (RELO_var_externalConfigFolder + "\configs\whitelist\RELO_var_whiteListedZeus.sqf") != "") then
{
	RELO_var_whiteListedZeus = call compileFinal preprocessFileLineNumbers (RELO_var_externalConfigFolder + "\configs\whitelist\RELO_var_whiteListedZeus.sqf");
	publicVariable "RELO_var_whiteListedZeus";
};
