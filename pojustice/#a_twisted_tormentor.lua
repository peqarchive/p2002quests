--#a_twisted_tormentor (201484)
--Trial of Torture
--pojustice

function event_spawn(e)
	eq.set_timer("depop", 60 * 1000);
end

function event_timer(e)
	if e.timer == "depop" and not e.self:IsEngaged() then
		eq.stop_timer(e.timer);
		eq.signal(201510, 2);	--#Event_Torture_Control (201510) - FAILED
		eq.depop();
	end
end

function event_death_complete(e)
	eq.signal(201510, 9);	--kill signal to #Event_Torture_Control (201510)
end
