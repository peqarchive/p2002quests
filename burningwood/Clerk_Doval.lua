function event_death_complete(e)
	e.self:Say("All Iksar residents.. shall learn.. of my demise. Ungghh!!");
	eq.signal(87101,1); -- Atheling Plague
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end