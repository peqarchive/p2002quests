function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 18846})) then --A tattered note
		e.self:Say("You strong and mean like bear!  You wear bear fur so all know you beastlord o' da Feerrott!  Talk to Grapok and get to work!");
		e.other:Faction(295,15); 	-- Shaman of War
		e.other:QuestReward(e.self,0,0,0,0,13575,100); 	--Bear Fur Tunic
	end
	item_lib.return_items(e.self, e.other, e.trade)
end