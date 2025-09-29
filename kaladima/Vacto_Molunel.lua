function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Well met, " .. e.other:GetName() .. "!  I am Vacto Molunel.  If you are seeking to outfit yourself with the finest weapons in all of Kaladim. I am the one to see.  I also posses a [" .. eq.say_link("rare talent") .. "] you might find useful.");
	elseif(e.message:findi("rare talent")) then
		e.self:Say("Piqued your interest, did I?  Well, you see, I am one of the few dwarves who possess the knowledge and talent to craft a unique type of armor entirely out of scarab carapaces.  While my specialty is making [" .. eq.say_link("scarab helms") .. "]. I have also been convinced to make [" .. eq.say_link("scarab breastplates") .. "] and [" .. eq.say_link("scarab boots") .. "] from time to time.  All of the pieces I craft are to dwarven proportions, but I have had some gnomish and halfling customers as well.  They come from all over for my armor.");
	elseif(e.message:findi("scarab helms")) then
		e.self:Say("Interested in a scarab helm, are you?  Well, because my talent is so unique and my time is so valuable, I am afraid I could only make you a helm if you were to provide me with the two scarab carapaces necessary to accommodate a head such as yours.  I will also need a payment of 5 gold pieces.  The Butcherblocks are crawling with worker scarabs that have just the right size carapaces for our needs.");
	elseif(e.message:findi("scarab breastplates")) then
		e.self:Say("Ah..  A  scarab breastplate.. hmm.  Well, if you want to convince me to go though the trouble of crafting one of those, not only will you have to pay my fee of 23 gold pieces, you must provide me with a pristine giant scarab carapace.  I refuse to make a breastplate with cracked carapaces.");
	elseif(e.message:findi("scarab boots")) then
		e.self:Say("Ah..  Scarab Boots.. hmm.  Well, if you want to convince me to go though the trouble of crafting a pair of those, not only will you have to pay my fee of 17 gold pieces, you must provide me with a cracked giant scarab shell and 2 scarab legs.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 13849, item2 = 13849, gold = 4})) then -- helm
		e.other:SummonItem(2175);
		e.self:Say("Here is your Scarab Helm!");
		e.other:Ding();
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 13133, gold = 22})) then -- breastplate
		e.other:SummonItem(2176);
		e.self:Say("Here is your Scarab breastplate!");
		e.other:Ding();
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 13132, item2 = 13848, item3 = 13848, gold = 16})) then -- boots
		e.other:SummonItem(2177);
		e.self:Say("Here is your Scarab boots!");
		e.other:Ding();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
