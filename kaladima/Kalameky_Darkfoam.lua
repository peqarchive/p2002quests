function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 18906})) then
		e.self:Say("The slaves...thank you! Here, this will help defend you against those vile orcs.");
		e.other:SummonItem(23359);
		e.other:AddEXP(30000);
		e.other:Ding();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
