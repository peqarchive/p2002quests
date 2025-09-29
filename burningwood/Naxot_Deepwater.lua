function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Beware these woods! The sarnak claim this land as their own and wicked creatures walk beneath the burning foliage.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 28056})) then	-- Ornate Sea Shell
		e.self:Say("Praise the Triumvirate! Natasha sent you just in time! Those twisted sarnak summoners are summoning Ixiblat Fer as we speak! We must stop Ixiblat Fer while he is still weak or all of Norrath may be set aflame! Please do me one more favor, should I perish to this beast of fire. Give this note to Natasha when you next see her, and if you should perish and I survive, I will make sure the waters never forget your reflections of your deeds this day.");
		e.other:QuestReward(e.self,0,0,0,0,28052,100);				-- Message to Natasha
		eq.unique_spawn(87244,0,0,1500,-2000,-300); -- Ixiblat Fer
		eq.depop_with_timer();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end