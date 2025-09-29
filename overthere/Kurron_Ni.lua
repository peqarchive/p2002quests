-- Part of SK Epic 1.0
function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Out of my way, stranger!  I am on a delicate [" .. eq.say_link("I seek to assist your mission",false,"mission") .. "]; interfere with my search and I shall relieve you of your head! Bother me no more.");
	elseif(e.message:findi("seek")) then
		e.self:Say("I have traveled here in hopes of finding a soul [" .. eq.say_link("i am worthy",false,"worthy") .. "] of assisting me in completing my mission.");
	elseif(e.message:findi("i am worthy")) then
		e.self:Say("I doubt it, but I have been wrong before. Before I share with you the details of my mission, however, you must first prove your worthiness. [" .. eq.say_link("Agreed") .. "]?");
	elseif(e.message:findi("agreed")) then
		e.self:Say("Very well then, my new friend. I have an acquaintance that stands in need of three pieces of Darkforge Armor. He requires the breast, greaves and helm to complete his set. I also must pay back a loan that has come due in the amount of 900 platinum. Return this to me and I shall share with you my [" .. eq.say_link("dark mission") .. "], and the immeasurable reward that will be earned at its completion. Show your face here without fulfilling my request and I will offer you on the altar to Innoruuk himself. Be off!");
	elseif(e.message:findi("mission")) then
		if(e.other:GetFaction(e.self) < 7) then
			e.self:Say("My mission is none of your concern!  Now you die, pitiful fool!");
			eq.attack(e.other:GetName());
		else
			e.self:Say("My mission was to find a pathetic shadowknight and bring him closer to Innoruuk. You volunteered. By exercising my superior powers of persuasion, I have now taken from you a fine suit of armor and enough coin to ensure that I will be sleeping neither soberly nor alone for quite some time! Now I ask you, worthy shadowknight, do you not feel the fires of hatred coursing through your veins like never before? That is the very reward I spoke of! You have been brought closer to my master. My mission is complete! You foolish excuse for a dark knight, I shall take your head and tell all of your generous donation to the mighty Teir'Dal rogues!");
			eq.attack(e.other:GetName());
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(e.other:GetClass() == 5 and e.other:HasItem(14383) == false) then
		if(item_lib.check_turn_in(e.self, e.trade, {item1 = 3141, item2 = 3145, item3 = 3140, platinum == 900})) then --Platinum x 900, Darkforge Breastplate, Darkforge Greaves, Darkforge Helm
			e.self:Say("Well done, " .. e.other:GetName() .. ", I honestly didn't expect to see you again. Yes, yes, this is perfect! My mission is nearly complete!");
			e.other:Faction(342,3);
			e.other:QuestReward(e.self,0,0,0,0,18099,1,342,70);
		end
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
