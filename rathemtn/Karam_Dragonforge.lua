function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Welcome. I have a number of platemail items, if you are interested. I am also a master [" .. eq.say_link("smith") .. "] of exotic materials such as dragon scales.");
	elseif(e.message:findi("smith")) then
		e.self:Say("Dragon scales make terrific armor. I can make a [" .. eq.say_link("white dragonscale cloak") .. "] and [" .. eq.say_link("red dragonscale armor") .. "]. I have not seen any other colored dragon variants around. But if you see any, be sure to let me know. I would be interested in what can be made from their scales.");
	elseif(e.message:findi("white dragonscale cloak")) then
		e.self:Say("Hrmmm. A white dragonscale cloak eh? Hrmmm. Well, I will make you a deal. You can save me some footwork and I will craft your cloak. I want to propose to my [" .. eq.say_link("fiancee") .. "] but I have neither a [" .. eq.say_link("wedding ring") .. "] nor a [" .. eq.say_link("present") .. "] for her. So, return with a white dragon hide, a wedding ring, and a present for my fiancee, and I will fashion your cloak for you.");
	elseif(e.message:findi("fiancee")) then
		e.self:Say("My fiancee...AHHHH.... The love of my life. My purpose for existing. She is a real woman. Long, golden blonde hair with a similarly colored full beard. A stout broad she is, kind and warm at heart. She knows every nook of my essence. But do not let that fool you. She is as strong as many dwarven men. Between you and me, she has even beaten me once or twice arm-wrestling over who gets the last ale and who has to go to the market.");
	elseif(e.message:findi("wedding ring")) then
		e.self:Say("Only the best will do. I will not propose to her with anything less than a platinum and diamond wedding ring.");
	elseif(e.message:findi("present")) then
		e.self:Say("Well, she is quite fond of jewelry. And a black sapphire platinum necklace would complement her eyes and beard so exquisitely.");
	elseif(e.message:findi("red dragonscale armor")) then
		e.self:Say("So you have a red dragon scale, eh? Well, I am wanting very much to return to my fiancee and propose to her. If you could aid me in quickly returning to her with a bit of spare change, we could have a deal. Heck, for the armor, a vial of swirling smoke and 1000 platinum coins is a bargain!");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 14707, item2 = 14703, item3 = 9240})) then
		e.self:Say("My fiancee will be so excited! An exquisite ring for the wedding and a gorgeous necklace as my wedding gift to her. Well, as promised, here is your white dragonscale cloak.");
		e.other:QuestReward(e.self,0,0,0,0,11603); -- White Dragonscale Cloak
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 11622, item2 = 14402, platinum = 1000})) then
		e.self:Say("Wonderful! Now I can get back to my fiance instantly! Isn't Love grand? As for your Red Dragonscale Armor, it is all done. Farewell!");
		e.other:QuestReward(e.self,0,0,0,0,11623); -- Red Dragonscale Armor
	end
	item_lib.return_items(e.self, e.other, e.trade)
end