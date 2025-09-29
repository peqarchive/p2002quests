function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Emote("smiles and taps her foot.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 20534})) then
		e.self:Emote("hands you a small ring.");
		e.other:SummonItem(20379);
		e.other:Ding();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end