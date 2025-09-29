function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 9968})) then
		e.self:Say("How dare you bring me this! You shall pay for what you have done!!");
		eq.attack(e.other:GetName());
		e.other:SummonItem(9967); --Karran's Head
	end
	item_lib.return_items(e.self, e.other, e.trade)
end