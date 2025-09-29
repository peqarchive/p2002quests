--This version of Hero Goxnok spawns after the Drachnid Spy is killed. Once confronted by hailing him, he will attack. Both versions of Hero Goxnok are for the fifth quest in the Greenmist line.
function event_spawn(e)
	eq.set_timer("depop", 1800000);
end

function event_timer(e)
	if e.timer == "depop" then
		eq.stop_timer("depop");
		eq.depop();
	end
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("sighs slowly, seeing the confusion on your face. He says, 'Yes, " .. e.other:GetName() .. ", I am the traitor. What I can gain by giving up this tome outweighs any patriotic obligations I may have once had. That city is dead, it is now time for us to grasp at our own destinies. I now give you two choices, " .. e.other:Race() .. ". You can walk away and never speak of this to anyone......or you can die. What will it be?'");
	end
end

function event_combat(e)
	if(e.joined == true) then
		e.self:Say("Die by the power of Greenmist!!");
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end