--The enslaved iksar is part of the Greenmist quest line, and is for the seventh quest in the series.
--He gives a bit of flavor through most of his speech, but is also used to turn in items for a part of the Stupendous Tome.
function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("looks up at you. You can tell his spirit is broken. His scars speak of a severe beating.");
	elseif(e.message:findi("Vok Na Zov")) then
		e.self:Say("Forget them. I believe all six scrolls lie in the [" .. eq.say_link("Kaesora Library") .. "] and that is no safe place for any explorer. The scrolls are not readable by any livng person, but I came here in search of a machine which may be able to decipher them, the [" .. eq.say_link("Stupendous Contraption") .. "]. Should you return to Cabilis, see that the Arch Duke hears of the scrolls.");
	elseif(e.message:findi("kaesora library")) then
		e.self:Say("Oh!! You heard of the ancient library I discovered in Kaesora? I think the six scrolls of Vok Na Zov may lie there. I have not yet actually found the location of the library and it's very dangerous to lurk within the ruins of Kaesora. I would not venture there if I were you.");
	elseif(e.message:findi("stupendous contraption")) then
		e.self:Say("I have learned it was a machine tinkered by a legendary gnome. It has many uses. It lies in the slave pens of Droga. Perhaps it may be used to decipher the Scrolls of Vok Na Zov. I have leearned that it will not work without a [" .. eq.say_link("contraption needle") .. "]. Luckily I have found one in my journies.");
	elseif(e.message:findi("contraption needle")) then
		e.self:Say("The contraption needle is a piece of the machine, the [" .. eq.say_link("Stupendous Contraption") .. "]. It won't operate without it and if you want it, you're going to have to bring me the [" .. eq.say_link("pen keys") .. "].");
	elseif(e.message:findi("pen keys")) then
		e.self:Say("Pen keys!! I need the pen keys to get out of here! Find the ones who hold these keys. Bring me the key to pen number 1 and both keys to the pen gates. Do so and I shall give you the [" .. eq.say_link("contraption needle") .. "].");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 12708, item2 = 12712, item3 = 12713})) then -- A Stone Key, A Bone Key and A Bone Necklace
		e.self:Emote("escapes with a flash, but before he goes, he speaks, 'At last!! The keys which shall bring me freedom! I thank you and here is the contraption needle. Good luck.'");
		e.other:QuestReward(e.self,0,0,0,0,12714,2000) -- A Coarse Iron Needle
		eq.depop_with_timer();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end