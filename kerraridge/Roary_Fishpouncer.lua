function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Rrrr.. catching and prrreparing fish is my specialty. Perrrhaps you could fetch for me some [" .. eq.say_link("rrrare fish") .. "] so that I may demonstrate my skill? Rrrr.");
	elseif(e.message:findi("rrrare fish")) then
		e.self:Say("Rrrr.. my most delectable dish is prrreparrred frrrom rrraw darkwater piranha. Unforrrtunately. the pirrranha only surrrvives in the murrrky waterrrs of the wicked Nektulos forrrest. I will rrreward any brrrave fisherman who can brrring me some rrraw darkwater pirranha.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 12318})) then
		e.self:Say("Rrrrr... you found the rrrraw fish.  I can now make my favorrrrrite dish.  Herrrrre is a special spearrrrr that will help you to catch morrrrrre of these."); --need proper text
		e.other:QuestReward(e.self,0,0,0,0,7027);
	end
end