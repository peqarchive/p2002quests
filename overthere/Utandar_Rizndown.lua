function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say(" It is good to see our numbers growing on this land. Welcome! May your travels be as prosperous as mine have. There are many [" .. eq.say_link("new powers") .. "] to be gained from this land.");
	elseif(e.message:findi("new powers")) then
		e.self:Say(" The new powers are scrolls that give us access to new and powerful spells. My collection is almost complete. I am simply [" .. eq.say_link("lacking") .. "] four more and then I will return back to the homeland.");
	elseif(e.message:findi("lacking")) then
		e.self:Say(" I am missing the scroll Atol's Spectral Shackles, Tears of Druzzil, Inferno of Al'kabor, and Pillar of Frost. Should you run into one, bring it to me and I'll perform an exchange for another scroll.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 19315}) or item_lib.check_turn_in(e.self, e.trade, {item1 = 19322}) or item_lib.check_turn_in(e.self, e.trade, {item1 = 19318}) or item_lib.check_turn_in(e.self, e.trade, {item1 = 19319})) then
		--tokyo2001 & Allakhazam don't have any text for the rewards, so i kept the text from FV's NPC.
		e.self:Say("Here is the scroll that I promised. We have both gained much knowledge today. I hope to do business with you again soon. Farewell!");
		e.other:QuestReward(e.self,0,0,0,0,eq.ChooseRandom(19329,19320,19324,19317),1000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end