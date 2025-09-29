--Fire Goblin Runner/Halfling Raider Helms
function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Welcome to the Cauldron of Hate. If you are a young warrior, you have come to the right place. There are many [" .. eq.say_link("duties") .. "] to be performed. If you are a veteran of the blade, we welcome your return to service. Perhaps you return with a [" .. eq.say_link("Leatherfoot") .. "] skullcap?");
	elseif(e.message:findi("duties")) then
		e.self:Say("I am so glad you asked. There is one matter of importance with which you may be able to assist. It seems an Erudite has made camp in Lavastorm. He is powerful and we do not expect you to slay him. Your mission is to cut off his supply line. I hope you will [" .. eq.say_link("accept the mission") .. "].");
	elseif(e.message:findi("accept the mission")) then
		e.self:Say("Go to the Lavastorm Mountain Range. It is a dangerous place, but the one you seek must leave by the direction you entered. He is a goblin. Apparently the Erudite is employing their strength. The fire goblin runner shall be an easy kill for you. At least, he should be. Return his runner pouch to me.");
	elseif(e.message:findi("leatherfoot")) then
		if(e.other:GetClass() == 1 and e.other:GetRace() == 6) then
			e.self:Say("Where have you been? The halflings of Rivervale have an elite force of warriors. They are called the Leatherfoot Raiders. They have been infiltrating our glorious city of Neriak for quite some time. They must be exterminated! I must hire strong warriors who wish to [" .. eq.say_link("collect the bounty") .. "].");
		else
			e.self:Say("Go!! Return when you have done more to serve the Indigo Brotherhood of Neriak. Fewer Leatherfoot Raiders in Nektulos and a few Leatherfoot skullcaps in the palms of Master Narex shall prove your true warrior nature and loyalty to our house.");
		end
	elseif(e.message:findi("collect the bounty")) then
		e.self:Say("So you wish to collect the bounty on Leatherfoot Raiders? Then go into Nektulos and hunt them down. I shall pay a reward for no fewer than four Leatherfoot Raider skullcaps.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 13886})) then --Goblin Supply Pouch
		e.self:Say("Fine work. I trust the denizens of Lavastorm were not unkind. Please take this featherweight pouch as a reward. May it keep you fleet of foot.");
		e.other:Faction(155, 2); --Indigo Brotherhood
		e.other:Faction(92,-5); --Emerald Warriors
		e.other:Faction(311,-5); --Steel Warriors
		e.other:Faction(260,-5); --Primordial Malice
		e.other:QuestReward(e.self,0,0,0,0,17972,17150); --Featherweight Pouch
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 13113, item2 = 13113, item3 = 13113, item4 = 13113})) then --Leatherfoot Raider Skullcap
		e.self:Say("I had my doubts, but you have proven them false. You are a fine warrior. You must continue to refine you talents. I reward you with the footman's voulge! Welcome into our house of warriors. Let us share skills as we share foes.");
		e.other:Faction(155, 2); --Indigo Brotherhood
		e.other:Faction(92,-5); --Emerald Warriors
		e.other:Faction(311,-5); --Steel Warriors
		e.other:Faction(260,-5); --Primordial Malice
		e.other:QuestReward(e.self,0,0,4,0,12257,250); --Footman's Voulge
	end
	item_lib.return_items(e.self, e.other, e.trade)
end