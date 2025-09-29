--Quest Name: Bard Mail Quest
function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Hail. " .. e.other:GetName() .. "  -Are you [" .. eq.say_link("interested") .. "] in helping the League of Antonican Bards by delivering some [" .. eq.say_link("mail") .. "]?");
	elseif(e.message:findi("mail") and not e.message:findi("deliver") and not e.message:findi("Kelethin")) then
		e.self:Say("The League of Antonican Bards has a courier system made up of travelers and adventurers.  We pay good gold to anyone who will take messages from bards such as myself to one of our more central offices.  Are you [" .. eq.say_link("interested") .. "]?");
	elseif(e.message:findi("interested")) then
		e.self:Say("I have messages that need to go to - well. right now I have one that needs to go to Kelethin.  Will you [" .. eq.say_link("deliver") .. "] mail to [" .. eq.say_link("Kelethin") .. "] for me?");
	elseif(e.message:findi("deliver") or e.message:findi("Kelethin")) then
		e.self:Say("Take this letter to Jakum Webdancer in Kelethin.  You can find him at the bard guild hall.  I am sure he will compensate you for your troubles.");
		e.other:SummonItem(18160); -- A Bardic Letter (Kelethin)
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end