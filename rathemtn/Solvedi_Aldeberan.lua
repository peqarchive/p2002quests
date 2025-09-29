function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hail, forestwalker. Welcome to the Rathe bear preserve of the Unkempt Druids. We strive to protect nature with diligence and punish her [" .. eq.say_link("defilers") .. "] with prejudice!");
	elseif(e.message:findi("defilers")) then
		e.self:Say("There are many defilers of nature about that warrant eradication. Groi Gutblade is a loathsome troll poacher who lurks in South Karana. Slay him and bring me his Lionhide Backpack. Timbur the Tiny takes pride in crushing the trees in North Karana into pulp under his feet. Make him pay for this affront and bring me his Laceless Sandal as proof of his demise. I will give you my own blade if you succeed.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 9352, item2 = 17350})) then
		e.self:Say("You have done well. Here, take my blade as promised");
		e.other:QuestReward(e.self,0,0,0,0,5378,25000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end