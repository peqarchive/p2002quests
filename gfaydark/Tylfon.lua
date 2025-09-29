function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("So, you think you have what it takes to be a Scout of Tunare? Come back with two gold and two rusty daggers and I'll make it worth your while.");
	elseif(e.message:findi("silvermesh legging")) then
		e.self:Say("Scout silvermesh leggings are part of the garb of the Scouts of Tunare. Besides greater protection in battle, they offer a protection against magic and their unique powers boost the wearer's agility. They are meant for the scouts only and, as such, are not just given away. Are you [" .. eq.say_link("willing to earn the leggings") .. "]?");
	elseif(e.message:findi("earn the legging")) then
		e.self:Say("A former scout named Faldor Hendrys has stolen our [" .. eq.say_link("Gem of Tunare") .. "]. He has fled Faydwer and we have been unable to track him down. Perhaps if you go and speak with his brother, [" .. eq.say_link("Elmion Hendrys") .. "], and ask him of Faldor, we might learn something of value?");
	elseif(e.message:findi("gem on tunare") or e.message:findi("gem of tunare")) then
		e.self:Say("The bright green Gem of Tunare was discovered by the Scouts of Tunare in the trunk of a great tree. The lightning streaked down to split the tree in twain and there, inside, was the gem, Tunare's gift to the people of Kelethin. It has no magical properties, but it represents the glory of Tunare. It appears as a small emerald shard. Alas, now it has been stolen by Faldor Hendrys and only his brother [" .. eq.say_link("Elmion Hendrys") .. "] could know of his whereabouts.");
	elseif(e.message:findi("elmion hendrys")) then
		e.self:Say("Seek out the Fier'Dal, Elmion. He was last heard telling the local bar patrons that he was off to do some adventuring at the lake near the estate. What that is, I do not know.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 18784})) then -- Tattered Note
 		e.self:Say("Hmm.. I hope you can prove yourself a lot more valuable than you look. Here, throw this on.. it'll help protect you a little. Let's get started on improving your skills.");
		e.other:Faction(283,100); -- Tunare's Scouts
		e.other:QuestReward(e.self,0,0,0,0,13535,100); -- Old Worn Gray Tunic*
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 7007,item2 = 7007,gold = 2})) then
 		e.self:Say("Well, well. I didn't think you could do it. Here's your cut and don't be surprised that it's not much because it's your first lesson. Remember. the smaller the operation. the bigger the share, and the richest rogues have the tightest lips.");
		e.other:Faction(283,5);
		e.other:QuestReward(e.self,0,math.random(5),0,0,7021,500);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 13346,item2 = 13346,gold = 2})) then
 		e.self:Say("Well, well. I didn't think you could do it. Here's your cut and don't be surprised that it's not much because it's your first lesson. Remember. the smaller the operation. the bigger the share, and the richest rogues have the tightest lips.");
		e.other:Faction(283,5);
		e.other:QuestReward(e.self,0,math.random(5),0,0,7021,500);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 7007,item2 = 13346,gold = 2})) then
 		e.self:Say("Well, well. I didn't think you could do it. Here's your cut and don't be surprised that it's not much because it's your first lesson. Remember. the smaller the operation. the bigger the share, and the richest rogues have the tightest lips.");
		e.other:Faction(283,5);
		e.other:QuestReward(e.self,0,math.random(5),0,0,7021,500);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 13322})) then
 		e.self:Say("Excellent job, " .. e.other:GetName() .. ", we will turn you into a rogue of Tunare yet.  Here this is for your trouble.");
		e.other:QuestReward(e.self,0,0,0,0,3315,100);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end