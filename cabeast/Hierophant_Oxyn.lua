--Greenmist 8, Shaman Skull 1/2
function event_say(e)
	local qglobals = eq.get_qglobals(e.self,e.other);
	if(e.message:findi("hail")) then
		e.self:Say("Greetings, and may the pain of the ancients guide you. You have come to us for guidance, have you not? We are the Hierophants of Cabilis and we guide the young Scale Mystics. All petitioners shall speak with me of [" .. eq.say_link("temple tasks") .. "]. I can also check the [" .. eq.say_link("progress") .. "] of tasks we have assigned you.");
	elseif((e.message:findi("temple tasks")) and (e.other:GetFaction(e.self) <= 4) and (e.other:Class() == "Shaman")) then
		e.self:Say("The Temple of Terror requires all young Scaled Mystics to [" .. eq.say_link("perform daily tasks.") .. "]. The tasks are necessary to the upkeep of our order as well as that of our brothers, the Crusaders of Greenmist.");
	elseif((e.message:findi("daily tasks")) and (e.other:GetFaction(e.self) <= 4) and (e.other:Class() == "Shaman")) then
		e.self:Say("We require many components for various rituals. Take this Component mortar and fill it with the following items - foraged [" .. eq.say_link("mud crabs") .. "]. two small mosquito wings and one portion of bone chips. You must then use the pestle and combine all the components. When you have a full component mortar, you may return to me and I shall pay you your wages, but most importantly, you shall prove your devotion to the Scaled Mystics.");
		e.other:SummonItem(17020); -- Component Mortar
	elseif(e.message:findi("mud crabs")) then
		e.self:Say("Mud crabs are tiny crustaceans which live along the mudcaked shores of the Lake of Ill Omen. You can forage for them and find a handful of them at a time.");
	elseif((e.message:findi("lost skulls")) and (e.other:GetFaction(e.self) <= 4) and (e.other:Class() == "Shaman")) then
		e.self:Say("You must have heard of the Trilac Brotherhoods disappearance. They are the skulls of three soon to be ancients. They were taken from this temple by a silent intruder. Crusaders are always on duty. I do not know how they got into our vault. Every petitioner is ordered to search for the three skulls and return them to me along with their petitioner cudgel and then they shall become clairvoyants.");
	elseif((e.message:findi("iron cudgel")) and (e.other:GetFaction(e.self) <= 4) and (e.other:Class() == "Shaman")) then
		e.self:Say("If you are looking to be handed the Iron Cudgel of the Clairvoyant then you are sadly mistaken. Perhaps if you were to gather a few [" .. eq.say_link("lost skulls") .. "] for the temple we may find you worthy to wield one.");
	elseif((e.message:findi("larger problem")) and (e.other:GetFaction(e.self) <= 4) and (tonumber(qglobals.shmskullquest) >= 1)) then
		e.self:Say("Many of the ancient skulls have been cast out of our temple. A hierophant was supposed to cast a special spell which was to protect the skulls from dust and decay. He cast some unknown spell which has sent many of our skulls to their original point of death. It would be most helpful if you would [" .. eq.say_link("assist in collecting the ancient skulls") .. "].");
	elseif((e.message:findi("ancient skulls")) and (e.other:GetFaction(e.self) <= 4) and (tonumber(qglobals.shmskullquest) >= 1)) then
		e.self:Emote("seems unsure of your prowess. 'Hmmm. First you shall go after the two skulls of the Cleansers of the Outlands. If you find them, bring them back unbroken and then I shall trust you. Hand me both skulls and your iron cudgel of the clairvoyant and I will know you are prepared.'");
	elseif(e.message:findi("liquid")) then
		e.self:Say("The bottle contains deklium in a liquid solution. The metal of prophecy has been determined to rest in a mass of living earth. Our scholars have written of a mass of ore that fell from the heavens. This ore was used in the creation of a blade of our father, Rile. We have been filled with visions of this blade. I have seen it in the hands of our Crusaders as they march towards the new age of Greenmist! Seek out the corrupted earth that guards the interlopers. We have an alchemist near there. He will be able to use the deklium to determine which golem contains the metal. Take care to go in force. I sense that there will be a battle.");
	elseif(e.message:findi("progress")) then
		if(e.other:HasItem(5149)) then -- Skyiron Cudgel of the Ancients
			e.self:Say("You have completed the Shaman Skulls Quest. No flag given.");
		elseif(e.other:HasItem(5148)) then -- SkyIron Cudgel of the Arisen
			e.self:Say("You have completed Shaman Skull Quest #7 and have been flagged for the begining of the 8th quest.");
			eq.set_global("shmskullquest","13",5,"F"); -- Completed Cudgel Quest 7
		elseif(e.other:HasItem(5146)) then -- Iron Cudgel of the Hierophant
			e.self:Say("You have completed Shaman Skull Quest #6 and have been flagged for the begining of the 7th quest.");
			eq.set_global("shmskullquest","10",5,"F"); -- Completed Cudgel Quest 6
		elseif(e.other:HasItem(5145)) then -- Iron Cudgel of the Channeler
			e.self:Say("You have completed Shaman Skull Quest #5 and have been flagged for the begining of the 6th quest.");
			eq.set_global("shmskullquest","7",5,"F"); -- Completed Cudgel Quest 5
		elseif(e.other:HasItem(5144)) then -- Iron Cudgel of the Prophet
			e.self:Say("You have completed Shaman Skull Quest #4 and have been flagged for the begining of the 5th quest.");
			eq.set_global("shmskullquest","6",5,"F"); -- Completed Cudgel Quest 4
		elseif(e.other:HasItem(5143)) then -- Iron Cudgel of the Mystic
			e.self:Say("You have completed Shaman Skull Quest #3 and have been flagged for the begining of the 4th quest.");
			eq.set_global("shmskullquest","5",5,"F"); -- Completed Cudgel Quest 3
		elseif(e.other:HasItem(5142)) then -- Iron Cudgel of the Seer
			e.self:Say("You have completed Shaman Skull Quest #2 and have been flagged for the begining of the 3rd quest.");
			eq.set_global("shmskullquest","2",5,"F"); -- Completed Cudgel Quest 2
		elseif(e.other:HasItem(5141)) then -- Iron Cudgel of the Clairvoyant
			e.self:Say("You have completed Shaman Skull Quest #1 and have been flagged for the begining of the 2nd quest.");
			eq.set_global("shmskullquest","1",5,"F"); -- Completed Cudgel Quest 1
		else
			e.self:Say("I cannot locate your Cudgel, it does not appear you have assisted us. We could use some help with [" .. eq.say_link("Lost Skulls") .. "].");
		end
	end
