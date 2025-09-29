-- Regal Band of Bathezid
-- global RegalBandBathezid, needed to be sure players won't jump to the last part of the quest
--   at 1 : you gave the Signet of Service to the goblin traitor
function event_say(e)
    local qglobals = eq.get_qglobals(e.self,e.other);
	if(qglobals["RegalBandBathezid"] == "1") then -- we handed the Signet of Service yet
		-- the goblin won't talk to the player unless we did the beginning of the quest
		if(e.message:findi("hail")) then
			e.self:Say("'Go away, my life is miserable enough!' The angry goblin looks at you more closely, his rage fading for a moment. 'Are you here with the evidence I was promised? Give it to me if you have it.'");
		end
	end
end

function event_trade(e)
    local qglobals = eq.get_qglobals(e.self,e.other);
	local item_lib = require("items");
	if(qglobals["RegalBandBathezid"] == "1") then -- we handed the Signet of Service yet
		if(item_lib.check_turn_in(e.self, e.trade, {item1 = 6474})) then -- Report to Skargus
			e.self:Emote("howls in triumph! 'This is just what I needed! Skargus is mine now, wait until he finds out, just wait! His death is close at hand. Follow me and I'll take you to Skargus's chamber, you can wait there while I take this report to the chief!'");
			e.self:Shout("I have you now Skargus, you traitor! Even now I'm taking this report of slave-trading to the chief! Your days here are at an end!");
			eq.depop_with_timer();
			eq.unique_spawn(81476,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ()); -- Warlord Skargus
		end
	end
	item_lib.return_items(e.self, e.other, e.trade)
end