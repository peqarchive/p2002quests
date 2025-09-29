function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Hello, " .. e.other:GetName() .. ". This place is quite a formidable outpost, but it lacks the comforts of home. Once I have finished collecting some of my [" .. eq.say_link("missing scrolls") .. "], I'll be able to leave this place and all its hidden dangers.");
	elseif(e.message:findi("missing scrolls")) then
		e.self:Say("Travelers have been bringing back numerous scrolls from the depths of darkness in the Outlands. They contain arcane knowledge specific to our classes. Only four are left that I seek. Keep a wary out for Theft of Thoughts, Color Slant, Cripple, and Dementia. Return any one of these to me and your reward shall be a scroll that can be found nowhere else.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 19374}) or item_lib.check_turn_in(e.self, e.trade, {item1 = 19378}) or item_lib.check_turn_in(e.self, e.trade, {item1 = 19269}) or item_lib.check_turn_in(e.self, e.trade, {item1 = 19384})) then
		e.self:Say("Here is the scroll that I promised. We have both gained much knowledge today. I hope to do business with you again soon. Farewell!");
		e.other:QuestReward(e.self,0,0,0,0,eq.ChooseRandom(19386,19379,19381,19215),1000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
