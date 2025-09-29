-- Shaman Skull Quest 7
function event_say(e)
	local qglobals = eq.get_qglobals(e.self,e.other);
	if(e.message:findi("Hail")) then
		e.self:Say("Leave me in peace " .. e.other:GetName() .. ", I have little desire for company now. The Faceless sends visions to me that may hold the fate of our race in sway.");
	elseif(e.message:findi("What Visions?") and tonumber(qglobals.shmskullquest) >= 10 and e.other:GetFaction(e.self) <= 4) then
		e.self:Say("The spirits tell me of strange happenings around the ancient city of Charasis. None of the mystics that have been sent to investigate have returned. Something is surely happening in the ancient tombs of that city. I pray to our lord for some way to calm the tortured spirits of our fallen brothers that haunt the Howling Stones.");
	elseif(e.message:findi("dreams") and tonumber(qglobals.shmskullquest) >= 13 and e.other:GetFaction(e.self) <= 4) then
		e.self:Say("I see much darkness...darkness and death. A void of life...the cold grip of death. An Ancient pact...with forces too terrible to describe...A great Leader...a fall, and a second coming. I see...a symbol of...an ancient city...Kaesora. I would begin there young Mystic. The spirits of that fallen city may hold a key to our future.");
	end
end

function event_trade(e)
	local qglobals = eq.get_qglobals(e.self,e.other);
	local item_lib = require("items");
	if((tonumber(qglobals.shmskullquest) >= 10) and (item_lib.check_turn_in(e.self, e.trade, {item1 = 30984})) and (e.other:GetFaction(e.self) <= 4)) then -- A Dusty Iksar Skull
		e.self:Emote("peers at the skull intently. 'There is strange magic in this skull Cradossk, whatever necromancer animated this skeleton was a powerful warlock indeed. I sense the power of several ancients in this relic. Take this skull to Oracle Qulin in the field of bone, he may be able to perform the ritual which will free this ancient's spirit from the mortal realm.'");
		eq.set_global("shmskullquest", "11",5,"F"); -- Completed Cudgel Quest 7.1
		e.other:QuestReward(e.self,0,0,0,10,30984,1000); -- A Dusty Iksar Skull
	elseif((tonumber(qglobals.shmskullquest) >= 11) and (item_lib.check_turn_in(e.self, e.trade, {item1 = 30986})) and (e.other:GetFaction(e.self) <= 4)) then -- Note to Granix
		e.self:Say("It is as I feared, the mark of the warlock has surely driven these ancient spirits mad. We can not allow these spirits to roam free in our world " .. e.other:GetName() .. ". Take this case and place the glowing skulls of other ancients inside of it. Return it to me with your Cudgel of the Heirophant so that we may remove these cursed spirits from our world forcefully.");
		eq.set_global("shmskullquest", "12",5,"F"); -- Completed Cudgel 7.2
		e.other:QuestReward(e.self,0,0,0,10,17134,1000); -- Ornate Skull Case
	elseif((tonumber(qglobals.shmskullquest) >= 12) and (item_lib.check_turn_in(e.self, e.trade, {item1 = 30988, item2 = 5146})) and (e.other:GetFaction(e.self) <= 4)) then -- A Filled Ornate Skull Case and Iron Cudgel of the Hierophant
		e.self:Say("You have done well " .. e.other:GetName() .. ". Perhaps you can help clear these troubling dreams from my tired aging mind. Commune with the spirits of our Ancestors and learn from them. Never forget that the ultimate power comes from knowledge. The ancients are privy to much knowledge that mortals will never see. Should you be granted enlightenment from our ancestors, share your knowledge with me so that we may use this knowledge for the benefit of our brethren. I will continue to study the [" .. eq.say_link("dreams") .. "] that cloud my mind.");
		eq.set_global("shmskullquest", "13",5,"F"); -- Totally Completed Cudgel Quest 7
		e.other:QuestReward(e.self,0,0,0,10,5148,100000); -- SkyIron Cudgel of the Arisen
	end
	item_lib.return_items(e.self, e.other, e.trade)
end