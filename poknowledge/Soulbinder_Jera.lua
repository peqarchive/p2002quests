function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Greetings " .. e.other:GetName() .. ". When a hero of our world is slain their soul returns to the place it was last bound and the body is reincarnated. As a member of the Order of Eternity  it is my duty to [" .. eq.say_link("bind my soul",false, "bind your soul") .. "] to this location if that is your wish.");
	elseif(e.message:findi("bind my soul")) then
		e.self:Say("Binding your soul. You will return here when you die.");
		e.self:CastSpell(2049,e.other:GetID(),0,1);
	-- Halloween Event
	-- elseif(e.message:findi("illusion")) then -- Halloween Event
	-- 	e.other:SetRace(eq.ChooseRandom(469,466,464,458,455,454,420,419,418,417,414,413,412,411,406,400,398,396,393,384,355,336));
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end
