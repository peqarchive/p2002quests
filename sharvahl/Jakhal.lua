function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Welcome to the merchant's quarter celebration house. relax and enjoy yourself. If you have any questions about my stock. please feel free to ask me.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end
