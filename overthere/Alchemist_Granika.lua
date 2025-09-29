--Alchemist Granika will help us to discern the glowing cliff golem from the rest, the one who holds our Chunk of Tynnonium. He is part of the eighth and final quest in the Greenmist line.
function event_spawn(e)
	eq.set_timer("sit",10000);
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("If you were sent to me, show proof or be gone from my sight!");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 3892})) then
		e.self:Say("If Heirophant Oxyn has sent this with you, I can assume that our visions were correct. The new age is calling us from the heavens. Prepare for battle. I will take this solution to the Outlander's gates and use it to reveal the location of the metal of prophecy. Should I not return, you will only need to find the creature that glows without the use of a torch. Deklium glows when it gets near the smallest trace of tynnomium. Prepare for battle, Crusader... I am off!");
		eq.stop_timer("sit");
		eq.start(4);
		eq.set_timer("Depop",8000);
		eq.spawn2(93308,0,0,1955,2825,-49,380); 	--Spawns glowing cliff golem
		eq.spawn2(93309,0,0,1955,2794,-49,380);		--undead watchman
		eq.spawn2(93309,0,0,1954,2855,-49,380);		--undead watchman
		eq.spawn2(93309,0,0,1925,2810,-49,380);		--undead watchman
		eq.spawn2(93309,0,0,1925,2840,-49,380);		--undead watchman		
		eq.spawn2(93311,0,0,1915,2825,-49,380);		--Watch Sergeant Grolj
		eq.signal(93077,0);						--despawns cliff golem if up since glowing golem triggered
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

function event_timer(e)
	if(e.timer == "Depop") then
		eq.stop_timer("Depop");
		eq.depop_with_timer();
	elseif(e.timer == "sit") then
		e.self:SetAppearance(1);
		eq.stop_timer("sit");
	end
end

