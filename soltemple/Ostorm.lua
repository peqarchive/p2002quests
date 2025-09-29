-- Quest for Bard Lambent Fire Opal
function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("I am Ostorm of the Temple of Solusek Ro, guardian of the sacred crystal of Kintaz.  Be wary and keep your distance, lest the proximity of the crystal [" .. eq.say_link("steal") .. "] your [" .. eq.say_link("memories") .. "].");
	elseif(e.message:findi("steal")) then
		e.self:Say("It is the nature of the crystal of Kintaz to steal the memories of those around it. Only I am safe, and then only because of the strong wardings placed on me by Solusek Ro himself. Are you interested in [" .. eq.say_link("losing") .. "] any [" .. eq.say_link("memories") .. "]?");
	elseif(e.message:findi("losing")) then
		e.self:Say("Recently, I have been experimenting with the crystal, and have found that those exposed to ruby light filtered through it tend to lose the memories of their most specialized arcane skills. Are you sure you want to [" .. eq.say_link("lose advanced memory") .. "] of specialization?");
	elseif(e.message:findi("advanced")) then
		e.self:Say("Be warned that once exposed to the crystal, I can not reverse the effects. If you desire exposure, fetch me a ruby.");
	elseif(e.message:findi("gold")) then
		e.self:Say("You do not remember?  You promised me fifty gold coins for allowing you to be exposed to the sacred crystal of Kintaz.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 10035})) then
		if(e.other:GetClass() == 2 or e.other:GetClass() == 6 or e.other:GetClass() == 10 or e.other:GetClass() == 11 or e.other:GetClass() == 12 or e.other:GetClass() == 13 or e.other:GetClass() == 14) then
			e.self:Say("..hear me? Ah, you seem to be coming out of your stupor. I think you have been exposed to the crystal long enough. By the time you leave the temple, your memories should have faded. Do you have the [" .. eq.say_link("fifty gold") .. "] coins that you owe me?");
			e.other:Faction(320,15);
			e.other:Faction(291,-15);
			for skill=43,47,1 do
				e.other:SetSkill(skill,49);
			end
			e.other:Message(7, "Your specialize skills have all been set to 49.");
			e.other:QuestReward(e.self,0,0,0,0,0,1000);
		else
			e.self:Say("I only do caster and priest type, Sorry I can't help you there."); -- text made up
			e.other:SummonItem(10035);
		end
	elseif(item_lib.check_turn_in(e.self, e.trade, {gold = 50})) then
		e.self:Say("Thank you.");
		e.other:Faction(320, 15);
		e.other:Faction(291, -15);
		e.other:Ding();
--Lambent Fire Opal
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 10031, item2 = 10031, item3 = 10000})) then
		e.self:Say("Ahh, Genni must have sent you to me.  Very well, here is your Lambent Fire Opal.");
		e.other:Faction(320, 15);
		e.other:Faction(291, -15);
		e.other:QuestReward(e.self,0,0,0,0,10128);
--magnetized platinum
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 16507})) then
		e.self:Say("I see that Gavel has sent you to me.  Very well, I have magnetized your platinum bar - take it.");
		e.other:QuestReward(e.self,0,0,0,0,19049);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end