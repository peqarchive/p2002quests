function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Errr?  What you say to Urrrkath?  Ah.  Hello to you as well. furrrless type person. Would you do Urrrkath a [" .. eq.say_link("favor") .. "]?");
	elseif(e.message:findi("favor")) then
		e.self:Say("Grrreatful I am that you would think to do this for me.  I am in need of a special leaf, called a [" .. eq.say_link("Sylvani Leaf") .. "], if you could brrrring this to me I would rrrrreward you verrrry well.");
	elseif(e.message:findi("sylvani leaf")) then
		e.self:Say("They say that the leaf only exists in a small forest farrrrr frrrrrom ourrrrrr island");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 1155})) then
		e.self:Say("Excellent! I can't believe you found it.  Here is the rrrreward that I promised you.");
		e.other:QuestReward(e.self,0,0,0,0,2045);
	end
end