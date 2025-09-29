function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 18891})) then -- A Tattered Cloth Note
		e.self:Say("Search!! Find Windstream. Find the mallet!! One. Two. Three.");
		eq.spawn2(36096,0,0,-88,-637,-66,254);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
