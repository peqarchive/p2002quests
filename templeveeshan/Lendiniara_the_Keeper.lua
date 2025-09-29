function event_say(e)
    if(e.other:GetFaction(e.self) == 1) then
	    if(e.message:findi("hail")) then
		    e.self:Say("Greetings, " .. e.other:GetName().. ". I am the keeper of relics. If you are brave I have tasks to test your might and perhaps [" .. eq.say_link("rewards") .. "].");
	    elseif(e.message:findi("rewards")) then
		    e.self:Say("One should ask of the [" .. eq.say_link("tasks") .. "] before worrying about rewards, " .. e.other:Race() .. ".");
	    elseif(e.message:findi("tasks")) then 
		    e.self:Say("Enter into the halls of testing to complete these tasks. Seek out the ancient ones inside and see if your might is as great as theirs and fear not, those who you slay will be returned to the temple by the gift of Veeshan's great power. I have three tasks, which any may complete, as well as a request of both the [" .. eq.say_link("request of the arcane",false,"arcane") .. "] and the [" .. eq.say_link("request of the strong",false,"strong") .. "].");
	    elseif(e.message:findi("request of the arcane")) then
		    e.self:Say("Those who seek knowledge, will seek this task out for its reward is great. [" .. eq.say_link("request of the three",false,"Three tears") .. "] and a glowing orb will garner one an ancient mask. The White tear and the black tear for balance the runed tear to hold the balance and a glowing orb to return raw energy to the ancient mask.");
        elseif(e.message:findi("request of the strong")) then
		    e.self:Say("Those who believe they are strong may be surprised after such a task. Seek out the cursed one and slay him, return to me when you have gathered a silver tear, a poison tear, a flame kissed tear and a serrated tear. End the cursed ones torment for a short time, before the high priest raises him to continue his suffering for eternity.");
        elseif(e.message:findi("request of the three")) then
		    e.self:Say("Tears from the cursed you much seek for each task. The [" .. eq.say_link("test of the Ruby Tear") .. "], the [" .. eq.say_link("test of the Platinum Tear") .. "] and the [" .. eq.say_link("test of the Emerald Tear") .. "] await all who wish to partake of them.");
        elseif(e.message:findi("test of the ruby tear")) then
		    e.self:Say("The test of the ruby tear sounds simple enough, enter the halls of testing, secure a ruby tear, a white symbol, a silver symbol and a ruby symbol. I warn you mortal, those who walk the halls will rend your body and mind if you are not worthy.");
        elseif(e.message:findi("test of the platinum tear")) then
		    e.self:Say("Seek the platinum tear and three symbols to bind its powers to a bracelet. The black symbol to add raw power, the serrated symbol to enchant its powers and the runed symbol to hold the powers to the bracelet.");
        elseif(e.message:findi("test of the emerald tear")) then
		    e.self:Say("The emerald tear of Veeshan entrusted to the cursed one. Return this tear to me so I may return the powers of an ancient shield. Three symbols you must also seek. Emerald like the tear, one kissed by the flames of the elder wurms and one made of the ancient wyverns venomous poison.");
        end
    elseif(e.message:findi("hail")) then
		    e.self:Say("I do not know you well enough to entrust you with such a quest, yet.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(e.other:GetFaction(e.self) <= 1) then
		if(item_lib.check_turn_in(e.self, e.trade, {item1 = 31262,item2 = 31261,item3 = 31263,item4 = 31260})) then
			give_reward(e.self, e.other, 31463);
		elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 31267,item2 = 31266,item3 = 31265,item4 = 31264})) then
			give_reward(e.self, e.other, 31464);
		elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 31259,item2 = 31270,item3 = 31253,item4 = 31250})) then
			give_reward(e.self, e.other, 31460);
		elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 31251,item2 = 31269,item3 = 31252,item4 = 31254})) then
			give_reward(e.self, e.other, 31461);
		elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 31257,item2 = 31268,item3 = 31256,item4 = 31255})) then
			give_reward(e.self, e.other, 31462);
		end
	else
		e.self:Say("I do not know you well enough to entrust you with such an item, yet.");
	end
	
	item_lib.return_items(e.self, e.other, e.trade)
end

function give_reward(self, other, item)
	self:Emote("looks happy as she hands you the reward.");
	other:Faction(42,50); -- CoV
	other:Faction(362,25); -- Yeli
	other:Faction(189,-100); -- Kromzek
	other:QuestReward(self,0,0,0,0,item,200000);
end
