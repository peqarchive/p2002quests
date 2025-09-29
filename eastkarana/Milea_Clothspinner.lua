function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hail, fellow adventurer. Are you from Qeynos?");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 18801})) then -- A Tattered Note
		e.self:Say("My sister is in danger. She is all the family I have left. I shall be on my way soon. Please take her my handkerchief, so she knows you have contacted me. Thank you. I am thankful Nerissa ran into you. I just wonder why she did not tell Kane about her suspicions.");
		e.other:Faction(311,10,0); -- Steel Warriors
		e.other:Faction(135,10,0); -- Guards of Qeynos
		e.other:Faction(53,-10,0); -- Corrupt Qeynos Guards
		e.other:Faction(105,-10,0); -- The Freeport Militia
		e.other:Faction(184,10,0); -- Knights of Truth
		eq.unique_spawn(15193,11,0,-5521,-1870,3,452); -- Guard Elias
		e.other:QuestReward(e.self,0,0,0,0,13302,2000); -- Monogrammed Cloth
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 18934})) then -- Sealed Note
		e.self:Say("Oh great!! I thought I'd saw that last of Plagus, or as all the women in the Steel Warriors called him, the Plague. Please do not tell him where I am. It must have been a long journey for you. Here. A little something for your wasted trip. I found it on the ground. Have fun going back to Freeport.");
		e.other:Faction(311,10,0); -- Steel Warriors
		e.other:Faction(135,10,0); -- Guards of Qeynos
		e.other:Faction(53,-10,0); -- Corrupt Qeynos Guards
		e.other:Faction(105,-10,0); -- The Freeport Militia
		e.other:Faction(184,10,0); -- Knights of Truth
		e.other:QuestReward(e.self,0,0,0,0,eq.ChooseRandom(3040,5231,1037,17005,13003,10008,1005,8791,1336,2910),2000); -- Random item
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

function event_signal(e)
	if(e.signal == 1) then
		e.self:Say("Get out of here! It is time I dealt with this traitorous guard. Okay guard, let's get it on!!");
		eq.signal(15193,1,5000); -- Guard Elias
	end
end
