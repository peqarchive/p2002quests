function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings, young one! There are many tasks to be performed aside from your studies to truly harness the powers passed down to us by our ancestor [" .. eq.say_link("Miragul") .. "]. The most basic of these tasks is the gathering of bat wings and snake fangs from the yard outside our city. I will reward you for every two bat wings and two snake fangs you bring to me.");
	elseif(e.message:findi("miragul")) then
		e.self:Say("You do not know of Miragul?!! You have more to learn of the heritage of the Dark Truth than at first I thought. Miragul was the first High Man to unlock the secrets of necromancy and is the founder of our city as well as the creator of the treacherous Hole.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 18018})) then --Dark Truth Guild Note
		e.self:Say("You are welcomed into the fold.  Now go out, and prove yourself, young one.  You have much to learn about the Dark Truth.");
		e.other:Faction(143,100); -- Heretics
		e.other:Faction(79,-100); -- Deepwater Knights
		e.other:Faction(112,-100); -- Gate Callers
		e.other:Faction(56,-100); -- Craftkeepers
		e.other:Faction(60,-100); -- Crimson Hands
		e.other:QuestReward(e.self,0,0,0,0,13551,100); --Dirt Soiled Robe*
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 13068, item2 = 13068, item3 = 13067, item4 = 13067})) then --Bat Wing x 2, Snake Fang x 2
		e.self:Say("Very good, young acolyte. Maintain your diligence in your duties and you will quickly learn the secrets of the Dark Truth.");
		e.other:Faction(143,1);  -- Heretics
		e.other:Faction(56,-1);  -- Craftkeepers
		e.other:Faction(60,-1);  -- Crimson Hands
		e.other:Faction(79,-1);  -- Deepwater Knights
		e.other:Faction(112,-1); -- Gate Callers
		e.other:QuestReward(e.self,0,0,0,0,15338); --Spell: Cavorting Bones
	end
	item_lib.return_items(e.self, e.other, e.trade)
end