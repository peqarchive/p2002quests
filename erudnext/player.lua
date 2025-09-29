function event_enter_zone(e)
	if(e.self:GetBoatID() == 772 or e.self:GetBoatID() == 773) then
		eq.signal(24056,3);
	else
		eq.signal(24056,4);
	end
	local discs = require('disciplines');
	discs:update_discs(e, e.self:GetLevel());
end

function event_signal(e)
	if(e.signal == 1) then
		e.self:SetBoatID(772);
		e.self:SetBoatName("Sea_King000");
	elseif(e.signal == 2) then
		e.self:SetBoatID(773);
		e.self:SetBoatName("Golden_Maiden000");
	end
end

function event_board_boat(e)
	local zone_time = eq.get_zone_time(); -- Time here is off by 1, so 6AM = 5.
	local hour = zone_time["zone_hour"] + 1;
	local minute = zone_time["zone_minute"];
	eq.debug(" At: " .. hour .. ":" .. minute .. " BoatID: " .. e.boat_id .. " was boarded. Its name is: " .. e.self:GetBoatName() .. ".", 1);
end

function event_leave_boat(e)
	local zone_time = eq.get_zone_time(); -- Time here is off by 1, so 6AM = 5.
	local hour = zone_time["zone_hour"] + 1;
	eq.debug(" At: " .. hour .. ":00 I left BoatID: " .. e.boat_id .. ".", 1);
end

function event_level_up(e)
	local discs = require('disciplines');
	discs:train_discs(e, e.self:GetLevel());
end