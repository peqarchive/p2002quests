function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say(string.format("Hail, %s - If you are interested in helping the League of Antonican Bards by delivering some mail then you should talk to my wife, Eve.",e.other:GetName()));
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 18150}) or item_lib.check_turn_in(e.self, e.trade, {item1 = 18151}) or item_lib.check_turn_in(e.self, e.trade, {item1 = 18153}) or item_lib.check_turn_in(e.self, e.trade, {item1 = 18154})) then
		e.self:Say("Incoming mail - very good! Please take this gold for your troubles.");
		e.other:Ding();
		e.other:Faction(192,10,0);
		e.other:Faction(184,10,0);
		e.other:Faction(135,10,0);
		e.other:Faction(273,-30,0);
		e.other:Faction(207,-30,0);
		e.other:AddEXP(100);
		e.other:GiveCash(0,0,math.random(9),0);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
