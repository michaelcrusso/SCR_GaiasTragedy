//<MCCS Interaction modes//>

Trigger("Player 2"){
Conditions:
	Deaths("Current Player", "Young Chrysalis", Exactly, 0);
	Bring("Current Player", "Yggdrasill (Overlord)", "PassiveP2", Exactly, 1);

Actions:
	Move Unit("Current Player", "Any unit", All, "PassiveP2", "ActiveP2");
	Preserve Trigger();
	Display Text Message(Always Display, "MCCS Set to combat mode.");
	Play WAV("staredit\\wav\\MCCSC.wav", 3862);
	Set Deaths("Current Player", "Young Chrysalis", Set To, 1);
	Comment("Set active mode");
}

//-----------------------------------------------------------------//

Trigger("Player 3"){
Conditions:
	Deaths("Current Player", "Young Chrysalis", Exactly, 0);
	Bring("Current Player", "Yggdrasill (Overlord)", "PassiveP3", Exactly, 1);

Actions:
	Move Unit("Current Player", "Any unit", All, "PassiveP3", "ActiveP3");
	Preserve Trigger();
	Display Text Message(Always Display, "MCCS Set to combat mode.");
	Play WAV("staredit\\wav\\MCCSC.wav", 3862);
	Set Deaths("Current Player", "Young Chrysalis", Set To, 1);
	Comment("Set active mode");
}

//-----------------------------------------------------------------//

Trigger("Player 4"){
Conditions:
	Deaths("Current Player", "Young Chrysalis", Exactly, 0);
	Bring("Current Player", "Yggdrasill (Overlord)", "PassiveP4", Exactly, 1);

Actions:
	Move Unit("Current Player", "Any unit", All, "PassiveP4", "ActiveP4");
	Preserve Trigger();
	Display Text Message(Always Display, "MCCS Set to combat mode.");
	Play WAV("staredit\\wav\\MCCSC.wav", 3862);
	Set Deaths("Current Player", "Young Chrysalis", Set To, 1);
	Comment("Set active mode");
}

//-----------------------------------------------------------------//

Trigger("Player 2"){
Conditions:
	Deaths("Current Player", "Young Chrysalis", Exactly, 0);
	Bring("Current Player", "Yggdrasill (Overlord)", "ActiveP2", Exactly, 1);

Actions:
	Move Unit("Current Player", "Any unit", All, "ActiveP2", "PassiveP2");
	Preserve Trigger();
	Display Text Message(Always Display, "MCCS Set to passive mode.");
	Set Deaths("Current Player", "Young Chrysalis", Set To, 1);
	Comment("Set inactive mode");
	Play WAV("staredit\\wav\\MCCSP.wav", 3463);
}

//-----------------------------------------------------------------//

Trigger("Player 3"){
Conditions:
	Deaths("Current Player", "Young Chrysalis", Exactly, 0);
	Bring("Current Player", "Yggdrasill (Overlord)", "ActiveP3", Exactly, 1);

Actions:
	Move Unit("Current Player", "Any unit", All, "ActiveP3", "PassiveP3");
	Preserve Trigger();
	Display Text Message(Always Display, "MCCS Set to passive mode.");
	Set Deaths("Current Player", "Young Chrysalis", Set To, 1);
	Comment("Set inactive mode");
	Play WAV("staredit\\wav\\MCCSP.wav", 3463);
}

//-----------------------------------------------------------------//

Trigger("Player 4"){
Conditions:
	Deaths("Current Player", "Young Chrysalis", Exactly, 0);
	Bring("Current Player", "Yggdrasill (Overlord)", "ActiveP4", Exactly, 1);

Actions:
	Move Unit("Current Player", "Any unit", All, "ActiveP4", "PassiveP4");
	Preserve Trigger();
	Display Text Message(Always Display, "MCCS Set to passive mode.");
	Set Deaths("Current Player", "Young Chrysalis", Set To, 1);
	Comment("Set inactive mode");
	Play WAV("staredit\\wav\\MCCSP.wav", 3463);
}

//<MCCS Interaction switches//>

Trigger("Player 1"){
Conditions:
	Elapsed Time(Exactly, 0);

Actions:
	Create Unit("Current Player", "Zerg Broodling", 1, "PassiveP1");
	Comment("Create MCCS switches");
}

//-----------------------------------------------------------------//

Trigger("Player 2"){
Conditions:
	Elapsed Time(Exactly, 0);

Actions:
	Create Unit("Current Player", "Zerg Broodling", 1, "ActiveP2");
	Comment("Create MCCS switches");
}

//-----------------------------------------------------------------//

