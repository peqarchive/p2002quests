-- Test of Charm - enchanter epic - start of quest
function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hello my dear. I am quite pleased to make your acquaintance. Perhaps even charmed!");
	elseif(e.message:findi("i need a sack") and e.other:HasItem(10604)) then
		e.self:Say("Take this sack and combine the items I requested in it. Then return it to me.");
		e.other:SummonItem(17861); --An Enchanters Sack
	elseif(e.message:findi("gems")) then
		e.self:Say("I have prepared some gems that you will need to trap the essence. You will need to force a [" .. eq.say_link("diamond") .. "], [" .. eq.say_link("sapphire") .. "], [" .. eq.say_link("ruby") .. "] and [" .. eq.say_link("emerald") .. "] onto special creatures to obtain their essence.");
	elseif(e.message:findi("diamond")) then
		e.self:Say("Here is the diamond that I have prepared for you. Its only purpose is to trap the essence of a particular book worm. If you should fail in your first attempt, do not worry. I will provide you with another.");
		e.other:SummonItem(10631); --Dull Diamond
	elseif(e.message:findi("sapphire")) then
		e.self:Say("Here is the sapphire that I have prepared for you. Take it and give it to the one referred to as the Golden Faerie.");
		e.other:SummonItem(10632); --Dull Sapphire
	elseif(e.message:findi("ruby")) then
		e.self:Say("Blood red is the ruby that I have given you. The city that you must travel to has no sun, but still a day and night. And at night, the mist could suffocate one. Tis the fate of poor Jaxion.");
		e.other:SummonItem(10633); --Dull Ruby
	elseif(e.message:findi("emerald")) then
		e.self:Emote("jumps.");
		e.self:Say("Eeekk... a scorpion. I thought they rid this area of these critters. Those things give me the creepers. Take this emerald and be on your way.");
		e.other:SummonItem(10634); --Dull Emerald
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 10604})) then --Jeb's Seal
		e.self:Say("Oh it must be time to reveal the staff! The piece I will help you craft is encrusted with magical [" .. eq.say_link("gems") .. "]. These gems contain the essence of various creatures. Alone they have very little power. Combined together they are much more powerful. They must be combined in a sack. Just ask if you don't have one.");
		e.other:QuestReward(e.self,0,0,0,0,10604); --Jeb's Seal
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 10637})) then --A Sack For Nadia
		e.self:Say("Lovely! You are indeed quite the charmer. Here, take the third part, and seek out the last master. The time draws near.");
		e.other:Faction(342,30); --True Spirit
		e.other:QuestReward(e.self,0,0,0,0,10612,10000); --3rd Piece of Staff
	end
	item_lib.return_items(e.self, e.other, e.trade)
end