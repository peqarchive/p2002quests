function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Pleasure to meet you.  Keep your eye out for the ship.  You don't want to miss it.");
	end
	if(e.message:findi("mudtoes")) then
		e.self:Say("Mudtoes!! I have heard tales of that foul clan of ogres. A few passengers aboard the ships have claimed to have seen one of them, off and on, amongst the pirates in the Ocean of Tears!!");
	end
end

function event_spawn(e)
	eq.spawn_condition("butcher",0,1,0);
	eq.spawn_condition("butcher",0,2,0);
end