Trigger("Player 3"){
Conditions:
	Elapsed Time(Exactly, 0);

Actions:
	Create Unit("Current Player", "Zerg Broodling", 1, "ActiveP3");
	Comment("Create MCCS switches");
}

//-----------------------------------------------------------------//

Trigger("Player 4"){
Conditions:
	Elapsed Time(Exactly, 0);

Actions:
	Create Unit("Current Player", "Zerg Broodling", 1, "ActiveP4");
	Comment("Create MCCS switches");
}

//-----------------------------------------------------------------//

Trigger("Player 2"){
Conditions:
	Bring("Current Player", "Zerg Broodling", "Ground", Exactly, 1);

Actions:
	Set Deaths("Current Player", "Young Chrysalis", Subtract, 1);
	Preserve Trigger();
	Comment("Inventory movement switch");
}

//-----------------------------------------------------------------//

Trigger("Player 3"){
Conditions:
	Bring("Current Player", "Zerg Broodling", "Ground", Exactly, 1);

Actions:
	Set Deaths("Current Player", "Young Chrysalis", Subtract, 1);
	Preserve Trigger();
	Comment("Inventory movement switch");
}

//-----------------------------------------------------------------//

Trigger("Player 4"){
Conditions:
	Bring("Current Player", "Zerg Broodling", "Ground", Exactly, 1);

Actions:
	Set Deaths("Current Player", "Young Chrysalis", Subtract, 1);
	Preserve Trigger();
	Comment("Inventory movement switch");
}

//-----------------------------------------------------------------//Trigger("Player 5"){
Conditions:
	Elapsed Time(Exactly, 0);

Actions:
	Create Unit("Player 5", "Terran Dropship", 1, "Dropship Start");
	Order("Player 5", "Terran Dropship", "Dropship Start", "Dropship End", move);
	Set Switch("Switch1", set);
	Comment("Intro start");
}

//-----------------------------------------------------------------//

Trigger("Player 5"){
Conditions:
	Bring("Player 5", "Terran Dropship", "Dropship End", Exactly, 1);

Actions:
	Set Switch("Switch1", clear);
	Play WAV("sound\\Misc\\TDrTra01.wav", 2490);
	Create Unit("Player 5", "Terran Civilian", 4, "Create Mercs");
	Wait(1000);
	Comment("Create mercs");
}

//-----------------------------------------------------------------//

Trigger("Player 1", "Player 2", "Player 3", "Player 4", "Player 5"){
Conditions:
	Command("Player 5", "Terran Dropship", Exactly, 1);

Actions:
	Run AI Script("+Vi4");
	Set Alliance Status("Player 1", Ally);
	Set Alliance Status("Player 2", Ally);
	Set Alliance Status("Player 3", Ally);
	Set Alliance Status("Player 4", Ally);
	Set Alliance Status("Player 5", Ally);
	Comment("Intro vision");
}

//-----------------------------------------------------------------//

Trigger("Player 1", "Player 2", "Player 3", "Player 4", "Player 5"){
Conditions:
	Switch("Switch1", Set);
	Elapsed Time(At most, 40);

Actions:
	Move Location("Player 5", "Terran Dropship", "Intro", "Follow P5");
	Preserve Trigger();
	Center View("Follow P5");
	Comment("Intro follow");
}

//-----------------------------------------------------------------//

Trigger("Player 1", "Player 2", "Player 3", "Player 4", "Player 5"){
Conditions:
	Elapsed Time(Exactly, 40);

Actions:
	Run AI Script("-Vi4");
	Comment("Intro vision off");
}

//-----------------------------------------------------------------//

Trigger("Player 1"){
Conditions:
	Switch("Switch1", Not Set);

Actions:
	Run AI Script("-Vi1");
	Run AI Script("-Vi2");
	Run AI Script("-Vi3");
	Preserve Trigger();
	Comment("Allied vision off");
}

//-----------------------------------------------------------------//

Trigger("Player 2"){
Conditions:
	Switch("Switch1", Not Set);

Actions:
	Run AI Script("-Vi0");
	Run AI Script("-Vi2");
	Run AI Script("-Vi3");
	Preserve Trigger();
	Comment("Allied vision off");
}

//-----------------------------------------------------------------//

Trigger("Player 3"){
Conditions:
	Switch("Switch1", Not Set);

Actions:
	Run AI Script("-Vi0");
	Run AI Script("-Vi1");
	Run AI Script("-Vi3");
	Preserve Trigger();
	Comment("Allied vision off");
}

//-----------------------------------------------------------------//

