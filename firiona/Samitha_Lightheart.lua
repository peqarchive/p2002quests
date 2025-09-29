function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("And a good day to you, too! I have traveled here in the name of the Jaggedpine Treefolk to search out any new and [" .. eq.say_link("wonderful powers") .. "] that would aid us in preserving the wildlife back home. I have not been able to venture far from this outpost as the inhabitants of the nearby woods pose a great danger. I have decided to wait for more of my Treefolk to arrive before adventuring further.  There's safety in numbers, they always say.");
	elseif(e.message:findi("wonderful powers")) then
		e.self:Say("From what I have gathered from the residents of this outpost and from others like myself, there are a fair number of scrolls to be found in the outlying areas.  These scrolls are said to contain new and powerful magic. I myself have found a few of these scrolls. But the problem is, I don't believe I have a complete collection. If you would care to [" .. eq.say_link("help") .. "] me, I'd be willing to trade some of the extra ones I have for some of the extras you may run across.");
	elseif(e.message:findi("help")) then
		e.self:Say("I am still looking for four scrolls that I have not been able to locate. They are the scrolls of Circle of Winter, Circle of Summer, Spirit of Scale, and Form of the Howler. If you bring any of these back, I'll give you one of four very rare scrolls in my possession.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 19238}) or item_lib.check_turn_in(e.self, e.trade, {item1 = 19244}) or item_lib.check_turn_in(e.self, e.trade, {item1 = 19232}) or item_lib.check_turn_in(e.self, e.trade, {item1 = 19234})) then
		e.self:Say("Here is the scroll that I promised. We have both gained much knowledge today. I hope to do business with you again soon. Farewell!");
		e.other:QuestReward(e.self,0,0,0,0,eq.ChooseRandom(19235,19233,19236,19240),1000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end