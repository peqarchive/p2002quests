function event_target_change(e)
	if((e.self:GetTarget():GetCleanName() == "Lady Vox") and (e.self:GetLevel() > 52) and (e.self:Admin() < 80)) then
		e.self:Message(0,"I will not fight you, but I will banish you!");
		e.self:MovePC(30,-7024,2020,-60.7,0);
	end
end

function event_level_up(e)
	local discs = require('disciplines');
	discs:train_discs(e, e.self:GetLevel());
end

function event_enter_zone(e)
	local discs = require('disciplines');
	discs:update_discs(e, e.self:GetLevel());
end
