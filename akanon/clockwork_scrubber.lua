function event_spawn(e)
	local miner628 = 0;
	local random_result = math.random(100);
	if(random_result <= 5) then
		miner628 = 1;
	end
end

function event_say(e)
	if (e.message:findi("628") and miner628) then
		e.self:Emote(".wizz.click.628.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if (miner628 and item_lib.check_turn_in(e.self, e.trade, {item1 = 12164})) then -- Scrubber Key
		e.self:Emote(".wizz.click.628.");
		e.other:Faction(45,-10,0); -- Clockwork Gnome
		e.other:QuestReward(e.self,0,0,0,0,eq.ChooseRandom(12162,12167),500); -- Gnome Take (Good or Bad)
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
