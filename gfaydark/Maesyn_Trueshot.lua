function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Welcome to Kelethin, " .. e.other:GetName() .. "! I am Maesyn Trueshot, commander of Faydark's Champions. We are the finest marksmen in all of Norrath. With our trusty [" .. eq.say_link("Trueshot longbows") .. "] we can miss no target regardless of the distance or the conditions.");
	elseif(e.message:findi("trueshot longbows")) then
		e.self:Say("The Trueshot Longbow was created by my famed father. Eldin Trueshot. It is quite accurate and takes a ranger's skill to wield. We use our new recruits to [" .. eq.say_link("gather materials") .. "] needed by my father.  We shall soon begin to release the formula to good elves so all may fletch such a bow.");
	elseif(e.message:findi("correct component")) then
		e.self:Say("Now that I have crafted the Treant Bow Staff, you shall need one Planing Tool, one Treant Bow Staff, one Micro Servo and one spool of Dwarven Wire. These items will be used with your Fletching Kit as all other bows. Be forewarned, only a Master Fletcher can create such a bow and even a master fails from time to time. Good Luck.");
	elseif(e.message:findi("next incarnation")) then
		e.self:Say("The Trueshot Longbow was once enchanted by the Koada'Dal enchanters.  Once it was enchanted now it is no more.  I am sure if you were ask the Koada'Dal [" .. eq.say_link("where the enchanted bows") .. "] are you will get an answer.");
	elseif(e.message:findi("gather material") and (e.other:GetClass() == 4)) then
		if(e.other:GetFaction(e.self) < 5) then -- Needs better than indifferent
			e.self:Say("Take this pack. Go to Kaladim, find Trantor Everhot and ask for dwarven wire. Then go to Freeport to meet Jyle Windshot. Search the inns for him and ask him for treant wood. Then, collect some spiderling silk from spiderlings and finally, in Steamfont, we have the permission of the gnomes to use any micro servos we find while destroying rogue spiders. Combine them all and return the pack to me.");
			e.other:SummonItem(17951); -- Material Pack
		else
			e.self:Say("Faydark's Champions cannot call you foe, but you have yet to earn our trust.");
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 12112})) then -- Pack of Materials
		e.self:Say("I shall see that my father gets the materials. I hope this can be of use to you. It will serve as your starting point toward fletching a Trueshot longbow. It is unfortunate that we are unable to enchant the bow to its [" .. eq.say_link("next incarnation") .. "], but it is still a fine weapon. You do know the [" .. eq.say_link("correct components") .. "] needed for fletching such a bow, do you not?");
		e.other:Faction(99,5); -- Faydark's Champions
		e.other:Faction(178,1); -- King Tearis Thex
		e.other:Faction(43,1); -- Clerics of Tunare got better. 
		e.other:Faction(304,1); -- Soldiers of Tunare got better. 
		e.other:Faction(63,-1); -- Crushbone Orcs got worse. 
		e.other:QuestReward(e.self,0,math.random(9),0,0,8091,500); -- Treant Bow Staff
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 18785})) then -- A tattered note
		e.self:Say("Hail, " .. e.other:GetName() .. ", and welcome.. I am Maesyn Trueshot, leader of Faydark's Champions. I will teach and train you, as I have done for many others. Let's get started.. Here, put this on.. it'll help protect you from the elements. You look pretty bright. Train hard, and I'm sure you'll do well.");
		e.other:Faction(99,100);  --  Faydark's Champions
		e.other:Faction(178,25); --  King Tearis Thex
		e.other:Faction(43,25);  --  Clerics of Tunare
		e.other:Faction(304,25); --  Soldiers of Tunare
		e.other:Faction(63,-25); --  Crushbone Orcs
		e.other:QuestReward(e.self,0,0,0,0,13536,100); -- Dirty Green Tunic*
	end
	item_lib.return_items(e.self, e.other, e.trade)
end