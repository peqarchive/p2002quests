function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {gold = 50})) then
		e.self:Say("I see that Sultin has sent you to me.  Very well, here are your gloves."); -- Made this text up
		e.other:SummonItem(2354);
		e.other:Ding();
		e.other:AddEXP(5000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end