function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings!  You must be a stranger or [" .. eq.say_link("new to the Hall") .. "].  If you are a stranger. be warned that these halls are intended for the Ebon Mask only. If you are found to be a member of another house. you just may feel the sting of a blade in your back.");
	elseif(e.message:findi("new to the hall")) then
		e.self:Say("Then I am glad to make your acquaintance. Have you ever been to Freeport?  If not. how would you like to go?  It is a test of your cunning we wish.  Are you prepared to risk your young life?  Are you [" .. eq.say_link("ready to venture to Freeport") .. "]?");
	elseif(e.message:findi("venture to freeport")) then
		e.self:Say("Find a way to the port of Freeport.  Seek out Giz Dinree.  She is usually near the shores at night.  She is your contact. Tell her you were [sent by Tani].  She will fill you in on your mission.  Good luck.  Do not waste time practicing your skills. Go as you are.");
	elseif(e.message:findi("book of souls")) then
		e.self:Say("The Book of Souls chronicles all the lives Innoruuk has tainted over the years. It is in the care of the Maestro of Rancor. I can use this tome as a basis for my translation, if you return it and the note to me. An experienced practitioner in the art of non-detection should be able to snatch it from its resting place, don't you think, " .. e.other:Race() .. "?'");
	elseif(e.message:findi("note")) then
		e.self:Say("Oh, you want that piece of paper Stanos was so hot after? Well it's mine now, though it looks like ogre scratch to me. You're not getting it, Stanos is not getting it, and Hanns is not getting it. It is MINE! Now, " .. e.other:Race() .. ", scamper off like the dog you are, before I decide I need more practice with these short swords!");
	elseif(e.message:findi("stanos")) then
		e.self:Say("Stanos? Hahahaha! That old fool crossed my path a few times in the past, but he is not able to trouble me now. If you see him, tell him Tani sends his..love. Hahahaha!");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 13892})) then
		e.self:Say("Good work! I knew you could prove your worth. Most waste time training. I do not reward those who waste my time. Please take this. It is from our horde, from countless robberies. I hope you can use it to advance yourself. Remember to always stay faithful to Neriak.");
		e.other:Faction(90,5);
		e.other:Faction(135,-5);
		e.other:Faction(361,-5);
		e.other:Faction(133,-5);
		e.other:Faction(31,-5);
		e.other:QuestReward(e.self,0,8,0,0,5066,5000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end