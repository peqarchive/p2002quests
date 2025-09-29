-- EPIC CLERIC (Timorous deep)
function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 28023})) then --Orb of the triumvirate
		e.self:Emote("takes the orb from you. The avatar has determined that you are worthy!");
		e.other:QuestReward(e.self,0,0,0,0,5532,200000); -- Water Sprinkler of Nem Ankh
		eq.depop();
	end
	item_lib.return_items(e.self, e.other, e.trade) -- return unused items
end
