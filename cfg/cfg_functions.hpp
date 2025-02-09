class diwako_lockbackpack {
	tag="diwako_lockbackpack";
	class functions {
		file = "\cgqc\functions\lockbackpack";
		class init{postInit = 1;};
		class onOpenInventory{};
		class checkUnlockBP{};
	};
};

class CGQC {
    tag = "CGQC";
    class functions {
        // Fonctions ---------------------------------------------------------------------------
        class medicalTreatment {
            file = "\cgqc\functions\fnc_medicalTreatment.sqf";
            description = "Custom medical treatments and such";
        };
        class getDrone {
            file = "\cgqc\functions\fnc_getDrone.sqf";
            description = "Handles drone restrictions";
        };
        class mapTools {
            file = "\cgqc\functions\fnc_mapTools.sqf";
            description = "Various custom map tools";
        };
        class becomeAmmoBearer {
            file = "\cgqc\functions\fnc_becomeAmmoBearer.sqf";
            description = "Get some ammo from the target's setup";
        };
        class reloadTraits {
            file = "\cgqc\functions\fnc_reloadTraits.sqf";
            description = "Reload fucking traits";
        };
        class wakeup {
            file = "\cgqc\functions\fnc_wakeup.sqf";
            description = "Wake up the player";
        };
        class perceivedPain {
            file = "\cgqc\functions\fnc_perceivedPain.sqf";
            description = "Return perceived pain";
        };
        class treatment {
            file = "\cgqc\functions\fnc_treatment.sqf";
            description = "Custom medical treatments";
        };
        class treatmentLocal {
            file = "\cgqc\functions\fnc_treatmentLocal.sqf";
            description = "Custom medical treatments";
        };
        class groupMoa {
            file = "\cgqc\functions\fnc_groupMoa.sqf";
            description = "Finds the size in moa of the shot group";
        };
        class groupSize {
            file = "\cgqc\functions\fnc_groupSize.sqf";
            description = "Finds the size of the shot group";
        };
        class trainingEod {
            file = "\cgqc\functions\fnc_trainingEod.sqf";
            description = "Explosives disposal training";
        };
        class checkVitals {
            file = "\cgqc\functions\fnc_checkVitals.sqf";
            description = "Check if the unit is stable";
        };
        class addPerksSpecial{
            file = "\cgqc\functions\fnc_addPerksSpecial.sqf";
            description = "Add special perks depending on role";
        };
        class configExtractor{
            file = "\cgqc\functions\fnc_configExtractor.sqf";
            description = "Exports specific config to clipboard";
        };

