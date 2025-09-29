-- Test of Phanatsm - enchanter epic - start of quest
function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Yes, young one?");
	elseif(e.message:findi("test of the phantasm")) then
		e.self:Say("It will be simple, go collect these items and return them to me. [" .. eq.say_link("Head of a serpent") .. "], [" .. eq.say_link("essence of a ghost") .. "], [" .. eq.say_link("essence of a vampire") .. "], and [" .. eq.say_link("sands of the mystics") .. "]. Do so and you will receive the last of the pieces. Be sure to combine them in a sack first. Just ask and I will provide you with one.");
	elseif(e.message:findi("head of a serpent")) then
		e.self:Say("Serpent is probably not an accurate term for what you must return to me. It is actaully the reminants of a spirit. The spirit is one which was erradicated long long ago by the Iksar. I believe they were called the Shissar. You may need to travel to the Iksar city to learn more about these creatures.");
	elseif(e.message:findi("essence of a ghost")) then
		e.self:Say("You don't have to look far to find roaming spirits. One in particular though has more meaning then the other sorry souls trapped here. You see, Kindle was a dear friend of mine. I came in search of him when he stopped writing. Well...look at me now. I fear that I have succumbed to the same fate as poor Kindle.");
	elseif(e.message:findi("essence of a vampire")) then
		e.self:Say("The essence of a vampire is just that. Only the most powerful of these creatures will possess what you need.");
	elseif(e.message:findi("sands of the mystic")) then
		e.self:Say("They are sands that were imbued with the magical might of the mystics. Mystics use a ritual involving their own blood to create a powerful bond with the sand. One will need to search the shores.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 10604})) then
		e.self:Say("Jeb has spoken with you already, excellent. Tell me are you ready for the [" .. eq.say_link("test of the phantasm") .. "]?");
		e.other:SummonItem(10604);
		e.other:QuestReward(e.self,0,0,0,0,17861);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 10638})) then
		e.self:Say("You have done well, take this last piece and return them to Jeb. He will be able to complete the final crafting.");
		e.other:Faction(342,30);
		e.other:QuestReward(e.self,0,0,0,0,10613,100000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end