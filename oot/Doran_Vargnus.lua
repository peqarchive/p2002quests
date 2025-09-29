function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 13995})) then
		e.self:Say("Ahh! You must have been sent by Beno of the Stormguard. I have been wondering when he would return my card. I have not been playing with a full deck. How about a reward? Hmm. Let's see what I have lying around... Here! Take this. I cannot possibly give you any of my good armor.");
		e.other:Faction(314, 5); -- Storm Guard
		e.other:Faction(169, 1); -- Kazon Stormhammer
		e.other:Faction(219, 1); -- Miner's Guild 249
		e.other:Faction(215, 1); -- Merchants of Kaladim
		e.other:Faction(57, -1); -- Craknek Warriors
		e.other:QuestReward(e.self,0,0,0,0,eq.ChooseRandom(3301,3048,3042,3050,3044,7012,3103,3111,3110,7015));
	end
	item_lib.return_items(e.self, e.other, e.trade)
end