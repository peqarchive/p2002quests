function event_say(e)
	if(e.message:findi("what bixie berry pie?")) then
		e.self:Say("Bixie berry pie?!!  It is no treat and is poisonous to the Iksar.  We use it to keep our froglok slaves nourished.  My apprentice baker, Bugrin, bakes them and delivers them to the slaves.  Only he has access to the bixie berry pie recipe.  All the pies are eaten by the slaves. If you think you have one, you must be mistaken.  Let me see it if you believe you have one.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 12676})) then -- Bixie Berry Pie
		e.self:Emote("breaks open the crust of the pie.");
		e.self:Say("Wait! What is this? A device of some kind? It looks kind of like some sort of lockpick. BUGRIN!! Get in here and answer some questions at once!!");
		eq.spawn2(106302,0,0,120,563,4,0); -- Bugrin the Gatherer
	end
end