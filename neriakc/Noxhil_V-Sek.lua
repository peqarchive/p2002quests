function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings, " .. e.other:GetName() .. "!  We of the Dead are proud to have you among us.  Your lineage is well known.  Still, you must learn to claw your way to the upper echelon.  There are many [" .. eq.say_link("menial tasks") .. "] to be performed before you can truly be inducted as a member.");
	elseif(e.message:findi("menial tasks")) then
		e.self:Say("You cannot avoid the toil of peons. We have all spent our time in the lower ranks. There are duties such as [" .. eq.say_link("collecting beetle eyes") .. "].");
	elseif(e.message:findi("beetle eye")) then
		e.self:Say("Take this chest.  It has been fitted with a mold designed to hold ten beetle eyes.  We require them for further experiments.  Do not return until you fill the chest.");
		e.other:SummonItem(17930);--Empty Box
	elseif(e.message:findi("other components")) then
		e.self:Say("The other components that are required are two Bull Elephant tusks.  Mammoth tusks would do as well.");--text made up
	end
end

function event_trade(e)
	local item_lib = require("items");
	local randomloot = math.random(3)
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 13389})) then--Box of Beetle Eyes
		e.self:Say("Fantastic work, my child! We shall store these for further experiments. Take this as extra payment for a fine job. You have done so well I believe you can assist in obtaining two [" .. eq.say_link("other components") .. "].");
		e.other:Faction(322,15); --The Dead
		e.other:Faction(268,2); --Queen Cristanos Thex
		e.other:Faction(177,-2); --King Naythox Thex
		e.other:Faction(170,-2); --Keepers of Art
		e.other:Faction(91,-2); --Eldritch Collective
		e.other:Faction(260,-30); --Primordial Malice
		e.other:QuestReward(e.self,0,16,0,0,0,17150);
		if(randomloot == 1) then
			e.other:SummonItem(eq.ChooseRandom(13021,13022));
		elseif(randomloot ==2) then
			e.other:SummonItem(13021,2);
			e.other:SummonItem(13022,2);
		end
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 10124, item2 = 10124})) then--Mammoth Tusks
		e.self:Say("These will do.  Thank you, child.");--text made up
		e.other:Faction(322,15); --The Dead
		e.other:Faction(268,2); --Queen Cristanos Thex
		e.other:Faction(177,-2); --King Naythox Thex
		e.other:Faction(170,-2); --Keepers of Art
		e.other:Faction(91,-2); --Eldritch Collective
		e.other:Faction(260,-30); --Primordial Malice
		e.other:QuestReward(e.self,0,0,0,0,eq.ChooseRandom(15035,15362,15445,15355,15360,15363),17150); --Random level 12 Necromancer spell
	end
	item_lib.return_items(e.self, e.other, e.trade)
end