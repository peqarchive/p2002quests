function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Most call me Gandari the Terse.  You here for [" .. eq.say_link("ivy armor") .. "]?");
	elseif(e.message:findi("ivy armor")) then
		e.self:Say("I reward brave rangers with ivy etched armor - [" .. eq.say_link("Helms") .. "], [" .. eq.say_link("Tunics") .. "], [" .. eq.say_link("Sleeves") .. "] and [" .. eq.say_link("Bracers") .. "]. Interested?");
	elseif(e.message:findi("bracer")) then
		e.self:Say("I do not haggle, I do not bargain. The Bottom of the Rune of Ivy from the plains of Everfrost, a Watery Ring from the Cauldron of Tears and a Fire Emerald to warm my heart. Bring these to me and you shall earn your reward.");
	elseif(e.message:findi("helm")) then
		e.self:Say("I do not haggle, I do not bargain. The Top of the Rune of Ivy from the Castle Mistmoore, a Cyclops Charm from Tarskuk and a Sapphire of Sky Blue. Bring these to me and you shall earn your reward.");
	elseif(e.message:findi("sleeve")) then
		e.self:Say("I do not haggle, I do not bargain. A Heart of Fire from the Caverns of Solusek, the Left side of the Rune of Ivy from the Griffon Grimfeather and two Star Rubies of sparkling hue. Bring these to me and you shall earn your reward.");
	elseif(e.message:findi("tunic")) then
		e.self:Say("I do not haggle, I do not bargain. The Skull of Meldrath, the Right side of the Rune of Ivy from the Thistle Brownie and two Rubies of Fiery Red. Bring these to me and you shall earn your reward.");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 10569, item2 = 10546, item3 = 10033})) then -- bracers
		e.self:Say("Well done. May Karana bless your soul.");
		e.other:Faction(182,5); -- kithicor residence
		e.other:Faction(265,1); -- protectors of the pine
		e.other:Faction(159,1); -- jaggedpine treefolk
		e.other:Faction(347,-1); -- unkempt druids
		e.other:QuestReward(e.self,0,0,0,0,3189,10000);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 10566, item2 = 10570, item3 = 10034})) then -- helm
		e.self:Say("Well done. May Karana bless your soul.");
		e.other:Faction(182,5); -- kithicor residence
		e.other:Faction(265,1); -- protectors of the pine
		e.other:Faction(159,1); -- jaggedpine treefolk
		e.other:Faction(347,-1); -- unkempt druids
		e.other:QuestReward(e.self,0,0,0,0,3181,10000);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 10548, item2 = 10568, item3 = 10032, item4 = 10032})) then -- sleeves
		e.self:Say("Well done. May Karana bless your soul.");
		e.other:Faction(182,5); -- kithicor residence
		e.other:Faction(265,1); -- protectors of the pine
		e.other:Faction(159,1); -- jaggedpine treefolk
		e.other:Faction(347,-1); -- unkempt druids
		e.other:QuestReward(e.self,0,0,0,0,3188,10000);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 10571, item2 = 10567, item3 = 10035, item4 = 10035})) then -- tunic
		e.self:Say("Well done. May Karana bless your soul.");
		e.other:Faction(182,5); -- kithicor residence
		e.other:Faction(265,1); -- protectors of the pine
		e.other:Faction(159,1); -- jaggedpine treefolk
		e.other:Faction(347,-1); -- unkempt druids
		e.other:QuestReward(e.self,0,0,0,0,3184,10000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end