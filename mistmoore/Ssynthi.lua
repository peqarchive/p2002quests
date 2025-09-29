-- Quest for Scepter of Sorrow

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("I am Ssynthi, [" .. eq.say_link("Warder of Ro") .. "]. Would you do a simple [" .. eq.say_link("service") .. "] for me?");
	elseif(e.message:findi("warder of ro")) then
		e.self:Say("I have renounced my ties to the Shadowed Men and become a follower of the one True Flame, Solusek Ro. I have hopes that one day my brethren will see the errors of their ways and cease their mindless war.");
	elseif(e.message:findi("service")) then
		e.self:Say("The body of my true love lies within this tomb. I see a token to remember her by the flower which lies atop her coffin. I would get it myself, but the tomb is warded against my kind. Since I can not enter, I ask you to fetch it for me.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 14362})) then -- Flower
		e.self:Say("Thank you. Since you have done me a service with no thought of reward, I offer you this small token of my favor.");
		e.other:SummonItem(14364); -- Scepter
		e.other:Ding();
		e.other:Faction(320,10);  -- Temple of Solusek Ro
		e.other:Faction(291,-1); -- Shadowed Men
		e.other:AddEXP(1000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end