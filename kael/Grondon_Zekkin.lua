function event_combat(e)
	e.self:Say("You have stuck yer nose where it don't belong fool, I'll show ya the error of yer ways!");
end

function event_death_complete(e)
	eq.spawn2(113492,28,0,1130.3,-933.2,-125.6,253.6);
end
