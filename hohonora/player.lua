--player.lua for
--Halls of Honor A
function event_enter_zone(e)
    local instance_id = eq.get_zone_instance_id();
    local instance_version = eq.get_zone_instance_version();
    local discs = require('disciplines');
    discs:update_discs(e, e.self:GetLevel());

    --e.self:Message(1,string.format("[DEBUG], InstanceID = %i, Instance Version = %i",instance_id,instance_version));

    if(instance_id ~= 0) then
        e.self:Message(15,"You have entered an Instanced Version of the zone.");
    end
end

function event_level_up(e)
    local discs = require('disciplines');
    discs:train_discs(e, e.self:GetLevel());
end

--zone in to hohonorb 
function event_click_door(e)
	local door = e.door:GetDoorID();
	local instance_id = eq.get_zone_instance_id();
	local qglobals = eq.get_qglobals(e.self);
	--eq.zone_emote(14,"Door ID is: " .. door);   --debug to easily check door IDs
	
	
	
	if door == 19 or door == 20 then
		if qglobals.pop_poj_mavuin ~= nil and qglobals.pop_poj_tribunal ~= nil and qglobals.pop_poj_valor_storms ~= nil and qglobals.pop_pov_aerin_dar ~= nil and qglobals.pop_hoh_faye ~= nil and qglobals.pop_hoh_trell ~= nil and qglobals.pop_hoh_garn ~= nil then
			if not e.self:HasZoneFlag(220) then
				e.self:SetZoneFlag(220);
				e.other:Message(15,"You've received a character flag!");
			end
		else
			e.self:Message(13,"You lack the will to pass through this portal safely.");
		end
	end
	
end
