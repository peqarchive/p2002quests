function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("This is no place for you. These Splitpaws are very fierce. Only the power of Rodcet Nife will guide them to the light. By the way, I might warn you that the cells here lock behind you.");
	elseif(e.message:findi("proof of nobility") and e.other:GetFaction(e.self) < 3) then
		e.self:Say("I require the returned note I gave you, a Testimony of Truth, a Sword of Faith and finally the hilt of Soulfire. The Testimony and Sword of Faith are earned in the Hall of Truth, but for the hilt of Soulfire you shall have to battle [" .. eq.say_link("Xicotl") .. "].");
	elseif(e.message:findi("xicotl")) then
		e.self:Say("Xicotl is the evil troll who attempted to steal Soulfire from the vaults of the Temple of Life. The hilt of Soulfire broke off during the battle and now rests in the hands of this troll shadowknight. From what I have heard, he is frequently an invited guest at the castle called Mistmoore. Woe to any paladin who dares set foot upon the land of Mistmoore, but should you attempt it you might search the guest rooms for the troll. May Rodcet Nife walk with you.");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 18927})) then -- Temple Summons
		e.self:Say("I am needed!! What am I doing here? I must return to the Temple of Life to commune with the Prime Healer. Rodcet Nife will give me more strength to finish this job. Thank you, young one! Take this key as a reward. Turn it into Tyokan in the temple shop. Safe journey to you!");
		e.other:Faction(257,5,0); 		-- Priest of Life
		e.other:Faction(183,5,0); 		-- Knights of Thunder
		e.other:Faction(135,5,0); 		-- Guards of Qeynos
		e.other:Faction(21,-5,0); 		-- BloodSabers
		e.other:Faction(9,5,0); 		-- Antonious Bayle
		e.other:QuestReward(e.self,0,0,0,0,13306,200);
	end
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 18936})) then -- A Sealed Note
		if(e.other:GetFaction(e.self) < 3) then -- items will get eaten if faction not high enough.
        	e.self:Say("Finally!! I see that Ariska has found a noble knight to retrieve Soulfire. Per Ariska's orders I am not to give Soulfire to you until you can show me [" .. eq.say_link("proof of nobility") .. "]. You must honor both the Temple of Life as well as the Hall of Truth and to a high degree. Only then shall you hold Soulfire.");
        	e.other:Faction(257,5,0); 		-- Priest of Life
        	e.other:Faction(183,5,0); 		-- Knights of Thunder
        	e.other:Faction(135,5,0); 		-- Guards of Qeynos
        	e.other:Faction(21,-5,0); 		-- BloodSabers
        	e.other:Faction(9,5,0); 		-- Antonious Bayle
        	e.other:QuestReward(e.self,0,0,0,0,18937,200);
        end
	end
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 18937,item2 = 13947,item3 = 18828,item4 = 12197})) then
		if(e.other:GetFaction(e.self) < 3) then -- items will get eaten if faction not high enough.
			e.self:Say("You have proven yourself worthy to hold Soulfire. Do not let her slip into the hands of evil. There are many who wish to free the many trapped souls of shadowknights and necromancers trapped inside the blade. The power of the blade can be called upon to heal you if need be. May Rodcet Nife and the twins of Marr hold you in their glory.");
			e.other:QuestReward(e.self,0,0,0,0,5504,0);	--  soulfire
		else
			-- faction not hight enough, items get eaten.
			-- e.self:Say("Faction not high enough, I'm going to eat these"); -- to test this.
		end
	end
	item_lib.return_items(e.self, e.other, e.trade)
end