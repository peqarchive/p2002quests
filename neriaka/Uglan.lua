function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Me Uglan. Mighty ogre. Member of Crakneks. We crush for dark elves. Do you like dark elves or they be mean to you?");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 13357})) then
		e.self:Say("You from Oggok. Me waiting for you. Me know dark elves have dark plan for ogres. We must stop plan. You must go to Nektulos Forest. Wait for blue orc. He deliver message for dark elf king. Not good. You kill blue orc runners. If message on them then you take to Lork in Oggok. Ogres must know plan.");
		e.other:Faction(322,10);
		e.other:Faction(268,10);
		e.other:Faction(177,-10);
		e.other:Faction(170,-10);
		e.other:Faction(91,-10);
		e.other:Faction(260,-10);
		e.other:AddEXP(500);
		e.other:Ding();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end