        class onHitTestTarget{
            file = "\cgqc\functions\fnc_onHitTestTarget.sqf";
            description = "Target is hit in the test targets";
        };
        class onHitRange{
            file = "\cgqc\functions\fnc_onHitRange.sqf";
            description = "Target is hit in the range";
        };
        class onHit{
            file = "\cgqc\functions\fnc_onHit.sqf";
            description = "Target is hit";
        };
        class envReport{
            file = "\cgqc\functions\fnc_envReport.sqf";
            description = "Create environment report";
        };
        class sniping{
            file = "\cgqc\functions\fnc_sniping.sqf";
            description = "All the new sniping thingys";
        };
        class createTarget{
            file = "\cgqc\functions\fnc_createTarget.sqf";
            description = "Create sniping targets";
        };
        class createSoldier{
            file = "\cgqc\functions\fnc_createSoldier.sqf";
            description = "Create sniping soldiers";
        };
        class generateTargets{
            file = "\cgqc\functions\fnc_generateTargets.sqf";
            description = "Generate some random targets around the player";
        };
        class targetHit{
            file = "\cgqc\functions\fnc_targetHit.sqf";
            description = "Reaction to target hit";
        };
        class trainingQualification{
            file = "\cgqc\functions\fnc_trainingQualification.sqf";
            description = "Qualifications diverses";
        };
        class getRandomOptic{
            file = "\cgqc\functions\fnc_getRandomOptic.sqf";
            description = "Pick a random optic of the right kind and modset";
        };
        class inspectPara{
            file = "\cgqc\functions\fnc_inspectPara.sqf";
            description = "Inspect parachute setup";
        };
        class perksFieldcraft{
            file = "\cgqc\functions\fnc_perksFieldcraft.sqf";
            description = "All the fieldcraft stuff";
        };
        class exportPistol{
            file = "\cgqc\functions\fnc_exportPistol.sqf";
            description = "Export custom pistol to settings";
        };
        class routeplanner{
            file = "\cgqc\functions\fnc_routeplanner.sqf";
            description = "Semi automated route planning";
        };
        class speedLimiter{
            file = "\cgqc\functions\fnc_speedLimiter.sqf";
            description = "Custom speed limiter menu";
        };
        class markClear{
            file = "\cgqc\functions\fnc_markClear.sqf";
            description = "Mark building clear";
        };
        class centerMap{
            file = "\cgqc\functions\fnc_centerMap.sqf";
            description = "Set map position when opening";
        };
        class renameVic{
            file = "\cgqc\functions\fnc_renameVic.sqf";
            description = "Rename vehicle";
        };
        class renameVicAuto{
            file = "\cgqc\functions\fnc_renameVicAuto.sqf";
            description = "Rename vehicle according to team";
        };
        class showObjectName{
            file = "\cgqc\functions\fnc_showObjectName.sqf";
            description = "Show object name";
        };
        class toggleUI{
            file = "\cgqc\functions\fnc_toggleUI.sqf";
            description = "Hide/show the whole UI";
        };
        class bluforceTracker{
            file = "\cgqc\functions\fnc_bluforceTracker.sqf";
            description = " Handle bluforce tracker sheeits";
        };
        class switchNonLethal{
            file = "\cgqc\functions\fnc_switchNonLethal.sqf";
            description = "Switch to nonLethal setup";
        };
        class removeAll{
            file = "\cgqc\functions\fnc_removeAll.sqf";
            description = "Remove and reset everything on player loadout";
        };
        class dropStuff{
            file = "\cgqc\functions\fnc_dropStuff.sqf";
            description = "Handles the dropping of stuff";
        };
        class notifyAll{
            file = "\cgqc\functions\fnc_notifyAll.sqf";
            description = "Handles global messages";
        };
        class gamestate{
            file = "\cgqc\functions\fnc_gamestate.sqf";
            description = "Handles the gamestate flow";
        };
        class fireteam{
            file = "\cgqc\functions\fnc_fireteam.sqf";
            description = "Handles the CGQC subgroups fireteam";
        };
        class listRadios{
            file = "\cgqc\functions\fnc_listRadios.sqf";
            description = "Returns a list of the unit radio and their settings";
        };
        class snapshot{
            file = "\cgqc\functions\fnc_snapshot.sqf";
            description = "Handles saving and reloading of stuffs";
        };
        class loadGroupInfo{
            file = "\cgqc\functions\fnc_loadGroupInfo.sqf";
            description = "Load all of the info about groups and members";
        };
        class playerUnconscious{
            file = "\cgqc\functions\fnc_playerUnconscious.sqf";
            description = "Handle player unconciousness";
        };
        class promotePlayer{
            file = "\cgqc\functions\fnc_promotePlayer.sqf";
            description = "Boost level of player so he has access to items/roles";
        };
        class setLeadership{
            file = "\cgqc\functions\fnc_setLeadership.sqf";
            description = "Set leadership level of player";
        };
        class setTeamColorReloadAll{
            file = "\cgqc\functions\fnc_setTeamColorReloadAll.sqf";
            description = "Reload all colors";
        };
        class setTeamColorReload{
            file = "\cgqc\functions\fnc_setTeamColorReload.sqf";
            description = "Reload colors";
        };
        class setTeamColor{
            file = "\cgqc\functions\fnc_setTeamColor.sqf";
            description = "Set team color";
        };
        class loadDiaryRoster{
            file = "\cgqc\functions\fnc_loadDiaryRoster.sqf";
            description = "Load current group rosters";
        };
        class loadDiaryRecord{
            file = "\cgqc\functions\fnc_loadDiaryRecord.sqf";
            description = "Load player Service Record";
        };

