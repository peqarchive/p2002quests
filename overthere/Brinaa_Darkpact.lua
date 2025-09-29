function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Hello, " .. e.other:GetName() .. ". It's nice to see more able bodies around this part of the outland. We came here in search of the magical powers that are supposed to exist in the ruins and dungeons of this area. We need you to bring back evidence of this power in the form of scrolls. I can't offer much coin in payment, but I do have some rare scrolls I already brought back that may interest you, if you wish to [" .. eq.say_link("help in the search") .. "].");
	elseif(e.message:findi("help in the search")) then
		e.self:Say("Excellent! Here is what we are still seeking. The scrolls of Death Pact. Upheaval. Yaulp IV. and Reckoning. If you return one of these to me. I'll release one of my rare scrolls to you.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 19203}) or item_lib.check_turn_in(e.self, e.trade, {item1 = 19205}) or item_lib.check_turn_in(e.self, e.trade, {item1 = 19209}) or item_lib.check_turn_in(e.self, e.trade, {item1 = 19212})) then
		e.self:Say("Here is the scroll that I promised. We have both gained much knowledge today. I hope to do business with you again soon. Farewell!");
		e.other:QuestReward(e.self,0,0,0,0,eq.ChooseRandom(19210,19224,19420,19206),1000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
