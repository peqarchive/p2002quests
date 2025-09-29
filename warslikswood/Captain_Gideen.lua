function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("I hope you have come to assist in the defense of the gate. We have had numerous assaults by the goblins. No doubt it is due to those [" .. eq.say_link("goblin watchers") .. "].");
	elseif(e.message:findi("goblin watchers")) then
		e.self:Say("Goblin Watchers are rumored to be the communication link between goblin outposts and patrols. We have found Goblin Watcher Signal Torches on a few of them. You bring me back no less than three and I will reward you.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	--Handin: 3x Watcher Signal Torch (12441)
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 12441, item2 = 12441, item3 = 12441})) then
		e.self:Say("Good work, " .. e.other:GetName() .. ". You are on your way to becoming a respected ally of the Iksar Empire. Keep up the good work. Take this reward for a job well done.");
		e.other:Faction(193,1); -- +Legion of Cabilis
		e.other:Faction(30,1); -- +Cabilis Residents
		e.other:Faction(282,1); -- +Scaled Mystics
		e.other:Faction(62,1); -- +Crusaders of Greenmist
		e.other:Faction(317,1); -- +Swifttails
		e.other:QuestReward(e.self,0,3,0,0,12357,10);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end