Trigger("Player 4"){
Conditions:
	Switch("Switch1", Not Set);

Actions:
	Run AI Script("-Vi0");
	Run AI Script("-Vi1");
	Run AI Script("-Vi2");
	Preserve Trigger();
	Comment("Allied vision off");
}

//-----------------------------------------------------------------//

Trigger("Player 1", "Player 2", "Player 3", "Player 4"){
Conditions:
	Bring("Player 5", "Terran Dropship", "Dropship End", Exactly, 1);

Actions:
	Display Text Message(Always Display, "Welcome to Gaia II, mercenaries.\r\n\r\nYour transport has touched down at the FPG's outpost the continent of Iros.\r\n\r\nThe Koga empire once restricted travel here, as the continent is overrun with strange\r\nmutants and rogue droids. You will find no shortage of work here, but first you will\r\nneed your power armor. \r\n\r\nStep down the ramp to obtain your MechaCorp power armor. Detailed information\r\nhas been provided for each model.");
	Center View("Create Mercs");
	Comment("Intro text");
}

//-----------------------------------------------------------------//


Trigger("Player 1"){
Conditions:
	Command("Current Player", "Yggdrasill (Overlord)", Exactly, 1);
	Elapsed Time(Exactly, 40);

Actions:
	Give Units to Player("Player 5", "Current Player", "Terran Civilian", 1, "Create Mercs");
	Play WAV("sound\\Misc\\TRescue.wav", 1896);
	Comment("Give mercs");
}

//-----------------------------------------------------------------//

Trigger("Player 2"){
Conditions:
	Command("Current Player", "Yggdrasill (Overlord)", Exactly, 1);
	Elapsed Time(Exactly, 40);

Actions:
	Give Units to Player("Player 5", "Current Player", "Terran Civilian", 1, "Create Mercs");
	Play WAV("sound\\Misc\\TRescue.wav", 1896);
	Comment("Give mercs");
}

//-----------------------------------------------------------------//

Trigger("Player 3"){
Conditions:
	Command("Current Player", "Yggdrasill (Overlord)", Exactly, 1);
	Elapsed Time(Exactly, 40);

Actions:
	Give Units to Player("Player 5", "Current Player", "Terran Civilian", 1, "Create Mercs");
	Play WAV("sound\\Misc\\TRescue.wav", 1896);
	Comment("Give mercs");
}

//-----------------------------------------------------------------//

Trigger("Player 4"){
Conditions:
	Command("Current Player", "Yggdrasill (Overlord)", Exactly, 1);
	Elapsed Time(Exactly, 40);

Actions:
	Give Units to Player("Player 5", "Current Player", "Terran Civilian", 1, "Create Mercs");
	Play WAV("sound\\Misc\\TRescue.wav", 1896);
	Comment("Give mercs");
}

//-----------------------------------------------------------------//

Trigger("Player 1"){
Conditions:
	Elapsed Time(Exactly, 30);

Actions:
	Run AI Script At Location("EnTr", "PassiveP1");
	Preserve Trigger();
}

//-----------------------------------------------------------------//

Trigger("Player 1"){
Conditions:
	Elapsed Time(Exactly, 0);

Actions:
	Give Units to Player("Player 12", "Player 1", "Any unit", All, "Ground");
}

//-----------------------------------------------------------------//
Trigger("Player 1"){
Conditions:
	Always();

Actions:
	Move Unit("Player 1", "Yggdrasill (Overlord)", All, "Ground", "PassiveP1");
	Preserve Trigger();
}

//-----------------------------------------------------------------//

Trigger("Player 2"){
Conditions:
	Bring("Player 2", "Yggdrasill (Overlord)", "PassiveP2", Exactly, 1);

Actions:
	Move Unit("Player 2", "Yggdrasill (Overlord)", 1, "PassiveP2", "PassiveP2");
	Comment("Hold passive 2");
	Preserve Trigger();
}

//-----------------------------------------------------------------//

Trigger("Player 3"){
Conditions:
	Bring("Player 3", "Yggdrasill (Overlord)", "PassiveP3", Exactly, 1);

Actions:
	Move Unit("Player 3", "Yggdrasill (Overlord)", 1, "PassiveP3", "PassiveP3");
	Comment("Hold passive 3");
	Preserve Trigger();
}

//-----------------------------------------------------------------//

Trigger("Player 4"){
Conditions:
	Bring("Player 4", "Yggdrasill (Overlord)", "PassiveP4", Exactly, 1);

Actions:
	Move Unit("Player 4", "Yggdrasill (Overlord)", 1, "PassiveP4", "PassiveP4");
	Comment("Hold passive 4");
	Preserve Trigger();
}

//-----------------------------------------------------------------//

