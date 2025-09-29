function event_say(e)
    if(e.message:findi("hail")) then
        e.self:Emote("flutters his wings rapidly, sending shimmering dust through the air around you. Although he speaks in high pitched chirps you somehow understand his meaning. Hello "..e.other:GetName()..", I am the Count of the Tunarean Drixies. Are you a [" .. eq.say_link("friend") .. "] of the Tunarean Court?");
    elseif(e.message:findi("friend")) then
		if(e.other:GetFaction(e.self) < 5) then -- indiff?
		    e.self:Say("I am in need of some help. One of my heralds was sent to deliver a message to the Othmir in the Cobalt Scar some time ago and has not returned. I fear for his safety. If your travels should lead you in that direction please attempt to find news of my missing herald.");
		else
			e.self:Say("You must prove yourself to the Court further before I can trust you.");
	    end
    end
end

function event_trade(e)
	local item_lib = require("items");

    if(e.other:GetFaction(e.self) < 5 and item_lib.check_turn_in(e.self, e.trade, {item1 = 24876})) then
		e.self:Say("Thank you for your assistance, though I am greatly saddened by the death of my herald.  Truly you are a friend of the Tunarean Court.  Take this crest as a token of my gratitude.");
		e.other:Faction(344, 30);
		e.other:QuestReward(e.self,0,0,0,0,24867,100);
    end
	
	item_lib.return_items(e.self, e.other, e.trade)
end