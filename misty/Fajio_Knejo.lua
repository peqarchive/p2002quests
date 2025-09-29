function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Greetings, " .. e.other:GetName() .. ".  I hope you are having a fine day.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 20532})) then
		e.self:Say("Run onward, my friend, to the far off Desert of Ro and give this torch to Andad Filla.");
		e.other:SummonItem(20533);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
