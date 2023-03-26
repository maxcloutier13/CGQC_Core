// --- welcome ----------------------------------------------------------
// Prep un message de bienvenue semi-random
_cgqc_welcome_pic = "";
_cgqc_welcome = "";
_cgqc_message = "";
if(cgqc_player_known) then {
	_welcome_list = ["Yo", "R’gard", "Allo", "Hello", "Ooooh", "Coucou", "Bonsoir", "Konnichiwa"];
	_message_list = [
		"what's up?", "what's up buddy?", "Time to fuck shit up", 
		"Asti que t'es beau", "Ça roule ma poule?", "As-tu couché ta blonde?", 
		"BAN dans 3,2,1...", "Prêt à répandre la démocratie dans l'monde?"
	];
	_cgqc_welcome = selectRandom _welcome_list;
	_cgqc_message = selectRandom _message_list;
	waitUntil {cgqc_player_patch_found};
	if(cgqc_player_23rd) then {
		_cgqc_welcome = "Sup 23rd! How you doin' ";
		_cgqc_welcome_pic = "<img size= '6' style='vertical-align:bottom' shadow='false' image='\cgqc\textures\23rd_logo_mod_ca.paa'/>";
	} else { //CGQC it is
		_cgqc_welcome_pic = format["<img size= '6' style='vertical-align:bottom' shadow='false' image='\cgqc\patches\%1.paa'/>", cgqc_player_patch];
	};
	_cgqc_welcome_message = format["<t size='2' >%1 %2!</t><br/><t>%3</t>", _cgqc_welcome, cgqc_player_steamName, _cgqc_message];
	cgqc_welcome_text = (_cgqc_welcome_pic + "<br/>" + _cgqc_welcome_message);
} else {
	// default text and patch ------------------------------------------------------------------------------------------
	//cgqc_welcome_text = ("<br/>" + "<br/>" + format["<t size='2' >Bonjour %1</t><br/><t>what's up?</t>", //cgqc_player_name]);
	cgqc_welcome_text = ("<br/>" + "<br/>" + "<t size='2' >Bonsoir, Visiteur!</t>" +
		"<br/>" + "<t size='1' >Joint nous sur teamspeak: ts.cgqc.ca</t>" +
		"<br/>" + "<t size='1' >Discord: CGQC.CA</t>");
		[ _text, 0, 0, 5, 2 ] spawn BIS_fnc_dynamicText;

};

// Welcome screen avec la patch et le message random
if (cgqc_setting_show_welcome) then {
	sleep 20;
	[ cgqc_welcome_text, 0, 0, 3, 2 ] spawn BIS_fnc_dynamicText;
};
true