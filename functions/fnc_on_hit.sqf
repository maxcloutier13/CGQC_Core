#include "\CGQC\script_component.hpp"
private ["_target", "_unit", "_bullet", "_ammo", "_position", "_vectorToTarget", "_velocity", "_distance", "_targetDir", "_impactDeviation", "_accuracy", "_score", "_targetScore"];

LOG("[on_hit] started");

if (TrainingCourse_ShotsFired == 0) exitWith {};

TrainingCourse_TargetsHit = (TrainingCourse_TargetsHit + 1) min TrainingCourse_ShotsFired;

_target = _this select 0;
_unit = _this select 1;
_bullet = _this select 2;
_position = _this select 3;
_velocity = _this select 4;
_ammo = _this select 6;

_vectorToTarget = (getPosASL _unit) vectorDiff _position;
_distance = vectorMagnitude _vectorToTarget;

TrainingCourse_AverageDistance = TrainingCourse_AverageDistance + (_distance - TrainingCourse_AverageDistance) / TrainingCourse_TargetsHit;

_accuracy = TrainingCourse_TargetsHit / TrainingCourse_ShotsFired;
_score = (_accuracy * TrainingCourse_AverageDistance / 25) min 100;

if ((typeOf _target) in ["metalTarget_Stand_AZone", "TargetP_Inf_Acc2_F", "TargetP_Inf2_Acc2_F", "TargetP_Inf_Acc2_NoPop_F", "TargetP_Inf2_Acc2_NoPop_F"]) then {
	_targetDir = getDir _target;
	_impactDeviation = _position vectorDiff (getPosASL _target);
	_impactDeviation = _impactDeviation vectorDiff [sin(_targetDir) * 0.16, cos(_targetDir) * 0.16, 0.85];
	_impactDeviation = vectorMagnitude _impactDeviation;

	TrainingCourse_AverageImpactDeviation = TrainingCourse_AverageImpactDeviation + (_impactDeviation - TrainingCourse_AverageImpactDeviation) / TrainingCourse_TargetsHit;

	_targetScore = 0;

	if (_impactDeviation < 0.0575 * 4.0) then {
		_targetScore = 1;
	};
	if (_impactDeviation < 0.0575 * 3.0) then {
		_targetScore = 2;
	};
	if (_impactDeviation < 0.0575 * 2.0) then {
		_targetScore = 3;
	};
	if (_impactDeviation < 0.0575 * 1.0) then {
		_targetScore = 4;
	};
	if (_impactDeviation < 0.0575 * 0.5) then {
		_targetScore = 5;
	};

	TrainingCourse_AverageTargetScore = TrainingCourse_AverageTargetScore + (_targetScore - TrainingCourse_AverageTargetScore) / TrainingCourse_TargetsHit;

	_title = "Impact!";
	_textDist = format["Distance: %1m", floor (round(_distance * 10) / 10)];
	_textVel = format["Velocité: %1m/s", floor (round(_velocity call BIS_fnc_magnitude))];
	//_textAcc = format["%1/100", round(_accuracy * 10000) / 100];
	//_textScore = format["%1/100", round(_score * 100) / 100];
	[[_title, 1.5, [0.161, 0.502, 0.725, 1]], [_textDist, 1.2], [_textVel, 1.2], true] call CBA_fnc_notify;
} else {
	_title = "Impact!";
	_textDist = format["Distance: %1m", floor (round(_distance * 10) / 10)];
	_textVel = format["Velocité: %1m/s", floor (round(_velocity call BIS_fnc_magnitude))];
	//_textAcc = format["%1/100", round(_accuracy * 10000) / 100];
	//_textScore = format["%1/100", round(_score * 100) / 100];
	[[_title, 1.5, [0.161, 0.502, 0.725, 1]], [_textDist, 1.2], [_textVel, 1.2], true] call CBA_fnc_notify;
	//hintSilent format["RemV: %1 m/s\nDistance: %2 m\n\n---- Moyenne ----\nPrécision: %3/100\nScore: %4/100",
	//round(_velocity call BIS_fnc_magnitude),
	//round(_distance * 10) / 10,
	//round(_accuracy * 10000) / 100,
	//round(_score * 100) / 100];
};

Projectile_Impact_Aux setPosASL _position;

_sound = ["cgqc_sound_impact1", "cgqc_sound_impact2"];
_rand = selectRandom _sound;
playSound _rand;
//playSound3D [_rand, _target, false, [0,0,0], 1, 1, 500, 0, false];
//playSound3D [filename, soundSource, isInside, soundPosition, volume, soundPitch, distance, offset, local]3
LOG("[on_hit] done");