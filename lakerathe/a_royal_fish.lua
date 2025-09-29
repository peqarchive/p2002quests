function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("flutters about and seems to be staring back at you as if reading and understanding your thoughts!!");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 12271})) then
		e.self:Emote("gladly gulps up your odd mixture and transforms into..!!");
		eq.unique_spawn(51176,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading());
		e.other:Ding();
		e.other:Faction( 8, 10);
		e.other:Faction( 43, 10);
		e.other:Faction( 178, 10);
		eq.depop_with_timer();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
