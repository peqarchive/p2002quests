function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("It's so good to see new faces, not to mention more adventurers in this area. On some nights, the sounds that come from the nearby hills will scare even the hardiest of travelers. I volunteered in the name of the Keepers of the Art to help locate any [" .. eq.say_link("new spell scrolls") .. "] that might surface. Maybe you will have a successful journey and find some of these scrolls yourself.");
	elseif(e.message:findi("new spell scrolls")) then
		e.self:Say("I have recently come into possession of some of these scrolls. They seem to be very promising in adding to the strengths of our occupation. Some more good news is that I have a few extra of these scrolls. Perhaps you might have or find an extra of your own and be willing to trade? In case you are interested, I am looking for the scrolls Theft of Thought, Color Slant, Cripple, and lastly Dementia. Bring me one of these and I'll make an even trade.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 19378}) or item_lib.check_turn_in(e.self, e.trade, {item1 = 19269}) or item_lib.check_turn_in(e.self, e.trade, {item1 = 19384}) or item_lib.check_turn_in(e.self, e.trade, {item1 = 19374})) then
		e.self:Say("Here is the scroll that I promised. We have both gained much knowledge today. I hope to do business with you again soon. Farewell!");
		e.other:QuestReward(e.self,0,0,0,0,eq.ChooseRandom(19386,19379,19381,19215),1000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end