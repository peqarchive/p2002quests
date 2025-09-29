function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("And who do you think you are? To step into the Cauldron of Hate one should have the black soul of a warrior. For one to speak with Trizam he should have good reason. Perhaps you return with tales of [" .. eq.say_link("deathfist") .. "] agendas. If so, then you're a year too late.");
	elseif(e.message:findi("deathfist")) then
		if(e.other:GetFaction(e.self) < 5) then
			e.self:Say("Have you been spending day and night at the Malden's Fancy?!! The Deathfist Orcs in the Commonlands are up to something. As the inept humans in Freeport hunt down the warrior orcs, the pawns run about on some secret mission. I have been appointed by King Nathox to attend to this matter and hire young warriors who wish to [" .. eq.say_link("collect") .. "] pawn kills.");
		else
			e.self:Say("Go! Return when you have done more to serve the Indigo Brotherhood of Neriak. Fewer Leatherfoot Raiders in Nektulos and a few Leatherfoot skullcaps in the palms of Master Narex shall prove your true warrior nature and loyalty to our house.");
		end
	elseif(e.message:findi("collect")) then
		if(e.other:GetFaction(e.self) < 5) then
			e.self:Say("Yes, You will. You need not know the reason why. I command you by order of King Naythox Thex to venture forth to the Commonlands and slay all the orc pawns you see. Return with four pawn picks and maybe I shall even reward you. Leave at once or you shall find yourself hanging from the Hooks of Innoruuk!");
		else
			e.self:Say("Go! Return when you have done more to serve the Indigo Brotherhood of Neriak. Fewer Leatherfoot Raiders in Nektulos and a few Leatherfoot skullcaps in the palms of Master Narex shall prove your true warrior nature and loyalty to our house.");
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(e.other:GetFaction(e.self) < 5) then
		if(item_lib.check_turn_in(e.self, e.trade, {item1 = 13885, item2 = 13885, item3 = 13885, item4 = 13885})) then
			e.self:Say("As instructed, I shaw reward your good deed. But I choose to reward you with provisions from the pantries of Neriak. They shall keep you strong.");
			e.other:Faction(155,10); -- +Indigo Brotherhood
			e.other:Faction(92,-1); -- -Emerald Warriors
			e.other:Faction(311,-1); -- -Steel Warriors
			e.other:Faction(260,-20); -- Primordial Malice
			e.other:QuestReward(e.self,0,0,0,0,13022,1000);
			e.other:SummonItem(13021,4); -- Neriak Nectar 4x
		end
		item_lib.return_items(e.self, e.other, e.trade)
	else
		e.self:Say("Go! Return when you have done more to serve the Indigo Brotherhood of Neriak. Fewer Leatherfoot Raiders in Nektulos and a few Leatherfoot skullcaps in the palms of Master Narex shall prove your true warrior nature and loyalty to our house.");
	end
end