Trigger("Player 2"){
Conditions:
	Bring("Player 2", "Yggdrasill (Overlord)", "ActiveP2", Exactly, 1);

Actions:
	Move Unit("Player 2", "Yggdrasill (Overlord)", 1, "ActiveP2", "ActiveP2");
	Comment("Hold active 2");
	Preserve Trigger();
}

//-----------------------------------------------------------------//

Trigger("Player 3"){
Conditions:
	Bring("Player 3", "Yggdrasill (Overlord)", "ActiveP3", Exactly, 1);

Actions:
	Move Unit("Player 3", "Yggdrasill (Overlord)", 1, "ActiveP3", "ActiveP3");
	Comment("Hold active 3");
	Preserve Trigger();
}

//-----------------------------------------------------------------//

Trigger("Player 4"){
Conditions:
	Bring("Player 4", "Yggdrasill (Overlord)", "ActiveP4", Exactly, 1);

Actions:
	Move Unit("Player 4", "Yggdrasill (Overlord)", 1, "ActiveP4", "ActiveP4");
	Comment("Hold active 4");
	Preserve Trigger();
}

//-----------------------------------------------------------------////<Sharpshooter Selection//>

Trigger("Player 1"){
Conditions:
	Bring("Player 1", "Alexei Stukov (Ghost)", "PassiveP1", Exactly, 1);
	Bring("Player 1", "Alexei Stukov (Ghost)", "Ground", Exactly, 1);
	Bring("Player 1", "Terran Civilian", "Sharpshooter Info", Exactly, 1);
	Deaths("Player 1", "Terran Beacon", Exactly, 2);

Actions:
	Set Deaths("Player 1", "Terran Beacon", Set To, 3);
	Center View("Buy Sharpshooter");
	Display Text Message(Always Display, "This is the sharpshooter. He is very cool. To buy him, switch your MCCS to active\r\nmode and select interact once again. To exit and view another power armor, simply\r\nselect interact a second time in passive mode.");
	Preserve Trigger();
}

//-----------------------------------------------------------------//

Trigger("Player 1"){
Conditions:
	Bring("Player 1", "Alexei Stukov (Ghost)", "Invalid Location", Exactly, 1);
	Bring("Player 1", "Alexei Stukov (Ghost)", "Ground", Exactly, 1);
	Deaths("Player 1", "Terran Beacon", At least, 3);

Actions:
	Remove Unit("Player 1", "Terran Civilian");
	Create Unit("Player 1", "Terran Ghost", 1, "Sharpshooter Info");
	Display Text Message(Always Display, "You have selected the sharpshooter. This concludes the brief tutorial phase of the\r\nMCCS system. You are now free to explore the world of Gaia II!");
	Set Deaths("Player 1", "Terran Beacon", Set To, 0);
}

//-----------------------------------------------------------------//

Trigger("Player 1"){
Conditions:
	Bring("Player 1", "Alexei Stukov (Ghost)", "PassiveP1", Exactly, 1);
	Bring("Player 1", "Alexei Stukov (Ghost)", "Ground", Exactly, 1);
	Deaths("Player 1", "Terran Beacon", Exactly, 3);

Actions:
	Set Deaths("Player 1", "Terran Beacon", Set To, 4);
	Center View("Create Mercs");
	Display Text Message(Always Display, "You have exited the Sharpshooter selection menu.");
	Preserve Trigger();
	Move Unit("Player 1", "Terran Civilian", All, "Sharpshooter Info", "Create Mercs");
	Display Text Message(Always Display, "BOOM BOOM BOOM");
}

//-----------------------------------------------------------------//

Trigger("Player 1"){
Conditions:
	Bring("Player 1", "Alexei Stukov (Ghost)", "PassiveP1", Exactly, 1);
	Bring("Player 1", "Alexei Stukov (Ghost)", "Ground", Exactly, 1);
	Bring("Player 1", "Terran Civilian", "Sharpshooter Info", Exactly, 1);
	Deaths("Player 1", "Terran Beacon", Exactly, 4);

Actions:
	Center View("Buy Sharpshooter");
	Display Text Message(Always Display, "This is the sharpshooter. He is very cool. To buy him, switch your MCCS to active\r\nmode and select interact once again. To exit and view another power armor, simply\r\nselect interact a second time in passive mode.");
	Preserve Trigger();
}

//-----------------------------------------------------------------//

