function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hail, " .. e.other:GetName() .. "!  Bow before the greatness of the Clerics of Underfoot!  It is good to be a paladin in such an order as ours - to fight the good fight and defend Kaladim from the evil and undead.  If you be a paladin, then I pray you find the [" .. eq.say_link("courage to battle the undead") .. "].");
	elseif(e.message:findi("courage")) then
		e.self:Say("Yes!!  To battle the undead is our greatest call.  There has been a rise in the number of dwarven skeletons seen in the Butcherblocks.  If you are a true member of this order, I shall reward you for the return of four bone chips.  We shall defend our land from evil!");
	elseif(e.message:findi("remains")) then
		if(e.other:GetFaction(e.self) < 5) then
			e.self:Say("My brother Cromil ventured to the Plains of Karana on the continent of Antonica. He never returned. Rumor has it that his undead skeleton is now part of an undead army in the plains. To end this curse, I ask all good paladins of this temple to return his bones to me. Nothing less than a spell is my reward for such a deed.");
		else
			e.self:Say("The Clerics of Underfoot have yet to see your faith directed towards our wills. Perhaps you should assist Master Gunlok Jure in the crusade against the undead.");
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 13073, item2 = 13073, item3 = 13073, item4 = 13073})) then
		e.self:Say("You have done well. We thank you for your deed with this humble reward. The power behind the raising of our dead shall soon be found. You will earn more respect with more bone chips. I only wish you could assist in the return of the [" .. eq.say_link("remains of Cromil") .. "].");
		e.other:SummonItem(eq.ChooseRandom(2116,2122,5013,5014,5016,5023,6011,13002,13003));
		e.other:Faction(44,10);             -- Clerics of Underfoot
		e.other:Faction(169,10);            -- Kazon Stormhammer
		e.other:Faction(219,10);            -- Miners Guild 249
		e.other:AddEXP(2000);
		e.other:GiveCash(7,10,0,0);
		e.other:Ding();
	end
	if((e.other:GetFaction(e.self) < 5) and (item_lib.check_turn_in(e.self, e.trade, {item1 = 13332}))) then -- Dwarf Bones
		e.self:Say("Many thanks, my friend. Now my brother can rest in peace. Please take this spell. May it serve you well.");
		e.other:SummonItem(15201); 			-- Spell: Flash of Light
		e.other:Faction(44, 25);  			-- Clerics of Underfoot
		e.other:Faction(169, 25); 			-- Kazon Stormhammer
		e.other:Faction(219, 25); 			-- Miners Guild 249
		e.other:AddEXP(10000);
		e.other:GiveCash(0, 0, 2, 0);
		e.other:Ding();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
