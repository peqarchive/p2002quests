function event_death_complete(e)
	if (math.random(100) <= 30) then	-- 30% chance for ooze to spawn
		eq.spawn2(48349,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),128); -- a pool of black ooze
	end
end
