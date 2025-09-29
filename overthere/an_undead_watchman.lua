function event_spawn(e)
	eq.set_timer("depop",15*60*1000);
end

function event_timer(e)
	if (e.timer == "depop") then
		eq.depop();
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end

