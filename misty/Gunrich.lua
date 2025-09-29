function event_say(e)
	if(e.other:GetFaction(e.self) < 4) then
		if(e.message:findi("hail")) then
			e.self:Say("Hello, " .. e.other:GetName() .. ". What can I do for you?");
		elseif(e.message:findi("dark rivers flow east")) then
			e.self:Say("So, Rueppy Kutpurse must have sent you. Here, take this case. Be careful, though. You don't want to get caught with that in town. It is illegal to possess such alcohol.");
			e.other:SummonItem(13131); --Case of Blackburrow Stout
		end
	else
		e.self:Say("I am sorry, " .. e.other:GetName() .. ". You aren't trustworthy enough yet.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end
