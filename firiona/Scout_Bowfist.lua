function event_waypoint_arrive(e)
	if(e.wp == 8) then
		e.self:SetRunning(1);
	end
	if(e.wp == 16) then
		e.self:SetRunning(0);
	end
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Halt!! This tunnel is used primarily for the forces of the Union of Vie. Citizens and adventurers are to use the main entrance.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end