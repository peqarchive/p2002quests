-- Wizard Epic
-- TODO Needs revamping based on -- http://epicquestadventures.tripod.com/Wizard/wizard_epic.htm
function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hello, there! Don't have time to talk. I'm workin', workin', workin'! Careful! Don't slip in the oil!");
	elseif(e.message:findi("what oil")) then
			e.self:Say("Ah the oil! I recently sent a specially crafted golem to explore through a huge portal to another plane. It's instructions were to collect special oil that I suspect existed in the plane. What I think is the golem broke down. This looks like a good task for one like you. Go see what's wrong with the golem. Here is spare gears of mine incase it's broken. Be careful though, if you put it in wrong it could explode or worse!");
			e.other:SummonItem(14319); -- Golem Sprocket
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 18169})) then -- Note from Arantir
		e.self:Say("Brother! I have one of those. He's great, but he's dead. His name was Gabstik and he was a really powerful wizard. I still have one of his greatest possesions! You look like you could use it. I've added another thing to my shopping list. I require a dry brittle skin that I can mold or a rare oil found in the planes that I can soak the fuse in. Get me one of these things and I'll trade it for my bother's stick.");
		e.other:Faction(342, 30); -- True Spirit
		e.other:QuestReward(e.self,0,0,0,0,0,100); --
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 14349})) then -- Green Oil
		e.self:Say("Oh wow! You found the oil! Where is the golem? You didn't hurt him did you? I am very fond of him. Anyways, here is your reward a note and staff to give to that guy you were asking me about.");
		e.other:SummonItem(18168); -- Note to Arantir
		e.other:Faction(342, 30); -- True Spirit
		e.other:QuestReward(e.self,0,0,0,0,14339,1000); -- Staff of Gabstik
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 14333, item2 = 14332})) then -- Mistletoe Powder and Cazic's Skin
		e.self:Say("Great! Give this to Arantir so he knows you've helped me! Hey! Have you seen my lantern anywhere?");
		-- e.other:SummonItem(14336); -- Kandin's Bag Not in our Database and n
		e.other:Faction(342, 30); -- True Spirit
		e.other:QuestReward(e.self,0,0,0,0,14339,1000); -- Staff of Gabstik
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 14332, item2 = 14332})) then -- 2x Cazic's Skin
			e.self:Say("Great! This is? What is this for again? Oh yeah, the casing for my firework. Here, you can have this then, oh no, wait. You can't yet. I forgot I needed another part to my firework, and you are exactly the person to get it for me! I need some mistletoe powder. Now, go find some for me! Go, go, go, go! Shoo! Oh, wait! Hold on to my bag for me, please. You can give it back after you've given me what I want.");
		--hack because we do not have this bag in the DB
		e.other:Ding();
		e.self:Say("**hack** Hand this skin back in when you turn in the mistletoe powder");
		e.other:QuestReward(e.self,0,0,0,0,14332,100); -- Cazic's Skin
	end
	item_lib.return_items(e.self, e.other, e.trade)
end