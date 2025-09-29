function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hi. How are you? The fish are biting pretty good. That is what Skipynn tells me. I sure wish I had a different [" .. eq.say_link("job") .. "]. If I did, I could fish all day long.");
	elseif(e.message:findi("job")) then
		e.self:Say("I am a messenger for [" .. eq.say_link("Antonius Bayle") .. "], ruler of the great city of [" .. eq.say_link("Qeynos") .. "].");
	elseif(e.message:findi("qeynos")) then
		e.self:Say("Huh?! Have you been living in a cave? The great city of Qeynos is the mightiest nation in Antonica! You'd best journey toward the west and visit the city whose influence stretches beyond the horizons.");
	elseif(e.message:findi("antonius bayle")) then
		e.self:Say("How can it be that you do not know of Antonius Bayle? Was it not he who named this great continent of Antonica? Is it not he who rules over the most powerful city on Norrath? Surely you jest!");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 13087})) then -- Bottle of Milk
		e.self:Say("Aaahhhh. Now that is refreshing. Just let me rest for a bit. The note is safe and sound in my bedroll inside the inn.");
		e.other:Faction(184,1,0); -- Knights of Truth
		e.other:Faction(86,-1,0); -- Dismal Rage
		e.other:Faction(105,-1,0); -- The Freeport Militia
		e.other:Faction(311,1,0); -- Steel Warriors
		e.other:Faction(258,1,0); -- Priests of Marr
		eq.spawn2(21136,0,0,2750,-307,-62); -- Duggin Scumber
		e.other:QuestReward(e.self,0,0,0,0,0,1000); -- Exp
	end
	item_lib.return_items(e.self, e.other, e.trade)
end