        class copyClackerCheck{
            file = "\cgqc\functions\fnc_copyClackerCheck.sqf";
            description = "Check if clacker codes can be copied from target";
        };
        class copyClacker{
            file = "\cgqc\functions\fnc_copyClacker.sqf";
            description = "Copy clacker codes";
        };
        class whistle{
            file = "\cgqc\functions\fnc_whistle.sqf";
            description = "Whistle stuff";
        };
        class setGroupRadios{
            file = "\cgqc\functions\fnc_setGroupRadios.sqf";
            description = "Set radio channels depending on group";
        };
        class joinGroup{
            file = "\cgqc\functions\fnc_joinGroup.sqf";
            description = "Group stuffs";
        };
        class arma{
            file = "\cgqc\functions\fnc_arma.sqf";
            description = "Functions to deal with debug/mulligans";
        };
        class setACRE{
            file = "\cgqc\functions\fnc_setACRE.sqf";
            description = "Set ACRE stuffs";
        };
        class getKey{
            file = "\cgqc\functions\fnc_getKey.sqf";
            description = "Get key to target vehicle";
        };
        class lockChannels{
            file = "\cgqc\functions\fnc_lockChannels.sqf";
            description = "Lock some chat channels";
        };
        class setVoiceVolume{
            file = "\cgqc\functions\fnc_setVoiceVolume.sqf";
            description = "Quick set voice to specified volume";
        };
        class removePrimary{
            file = "\cgqc\functions\fnc_removePrimary.sqf";
            description = "Remove primary gun and mags ";
        };
        class removeHandgun{
            file = "\cgqc\functions\fnc_removeHandgun.sqf";
            description = "Remove handgun and mags ";
        };
        class loadLoadout{
            file = "\cgqc\functions\fnc_loadLoadout.sqf";
            description = "Load selected uniform items ";
        };
        class loadoutPrep{
            file = "\cgqc\functions\fnc_loadoutPrep.sqf";
            description = "Prep the player for loadout switch";
        };
        class getLinkedItems{
            file = "\cgqc\functions\fnc_getLinkedItems.sqf";
            description = "Get basic linked items and NVG's";
        };
        class getCustomHandgun{
            file = "\cgqc\functions\fnc_getCustomHandgun.sqf";
            description = "Get player custom handgun from config";
        };
        class resetTraits{
            file = "\cgqc\functions\fnc_resetTraits.sqf";
            description = "Remove all traits from target";
        };
        class loadoutRemoveAll{
            file = "\cgqc\functions\fnc_loadoutRemoveAll.sqf";
            description = "Remove everything from unit";
        };
        class preInit{
            file = "\cgqc\XEH_preInit.sqf";
            description = "Set everything that needs to be there before editor/menu/briefing";
        };
        class preInitServer{
            file = "\cgqc\XEH_preInitServer.sqf";
            description = "Set everything that needs to be there before editor/menu/briefing";
        };
        class preInitClient{
            file = "\cgqc\XEH_preInitClient.sqf";
            description = "Set everything that needs to be there before editor/menu/briefing";
        };
        class postInit{
            file = "\cgqc\XEH_postInit.sqf";
            description = "Start everything before everything";
        };
        class postInitClient{
            file = "\cgqc\XEH_postInitClient.sqf";
            description = "Start everything player related";
        };
        class postInitServer{
            file = "\cgqc\XEH_postInitServer.sqf";
            description = "Start everything server related";
        };

