--Innoruuk Disciple/Innoruuk Regent
function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hail, " .. e.other:GetName() .. "! I sense the gift of hatred in your aura. What status do you hold within these Spires?");
	elseif(e.other:HasItem(1369)) then --Initiate Symbol of Innoruuk
		if(e.message:findi("initiate")) then
			e.self:Say("Well met, Initiate " .. e.other:GetName() .. ". If you desire to raise your station in this temple, I have a task for you. Are you [" .. eq.say_link("willing") .. "] to accept the task I am about to set before you?");
		elseif(e.message:findi("willing")) then
			e.self:Say("As an initiate of the Spires, you have proven your hatred of the halflings who are desecrating our forest with their feeble shrines and camps. They persist in their hopeless task and seem to anticipate many of our tactics against them. Go out into the Nektulos and slay the one called Master Whoopal. Take his head to Draxiz N'Ryt so that he may probe the brain.");
		end
	elseif(e.other:HasItem(1370)) then --Disciple Symbol of Innoruuk
		if(e.message:findi("disciple")) then
			e.self:Say("I have an important task for a disciple of Hate such as yourself. It is no secret that King Naythox Thex wishes to expand the Teir'Dal Empire to the continent of Faydwer. We have a camp established in the Lesser Faydark near the stronghold of the vampire lord, Mayong Mistmoore. The camp is constantly under siege by the Fier'Dal and Koada'Dal and must rely on the support of Neriak for supplies necessary to survival. Are you willing to serve your King and Empire by [" .. eq.say_link("delivering the provisions") .. "]?");
		elseif(e.message:findi("deliver the provisions")) then
			e.self:Say("The provisions are crated and prepared for shipment by Dran Slug Rembor. Go to his establishment in the Foreign Quarter and tell him Ithvol sent you. Make haste, young disciple of Hate! The fate of the Empire hangs upon our support of the Faydark Camp!");
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 12497, item2 = 1369})) then --Head of a Halfling Spy, Initiate Symbol of Innoruuk
		e.self:Emote("You have focused the hate within you and discovered that hate and rage are not the same. Hate can be calculating and deceptive. For your service in defending the Kingdom of King Naythox Thex from the halfling invaders, I award you the disciple symbol of Innoruuk. Wear it with pride, " .. e.other:GetName() .. ".");
		e.other:Faction(256, 15);  --Priests of Innoruuk
		e.other:Faction(177, 2);  --King Naythox Thex
		e.other:Faction(43, -3);  --Clerics of Tunare
		e.other:Faction(257, -2); --Priests of Life
		e.other:Faction(258, -5); --Priests of Marr
		e.other:Faction(260, -60); --Primordial Malice
		e.other:QuestReward(e.self,0,0,0,0,1370,4000); --Disciple Symbol of Innoruuk
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 12499, item2 = 12498, item3 = 19029, item4 = 1370})) then --Voucher of Service to Naythox, Swiftmoon's Head, Receipt for Provisions Crate, Disciple Symbol of Innoruuk
		e.self:Say("Your devotion to the ideals of hatred and your service to our King Naythox Thex has proven your usefulness within these spires and within our great city. I award you the Regent Symbol of Innoruuk. Congratulations, Regent " .. e.other:GetName() .. "!");
		e.other:Faction(256, 15);  --Priests of Innoruuk
		e.other:Faction(177, 2);  --King Naythox Thex
		e.other:Faction(43, -3);  --Clerics of Tunare
		e.other:Faction(257, -2); --Priests of Life
		e.other:Faction(258, -5); --Priests of Marr
		e.other:Faction(260, -60); --Primordial Malice
		e.other:QuestReward(e.self,0,0,0,0,1371,8000); --Regent Symbol of Innoruuk
	end
	item_lib.return_items(e.self, e.other, e.trade)
end