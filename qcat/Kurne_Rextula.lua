function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Welcome to the new order of life, the life of service to our diseased Lord, Bertoxxulous. Did you encounter any of my [" .. eq.say_link("pets") .. "] on the way here? I hope not.");
	elseif(e.message:findi("pets")) then
		e.self:Say("My pets are the skeleton guardians of these catacombs. Some have been behaving erratically since the arrival of [" .. eq.say_link("Drosco") .. "].");
	elseif(e.message:findi("drosco")) then
		e.self:Say("Drosco used to be a loyal member of our shrine, until we learned the truth. The truth was that he was a mole from the Knights of Thunder. It appears they are assisting the Temple of Life in their pursuit of our eradication. Drosco was apprehended and boiled alive. I turned his boiled body into a zombie to march these halls. Now he must be stopped. He has begun to [" .. eq.say_link("compromise the shrine's location") .. "].");
	elseif(e.message:findi("compromise")) then
		if(e.other:GetFaction(e.self) < 5) then
			e.self:Say("The problem is, he was strong in Karana's faith. And as sometimes is the case, there is a resonance from his deity. This causes him to wander in and out of our hidden shrine and I believe it also interferes with my control of the other pets. Please find him and destroy him. Bring me back the note I placed upon his body. Go!!");
		else
			e.self:Say("While the Bloodsabers appreciate your past contributions to Bertoxxulous and our cause, we do not feel you can be trusted with vital information yet.");
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 18805}) and e.other:GetFaction(e.self) < 5) then
		e.self:Say("Good work! You shall rise quickly in our ranks of evil. Let no man stand in your way and never betray the shrine or you to will join our collection of undead. You can also assist me with a [" .. eq.say_link("new task") .. "].");
		e.other:SummonItem(17002);
		e.other:Ding();
		e.other:AddEXP(1000);
		e.other:Faction(21,1);
		e.other:Faction(135,-1);
		e.other:Faction(235,-1);
		e.other:Faction(257,-1);
		e.other:Faction(53,1);
		e.other:GiveCash(0,3,0,0);
	end
	item_lib.return_items(e.self, e.other, e.trade, false);
	e.self:Say("I'm... erm, not quite sure what to do with this, but... thanks, I guess.");
end