function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Gimme duffynitey rocks! Me powdrem GUUD!!!");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 10073})) then --Dufrenite
		e.self:Emote("takes the dufrenite and smashes it with her bare hands.");
		e.self:Say("Here ya go!");
		e.other:SummonItem(19052); --Powdered Dufrenite
		e.other:Ding();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
