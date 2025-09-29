-- orc pawn picks & cutthroat rings quest
function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings, traveler! If you wish to walk upon the road to Freeport, you will pay the toll of two silver pieces. And you should. It is not safe to stray from the pathway. There are many [" .. eq.say_link("dangers in the Commonlands") .. "].");
	elseif(e.message:findi("dangers in the commonlands")) then
		e.self:Say("The orcs have been a nuisance of late. Many travelers have perished at the hands of the orc pawns. Would you like to [" .. eq.say_link("assist the Freeport Militia") .. "] in ridding the lands of the orcs?");
	elseif(e.message:findi("assist the freeport militia")) then
		e.self:Say("Sir Lucan would be proud!! Patrol the Commonlands and watch for any orc pawns. Should you find any orc pawn picks on them, I will pay you for every four you return to me. Be off, then! For the glory of Freeport!!");
	elseif(e.message:findi("hunt dervish cutthroats")) then
		e.self:Say("You will make a fine reserve!! Take this bag and fill it with Dervish Cutthroat Insignia Rings. When they are combined and returned to me you shall be accepted into the Reserve Freeport Militia!!");
		e.other:SummonItem(17975); -- Bag for Cutthroat Rings
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 13885,item2 = 13885,item3 = 13885,item4 = 13885})) then -- 4x Orc Pawn Pick
		e.self:Say("You have done well. Keep up the good work and we may trust you to [" .. eq.say_link("hunt dervish cutthroats") .. "] which in turn will allow you to join the Reserve Freeport Militia.");
		e.other:Faction(105,5); -- freeport militia
		e.other:Faction(48,5); -- coalition of tradefolk underground
		e.other:Faction(184,-10); -- knights of truth
		e.other:Faction(258,-10); -- priests of marr
		e.other:QuestReward(e.self,0,0,1,0,0,500); -- Gold and EXP
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 12272})) then -- Bag of Cutthroat Rings
		e.self:Say("Excellent work, "..e.other:GetName().."!! You are quite formidable. Maybe soon you shall aid in our efforts to rid the Northern part of Freeport of the paladins!! Until then keep up the good work. Take this Armory Token to the Militia Armorer in the Militia House in Freeport to receive your tunic. He may not be there, but I assure you he will show up at some time. On the second floor. Hail Sir Lucan!!");
		e.other:Faction(105,5); -- freeport militia
		e.other:Faction(48,5); -- coalition of tradefolk underground
		e.other:Faction(184,-10); -- knights of truth
		e.other:Faction(258,-10); -- priests of marr
		e.other:QuestReward(e.self,0,0,0,0,12273,500); -- Militia Armory Token
	end
	item_lib.return_items(e.self, e.other, e.trade);
end