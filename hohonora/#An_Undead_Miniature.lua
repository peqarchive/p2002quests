--#An_Undead_Miniature (211089)
--spawns on death of An_Undead_Inhabitant
--hohonora

function event_spawn(e)
	eq.set_timer("depop", 10 * 60 * 1000); --10 min depop
end

function event_combat(e)
	if e.joined then
		eq.stop_timer("depop");	--stop timer if aggroed
	else
		eq.set_timer("depop", 10 * 60 * 1000);	--reset depop timer once not aggroed
	end
end

function event_timer(e)
	if e.timer == "depop" then
		eq.depop();
	end
end