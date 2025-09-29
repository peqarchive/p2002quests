local count;
function event_spawn(e)
	count = 0;
	eq.set_timer("train",7000);
end

function event_timer(e)
	count = count + 1;
	if(count==3) then
		e.self:Say("Listen up, recruits! Your lives will depend on your ability to deal with an enemy in unarmed combat.");
	elseif(count==4) then
		e.self:Say("If you are comfortable in unarmed combat, you will be able to understand the worst cast scenario of any given situation.");
	elseif(count==5) then
		e.self:Say("If you are caught by surprise, Your ability to fight with your feet and fists will be the base from which you will have to work.");
	elseif(count==6) then
		e.self:Say("If that foundation is a strong one, you will have little to worry about... even in the most dire of situations.");
		eq.set_timer("train",25000);
	elseif(count==7) then
		e.self:Say("Are you two ready to spar?");
		eq.signal(155131,1,5);
		eq.set_timer("train",5000);
	elseif(count==8) then
		eq.signal(155131,2,5);
		eq.set_timer("train",90000);
	elseif(count==9) then
		count = 0;
		eq.set_timer("train",7000);
	end
end

function event_signal(e)
	if(e.signal == 1) then
		e.self:Say("Recruit, don't guess... Bring up your guard and fight! ");
	elseif(e.signal == 2) then
		e.self:Say("Good good! Ease up on him, Mogol. Both of you, take a break for a moment.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end
