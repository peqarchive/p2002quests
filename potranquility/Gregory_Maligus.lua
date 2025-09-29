--Gregory_Maligus (203421)
--potranquility

function event_say(e)
	if e.message:findi("hail") then
		e.self:Emote("gives a gentle smile and nod in warm greetings, 'The residents of tranquility are quite eager to have your presence among us, my friend. We are hopeful to see what the adventurers of this era are capable of rendering from the Elders' efforts in opening the domains of the gods. Of course, our hopes that the fates will guide you in their graces through these dangerous journeys are always with you. In order to aid you further, the residents of tranquility have gathered a supply of modest, though fair provisions that may come of great use to you as you venture into the divine realms. Do not hesitate to search our wares, friend, for they are at your disposal should you find a need or use of them.'");
	end
end

function event_trade(e)		--standard item return script
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end






