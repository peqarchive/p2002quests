function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings, child. Welcome to Gemchopper Hall. I trust that you are a [" .. eq.say_link("warrior") .. "], or perhaps you are [" .. eq.say_link("lost") .. "]..?");
	elseif(e.message:findi("lost")) then
		e.self:Say("One can easily get lost in Ak'Anon. You must get your vision checked. If you are truly lost, I would advise speaking with a mechanical guide. There should be one close by on the main walkway.");
	elseif(e.message:findi("warrior")) then
		e.self:Say("That is good news! We gnomes are not known for our love of battle so it is always good to bring new blood into our ranks. We shall prove our worth as warriors to all other races. For now. there is much to do in Ak'Anon. There are [" .. eq.say_link("rogue clockworks") .. "] and the [" .. eq.say_link("cargo clockwork") .. "].");
	elseif(e.message:findi("rogue clockworks")) then
		e.self:Say("The clockworks are the responsibility of Manik Compolten. Speak with him - I am sure he is here somewhere.");
	elseif(e.message:findi("cargo clockwork")) then
		e.self:Say("The cargo clockwork is located near the entrance to Ak'Anon in the Steamfont Mountains. It runs a delivery to the windmills every five days at eight in the morning. There have been attacks by a group of highwaymen. They are quite a formidable group. I have offered a reward for their heads. Be very careful if you plan on escorting the cargo clockwork. This trio of bandits is very strong.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 1270,item2 = 1319,item3 = 1323})) then -- Hector's Severed Head, Jerald's Severed Head and Renaldo's Severed Head
		e.self:Say("I heard our shipment made it back safely. These heads will send a message to any other thief that plans on robbing our cargo shipments. Thank you " .. e.other:GetName() .. ", take this mask and this coin as your reward.");
		e.other:Faction(115,2); -- gem chopper
		e.other:Faction(210,1); -- merchants of akanon
		e.other:Faction(176,1); -- king akanon
		e.other:Faction(71,-1); -- dark reflection
		e.other:Faction(39,-1); -- clan grikbar
		e.other:QuestReward(e.self,math.random(9),math.random(9),math.random(5),0,137320,1500);	--Highway Protectors Mask
	end	
	item_lib.return_items(e.self, e.other, e.trade)
end