--Quest Name: Bard Mail Quest

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hail. " .. e.other:GetName() .. " - Are you [" .. eq.say_link("interested") .. "] in helping the League of Antonican Bards by delivering some [" .. eq.say_link("mail") .. "]?");
	elseif(e.message:findi("mail") and not e.message:findi("deliver") and not e.message:findi("freeport") and not e.message:findi("qeynos")) then
		e.self:Say("The League of Antonican Bards has a courier system made up of travelers and adventurers.  We pay good gold to anyone who will take messages from bards such as myself to one of our more distant offices.  Are you [" .. eq.say_link("interested") .. "]?");
	elseif(e.message:findi("interested")) then
		e.self:Say("I have messages that need to go to Freeport and to Qeynos.  Will you [" .. eq.say_link("deliver") .. "] mail [" .. eq.say_link("I would like to deliver mail to Freeport",false,"to Freeport") .. "] or [" .. eq.say_link("I would like to deliver mail to Qeynos",false,"to Qeynos") .. "] for me?");
	elseif(e.message:findi("deliver") and e.message:findi("Freeport")) then
		e.self:Say("Take this pouch of mail to Ton Twostring. You can find him at the bard guild hall. I'm sure he will compensate you for your trouble.");
		e.other:SummonItem(18164);
	elseif(e.message:findi("deliver") and e.message:findi("Qeynos")) then
		e.self:Say("Take this pouch to Eve Marsinger in Qeynos. You can find her at the bard guild hall. I am sure she will compensate you for your troubles.");
		e.other:SummonItem(18165);
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 18152}) or item_lib.check_turn_in(e.self, e.trade, {item1 = 18156})) then
		e.self:Say("More mail - you have done us a noteworthy service!  Please take this gold for your troubles.  If you are interested in more work, just ask me.");
		e.other:Ding();
		e.other:Faction(192,5,0);
		e.other:Faction(184,5,0);
		e.other:Faction(135,5,0);
		e.other:Faction(273,-15,0);
		e.other:Faction(207,-15,0);
		e.other:AddEXP(200);
		e.other:GiveCash(0,0,eq.ChooseRandom(8,9,10,11,12),0);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end