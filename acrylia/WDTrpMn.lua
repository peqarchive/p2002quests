-- WDTrpMn (NPCID: 154130)
--Khati Sha Event
--Created by Daeron

local event_counter;
local guard_locs = { [1] = {361,-255,-8,384}, [2] = {326, -255, -8, 127}, [3] = {326, -215, -8, 127}, [4] = {361, -215, -8, 384}, [5] = {326, -295, -8, 127}, [6] = {326, -342, -8, 127}, [7] = {361, -295, -8, 384}, [8] = {361, -342, -8, 384} }
;
local jammer_locs_A = { [1] = {321,-258,-7,56}, [2] = {363,-259,-7,456}, [3] = {344,-207,-7,256} }; -- Jail Cell A (Kama)
local jammer_locs_B = { [1] = {322,-294,-7,204}, [2] = {364,-296,-7,308}, [3] = {344,-347,-7,512} }; -- Jail Cell B (Andro)
local life_seal;
local death_seal;
local fail_timer = 10 --default value (in minutes)

function event_spawn(e)
	eq.set_timer("setup",5*1000);
end

function event_signal(e)	
	if (e.signal == 1) then
			SpawnJammers(3,jammer_locs_A);	--initial wave always 3 mobs  
			SpawnJammers(3,jammer_locs_B);	--initial wave always 3 mobs  
			eq.set_timer("jammers", 60 * 1000); -- 90 second jammer respawn time
			eq.set_timer("fail",fail_timer*60*1000)
			eq.unique_spawn(154154,0,0,315,-277,-6,260);  -- Ward of Life -- needs_heading_validation
			eq.unique_spawn(154155,0,0,403,-219,37.06,260); -- Ward of death	
			eq.signal(154404,99); --signals Witchdoctor event spawner to temporarily depop
			
	elseif(e.signal == 2) then 		--signaled upon Warder of Life activation
		eq.stop_timer("jammers");
	elseif(e.signal == 10) then		--checks for signal from #Ward_of_Life upon its death
		life_seal = true;
		WardCheck();
	elseif(e.signal == 11) then		--checks for signal from #Ward_of_Death upon its death
		death_seal = true;
		WardCheck();
	end
end



function event_timer(e)
	if e.timer == "jammers" then 
		SpawnJammers(math.random(2,3),jammer_locs_A);	
		SpawnJammers(math.random(2,3),jammer_locs_B);
	elseif e.timer == "fail" then
		eq.zone_emote(13,"The image of the Ward beings to waver as its physical form fades and it falls behind protection again.");
		eq.signal(154052,10)  --signal event failure to Spiritist_Kama_Resan
		eq.signal(154053,10)  --signal event failure to Spiritist_Andro_Shimi
		eq.depop(154154);	--depop Warder of Life
		eq.signal(154155,10);	--depop Warder of death		
		eq.depop_all(154157); --depops Reanimated Guardians if up
		eq.depop_with_timer();
	elseif e.timer == "setup" then
		EventSetup();
	end
end

function SpawnJammers(total,cell)	
	for n = 1,total do 
		eq.spawn2(154147,0,0,unpack(cell[n]));
	end
end

function WardCheck() --verifies both warders are dead before allowing progress to next stage of event
	if life_seal and death_seal then
		local instance_id = eq.get_zone_instance_id();
		eq.stop_timer("fail");
		eq.spawn2(154122,0,0,614.00,-345.00,-23.00,374); -- Spawns Arcanist Trigger
		eq.set_global(instance_id.. "_IAC_Seal_1","1",3,"H2");
		eq.depop(154053); -- Spiritist_Andro_Shimi
		eq.depop(154052); -- Spiritist_Kama_Resan 
		eq.depop_with_timer();
	end
end

function EventSetup()
	eq.stop_all_timers();
	eq.unique_spawn(154053,0,0,344, -323.49, -7.94,512); -- Spiritist_Andro_Shimi
	eq.unique_spawn(154052,0,0,344, -232.48, -7.94,512); -- Spiritist_Kama_Resan 
	for n = 1,8 do
		eq.spawn2(154344,0,0,unpack(guard_locs[n]));
	end
	event_counter = 0;
	life_seal = false;
	death_seal = false;
end

