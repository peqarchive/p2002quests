function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Har har har! Yu funy lukking. Oooo.. do u hav doze [" .. eq.say_link("smarty writin's") .. "]?");
	elseif(e.message:findi("smarty writin's")) then
		e.self:Say("Me not know what dem ar for shure. Dem only hav dees names. Umm.. let me see if I can member dem. Taaalisman de umm.. Jasinth. Dat's one of dem. Spirited of Scaley?? OH!! Dis my favorite. Kripple. Den the last is the painful one. Canaabaalize canaabaalize canaabaalize. Yep, dat super duper one. Bring me bak one of dem, me trade.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 19269}) or item_lib.check_turn_in(e.self, e.trade, {item1 = 19238}) or item_lib.check_turn_in(e.self, e.trade, {item1 = 19264}) or item_lib.check_turn_in(e.self, e.trade, {item1 = 19272})) then
		e.self:Say("Here is the scroll that I promised. We have both gained much knowledge today. I hope to do business with you again soon. Farewell!");
		e.other:QuestReward(e.self,0,0,0,0,eq.ChooseRandom(19267,19271,19274,19266),1000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
