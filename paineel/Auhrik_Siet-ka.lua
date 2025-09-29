--Quest for Paineel - Auhrik Siet`ka: Neonate Cowardice
function event_say(e)
	if(e.message:findi("understand common")) then
		e.self:Say("Of course you do. Now, listen carefully. It may be too much for your feeble mind to gather all at once, and I hate to repeat myself. Bring me one bat wing, one rat ear, one snake egg, and one fire beetle eye. Take this bag, and make sure it's sealed before you return it to me. Snake eggs spoil. Now, quit staring at me with your jaw hanging open like a dead codfish. I would have mistaken you for one, but dead codfish smell better. Haha!");
		e.other:SummonItem(17802); --Small Sealable Bag
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 14041})) then --A Rolled Up Note
		e.self:Say("Why are you giving this to me? Oh I see. I forgot that rats don't know how to read. Haha! Well, then. I shall read it for you. You do [" .. eq.say_link("understand common") .. "] don't you? Haha.");
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 12993})) then --Small Sealed Bag
		e.self:Say("My revenge has been satisfied. Thank you, my child. You have proven yourself to be a most worthy asset to our cause. Here, I no longer have any use for this, my ties to the old life are now severed.");
		e.other:Faction(143,5);  --Heretics
		e.other:Faction(79,-5);  --Deepwater Knights
		e.other:Faction(112,-5); --Gate Callers
		e.other:Faction(56,-5);  --Craftkeepers
		e.other:Faction(60,-5);  --Crimson Hands
		e.other:QuestReward(e.self,8,0,0,0,0,2000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end