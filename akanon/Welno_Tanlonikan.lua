function event_spawn(e)
	local xloc = e.self:GetX();
	local yloc = e.self:GetY();
	eq.set_proximity(xloc - 50, xloc + 50, yloc - 50, yloc + 50);
end

function event_enter(e)
	if(e.other:HasItem(18776) == true) then -- A note
		e.other:Message(15,"A voice echoes throughout the room as you take in your surroundings. 'Hey you! This is Welno Tanlonikan. Remember me? Read the note in your inventory and then hand it to me. Hurry up! We don't have all day! You owe me a lot of money!'");
	end
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings there " .. e.other:GetName() .. "! I am Welno Tanlonikan Assassin of Akanon. I pride myself on being one of the few to train our younger prospects in the ways of the rogue. If you are a young gnome rogue in training then I might have some [" .. eq.say_link("tasks") .. "] for you.");
	elseif(e.message:findi("tasks")) then
		e.self:Say("Well I should hope you are truly a Rogue of Akanon or else I dont have any work for ya! However if you are then I have some things for you to do. I will present you with a magical box that you will use to craft together certain components that will make an armor material. You will then take the material that you have fashioned with the proper pattern to the forge to create your own armor. I will provide you with whatever patterns are necessary along with the armor [" .. eq.say_link("recipes") .. "] should you so ask.");
	elseif(e.message:findi("recipes")) then
		e.self:Say("I have the armor recipes for all pieces of Chainmail of the Shadowwalker all you must do is simply ask for whichever piece you want to craft. I can provide you with the recipe for Shadowwalker [" .. eq.say_link("Coifs") .. "], [" .. eq.say_link("Bracers") .. "], [" .. eq.say_link("Sleeves") .. "], [" .. eq.say_link("Boots") .. "], [" .. eq.say_link("Leggings") .. "], [" .. eq.say_link("Gloves") .. "] and [" .. eq.say_link("Tunic") .. "]. Once you have collected the necessary components for each recipe combine them in this box to fashion the correct material.");
		e.other:SummonItem(17254); 	-- Welnos Assembly Kit
	elseif(e.message:findi("boots")) then
		e.self:Say("There are many things in the Steamfont Mountains that I am sure you don't want to step in " .. e.other:GetName() .. ". To create your boot material you will need to combine 3 Bricks of Crude Bronze, 1 Yellow Reculse Silk, 2 Spiderling Eyes and 1 Mead in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Shadowwalkers Chainmail Boots.");
		e.other:SummonItem(19634); 	-- Crude Boot Mold
	elseif(e.message:findi("bracers")) then
		e.self:Say("A pair of these here bracers will be a great addition to your armor set there " .. e.other:GetName() .. ". To create your bracer material you will need to combine 1 Brick of Crude Bronze, 1 Runaway Clockwork Motor, 1 Infected Rat Liver and 1 Bandage in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Shadowwalkers Chainmail Bracer.");
		e.other:SummonItem(19632); 	-- Crude Bracer Mold
	elseif(e.message:findi("coifs")) then
		e.self:Say("While you should usually be using the shadows to your advantage should you need to face your opponent having a good coif will greatly increase your chances of survival. To create your coif material you will need to combine 2 Bricks of Crude Bronze, 1 Rat Meat, 1 Grikbar Kobold Fur and 1 Throwing Knife in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Shadowwalkers Chainmail Coif.");
		e.other:SummonItem(19631); 	-- Crude Helm Mold
	elseif(e.message:findi("gloves")) then
		e.self:Say("Well you sure cant pick someones pocket with a broken hand now can you? I agree that gloves would be a great armor piece for you to craft. To create your glove material you will need to combine 3 Bricks of Crude Bronze, 1 Yellow Reculse Silk, 1 Brownie Leg , and 2 Spider Legs in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Shadowwalkers Chainmail Gloves.");
		e.other:SummonItem(19633); 	-- Crude Gauntlets Mold
	elseif(e.message:findi("leggings")) then
		e.self:Say("What do you think you are doing running around here with no pants on! To create your leggings material you will need to combine 4 Bricks of Crude Bronze, 1 Kobold Tooth, 1 Plague Rat Tail , 1 Bottle and the Torn Cloak of Faerron in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Shadowwalkers Chainmail Leggings.");
		e.other:SummonItem(19636); 	-- Crude Greaves Mold
	elseif(e.message:findi("sleeves")) then
		e.self:Say("Having the proper sleeves will definitely be to your advantage when in a heated battle. To create your sleeves material you will need to combine 2 Bricks of Crude Bronze, 2 Brownie Brains and 1 Young Ebon Drake Wing in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Shadowwalkers Chainmail Sleeves.");
		e.other:SummonItem(19635); 	-- Crude Vambrace Mold
	elseif(e.message:findi("tunic")) then
		e.self:Say("I'm glad to see that you have progressed this far in your training and that you are ready to craft your final armor piece. To create your tunic material you will need to combine 5 Bricks of Crude Bronze, 1 Minotaur Scalp, 1 Brownie Parts, 1 Runaway Clockwork Motor, 1 Swirling Mist and the evil Dirolensab`s Bracer in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Shadowwalkers Chainmail Tunic. When you are finished with your tunic please come back to see me as I have a [" .. eq.say_link("favor") .. "] to ask of you.");
		e.other:SummonItem(19637); 	-- Crude Breastplate Mold
	elseif(e.message:findi("favor")) then
		e.self:Say("Well you see I have been working on constructing some new daggers for all new rogues but I am in need of a few items to make my first prototype. If you were able to collect the rare items I am in need of to make this dagger I would be happy to give you the first I make should I be able to create it. Will you [" .. eq.say_link("collect") .. "] these rare items for me?");
	elseif(e.message:findi("collect")) then
		e.self:Say("Excellent please seek out 2 Minotaur Scalps and 2 Mountain Lion Jawbones and return to me with them when you are done.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 18776})) then -- A note
		e.self:Say("Yes, I just knew you'd see it my way, " .. e.other:GetName() .. ". Anyway, welcome to our little part of Ak'Anon's underworld. We have to pay a high price to keep our small orgainzation hidden, which keeps us all busy around here. Now throw this on, and let's put you to work.");
		e.other:Faction(76,100); 	-- Deep Muses
		e.other:Faction(210,15); 	-- Merchants of Ak'Anon
		e.other:Faction(115,15); 	-- Gem Choppers
		e.other:Faction(71,-15); 	-- Dark Reflection
		e.other:QuestReward(e.self,0,0,0,0,13519,100); -- Scuffed Tunic*
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 9108,item2 = 9108, item3 = 9109, item4 = 9109})) then -- Minotaur Scalp x 2 and Mountain Lion Jawbone x 2
		e.self:Say("Here is that dagger I promised you " .. e.other:GetName() .. "!");
		e.other:QuestReward(e.self,0,0,0,0,9110,100); -- Gemmed Shadowwalkers Dagger
	end
	item_lib.return_items(e.self, e.other, e.trade)
end