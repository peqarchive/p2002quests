function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings, friend! I am Bubar, merchant from the burning sands. You must be thirsty or, perhaps, hungry. Please look over my goods.");
	elseif(e.message:findi("gem case")) then
		e.self:Say("Talking of containers? I do not make containers any longer. Provisions are much more profitable. Do you have one of my containers? Most likely you have locked yourself out then. My specialty was the three-lock case. They always lose one of the keys. Hand me the case and at least two of the keys and I can open it for you.");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 12351,item2 = 12352,item3 = 12350})) then
		e.self:Say("Mmmph!!.. *Pop!!* Ouch, my thumb!! Here you are. You had a gem inside.");
		e.other:SummonItem(12349);
		e.other:Ding();
		e.other:AddEXP(15000);
	end
	item_lib.return_items(e.self, e.other, e.trade);
end