        class trainingCqb{
            file = "\cgqc\functions\fnc_trainingCqb.sqf";
            description = "Cqb shenanigans";
        };
        class trainingDefense{
            file = "\cgqc\functions\fnc_trainingDefense.sqf";
            description = "Wave defense mission";
        };
        class trainingHeli{
            file = "\cgqc\functions\fnc_trainingHeli.sqf";
            description = "Helicopter training";
        };
        class trainingKOTH{
            file = "\cgqc\functions\fnc_trainingKOTH.sqf";
            description = "King of the hill stuff";
        };
        class trainingMedical{
            file = "\cgqc\functions\fnc_trainingMedical.sqf";
            description = "Medical training";
        };
        class trainingPara{
            file = "\cgqc\functions\fnc_trainingPara.sqf";
            description = "Paradrop shenanigans";
        };
        class trainingSniping{
            file = "\cgqc\functions\fnc_trainingSniping.sqf";
            description = "Sniping shenanigans";
        };
        class trainingTime{
            file = "\cgqc\functions\fnc_trainingTime.sqf";
            description = "Sets time to current real-life date but sunrise and with nice clear weather";
        };
        class loadoutToClipboard{
            file = "\cgqc\functions\fnc_loadoutToClipboard.sqf";
            description = "Send cursorTarget's loadout to clipboard with everything to create new role";
        };
        class refuel{
            file = "\cgqc\functions\fnc_refuel.sqf";
            description = "Refuel/Repair/Ressupply";
        };
        class refuelSetup{
            file = "\cgqc\functions\fnc_refuelSetup.sqf";
            description = "Set up dynamic ressuply";
        };
        class loadoutConstructionVic{
            file = "\cgqc\functions\fnc_loadoutConstructionVic.sqf";
            description = "Add ADS to cgqc vehicles";
        };
        class addADS{
            file = "\cgqc\functions\fnc_addADS.sqf";
            description = "Add ADS to cgqc vehicles";
        };
        class inspect{
            file = "\cgqc\functions\fnc_inspect.sqf";
            description = "Inspect loadout of self or others";
        };
        class loadSupplyBox{
            file = "\cgqc\functions\fnc_loadSupplyBox.sqf";
            description = "Fill up dynamic supply box";
        };
        class loadMk3Menu{
            file = "\cgqc\functions\fnc_loadMk3Menu.sqf";
            description = " Ace menu for mk3 sheeits";
        };
        class showTransition{
            file = "\cgqc\functions\fnc_showTransition.sqf";
            description = "Black fadout/in with some information in some cases";
        };
        class switchStuff{
            file = "\cgqc\functions\fnc_switchStuff.sqf";
            description = "Switch vest/backpack for another version";
        };
        class dropChem{
            file = "\cgqc\functions\fnc_dropChem.sqf";
            description = "Drop various signals, not just chems";
        };
        class addMags{
            file = "\cgqc\functions\fnc_addMags.sqf";
            description = "Fill player with maximum mags according to settings";
        };
        class getCustomGun{
            file = "\cgqc\functions\fnc_getCustomGun.sqf";
            description = "Get custom gun if it exists";
        };
        class getCustomHelmet{
            file = "\cgqc\functions\fnc_getCustomHelmet.sqf";
            description = "Get custom helmet if it exists";
        };
        class switchUniform{
            file = "\cgqc\functions\fnc_switchUniform.sqf";
            description = "Switch player uniform";
        };
        class addSpares{
            file = "\cgqc\functions\fnc_addSpares.sqf";
            description = "Add spare tires/tracks to vehicles";
        };
        class addPerksSwitch{
            file = "\cgqc\functions\fnc_addPerksSwitch.sqf";
            description = "Add zeus perks on unit when Zeus takes control";
        };
        class mapShareList{
            file = "\cgqc\functions\fnc_mapShareList.sqf";
            description = "Show list of players that see your markers";
        };
        class addItemWithOverflow{
            file = "\cgqc\functions\fnc_addItemWithOverflow.sqf";
            description = "Add items to uniform/vest/backpack/ground";
        };
        class openBandolier{
            file = "\cgqc\functions\fnc_openBandolier.sqf";
            description = "Open ammo bandoliers";
        };
        class openMedical{
            file = "\cgqc\functions\fnc_openMedical.sqf";
            description = "Open the medical pouches";
        };
        class training{
            file = "\cgqc\functions\fnc_training.sqf";
            description = "Various training related shenanigans";
        };
        class checkLoadout{
            file = "\cgqc\functions\fnc_checkLoadout.sqf";
            description = "Check if a loadout exist for that unit type";
        };
        class switchRole{
            file = "\cgqc\functions\fnc_switchRole.sqf";
            description = "Switch player role";
        };
        class getStuff{
            file = "\cgqc\functions\fnc_getStuff.sqf";
            description = "Get various items and things";
        };
        class getRadioPresets{
            file = "\cgqc\functions\fnc_getRadioPresets.sqf";
            description = "Get and set radios ";
        };
        class setRadios{
            file = "\cgqc\functions\fnc_setRadios.sqf";
            description = "Setup radios according to preset";
        };
        class addRadios{
            file = "\cgqc\functions\fnc_addRadios.sqf";
            description = "Add some specific radios to player";
        };
        class removeRadios{
            file = "\cgqc\functions\fnc_removeRadios.sqf";
            description = "Remove all radios on player";
        };
        class nameRadios {
            file = "\cgqc\functions\fnc_nameRadios.sqf";
            description = "Set radio channel names";
        };
        class switchPrimary{
            file = "\cgqc\functions\fnc_switchPrimary.sqf";
            description = "Switch primary weapon";
        };
        class switchOptics{
            file = "\cgqc\functions\fnc_switchOptics.sqf";
            description = "Switch optics";
        };
        class switchPerks{
            file = "\cgqc\functions\fnc_switchPerks.sqf";
            description = "Switch role perks";
        };
        class trainingLoadMenu{
            file = "\cgqc\functions\fnc_trainingLoadMenu.sqf";
            description = "Load training ace-interaction menu";
        };
        class trainingMortar{
            file = "\cgqc\functions\fnc_trainingMortar.sqf";
            description = "Manual mortar training ";
        };
        class perkGoggles{
            file = "\cgqc\functions\fnc_perksGoggles.sqf";
            description = "Change goggles";
        };
        class isDaytime {
            file = "\cgqc\functions\fnc_isDaytime.sqf";
            description = "Check if Daytime Operation";
        };
        class keepPatch {
            file = "\cgqc\functions\fnc_keepPatch.sqf";
            description = "Make sure the player patch stays";
        };
        class setPatch {
            file = "\cgqc\functions\fnc_setPatch.sqf";
            description = "Set and keep player patch on";
        };
        class findPatch {
            file = "\cgqc\functions\fnc_findPatch.sqf";
            description = "Match steam ID of known players and find patchs";
        };
        class findRank {
            file = "\cgqc\functions\fnc_findRank.sqf";
            description = "Match name prefix with rank";
        };
        class showWelcome {
            file = "\cgqc\functions\fnc_showWelcome.sqf";
            description = "Prep un message de bienvenue semi-random";
        };
        class loadDiary {
            file = "\cgqc\functions\fnc_loadDiary.sqf";
            description = "Post group info in default briefing";
        };
        class addPerks {
            file = "\cgqc\functions\fnc_addPerks.sqf";
            description = "Add all perks to player";
        };
        class setZeus {
            file = "\cgqc\functions\fnc_setZeus.sqf";
            description = "Set zeus and keeps them there";
        };
        class maxMags {
            file = "\cgqc\functions\fnc_maxMags.sqf";
            description = "Limit maximum mags on player";
        };
        class playerKilled {
            file = "\cgqc\functions\fnc_playerKilled.sqf";
            description = "Code in the event a player gets dead";
        };
        class playerRespawned {
            file = "\cgqc\functions\fnc_playerRespawned.sqf";
            description = "Code in the event a player respawns";
        };
        class showIntro {
            file = "\cgqc\functions\fnc_showIntro.sqf";
            description = "Show intro on load";
        };
        class perksBasic {
            file = "\cgqc\functions\fnc_perksBasic.sqf";
            description = "Perks for the everyman";
        };
        class perksRecon {
            file = "\cgqc\functions\fnc_perksRecon.sqf";
            description = "Perks for the camoman";
        };
        class perksPilot {
            file = "\cgqc\functions\fnc_perksPilot.sqf";
            description = "Perks for the flyingman";
        };
        class perksZeus {
            file = "\cgqc\functions\fnc_perksZeus.sqf";
            description = "Perks for the gods";
        };
        class checkZeus {
            file = "\cgqc\functions\fnc_checkZeus.sqf";
            description = "Check if player is zeus";
        };
        class getRankedBeret {
            file = "\cgqc\functions\fnc_getRankedBeret.sqf";
            description = "Find beret for current rank";
        };
    };
};