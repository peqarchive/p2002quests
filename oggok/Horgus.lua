function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("What!!? You [" .. eq.say_link("Craknek") .. "] or you [" .. eq.say_link("pest") .. "]?");
	elseif(e.message:findi("craknek")) then
		e.self:Say("Good. Me not bash you. You help Horgus and Crakneks. Go smash lizards. Bring four tails. Greenbloods think they get all lizard tails. We take first. Taste good. You bring four tails. Me give you tings. Me gives armur. Now go!!");
	elseif(e.message:findi("pest")) then
		e.self:Say("Bah!! You go join Greenbloods. You weak.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 13354, item2 = 13354, item3 = 13354, item4 = 13354})) then
		e.self:Say("You smash lizards good. Here is armur me promise.");
		e.other:QuestReward(e.self,0,0,0,0,eq.ChooseRandom(2136,2135,2132,2128,2130),500);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
