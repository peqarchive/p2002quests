--Quest for Paineel - Davorre Bloodthorn: Neonate Cowardice and Experienced Courier
function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings. Perhaps within that husk you call a body there is some worth? Are you [" .. eq.say_link("experienced") .. "] in your craft, young one, or are you a [" .. eq.say_link("neonate") .. "]?");
	elseif(e.message:findi("neonate")) then --Neonate Cowardice
		e.self:Say("Well then, child, I may still have a task for you. Will you [" .. eq.say_link("make use of your pathetic cowardice") .. "], then, eh?");
	elseif(e.message:findi("pathetic cowardice")) then --Neonate Cowardice
		e.self:Say("I see. This will not be the first time for you, I am sure. Take this list to Auhrik Siet`ka. His writing has become illegible in his old age, but he shall clarify what it is he needs you to do. Do as he says, child, and perhaps you will prove yourself a bit more worthy than the rotting flesh he will most likely have you return to him.");
		e.other:SummonItem(14041); --A Rolled Up Note
	elseif(e.message:findi("experienced")) then --Experienced Courier
		e.self:Say("Ahhhh, a youth doth approach me with such confidence! That is to be commended in and of itself. Ordinarily, I would turn you away without a second glance, but perhaps you can be of some use. Tell me, child, are you [" .. eq.say_link("willing to assist") .. "] me in a small, yet important, task?");
	elseif(e.message:findi("willing to assist")) then --Experienced Courier
		e.self:Say("Good, child. Deliver this note to Veisha Fathomwalker. You shall find her patrolling the outer regions of Toxxulia Forest. I trust that you will keep your eyes to yourself in this matter. Now go, and please travel within the veil of night, so you will not be seen by those whose minds are still clouded with delusions of Erudin's grandeur.");
		e.other:SummonItem(12998); --Rolled up Note
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 12997})) then --Veisha's Engagement Ring
		e.self:Say("Only a few years have passed and her heart has already forgotten me. No doubt she has found another to warm her bed. Go, find her new lover, and bring me nothing less than his head.");
		e.other:Faction(143,5);  --Heretics
		e.other:Faction(79,-5);  --Deepwater Knights
		e.other:Faction(112,-5); --Gate Callers
		e.other:Faction(56,-5);  --Craftkeepers
		e.other:Faction(60,-5);  --Crimson Hands
		e.other:QuestReward(e.self,0,0,0,0,0,500);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 12996})) then --Phaeril Nightshire's Head
		e.self:Say("Apparently her choice in suitors has drifted to the most pathetic of wretches ever to slither Odus. You have done well, child. I ask of you one last task before my message to Veisha is complete. Here, deliver this to her with my most sincere regards.");
		e.other:Faction(143,5);  --Heretics
		e.other:Faction(79,-5);  --Deepwater Knights
		e.other:Faction(112,-5); --Gate Callers
		e.other:Faction(56,-5);  --Craftkeepers
		e.other:Faction(60,-5);  --Crimson Hands
		e.other:QuestReward(e.self,0,0,0,0,12995,500); --A Locked Chest
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 12994})) then --Veisha Fathomwalker's Head
		e.self:Say("My revenge has been satisfied. Thank you, my child. You have proven yourself to be a most worthy asset to our cause. Here, I no longer have any use for this, my ties to the old life are now severed.");
		e.other:Faction(143,5);  --Heretics
		e.other:Faction(79,-5);  --Deepwater Knights
		e.other:Faction(112,-5); --Gate Callers
		e.other:Faction(56,-5);  --Craftkeepers
		e.other:Faction(60,-5);  --Crimson Hands
		e.other:QuestReward(e.self,0,0,0,0,5526,6000); --Battle Worn Halberd
	end
	item_lib.return_items(e.self, e.other, e.trade)
end