function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 19582, item2 = 19583, item3 = 16166})) then
		e.self:Say("Well done " .. e.other:GetName() .. "!  Use this with pride.");
		e.other:QuestReward(e.self,0,0,0,0,19611,1000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end