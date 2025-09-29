function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings, " .. e.other:GetName() .. ". You have come to me searching for tasks and tasks I have. Would you judge yourself an [" .. eq.say_link("experienced heretic") .. "] or one who has [" .. eq.say_link("much to learn") .. "]?");
	elseif(e.message:findi("much to learn")) then
		e.self:Say("Very well, " .. e.other:GetName() .. ". I do have a task for you. There is an old and frail Erudite male who now lives in Toxxulia named Aglthin Dasmore. He has left the ways of Cazic-Thule and no longer practices our craft. He has been stripped of his power and wealth, so he spends his time fishing by the river. Our great Lord of Fear has decreed that his life is forfeit. Slay him, and bring me proof of the deed.");
	elseif(e.message:findi("experienced heretic")) then
		e.self:Say("Ah. Excellent. I have just the task for you, " .. e.other:GetName() .. ". In Kerra Ridge, there is a particular cat named Kirran Mirrah that we have been using to gather information about, well, certain aspects of cat society. He is no longer providing information for us and we have something for him that may encourage him to assist again. Ha! Hand him this sealed bag for us. It may just change his point of view. Hahaha!");
		e.other:SummonItem(9968); --Smelly Sealed Bag
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 9969})) then --Aglthin's Fishing Pole
		e.self:Say("Yes, this will do.");
		e.other:Faction(143,3);  --Heretics
		e.other:Faction(112,-3); --Gate Callers
		e.other:Faction(79,-3);  --Deepwater Knights
		e.other:Faction(56,-3);  --Craftkeepers
		e.other:Faction(60,-3);  --Crimson Hands
		e.other:QuestReward(e.self,4,8,4,0,13697,500); --Staff of the Abattoir Initiate
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 9967})) then --Karran's Head
		e.self:Say("I take it he got the message... Excellent work!");
		e.other:Faction(143,3);  --Heretics
		e.other:Faction(112,-3); --Gate Callers
		e.other:Faction(79,-3);  --Deepwater Knights
		e.other:Faction(56,-3);  --Craftkeepers
		e.other:Faction(60,-3);  --Crimson Hands
		e.other:QuestReward(e.self,2,8,2,0,0,1000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
--END of FILE Zone:paineel  ID:75089 -- Antus_Shelbra
