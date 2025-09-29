function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings!! You look like an adventurer. I have a bit of a problem with which you might be able to help. You see, there have been reports of sarnak hatchlings near the lake. I do not know why they are here, but I do know we need them exterminated. Here is the deal.. You bash them good and return their brains to me. For every four brains, I shall reward you.");
	elseif(e.message:findi("trooper reporting for duty")) then
		e.self:Say("Very good to have you on board, Trooper " .. e.other:GetName() .. "! We have had reports of sarnak legionnaires attacking caravans. I shall require you to find these sarnak legionnaires. Take this pack. Fill and combine it with as many of their brains as sill fit inside. Return the full pack to me and I shall consider you for a promotion.");
		e.other:SummonItem(17044);
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 12914})) then
		e.self:Say("Very good. I cannot see any reason a warrior like you should waste their time on the patrols of a trooper. I shall recommend you for a promotion. I hope the War Baron agrees.");
		e.other:Faction(193,1);
		e.other:Faction(30,1);
		e.other:Faction(282,1);
		e.other:Faction(62,1);
		e.other:Faction(317,1);
		e.other:QuestReward(e.self,0,0,0,0,18074,2000);
	end
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 12408, item2 = 12408, item3 = 12408, item4 = 12408})) then
		e.self:Say("Bravo!! You have done well. Here is a small reward. The greater reward is service to the empire.");
		e.other:Faction(193,1);
		e.other:Faction(30,1);
		e.other:Faction(282,1);
		e.other:Faction(62,1);
		e.other:Faction(317,1);
		e.other:GiveCash(0,0,1,0);
		e.other:QuestReward(e.self,0,0,0,0,12614,3000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end