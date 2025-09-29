function event_say(e)
	local fac = e.other:GetFaction(e.self);

	if(e.message:findi("hail")) then
		e.self:Say("I say, good to meet you, " .. e.other:GetName() .. "!  I am Camlend Serbold.  Some call me Serbold the Great.  I am the leader of the righteous order of paladins which serves the Temple of Life.  Together with the clerics of this temple, we defend the will of the great [" .. eq.say_link("Rodcet Nife") .. "] and smite all who dare to oppose us.");
	elseif(e.message:findi("rodcet nife")) then
		e.self:Say("Do you feel your heart beating within your chest?  It is Rodcet Nife, the Prime Healer, whose breath keeps it in perfect rhythm.  If you do not pray to His glory then I assure you, someday when your heart begins to slow, you shall be crying out loud to Rodcet Nife.");
	elseif(fac <= 3) then
		if(e.message:findi("lord grimrot")) then
			e.self:Say("You have heard of Lord Grimrot? He is a shadowknight working with the Bloodsabers. We have word he is trying to build an army of undead. Only a powerful knight can rid the lands of Grimrot. So, did you come here to [" .. eq.say_link("defend life") .. "]?");
		elseif(e.message:findi("defend life")) then
			e.self:Say("Do you feel your heart beating within your chest?  It is Rodcet Nife, the Prime Healer, whose breath keeps it in perfect rhythm.  If you do not pray to His glory then I assure you, someday when your heart begins to slow, you shall be crying out loud to Rodcet Nife.");
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	local fac = e.other:GetFaction(e.self);

	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 18711})) then -- Tattered Note
		e.self:Say("Welcome to the Temple of Life. You have much to learn and we have much work to do. Pain, hurt, disease and death lurk everywhere, our job is seemingly endless, but none is more gratifying. Here is our guild tunic, represent us well. Davloran Girionlis will help you to get started.");
		e.other:SummonItem(13506); -- Faded Tunic*
		e.other:Ding();
		e.other:Faction(257,100,0); -- Priest of Life
		e.other:Faction(183,30,0); -- Knight of Thunder
		e.other:Faction(135,50,0); -- Guards of Qeynos
		e.other:Faction(21,-25,0); -- Bloodsabers
		e.other:Faction(9,15,0); -- Antonius Bayle
		e.other:AddEXP(100);
	elseif(fac <= 3) then -- Require kindly or greater faction 
		if(item_lib.check_turn_in(e.self, e.trade, {item1 = 13324,item2 = 13325})) then -- Pestilence Scythe ID: 13324 # Decaying Heart ID: 13325
			e.self:Say("We thank you for your service. With Lord Grimrot's evil soul trapped in this scythe, all but the truly evil shadowknights would be able to wield it. I would like to present you with this as a token of our appreciation. Your devotion to life is supreme. Go now, and serve life.");
			e.other:SummonItem(12238); -- Aegis of Life ID: 12238
			e.other:Ding();
			e.other:Faction(257,30,0); -- Priest of Life
			e.other:Faction(183,30,0); -- Knight of Thunder
			e.other:Faction(135,30,0); -- Guards of Qeynos
			e.other:Faction(21,-55,0); -- Bloodsabers
			e.other:Faction(9,30,0); -- Antonius Bayle
			e.other:AddEXP(1000);
			e.other:GiveCash(0,0,0,9);
		end
	end
	item_lib.return_items(e.self, e.other, e.trade);
end