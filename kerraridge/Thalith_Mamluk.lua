function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Wha?  Rarrrr!  Thalith try to fish but with [" .. eq.say_link("rrrats") .. "] and you botherring him. he cannot concentrate on water!  Go away. let Thalith fish!");
	elseif(e.message:findi("rats")) then
		e.self:Say(";Rats. Yes. Small, furry, brown, with teeth. They come, bite my paws, steal my bait, chew on lines and rods. They nasty little beasts and easy to kill but me not able to leave this position or fish get away. Errr. Maybe you keep the rats away? You kill baddest rat, Sharptooth. You bring me his tooth. I be very happy.")
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 6347})) then
		e.self:Say("You.. You kill the rats? Errr. Thalith thanks you. Here. Take this. It's good luck charm I've had for years.");
		e.other:Faction(175,10);
		e.other:QuestReward(e.self,0,0,0,0,1061);
	end
end