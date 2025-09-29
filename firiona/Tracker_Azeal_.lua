--Tracker Azeal is actually Hero Goxnok in disguise. This version of him has been triggered to spawn at 9 PM game time, and will then path out of the outpost.
--After a time, he will pause on his normal pathing and kneel and we can give him an item to spawn Hero Goxnok. All of this is for the fifth Greenmist quest.
function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 12691})) then --Test of Betrayal (Greenmist Quest 5/8)
		e.self:Emote("begins to pull his face off.. it is a disguise!! 'Aha!! You have made it!! I cannot see well in this disguise, but I thought I smelled you. I have [" .. eq.say_link("news of the Charasis tome") .. "].'");
		e.other:Ding();
		eq.spawn2(84412,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading());
		eq.spawn2(84392,0,0,-1822,617,142.5,206);
		eq.depop();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
