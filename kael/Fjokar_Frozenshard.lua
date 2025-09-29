-- Wenglawks the Traitor
function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Today is a good day in Kael Drakkel. Don't you think?");
	elseif(e.message:findi("wenglawks")) then
		e.self:Say("Wenglawks masquerades as a noble. As family lines go, his is even more diluted than those two [" .. eq.say_link("Iceshard brothers") .. "]. He is a petty merchant and traitor. One day I will find my proof of this.");
	elseif(e.message:findi("iceshard brothers")) then
		e.self:Say("Klaggan and Vorken, those two ruffians who somehow have managed to become the lords of the [" .. eq.say_link("Kromrif") .. "] manor. They were nothing but a pair of thugs no less than twenty years ago. I remember watching them kill and maim the innocent among the Kromrif tribes. If it were not for King Tormax's protection, I would slay them.");
	elseif(e.message:findi("kromrif")) then
		e.self:Say("The Frost giants are a proud race, but they are not nearly as powerful and blessed as we Kromzek. Our cousins may be strong, but the might of an enraged storm giant is something to behold.");
	elseif(e.message:findi("courier")) then
		e.self:Say("Those Kromzek deserve to die. They know very well what he is up to. I will hunt them for sport, moving silently through the streets of Kael Drakkel, and invisibly through the outside world. Wenglawks has some sort of underhanded deals going on with the dragons. I have yet to find anything which will persuade King Tormax to allow me to slay him, unfortunately.");
	end
end

function event_trade(e)
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 1717})) then -- Sealed Letter
		e.self:Say("You have found what I was unable to. King Tormax's protection of [" .. eq.say_link("Wenglawks") .. "] will end soon. His death will be so very delightful to invoke.");
		e.self:Emote("rushes out of the room, dropping his spear as he does.");
		e.other:Faction(189, 20); -- kromzek
		e.other:Faction(179, 20); -- king tormax
		e.other:Faction(67, -30); -- dain
		e.other:Faction(362, -30); -- yelinak
		e.other:QuestReward(e.self, 0, 0, 0, 0, 25030, 1107392) -- Frozen Shard. XP 1% of level 45
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
