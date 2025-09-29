-- NPC Name: a frost giant wolf tamer

function event_say(e)
	if(e.other:GetFaction(e.self) < 7) then
		if(e.message:findi("hail")) then
			e.self:Say("Yes? Do you have a wolf choker for me or are you looking for more [" .. eq.say_link("work") .. "]?");
		elseif(e.message:findi("work")) then
			e.self:Say("Yes. I was charged with a certain... delivery. Apparently one of our good friends named Erdarf in Thurgadin needs a shipment of one karsin acid bottle. You can find such a thing in Crystal Caverns. Maybe one of the orc dogs has it. Find a way to get one of those bottles to our good friend eh? When you do, let me see whatever it is you find on him.");
		end
	else
		e.self:Say("Go away! I don't have time for the likes of you.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(e.other:GetFaction(e.self) < 7) then
		if(item_lib.check_turn_in(e.self, e.trade, {item1 = 30246})) then -- Velium War Wolf Choker
			e.other:QuestReward(e.self,0,0,0,0,30249); -- Blood Wolf Harness
		elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 30270})) then -- Gem of Persuasion
			e.other:QuestReward(e.self,0,0,0,0,30273); -- Giants Gem of Persuasion
		elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 30273, item2 = 30249})) then -- Giants Gem of Persuasion and Blood Wolf Harness
			e.other:QuestReward(e.self,0,0,0,0,30274); -- Giants Harness of Control
		end
	end
	item_lib.return_items(e.self, e.other, e.trade)
end