function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 20368})) then
		e.self:Say("Hmmm. What's this? A note from that silly bard Baenar? I wasn't aware that those of his kind could write, much less read.' Maligar lets out a deep laugh. 'I see you do not share my sense of humor. Let's read it, shall we? Oh, no! She's dead? I knew that already, you fool. It was by my hand she died! Ooops! Did I let that slip out? Silly me. I guess I will have to kill you now!");
		eq.spawn2(12173,0,0,-10909,1260,209,272);
		local maligar_dop = eq.get_entity_list():GetMobByNpcTypeID(12173);
		maligar_dop:CastToNPC():AddToHateList(e.other);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
