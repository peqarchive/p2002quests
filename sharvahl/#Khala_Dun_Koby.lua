function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("And hello to you traveler. Beyond this gate lies the Shadeweavers Thicket. You had best go armed. for the [" .. eq.say_link("Claw Beasts") .. "] have been attacking merchants regularly.");
	elseif(e.message:findi("claw beasts")) then
		e.self:Say("A true horror. they are mindless predators and quite large to boot. These beasts have massive razor sharp teeth that can rip your arm off cleanly.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	-- takes repair order from master Barkhem
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 29803})) then
		e.self:Say("Oh this old shield does fine, but I guess if Barkhem needs to break in a new apprentice, it does have some dings in it. Thank you, my friend.");
		e.other:QuestReward(e.self,0,0,0,0,29804); -- koby dented shield
	end
	-- You receive Koby's Dented Shield. Take the dented shield and place it into a forge with your Vah Shir Apprentice Mallet. This creates Koby's Immaculate Shield (the mallet will be returned). Give this shield back to Jasir to receive Koby's Work Order.
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 29805})) then
		e.self:Say("Tip-top work! Barkhem has done well by himself choosing you for an apprentice.");
		e.other:QuestReward(e.self,0,0,0,0,29806); -- koby work order
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
