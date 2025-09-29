function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hail and welcome.  I am sure you have much to do, but could I ask a [" .. eq.say_link("favor") .. "] of you?");
	elseif(e.message:findi("favor")) then
		e.self:Say("Oh, um, on second thought, never mind.  I should really just do it myself.  Thank you anyway."); 
	elseif(e.message:findi("enchanted bow")) then
  		e.self:Say("Alas... Another ranger in search of the [" .. eq.say_link("Rain Caller") .. "]. She is no more");
	elseif(e.message:findi("rain caller")) then
  		e.self:Say("Rain Caller is the name we give each Trueshot longbow once it is enchanted. Unfortunately, I am unable to enchant them any longer. One of the components is no longer available. Someone would have to strike a [" .. eq.say_link("deal with the fairie folk") .. "]. Once I have that and the [" .. eq.say_link("remaining components") .. "] I can create the Rain Caller, a ranger's bow");
	elseif(e.message:findi("fairie folk")) then
  		e.self:Say("The fairie princess, Joleena, used to have a metal gnome deliver [" .. eq.say_link("fairie gold dust") .. "] to the Keepers every month. She has stopped this and now refuses to offer it to any nation of Faydwer. What she is angry about, we do not know.");
	elseif(e.message:findi("gold dust")) then
 	 	e.self:Say("Fairie gold dust is an enchanted powder which only a fairie princess can create.");
	elseif(e.message:findi("remaining component")) then
  		e.self:Say("The remaining components are the Trueshot longbow and a treant heart. There will also be the guild donation in the amount of 3000 gold coins. These and the [" .. eq.say_link("fairie gold dust") .. "] will merit a ranger the Rain Caller enchanted bow.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 18778})) then -- Enrollment Letter
		e.self:Say("Greetings and welcome aboard!  My name's Kinool. Master Enchanter of the Keepers of the Art.  Here is your guild tunic. Make us proud, young pupil!");
		e.other:SummonItem(13593); -- Torn Training Robe*
		e.other:Ding();
		e.other:Faction(170,100,0); -- Keepers of the Art
		e.other:Faction(178,25,0); -- King Tearis Thex
		e.other:Faction(99,15,0); -- Faydark's Champions
		e.other:Faction(322,-25,0); -- The Dead
		e.other:AddEXP(100);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 12333,item2 = 12334,item3 = 8401, gold = 3000})) then
  		e.self:Say("Fine work!! I now reward you with The Rain Caller.");
		e.other:Ding();
  		e.other:AddEXP(5000);
  		e.other:SummonItem(8402);
	end
	item_lib.return_items(e.self, e.other, e.trade);
end