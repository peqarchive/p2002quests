-- pulsing green stone - ranger/druid epic
function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("The living fire. I seek the fires of life. Bring them.");
	end
end

function event_trade(e)
	local qglobals = eq.get_qglobals(e.self);
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 10295})) then
		e.self:Emote("grasps the glowing sphere of fireflies from your hands. Tendrils of mystical energy begin to flow forth from the swarm of glowing insects like tiny fingers. The glowing tendrils begin to reach into the ribcage of the rotting remains of Venril Sathir, coalescing into the form of an iksar ghost.");
		eq.unique_spawn(102137,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading());
		if qglobals.VSR_timer ~= nil then
			eq.delete_global("VSR_timer");
		end
		eq.depop();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end