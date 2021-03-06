
/* ----------------------------------------------------------------------------
Function: btc_fnc_eh_veh_killed

Description:
    Fill me when you edit me !

Parameters:
    _vehicle - [Object]

Returns:

Examples:
    (begin example)
        _result = [] call btc_fnc_eh_veh_killed;
    (end)

Author:
    Giallustio

---------------------------------------------------------------------------- */

params [
    ["_vehicle", objNull, [objNull]]
];

private _marker = createMarker [format ["m_%1", _vehicle], getPos _vehicle];
_marker setMarkerType "mil_box";
_marker setMarkerColor "ColorRed";
[_marker, "STR_BTC_HAM_O_EH_VEHKILLED_MRK", getText (configFile >> "cfgVehicles" >> typeOf _vehicle >> "displayName")] remoteExec ["btc_fnc_set_markerTextLocal", [0, -2] select isDedicated, _marker]; // %1 wreck

_vehicle setVariable ["marker", _marker];

if (isServer) then {
    btc_rep_malus_veh_killed call btc_fnc_rep_change;
} else {
    btc_rep_malus_veh_killed remoteExec ["btc_fnc_rep_change", 2];
};
