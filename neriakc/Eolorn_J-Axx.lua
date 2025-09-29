function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("It is good to see new blood in our halls. I am the leader of this house. If you are looking for guidance, seek out the masters within. I rarely appoint tasks to new recruits, unless I need to retrieve the [" .. eq.say_link("foreign take") .. "].");
	elseif(e.message:findi("foreign take")) then
		e.self:Say("We have rogues operating in a few great cities. We send young rogues to retrieve the monthly take. We have been awaiting the Freeport delivery. The last youth I sent must have been killed along the way. I will need a new runner to [" .. eq.say_link("retrieve the chest") .. "].");
	elseif(e.message:findi("retrieve the chest")) then
		e.self:Say("You seem able enough. Here. Take this note to Freeport. Go through the Commonlands and be careful not to encounter any Freeport guards. There is a network of aqueducts accessible through hidden passages. Search the outside walls of Freeport. Take the note to Giz. She will meet you at night, on an island in the harbor. Good luck.");
		e.other:SummonItem(18844);
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 18752})) then --tattered note
		e.self:Say("You wanna be part of the Ebon Mask, huh? Well, you'll need to impress me. Here's your guild tunic. Go find Hekzin, he'll have some work for you, I'm sure. Don't screw up, kid.  That pretty face of yours would make a fine trophy, got it? Now, quit breathin' my air, and go get some work done.");
		e.other:Faction(90,100); --Ebon Mask
		e.other:Faction(135,-5); --Guard of Qeynos
		e.other:Faction(361,-25); --Wolves of the North
		e.other:Faction(133,-10); --Guardians of the Vale
		e.other:Faction(31,-25); --Carson McCabe
		e.other:QuestReward(e.self,0,0,0,0,13581,100); --Old Black Tunic*
	end
	item_lib.return_items(e.self, e.other, e.trade)
end