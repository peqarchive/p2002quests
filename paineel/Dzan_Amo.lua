function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Welcome to the Tabernacle of Terror. Perhaps you can control your fear long enough to be of [" .. eq.say_link("service") .. "] to us.");
	elseif(e.message:findi("service")) then
		e.self:Say("I need some things fetched from the creatures just outside our city for some ritual experimentation. Bring me two tufts of bat fur and two fire beetle legs and I will school you in the ways of terror.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 13069, item2 = 13069, item3 = 13250, item4 = 13250})) then --Bat Fur x 2, Fire Beetle Leg x 2
		e.self:Say("Very good young one. Here is something to assist in your studies of the principles of terror.");
		e.other:Faction(143, 5);  --Heretics
		e.other:Faction(79, -5);  --Deepwater Knights
		e.other:Faction(112, -5); --Gate Callers
		e.other:Faction(56, -5);  --Craftkeepers
		e.other:Faction(60, -5);  --Crimson Hands
		e.other:QuestReward(e.self,0,0,0,0,15209,1000); --Spell: Spook the Dead
	end
	item_lib.return_items(e.self, e.other, e.trade)
end