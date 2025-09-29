function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 1681})) then -- Engraved Ring
		e.self:Say("Nothing is left to hide now. You shall have the truth. But truth is not won easily and if you cannot defeat me, you have not the ability to see that vengeance is served. Brace yourself!");
		eq.depop()
		e.other:Ding();
		e.other:Faction(342,50); -- True Spirit
		eq.spawn2(90195,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- Neh`Ashiir
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
