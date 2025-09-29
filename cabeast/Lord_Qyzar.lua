--Lord Qyzar is for the Greenmist quest and administers the fourth, fifth, and sixth quests in the line.
function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("looks upon you with a sneer. 'What is the year of our birth and who was our Father?'");
	elseif(e.message:findi("the year is 371 AG and our father is Rile")) then
		e.self:Say("You are a student of our ways? I would hope so. I seek a knight in search of a way to prove his allegiance and a way to earn his [" .. eq.say_link("zealot khukri") .. "].");
	elseif(e.message:findi("zealot khukri")) then
		e.self:Say("In search of a zealot khukri? I have heard much of your deeds to aid us. I offer it to you in exchange for your service. I have dispatched a knight named Grizzle to seek out the Kromdul fortress called Chalp. He was to secretly map Chalp and return with a [" .. eq.say_link("Chalp diagram") .. "]. He has yet to return. Perhaps you can [" .. eq.say_link("rescue Grizzle") .. "].");
	elseif(e.message:findi("chalp diagram")) then
		e.self:Emote("grimaces in pure disgust. 'I have been awaiting the Chalp diagram from a knight named Grizzle, but alas, he has proven himself weak. He has been taken prisoner by one of the Kromdul of Chalp. If only there were another knight I could send to [" .. eq.say_link("rescue Grizzle") .. "] and return the Chalp diagram...'");
	elseif(e.message:findi("rescue grizzle")) then
		e.self:Say("If you can find the knight in Chalp and have him hand you the Chalp diagram, you shall become a zealot and wield a zealot khukri. All I need are the Chalp diagram and your knight khukri.");
	elseif(e.message:findi("matter of betrayal")) then
		e.self:Say("One of our agents, a hero by the name of Goxnok, has found evidence that the book entitled 'Charasis' has been taken from this temple and is to be delivered to an unknown foe in the Outlands. Go at once to the lower levels of the temple and greet Goxnok. Hurry, before he departs!");
		eq.spawn2(106301,0,0,-113,1000,-23.9,60); -- an Iksar crusader
	elseif(e.message:findi("visceral dagger")) then
		e.self:Say("The visceral dagger was an ancient torturing weapon. I do not know much of it other than that it was forged by a member of the Brood of Kotiz, but that was ages ago. He is surely dust by now.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 12496, item2 = 5123})) then -- Chalp Diagram and Knights Khukri
		e.self:Say("At last!! The Chalp diagram. I shall see that the emperor gets this at once. You have proven yourself more than just a mere knight, you are a zealot. Being new to the temple we have need of you in a [" .. eq.say_link("matter of betrayal") .. "].");
		e.other:Faction(62,20); -- Crusaders of Greenmist
		e.other:Faction(193,10); -- Legion of Cabilis
		e.other:QuestReward(e.self,0,0,6,1,5124,1600); -- Zealots Khukri
	end
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 1730, item2 = 5124, item3 = 1729})) then -- Charasis Tome Copy, Zealots Khukri and Charasis Tome
		e.self:Say("Congratulations! You are now a true crusader, but there is no time for celebration. We have lost two of our operatives. Crusaders Golin and Fodcod were dispatched to seek out an ancient artifact, the [" .. eq.say_link("visceral dagger") .. "]. Where they have gone, I do not know. They have been gone far too long. Find them and return the dagger to me with your crusader khukri and you shall be a hero.");
		e.other:Faction(62,20); -- Crusaders of Greenmist
		e.other:Faction(193,10); -- Legion of Cabilis
		e.other:QuestReward(e.self,0,0,0,2,5125,2000); -- Crusaders Khukri
	end
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 7324, item2 = 5125})) then -- The Visceral Dagger and Crusaders Khukri
		e.self:Emote("gazes in astonishment at the dagger. 'Ahhh!! You have brought the sacred visceral dagger back to the Temple of Terror. Let all be aware that the great " .. e.other:GetName() .. " has returned to Cabilis a hero!! You now wield the weapon of a hero. Hail, " .. e.other:GetName() .. ", hero of the Crusaders of Greenmist.");
		e.other:Faction(62,20); -- Crusaders of Greenmist
		e.other:Faction(193,10); -- Legion of Cabilis
		e.other:QuestReward(e.self,0,0,0,3,5126,3000); -- Heros Khukri
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
