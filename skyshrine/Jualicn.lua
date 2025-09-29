-- Hsagra's Wrath
function event_say(e)
	if e.other:GetFaction(e.self) <= 3 then
		if(e.message:findi("hail"))  then
			e.self:Say("Why hello there, " ..e.other:GetName().. ". I do not see many that pass through these chambers unless they are trusted. What brings you before me today?");
		elseif(e.message:findi("Teachings of Relinar")) then
			e.self:Say("In order to receive the teachings, you need to gather four runes from the [" .. eq.say_link("descendants of Relinar") .. "]. Each descendant of Relinar has one of the four runes. You will find them where they stand six abreast in the wasteland. However in order to know that you have my blessing you must present them with a [" .. eq.say_link("treasure") .. "] that they would know came from me.");
		elseif(e.message:findi("treasure")) then
			e.self:Say("I do have an ancient token that I have carried with me for quite some time. It is very special to me, but if you have been sent here by Lawyla then you must be worthy, for she is quick to see through the lies that some believe will gain them admittance to our halls. Please take this and present it to each of the descendants so that they will know you are truthful when you say that you were sent by me.");
			e.other:SummonItem(1908); -- Jualicns Token
		elseif(e.message:findi("descendants of Relinar")) then
			e.self:Say("Another wizard joining our ranks? Excellent. Listen closely, " ..e.other:GetName()..". I will give you the Lexicon of Relinar, a great and well remembered sorcerer whose teachings are necessary in constructing a spell that is very powerful against the giants. I will give you his ancient lexicon which can harness his teachings if you can carry this large tome. You may need to rearrange your belongings. Are you [" .. eq.say_link("ready to receive the lexicon") .. "]?");	 
		elseif(e.message:findi("ready to receive the lexicon")) then
			e.self:Say("Combine the four runes in this lexicon and you will then have the teachings of Relinar. After you have done this, you are required to speak again with Lawyla about the [" .. eq.say_link("problems") .. "] we are having [with Kromzek spies].");
			e.other:SummonItem(17061); -- Lexicon of Relinar
		end
	else
		e.self:Say("Return when you have earned the trust of my bretheren.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end