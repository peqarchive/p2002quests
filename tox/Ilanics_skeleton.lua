-- Ilanic's Scroll
function event_spawn(e)
	eq.set_timer("depop",3600000);
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("I am no more.");
	elseif(e.message:findi("scroll") and e.other:GetClass() == 12) then
		e.self:Say("Kobold! Kobold!");
		eq.unique_spawn(38172,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading());
		eq.depop();
	end
end

function event_timer(e)
	eq.depop();
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end