-- Cleric quests
function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("May the fires of Solusek Ro warm your innards! I am Gavel the Temperant. I work with Sister Blaize to forge the most elegant finery for clerics known to man or beast. Because we have no need for material wealth here in the temple, we ask that you retrieve [" .. eq.say_link("ingots and icons") .. "] from the lost or fallen brothers and sisters of our order. When mixed with some enchanted, [" .. eq.say_link("galvanized") .. "], [" .. eq.say_link("vulcanized") .. "], or [" .. eq.say_link("magnetized") .. "] platinum into an alloy, the items I can forge are splendid indeed!");
	elseif(e.message:findi("ingots and icons")) then
		e.self:Say("The ingots and icons are all named after the virtues of the cleric who held them. The virtues I require are those of the [" .. eq.say_link("reverent") .. "], the [" .. eq.say_link("constant") .. "], and the [" .. eq.say_link("devout") .. "].");
	elseif(e.message:findi("reverent")) then
		e.self:Say("Regis the Reverent fell in love with a gypsy girl named Lianna Ferasa who lives in the Rathe Mountains. Ask her what has become of him. Bring me the ingot of the Reverent, the icon of the Reverent, and two enchanted platinum bars and I will forge them into a reward for you.");
	elseif(e.message:findi("constant")) then
		e.self:Say("Althuryn the Constant was brutally slain by two aqua goblins. The one called Sludge fled to Runnyeye. The one called Dwigus lives in Dagnor's Cauldron. Bring me the ingot of the Constant, the icon of the Constant, and two galvanized platinum bars and I will forge them into a reward for you.");
	elseif(e.message:findi("devout")) then
		e.self:Say("Nebbletob the Devout was once a slave in the mines of Meldrath. The Minotaur Sentry there was particularly cruel to him. He was in the expedition to Everfrost when Brother Theo drowned. When trying to rescue Theo, he came upon some caves under the river. He also narrowly escaped death when a great white beast attacked him. He never saw what the beast was, but it shredded his pack where he kept his icon. Bring me the ingot of the Devout, the icon of the Devout, and two vulcanized platinum bars and I will forge them into a reward for you.");
	elseif(e.message:findi("galvanized")) then
		e.self:Say("Enchanted platinum bars can be galvanized by Genni, vulcanized by Vilissia, and magnetized by Ostorm. Just give them the enchanted platinum bar and they will do the rest.");
	elseif(e.message:findi("vulcanized")) then
		e.self:Say("Enchanted platinum bars can be galvanized by Genni, vulcanized by Vilissia, and magnetized by Ostorm. Just give them the enchanted platinum bar and they will do the rest.");
	elseif(e.message:findi("magnetized")) then
		e.self:Say("Enchanted platinum bars can be galvanized by Genni, vulcanized by Vilissia, and magnetized by Ostorm. Just give them the enchanted platinum bar and they will do the rest.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 16507, item2 = 16507, item3 = 19010, item4 = 19009})) then
		e.self:Say("Well done! You are truly a skilled cleric. I have crafted you a bracer - take it.");
		e.other:Faction(320,5);
		e.other:Faction(291,-5);
		e.other:QuestReward(e.self,0,0,0,0,4925,1000);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 19049, item2 = 19049, item3 = 19016, item4 = 19015})) then
		e.self:Say("Well done! You are truly a skilled cleric. I have crafted you a weapon - take it.");
		e.other:Faction(320,5);
		e.other:Faction(291,-5);
		e.other:QuestReward(e.self,0,0,0,0,6407,1000);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 19047, item2 = 19047, item3 = 19011, item4 = 19012})) then
		e.self:Say("Well done! You are truly a skilled cleric. I have crafted you a chestplate - take it.");
		e.other:Faction(320,5);
		e.other:Faction(291,-5);
		e.other:QuestReward(e.self,0,0,0,0,4926,1000);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 19048, item2 = 19048, item3 = 19013, item4 = 19014})) then
		e.self:Say("Well done! You are truly a skilled cleric. I have crafted you a shield - take it.");
		e.other:Faction(320,5);
		e.other:Faction(291,-5);
		e.other:QuestReward(e.self,0,0,0,0,9427,1000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end