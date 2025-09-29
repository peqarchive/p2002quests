function event_spawn(e)
	local xloc = e.self:GetX();
	local yloc = e.self:GetY();
	eq.set_proximity(xloc - 50, xloc + 50, yloc - 50, yloc + 50);
end

function event_enter(e)
	if(e.other:HasItem(18759) == true) then -- Stained Parchment
		e.other:Message(15,"A diminutive, but powerful looking gnome stands before you. 'I am Naygog Mitope. The Dark Reflection has called you. Read the note in your inventory and hand it to me when you wish to begin your training. Your destiny awaits!'");
	end
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hail " .. e.other:GetName() .. ". I train those young gnomes who wish to [" .. eq.say_link("serve as a warrior") .. "] in the service of the Dark Reflection and our patron. Bertoxxulous the Plaguelord. Decay and destruction are powerful forces that influence Norrath. It is the duty of the Warriors of the Dark Reflection to bring destruction to the weak and injury to the strong so that our fellow gnomes may be reminded of their own mortality and new strong individuals may rise to power before Bertoxxulous decides it is their time to decay and be replaced like countless before them.");
	elseif(e.message:findi("serve as a warrior")) then
		e.self:Say("Ours is the duty of a martyr. to be the hated and feared hand of destruction and catalyst of change. All roads are paved with destruction and in turn are eventually destroyed. All machines are built from the rubble of broken mountains and in turn become rust and bits of metal. You must outfit yourself with the tools of a warrior. crafted from the destruction of archaic clockworks that have long since finished serving the purpose for which they were built. Take this parchment to Windlebeck Tobokog. he will assist you in the construction of a suit of armor. When you have been properly outfitted return to me for [" .. eq.say_link("further instruction") .. "].");
		e.other:SummonItem(10986); -- Parchment to Windlebeck
	elseif(e.message:findi("further instruction")) then
		e.self:Say("It is one thing to destroy the artificial life of a clockwork. It is another thing entirely to claim the life of another gnome. There is a member of the Dark Reflection. Yulcabis. who has been assigned to a task in the Steamfont Mountains. He has failed repeatedly in the tasks assigned to him in the past and has become a burden to the Dark Reflection. Find Yulcabis and slay him. Return to me with the weapon he carries.");
	elseif(e.message:findi("armor")) then
		e.self:Say("Armor? For a warrior? Oh yes. You'll need to speak with Windlebeck for that.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 10990})) then -- Yulcabis's axe
		e.self:Say("Excellent work. Now that we no longer have to bother with Yulcabis, I suppose we can discuss your progression as a member of the Dark Reflection. You'll need some [" .. eq.say_link("armor") .. "], though.");
		e.other:Faction(115,-10,0); -- gem choppers
		e.other:Faction(71,3,0); -- dark reflection
		e.other:Faction(91,-10,0); -- eldritch collective
		e.other:Faction(176,-10,0); -- King ak'anon
		e.other:Faction(209,3,0); -- meldrath
		e.other:QuestReward(e.self,0,0,0,0,11077,100); -- Plague Warrior Battle Axe
	elseif (item_lib.check_turn_in(e.self, e.trade, {item1 = 18759})) then -- Stained Parchment
		e.self:Say("This is fabulous news!! You have done well, young one. Here, then, is your reward for a job well done.");
		e.other:Faction(71,100,0); 	-- Dark reflection
		e.other:Faction(91,-10,0); 	-- eldritch collective
		e.other:Faction(115,-10,0); -- gem choppers
		e.other:Faction(76,-10,0); 	-- Deepmuses
		e.other:QuestReward(e.self,0,0,0,0,13518,100); -- Tin Patched Tunic*
	end
	item_lib.return_items(e.self, e.other, e.trade)
end