Trigger("Player 1"){
Conditions:
	Bring("Player 1", "Alexei Stukov (Ghost)", "Invalid Location", Exactly, 1);
	Bring("Player 1", "Alexei Stukov (Ghost)", "Ground", Exactly, 1);
	Deaths("Player 1", "Terran Beacon", Exactly, 4);

Actions:
	Remove Unit("Player 1", "Terran Civilian");
	Create Unit("Player 1", "Terran Ghost", 1, "Sharpshooter Info");
	Display Text Message(Always Display, "You have selected the sharpshooter.");
	Set Deaths("Player 1", "Terran Beacon", Set To, 0);
}

//-----------------------------------------------------------------//

Trigger("Player 1"){
Conditions:
	Never();

Actions:
	Display Text Message(Always Display, "Exited Sharpshooter selection menu.");
	Move Unit("Current Player", "Terran Civilian", 1, "Sharpshooter Info", "Create Mercs");
}

//-----------------------------------------------------------------//

Trigger("Player 1", "Player 2", "Player 3", "Player 4"){
Conditions:
	Bring("Current Player", "Terran Civilian", "Stop", At least, 1);

Actions:
	Display Text Message(Always Display, "You must acquire a MechaCorp power armor suit before leaving the area.");
	Move Unit("Current Player", "Terran Civilian", All, "Stop", "Create Mercs");
	Preserve Trigger();
	Comment("Pick class first");
}

//-----------------------------------------------------------------//

Trigger("Player 1"){
Conditions:
	Bring("Current Player", "Terran Civilian", "Sharpshooter Info", Exactly, 1);

Actions:
	Display Text Message(Always Display, "Before purchasing a MechaCorp power armor, you must first read the description.\r\n\r\nWe'll use this opportunity to get you acquainted with the system you'll use to interact\r\nwith the rest of Gaia II - The MechaCorp Combat Suite, or MCCS for short.");
	Set Deaths("Player 1", "Terran Beacon", Set To, 1);
}

//-----------------------------------------------------------------//

Trigger("Player 1"){
Conditions:
	Deaths("Player 1", "Terran Beacon", Exactly, 1);

Actions:
	Center View("PassiveP1");
	Display Text Message(Always Display, "This is your MechaCorp Combat Suite, which you will use throughout your journey.\r\n\r\nNote: You MUST hotkey your MCCS before continuing!\r\n\r\nYou will notice you currently have two options: The Active/Passive switch, and \r\nInteract/Talk/Use.\r\n\r\nSwitching from passive to active mode will enable you to interact with the world\r\ndifferently. Select your interaction option to view information about the power armor\r\nyou're standing next to now.");
	Preserve Trigger();
	Set Deaths("Player 1", "Terran Beacon", Set To, 2);
}

//-----------------------------------------------------------------//

Trigger("Player 6"){
Conditions:
	Switch("Switch2", Not Set);

Actions:
	Wait(0);
	Set Switch("Switch2", set);
	Wait(0);
	Preserve Trigger();
}

//-----------------------------------------------------------------//

Trigger("Player 7"){
Conditions:
	Switch("Switch2", Set);

Actions:
	Wait(0);
	Set Switch("Switch2", clear);
	Wait(0);
	Preserve Trigger();
}

//-----------------------------------------------------------------//

Trigger("Player 5"){
Conditions:
	Elapsed Time(Exactly, 40);

Actions:
	Order("Player 5", "Terran Civilian", "Create Mercs", "Send retards", move);
	Comment("Herd retards - regards, the retard handler.");
}

//-----------------------------------------------------------------//

Trigger("Player 5"){
Conditions:
	Bring("Player 5", "Terran Civilian", "Send retards", At least, 1);

Actions:
	Remove Unit At Location("Player 5", "Terran Civilian", All, "Send retards");
	Comment("Dispose of retards - regards, the retard handler.");
	Preserve Trigger();
}

//-----------------------------------------------------------------//


Trigger("Player 1"){
Conditions:
	Bring("Player 1", "Zerg Broodling", "PassiveP1", Exactly, 1);
	Bring("Player 1", "Zerg Broodling", "Ground", Exactly, 1);
	Bring("Player 1", "Zerg Zergling", "PassiveP1", Exactly, 1);

Actions:
	Move Location("Player 1", "Zerg Defiler", "Ground", "PassiveP1");
	Preserve Trigger();
}

//-----------------------------------------------------------------//

Trigger("Player 1"){
Conditions:
	Bring("Player 1", "Zerg Broodling", "PassiveP1", Exactly, 1);
	Bring("Player 1", "Zerg Broodling", "Ground", Exactly, 1);
	Bring("Player 1", "Zerg Defiler", "PassiveP1", Exactly, 1);

Actions:
	Move Location("Player 1", "Zerg Zergling", "Ground", "PassiveP1");
	Preserve Trigger();
}

//-----------------------------------------------------------------//


