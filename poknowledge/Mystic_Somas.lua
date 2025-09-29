function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Hail to you. " .. e.other:GetName() .. ". New Tanaan's mystics are always fond of visitors. for it is we above all others who desire pupils and interaction with the world. Though often times we seem solitary. the spirits guide us and we always listen. It is when a pupil is listening to our words and following a path carved from our guidance that we feel possessed with life and purpose. The mystics of New Tanaan have been limited. however. and we may only properly guide others who are shaman of their mortal world. Spells have been scribed from our collective memories and those who feel that they may gain from our efforts are encouraged to browse our inventories.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end
