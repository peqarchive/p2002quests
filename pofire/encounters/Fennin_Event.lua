--Fennin_Ro, The Tyrant of Fire Encounter
--By Daeron

--mob tables
local phase1_mobs = {217418,217419,217420,217421,217422,217424};
local phase2_mobs = {217418,217419,217424,217426,217439,217440,217450};
local council_mobs = {217428,217429,217449,217453};


local fail = false;
local phase2;
local council;

 
function event_encounter_load(e)
	--event variables
	EventReset();
	controller = eq.get_entity_list():GetMobByNpcTypeID(217066);	--#fennin_unloader (217066)
	
	--zone crash handling - checks to resume encounter
	CheckPhase();
	
	--registered events

	--Phase 1 (trash + Chaosfiends)
	eq.register_npc_event("Fennin_Event", Event.death_complete, 217418, PhaseCheck);	--a_chaos_healer_of_flame (217418)
	eq.register_npc_event("Fennin_Event", Event.death_complete, 217419, PhaseCheck);	--a_dark_magus_of_flame (217419)
	eq.register_npc_event("Fennin_Event", Event.death_complete, 217420, PhaseCheck);	--a_doomfire_chaosfiend (217420)
	eq.register_npc_event("Fennin_Event", Event.death_complete, 217421, PhaseCheck);	--a_doomfire_darkfiend (217421)
	eq.register_npc_event("Fennin_Event", Event.death_complete, 217422, PhaseCheck);	--a_doomfire_ragefiend (217422)
	eq.register_npc_event("Fennin_Event", Event.death_complete, 217424, PhaseCheck);	--a_rage_reaver_of_flame (217424)
		
	
	--Phase 2  (Balrogs)
	eq.register_npc_event("Fennin_Event", Event.death_complete, 217426, PhaseCheck);		--#Azobian_the_Darklord
	eq.register_npc_event("Fennin_Event", Event.death_complete, 217439, PhaseCheck);		--#Hebabbilys_the_Ragelord
	eq.register_npc_event("Fennin_Event", Event.death_complete, 217440, PhaseCheck);		--#Javonn_the_Overlord
	eq.register_npc_event("Fennin_Event", Event.death_complete, 217450, PhaseCheck);		--#Reaxnous_the_Chaoslord
	
	--Phase 3 (Council)
	eq.register_npc_event("Fennin_Event", Event.death_complete, 217428, CouncilCheck);		--#Chancellor_Kirtra (217428)
	eq.register_npc_event("Fennin_Event", Event.death_complete, 217429, CouncilCheck);		--#Chancellor_Traxom (217429)
	eq.register_npc_event("Fennin_Event", Event.death_complete, 217449, CouncilCheck);		--#Omni_Magus_Crato
	eq.register_npc_event("Fennin_Event", Event.death_complete, 217453, CouncilCheck);		--#Warlord_Prollaz

	--Fennin Killed
	eq.register_npc_event("Fennin_Event", Event.death_complete, 217436, EventWin);		--#Fennin_Ro,_The_Tyrant_of_Fire (217436)
	
	--Timers
	eq.register_npc_event("Fennin_Event", Event.timer, 217066, FailTimer);		--#fennin_unloader (217066)
end



function EventReset()
	eq.stop_all_timers();
	trash_counter = 0;
	balrog_counter = 0;
	council_counter = 0;
	fail = false;
	phase2 = false;
	council = false;
end

function CheckPhase()
	instance_id = eq.get_zone_instance_id();
	qglobals = eq.get_qglobals();
	if qglobals[instance_id .. "_PoFire_FenninEvent"] == "Phase2" then
		phase2 = true;
		fail_timer = 100;	--passes value in minutes
		Phase2Setup();		
	elseif qglobals[instance_id .. "_PoFire_FenninEvent"] == "Phase3" then
		council = true;
		fail_timer = 80;	--passes value in minutes
		Phase3Setup();
	elseif qglobals[instance_id .. "_PoFire_FenninEvent"] == "Phase4" then
		fail_timer = 60;	--passes value in minutes
		council = true;
		Phase4Setup();
	else
		fail_timer = 120;
		Phase1Setup();
	end
	UpdateFailTimer(fail_timer);
	
