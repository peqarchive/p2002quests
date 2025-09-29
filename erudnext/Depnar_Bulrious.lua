function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hail. " .. e.other:GetName() .. "! I am the master of the paladins among the Peacekeepers. Have you [" .. eq.say_link("joined") .. "] the harmony of the Peacekeepers or are you merely a visitor?");
	elseif(e.message:findi("joined")) then
		e.self:Say("Then go and speak with the other Peacekeepers. Do your part to promote the words of Quellious.");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 18726})) then -- Tattered Note
		e.self:Say("Welcome to the Temple of Divine Light. I am Master Bulrious. Here. we study and spread the will of Quellious. Here is your guild tunic. Go find Jras Solsier. he will get you started with your first lesson.");
		e.other:SummonItem(13546); -- Faded Silver Tunic*
		e.other:Ding();
		e.other:Faction(247,100,0); -- Peace Keepers
		e.other:Faction(145,25,0); -- High Council of Erudin
		e.other:Faction(143,-25,0); -- Heretics
		e.other:AddEXP(100);
	end
	item_lib.return_items(e.self, e.other, e.trade);
end

-- END of FILE Zone:erudnext  ID:98062 -- Depnar_Bulrious