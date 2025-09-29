function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("waves her hands as if to cast a spell.  'GREETINGS!!  I am the Luminare of Firiona.  By decree of his royal highness, King Thex, I am here to research spells and artifacts.  I have much to do.  I welcome any enchanter who offers to [" .. eq.say_link("assist the great Luminare") .. "].'");
		e.self:DoAnim(43);
	elseif(e.message:findi("assist")) then
		e.self:Say("And great I am, indeed!! Alas, not great enough to be everywhere at once. I would gladly reward you if you would [" .. eq.say_link("collect") .. "] components for me.");
		e.self:DoAnim(42);
	elseif(e.message:findi("collect")) then
		e.self:Say("Then go into the wilds beyond the outpost and upon your return, you shall give me one Nok Shaman Powder, one Heart of Ice, one Ton Warrior Totem, and one Sabertooth Tiger Mane. This shall earn you knowledge of an enchanter spell I recently scribed.");
		e.self:DoAnim(64);
	end
end

function event_trade(e)
	local item_lib = require("items");
	--Handin: Nok Shaman Powder, Heart of Ice, Ton Warrior Totem, Sabertooth Tiger Mane
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 12948, item2 = 12834, item3 = 12743, item4 = 12824})) then
		e.self:Emote("place's the items into a sack and removes a scroll from her robe.");
		e.self:Say("This is yours. A spell I discovered and translated for one with less intelligence than the great Luminare of Firiona Vie. You may kiss my feet now.");
		e.other:Faction(418,10);  -- +Inhabitants of Firiona Vie
		e.other:Faction(92,10);   -- +Emerald Warriors
		e.other:Faction(314,10);  -- +Storm Guard
		e.other:Faction(193,-10); -- -Legion of Cabilis
		e.other:Faction(250,-10); -- -Pirates of Gunthak
		e.other:QuestReward(e.self,0,0,0,0,15243,250); --Summon: Vision of Sebilite
	end
	item_lib.return_items(e.self, e.other, e.trade)
end