end

function UpdateFailTimer(mins)
	eq.stop_timer("fail",controller);
	eq.set_timer("fail",mins * 60 * 1000,controller);
	eq.GM_Message(5,string.format("[%s] Fail timer set to [%s] minutes",qglobals[instance_id .. "_PoFire_FenninEvent"],tonumber(mins)));
end

function Phase1Setup()
	eq.zone_emote(7,"The ground rumbles as the Guardian of Doomfire collapses to the ground dead. Then a loud booming voice is heard saying. 'Come little mortals! Feel the chaos of the fires that flame the dark rage. Test yourselves against the might of my armies!'");
	eq.set_global(eq.get_zone_instance_id() .. "_PoFire_FenninEvent","Phase1",3,"D3");
	--spawn 1 (Chaosfiend Cluster #1) - 6 spawn
	eq.spawn2(217424,0,0,-460,-1145,-205,124);	--a_rage_reaver_of_flame (217424)
	eq.spawn2(217418,0,0,-460,-1175,-205,124);	--a_chaos_healer_of_flame (217418)
	eq.spawn2(217424,0,0,-460,-1205,-205,124);	--a_rage_reaver_of_flame (217424)
	eq.spawn2(217420,0,0,-485,-1175,-205,124);	--a_doomfire_chaosfiend (217420)
	eq.spawn2(217419,0,0,-525,-1160,-205,124);	--a_dark_magus_of_flame (217419)
	eq.spawn2(217419,0,0,-525,-1190,-205,124);	--a_dark_magus_of_flame (217419)
	
	--spawn 2 (Chaosfiend Cluster #2) - 4 spawn
	eq.spawn2(217424,0,0,-465,-995,-170,254);	--a_rage_reaver_of_flame (217424)
	eq.spawn2(217424,0,0,-510,-995,-170,254);	--a_rage_reaver_of_flame (217424)
	eq.spawn2(217420,0,0,-485,-975,-170,254);	--a_doomfire_chaosfiend (217420)
	eq.spawn2(217418,0,0,-485,-945,-170,254);	--a_chaos_healer_of_flame (217418)
	
	--spawn 3 (Chaosfiend Cluster #3) - 5 spawn
	eq.spawn2(217424,0,0,-575,-945,-150,124);	--a_rage_reaver_of_flame (217424)
	eq.spawn2(217424,0,0,-575,-995,-150,124);	--a_rage_reaver_of_flame (217424)
	eq.spawn2(217420,0,0,-580,-970,-150,124);	--a_doomfire_chaosfiend (217420)
	eq.spawn2(217418,0,0,-615,-955,-150,124);	--a_chaos_healer_of_flame (217418)
	eq.spawn2(217419,0,0,-615,-985,-150,124);	--a_dark_magus_of_flame (217419)
	
	--spawn 4 (Darkfiend Cluster #1) - 4 spawn
	eq.spawn2(217424,0,0,-670,-1095,-145,32);	--a_rage_reaver_of_flame (217424)
	eq.spawn2(217424,0,0,-722,-1088,-149,32);	--a_rage_reaver_of_flame (217424)
	eq.spawn2(217421,0,0,-705,-1095,-150,32);	--a_doomfire_darkfiend (217421)
	eq.spawn2(217419,0,0,-705,-1120,-145,32);	--a_dark_magus_of_flame (217419)
	
	--spawn 5 (Darkfiend Cluster #2) - 4 spawn
	eq.spawn2(217424,0,0,-625,-1170,-122,454);	--a_rage_reaver_of_flame (217424)
	eq.spawn2(217418,0,0,-620,-1205,-120,454);	--a_chaos_healer_of_flame (217418)
	eq.spawn2(217421,0,0,-605,-1190,-120,454);	--a_doomfire_darkfiend (217421)
	eq.spawn2(217419,0,0,-575,-1190,-120,454);	--a_dark_magus_of_flame (217419)
	
	--spawn 6 (Darkfiend Cluster #3) - 4 spawn
	eq.spawn2(217424,0,0,-600,-1320,-120,32);	--a_rage_reaver_of_flame (217424)
	eq.spawn2(217421,0,0,-592,-1340,-122,32);	--a_doomfire_darkfiend (217421)
	eq.spawn2(217424,0,0,-560,-1340,-120,484);	--a_rage_reaver_of_flame (217424)
	eq.spawn2(217419,0,0,-590,-1375,-127,66);	--a_dark_magus_of_flame (217419)
	
	--spawn 7 (Ragefiend Cluster #1) - 4 spawn
	eq.spawn2(217424,0,0,-740,-1435,-150,70);	--a_rage_reaver_of_flame (217424)
	eq.spawn2(217422,0,0,-715,-1455,-150,70);	--a_doomfire_ragefiend (217422)
	eq.spawn2(217424,0,0,-690,-1480,-150,70);	--a_rage_reaver_of_flame (217424)
	eq.spawn2(217418,0,0,-750,-1490,-150,70);	--a_chaos_healer_of_flame (217418)
	
	--spawn 8 (Ragefiend Cluster #2) - 4 spawn
	eq.spawn2(217424,0,0,-580,-1615,-170,444);	--a_rage_reaver_of_flame (217424)
	eq.spawn2(217424,0,0,-545,-1640,-170,444);	--a_rage_reaver_of_flame (217424)
	eq.spawn2(217422,0,0,-515,-1610,-170,434);	--a_doomfire_ragefiend (217422)
	eq.spawn2(217419,0,0,-490,-1580,-170,400);	--a_dark_magus_of_flame (217419)
	
	--spawn 9 (Ragefiend Cluster #3) - 6 spawn
	eq.spawn2(217424,0,0,-800,-1645,-206,124);	--a_rage_reaver_of_flame (217424)
	eq.spawn2(217422,0,0,-850,-1645,-206,124);	--a_doomfire_ragefiend (217422)
	eq.spawn2(217424,0,0,-860,-1620,-206,124);	--a_rage_reaver_of_flame (217424)
	eq.spawn2(217424,0,0,-860,-1675,-206,124);	--a_rage_reaver_of_flame (217424)
	eq.spawn2(217418,0,0,-905,-1665,-206,124);	--a_chaos_healer_of_flame (217418)
	eq.spawn2(217419,0,0,-905,-1635,-206,124);	--a_dark_magus_of_flame (217419)
end

function Phase2Setup()
	eq.set_global(eq.get_zone_instance_id() .. "_PoFire_FenninEvent","Phase2",3,"D3")
	eq.zone_emote(7,"Four enraged roars of fury echo from further down the bridge over the cacophany of an army waiting to hand out death. The powerful voice is then heard saying, 'Reaxnous, Azobian, Hebabbilys, and Javonn! Come destroy these intruders.'");

	--Phase 2 Spawns
	eq.spawn2(217424,0,0,-1220,-1550,-230,206);	--a_rage_reaver_of_flame (217424)
	eq.spawn2(217424,0,0,-1235,-1585,-230,172);
	eq.spawn2(217424,0,0,-1255,-1565,-225,202);
	eq.spawn2(217424,0,0,-1255,-1620,-225,136);
	eq.spawn2(217424,0,0,-1280,-1590,-225,200);
	eq.spawn2(217424,0,0,-1315,-1615,-225,146);
	eq.spawn2(217424,0,0,-1300,-1550,-195,206);
	
	eq.spawn2(217418,0,0,-1280,-1575,-205,184);	--a_chaos_healer_of_flame (217418)
	eq.spawn2(217418,0,0,-1300,-1605,-225,200);		
	eq.spawn2(217418,0,0,-1305,-1530,-195,200);
	eq.spawn2(217418,0,0,-1350,-1580,-195,200);
	eq.spawn2(217418,0,0,-1250,-1505,-195,200);
	
	eq.spawn2(217419,0,0,-1238,-1542,-215,206);	--a_dark_magus_of_flame (217419)
	eq.spawn2(217419,0,0,-1250,-1525,-200,206);
	eq.spawn2(217419,0,0,-1320,-1603,-220,206);
	eq.spawn2(217419,0,0,-1331,-1587,-210,206);
	
	--Phase 2 Named Balrogs		
	eq.spawn2(217450,0,0,-1290,-1570,-210,166);	--#Reaxnous_the_Chaoslord
	eq.spawn2(217426,0,0,-1280,-1500,-195,206);	--#Azobian_the_Darklord
	eq.spawn2(217439,0,0,-1350,-1550,-195,206);	--#Hebabbilys_the_Ragelord
	eq.spawn2(217440,0,0,-1320,-1505,-195,206);	--#Javonn_the_Overlord
end

function Phase3Setup()
	eq.set_global(eq.get_zone_instance_id() .. "_PoFire_FenninEvent","Phase3",3,"D3")
	eq.zone_emote(7,"As the last of the army is defeated, visions of endless burning flames intrude into your mind.  Suddenly the visions end as a call comes from just ahead saying, 'Prepare to meet your end at the hands of the Council of Fire!'");

	--Phase 3 Council Spawns
	eq.spawn2(217428,0,0,-1555,-1125,-195,254);	--#Chancellor_Kirtra (217428)
	eq.spawn2(217429,0,0,-1450,-1120,-195,254);	--#Chancellor_Traxom (217429)
	eq.spawn2(217449,0,0,-1400,-920,-180,254);	--#Omni_Magus_Crato
	eq.spawn2(217453,0,0,-1600,-920,-180,254);	--#Warlord_Prollaz
end

function Phase4Setup()
	eq.set_global(eq.get_zone_instance_id() .. "_PoFire_FenninEvent","Phase4",3,"D3")
	eq.zone_emote(7,"A maddened call of endless fury erupts as a burning creature of pure destructions stands tall before you.  The creature then speaks in the loud booming voice of immense power saying, 'You are fools to have come this far. Prepare to tremble at the might of Doomfire!'");
	eq.spawn2(217436,0,0,-1500,-935,-170,244);		--#Fennin_Ro,_The_Tyrant_of_Fire (217436)
	
	--spawn elite guardians of ro
	eq.spawn_condition("pofire",eq.get_zone_instance_id(),1,1)
end

function FailTimer(e)
	if e.timer == "fail" then
		eq.set_global(eq.get_zone_instance_id() .. "_PoFire_FenninEvent","Failed",3,"D3")
		eq.stop_all_timers();
		DepopEvent();
		eq.signal(217066,1);	--signal #fennin_unloader (217066) to unload encounter
	end
end

function PhaseCheck()
	if not phase2 and not mob_check(phase1_mobs) then
		phase2 = true;
		Phase2Setup();
	elseif phase2 and not mob_check(phase2_mobs) then
		council = true;
		Phase3Setup();
	end
end

function CouncilCheck()
	if council and not mob_check(council_mobs) then
		Phase4Setup();
	end
end



function mob_check(mob_table)
	for n,npc_id in pairs (mob_table) do
		if eq.get_entity_list():IsMobSpawnedByNpcTypeID(npc_id) then
			return true;
		end
	end
	return false;
end

function EventWin(e)
	eq.stop_all_timers();
	DepopEvent();
	eq.zone_emote(7,"Loud cries of hopelessness echo throughout the burning lands. The creatures of Doomfire call out to their master, Fennin Ro the Tyrant of Fire, for his dead body now lies at the feet of the mighty adventurers.");
	eq.spawn2(217455,0,0,e.self:GetX(), e.self:GetY(), e.self:GetZ() - 15, e.self:GetHeading());	--#Essence_of_Fire (217455)
	eq.signal(217066,1);	--signal #fennin_unloader (217066) to unload encounter
	eq.set_global(eq.get_zone_instance_id() .. "_PoFire_FenninEvent","Win",3,"D3");
end
	
function DepopEvent()	
	local mob_list = {217418,217419,217420,217421,217422,217424,217426,217439,217440,217450,217428,217429,217449,217453,217436};	
	for _,mob in pairs(mob_list) do
		eq.depop_all(mob);
	end
	
	eq.spawn_condition("pofire",eq.get_zone_instance_id(),1,0);	--depop/disable elite guardians of ro
end
	
