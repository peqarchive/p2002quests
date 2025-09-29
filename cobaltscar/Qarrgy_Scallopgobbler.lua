-- Kelorek's Scales and Captain Nalot's Triple Strength Rum
function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("sets down several large crustacean shells covered in foreign runes, then extends his large, coarse hands in a gesture of friendship.");
		e.self:Say("I am pleased to see friendly visitors to our villages. I am the head craftsman of the village. The [" .. eq.say_link("crustacean shell armor") .. "] worn by the warriors of our village was crafted by me and by my apprentices. I will craft [" .. eq.say_link("other materials") .. "] as well when they are available.");
	elseif(e.message:findi("crustacean shell armor")) then	
		e.self:Say("It takes awhile to make each piece. It has to go through a long [" .. eq.say_link("burning process") .. "] to clean away all old meat and dirt. Then it needs shaping and etching with runes.");
	elseif(e.message:findi("burning process")) then	
		e.self:Say("Usually I use a mixture made from the livers of barraccudas. Their liquids are very strong and make good burning liquid. If you want some you need to bring me two barraccuda livers.");
	elseif(e.message:findi("other materials")) then	
		e.self:Say("I am able to craft dragon scale armor but it has been a long time since I have had the opportunity to do so for my people. What kind of scales do you wish for me to craft?");
	elseif(e.message:findi("emerald dragon scale")) then	
		e.self:Say("I will craft an emerald dragonscale tunic for emerald dragon scales, ulthork tusks, and an unstained fine plate breastplate.");
	elseif(e.message:findi("sea dragon scale")) then	
		e.self:Say("Should you slay Kelorek'Dar, the sea dragon, I would craft you a sea dragon bracer from his scales. All I ask for are the scales of the dragon, an ornately runed shell necklace, and an unstained bracer crafted of the metal you strange ones call fine steel.");
	end
end

function event_trade(e)
	local item_lib = require('items');
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 22823, item2= 24874, item3 = 21004})) then -- Emerald Dragon Scales, Ulthork Tusks and Fine Plate Breastplate
		e.self:Emote("skillfully crafts the Emerald Dragon Scales into a tunic, hands it to "..e.other:GetName()..", and claps enthusiastically.");
		e.other:Faction(241, 30); -- Othmir
		e.other:Faction(345, -60); -- Ulthork
		e.other:QuestReward(e.self,0,0,0,0,11635,10000) -- Emerald Dragonscale Tunic
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 22814, item2 = 28515, item3 = 21009})) then	-- Sea Dragon Scales, Ornately Runed Shell Necklace and Fine Plate Bracer
		e.self:Emote("skillfully crafts the Sea Dragon Scales into a bracer, hands it to "..e.other:GetName()..", and claps enthusiastically.");
		e.other:Faction(241, 30); -- Othmir
		e.other:Faction(345, -60); -- Ulthork
		e.other:QuestReward(e.self,0,0,0,0,11589,10000); -- Sea Dragonscale Bracer
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 30059,item2= 30059})) then -- Barracuda Liver
		e.self:Emote("slams a knife into the various livers and squeezes out all of their various goos and juices. Eventually he separates a bit of it and pours it into a protective bladder. 'Excellent work. This good catch. Here, you have sack of ooze. It's good for burning things off or etching metals. Thank you for your help.");
		e.other:Faction(241, 30); -- Othmir
		e.other:Faction(345, -60); -- Ulthork
		e.other:QuestReward(e.self,0,0,0,0,30060,10000); -- Bladder of Acidic Ooze
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

