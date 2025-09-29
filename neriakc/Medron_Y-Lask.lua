function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Welcome to the Furrier Royale. Here you will find the finest skins from a variety of Norraths lesser creatures.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 16170, item2 = 16170})) then
		e.self:Emote("stretches and fastened the basilisk skins across the shield frame and attaches a leather strap and grip to the back of the shield. 'Here is your new shield young Shadowknight. I have been paid in advance by the Lodge of the Dead for the shields assembly. May Innoruuk strengthen you in your service to Her Majesty Queen Cristanos.'");
		e.other:Faction(69,1);
		e.other:Faction(87,1);
		e.other:Faction(88,1);
		e.other:QuestReward(e.self,0,0,0,0,19610,1000);
	end
end