function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("glares at you with fangs bared as he draws an [" .. eq.say_link("electrum-bladed wakizashi") .. "].");
	elseif(e.message:findi("electrum-bladed wakizashi")) then
		e.self:Say("HA! As if a mortal such as yourself is worthy of such a weapon. Leave me to my mission - my purpose in life - the slaying of those who brought me into this existence, then exiled me from this place.");
	elseif(e.message:findi("mother")) then
		e.self:Say("My mother was named Issis. She is, to my knowledge, employed as Lord Mistmoores maid.");
	elseif(e.message:findi("father")) then
		e.self:Say("Syncall is my fathers name. He serves as Lord Mistmoores butler.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 10179,item2 = 10178})) then
		e.other:SummonItem(5408);
		e.other:Ding();
		e.self:Say("[" .. eq.say_link("Mother") .. "]? [" .. eq.say_link("Father") .. "]? May you find peace at last. I shall avenge your suffering! I will grow stronger and set free the souls of the others.");
		e.other:AddEXP(50000);
		eq.depop_with_timer();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
