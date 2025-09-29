function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 18757})) then --tattered note
		e.self:Say("Hmmm, I hope you're tougher than you look. Here, put this on. Go find Ulraz, he'll beat you into shape. There's no turning back now, punk. So, you'd better do well, got it?");
		e.other:Faction(322,100); --The Dead
		e.other:Faction(268,15); --Queen Cristanos Thex
		e.other:Faction(177,-15); --King Naythox Thex
		e.other:Faction(170,-15); --Keeper of the Art
		e.other:Faction(91,-15); --Eldritch Collective
		e.other:Faction(260,-200); --Primodial Malice
		e.other:QuestReward(e.self,0,0,0,0,13586,100); --Black Training Tunic
	end
	item_lib.return_items(e.self, e.other, e.trade)
end