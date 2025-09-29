--Terris_Thule
--ID:221041
--Zone:nightmareb

--Terris Thule will spawn 15 x a dream defiler at 75% health, cast Direption of Dreams at 50% health, and spawn 4 x a grotesque statue at 35% health. Upon death a Planar Projection will spawn to give flags. The timer is used to continuously check to make sure that she is not pulled from her lair. If so, she will shout a curse and despawn.

local gargoyles = { 366176, 366053, 365397, 367232};  --spawngroups for untargetable gargoyles

function event_spawn(e)
	eq.set_next_hp_event(90);	
	eq.depop_all(221042);  --depop targetable gargoyles if up
	eq.depop_all(221044);  --depop dream defilers if up
end

function event_combat(e)
	if e.joined then
		eq.set_timer("leash", 1);
	else
		eq.stop_timer("leash");
	end
end

function event_timer(e)
	if e.timer == "leash" then
		if e.self:GetX() <= -2100 or e.self:GetX() > -1600 or e.self:GetY() >= 230 or e.self:GetY() <= -265 then 
			e.self:Shout("Never shall I be removed from nightmares!");
			eq.depop_with_timer();
		end
	end
end


function event_hp(e)
	if e.hp_event == 90 then
		eq.local_emote({e.self:GetX(), e.self:GetY(), e.self:GetZ()},7,300,"The sound of a thousand terrified screams fills your head.  You feel yourself becoming a part of the fabric of this nightmare realm.");
		eq.set_next_hp_event(75);
		eq.set_next_inc_hp_event(98); --to reset on event failure
	elseif e.hp_event == 75 then
		--mezzable versions
		eq.spawn2(221043,0,0,-1858,-25,134,10); --a_dream_defiler (221043)
		eq.spawn2(221043,0,0,-1852,48,134,314); --a_dream_defiler (221043)
		eq.spawn2(221043,0,0,-1933,49,134,312); --a_dream_defiler (221043)
		eq.spawn2(221043,0,0,-1984,-61,134,296); --a_dream_defiler (221043)
		eq.spawn2(221043,0,0,-1899,-65,134,486); --a_dream_defiler (221043)
		eq.spawn2(221043,0,0,-1773,-39,134,374); --a_dream_defiler (221043)
		eq.spawn2(221043,0,0,-2031,-3,134,284); --a_dream_defiler (221043)
		eq.spawn2(221043,0,0,-1887,33,134,226); --a_dream_defiler (221043)
		
		--unmezzable versions
		eq.spawn2(221044,0,0,-1876,-63,134,456); --#a_dream_defiler (221044)
		eq.spawn2(221044,0,0,-1896,-108,134,460); --#a_dream_defiler (221044)
		eq.spawn2(221044,0,0,-1732,3,134,380); --#a_dream_defiler (221044)
		eq.spawn2(221044,0,0,-2005,85,134,198); --#a_dream_defiler (221044)
		eq.spawn2(221044,0,0,-1954,-29,134,142); --#a_dream_defiler (221044)
		eq.spawn2(221044,0,0,-1780,-59,134,386); --#a_dream_defiler (221044)
		eq.spawn2(221044,0,0,-1833,102,134,330); --#a_dream_defiler (221044)
		eq.set_next_hp_event(50);		
	elseif e.hp_event == 50 then
		eq.local_emote({e.self:GetX(), e.self:GetY(), e.self:GetZ()},7,300,"As if in a waking nightmare, you feel your movements slow and your arms begin to fail you.  Each swing of your weapon feels as if it will miss its mark.   Even your legs begin to fail you, as you fall deeper into the dreamlike state!");
		e.self:SpellFinished(3150, e.self); --Direption of Dreams
		eq.set_next_hp_event(45);
	elseif e.hp_event == 45 then
		e.self:SpellFinished(1139, e.self:GetHateTop()); --Defilement of Hope
		eq.set_next_hp_event(35);
	elseif e.hp_event == 35 then
		e.self:Shout("You will not escape my realm so easily!")
		eq.local_emote({e.self:GetX(), e.self:GetY(), e.self:GetZ()},7,300,"The air grows thick with the smell of burning mana.  A rumbling sound draws your attention to the massive statues that rest above the ancient monoliths.  The statues begin to crumble, as they shift their attention from the heavens to you!");
		Gargoyles(true);
	end
	
	if e.inc_hp_event == 98 then
		eq.set_next_hp_event(90);
		Gargoyles(false);
		RepopGargoyles();
		eq.depop_all(221042);  --depop targetable gargoyles if up
		eq.depop_all(221044);  --depop dream defilers if up
	end
end

function event_death_complete(e)
	eq.spawn2(221045,0,0,e.self:GetX(), e.self:GetY(), e.self:GetZ() - 15, e.self:GetHeading());  --Planar Projection 
end

function RepopGargoyles()
	for _,spawns in pairs(gargoyles) do
		local mobs = eq.get_entity_list():GetSpawnByID(spawns);
		mobs:Enable();
		mobs:Reset();
		mobs:Repop(5);
	end
end

function Gargoyles(garg)	--true argument spawns adds
	for _,spawns in pairs(gargoyles) do
		local npc_list = eq.get_entity_list():GetNPCList();

		if(npc_list ~= nil) then
			for npc in npc_list.entries do
				if npc:GetSpawnPointID() == spawns then
					if garg then
						eq.spawn2(221042,0,0,npc:GetX(), npc:GetY(), npc:GetZ(), npc:GetHeading());
					end
					npc:Depop(true);
				end
			end
		end
	end
end
