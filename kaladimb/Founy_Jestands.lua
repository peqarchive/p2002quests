-- Rogue Epic NPC/Guildmaster -- Founy_Jestands
function event_say(e)
	if(e.message:findi("stanos")) then
		e.self:Say("Um, er.. (looks around nervously) Have you actually seen Stanos? How.. is he? Um, I have things I should be doing. I've got to figure out how this pottery wheel got stuck on my foot, for one thing. Er, I really don't have anything to tell you about Stanos, really, I swear it.");
	elseif(e.message:findi("note")) then
		e.self:Say("I don't know what you're talking about, if you know what I mean.' Founy fingers his belt pouch. 'You should leave now, if you know what's good for you. Don't make me sic the crew on you.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end