function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Welcome to the Trail's End.  If you're going to be drinking. be sure to watch your manners.  Anyone that get's out of line will earn a trip to the pit via the fast route. Now. relax and enjoy.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end
