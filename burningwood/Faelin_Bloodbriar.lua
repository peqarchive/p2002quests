-- Ranger Epic
function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Didn't think I was gone for good, did you? We're that much closer to finishing this trial of our strength, thanks to you.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 20481})) then -- Refined Ancient Sword
		e.self:Emote("smiles at you, then closes her eyes as she sets the gem 'Nature's Balance' into the crossguard and begins to channel her spirit into the sword. The ground rumbles loudly as she casts. She collapses in exhaustion after a short time. 'Take the blade, and perhaps you can finish this. You must strike at the heart of Innoruuk's lair. Bring a shattered gem and the mithril blade to Xanuusus. Only by weakening Innoruuk's grip over his realm can the balance of the land once again be restored. If we do not meet again, " .. e.other:GetName() .. ", remember you always have my eternal thanks.'");
		e.other:QuestReward(e.self,0,0,0,0,20487,1000000); --  Swiftwind
		eq.depop();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end