end

function event_trade(e)
	local qglobals = eq.get_qglobals(e.self,e.other);
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 3895})) then -- A note to Oxyn
		e.self:Emote("takes the note and begins to howl into the air! 'The visions are true! The new prophecy begins today, Crusader,' the mystic growls with pleasure. He quickly turns and takes a bottle of murky liquid from one of his potion bags and hands it to you. 'Take this and keep it safe. Our visions have told of this day. We have been able to learn of the metal of prophecy. This [" .. eq.say_link("liquid") .. "] will help us to locate its true resting place!");
		e.other:Faction(62,20); -- Crusaders of Greenmist
		e.other:Faction(193,10); -- Legion of Cabilis
		e.other:QuestReward(e.self,0,0,5,0,3892,5000); -- Bottle of Liquid Deklium
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 3886})) then -- Chunk of Tynnonium
		e.self:Emote("holds the ore in his hands and begins to chant. His eyes go white as he raises the chunk of ore above his head. He lowers his arms and shakes his head for a moment. His eyes return to their normal state as they focus on you. The shaman hands you the ore and says, 'Seek out the creator of Rile's blade. He is still on this plane. I have felt his torment. Take this note to Librarian Zimor. He learned a great deal from the tome and can instruct you further.'");
		e.other:Faction(62,20); -- Crusaders of Greenmist
		e.other:Faction(193,10); -- Legion of Cabilis
		e.other:SummonItem(3893); -- Note to Librarian Zimor
		e.other:QuestReward(e.self,0,0,5,0,3886,5000); -- Chunk of Tynnonium
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 12403}) and (e.other:Class() == "Shaman")) then -- Full Component Mortar
		e.self:Say("We appreciate your service. Take a few copper for your deed as well as some of our cursed waters. They will provide you with nourishment. As for future tasks, we are searching for a few [" .. eq.say_link("lost skulls") .. "] and i am sure you are searching for your [iron cudgel of the clairvoyant] And i also hear that the furscales are in need of some broodlings to do some manual labor. Tell them Oxyn sent you.");
		e.other:Faction(282, 10); -- Scaled Mystics
		e.other:Faction(193, 10); -- Legion of Cabilis
		e.other:SummonItem(12406, 2); -- Cursed Wafers
		e.other:QuestReward(e.self,0,0,5,0,0,1000); -- Faction and Exp
	elseif((item_lib.check_turn_in(e.self, e.trade, {item1 = 12721, item2 = 12722, item3 = 12723, item4 = 5140})) and (e.other:GetFaction(e.self) <= 4) and (e.other:Class() == "Shaman")) then -- Logrin Skull, Morgl Skull, Waz Skull and Iron Cudgel of the Petitioner
		e.self:Say("Excellent! You have proved yourself worthy to wield the iron cudgel of the clairvoyant. As a clairvoyant I feel I can trust you, so I will tell you that the issue of the missing skulls is a [" .. eq.say_link("much larger problem") .. "] than last stated.");
		eq.set_global("shmskullquest","1",5,"F"); -- Completed Cudgel Quest 1
		e.other:Faction(282, 10); -- Scaled Mystics
		e.other:Faction(193, 10); -- Legion of Cabilis
		e.other:QuestReward(e.self,0,0,0,1,5141,2000); -- Iron Cudgel of the Clairvoyant
	elseif((tonumber(qglobals.shmskullquest) >= 1) and (item_lib.check_turn_in(e.self, e.trade, {item1 = 12724, item2 = 12725, item3 = 5141})) and (e.other:GetFaction(e.self) <= 4)) then -- Skull with I, Skull with II and Iron Cudgel of the Clairvoyant
		e.self:Say("We are in your debt. You are truly one who shall collect all the lost ancient skulls. Take your weapon. Go to Hierophant Zand and he shall guide you further. Tell him you are [" .. eq.say_link("the chosen saviour") .. "].");
		eq.set_global("shmskullquest","2",5,"F");	-- Completed Cudgel Quest 2
		e.other:Faction(282, 10); -- Scaled Mystics
		e.other:Faction(193, 10); -- Legion of Cabilis
		e.other:QuestReward(e.self,0,0,5,1,5142,60000); -- Iron Cudgel of the Seer
	end
	item_lib.return_items(e.self, e.other, e.trade)
end