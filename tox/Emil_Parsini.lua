function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Good to meet you. " .. e.other:GetName() .. ".  Please look around.  I have much to offer.  I am a master woodworker.  It runs in the Parsini family.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 18833})) then
		e.self:Say("I have been waiting for someone to come and retrieve this staff.  Here you are.  You will have to combine it with treant resin and an Odus pearl.  You can find Odus pearls in the water in the harbor. As for the resin. I can make it if you can find me some treant shards.  Maybe another woodworker or cobbler in Qeynos has some.");
		e.other:Faction(211,10); -- +Merchants of Erudin
		e.other:Faction(145,10); -- +High Council of Erudin
		e.other:Faction(147,10); -- +High Guard of Erudin
		e.other:QuestReward(e.self,0,0,0,0,17917,2432);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 13824})) then--Wooden Shards
		e.self:Say("Wonderful work!! These shards will work nicely. Here you are then. I found a few flasks of treant resin in the back. You can have one. Thanks again. It kept me from having to go out and hunt treants.");
		e.other:Faction(211,10); -- +Merchants of Erudin
		e.other:Faction(145,10); -- +High Council of Erudin
		e.other:Faction(147,10); -- +High Guard of Erudin
		e.other:QuestReward(e.self,0,0,0,0,13822,2432);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end