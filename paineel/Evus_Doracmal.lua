function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Good day. " .. e.other:GetName() .. "!  Have you visited Taria already? Taria does indeed make some of the finest statuettes in all the land.  I fear. though. that she has lost her faith.  She used to make idols depicting our Lord of Fear.  Now she dabbles in the creation of [" .. eq.say_link("other idols") .. "]!");
	elseif(e.message:findi("other idol")) then
		e.self:Say("Well. just the other day. she was commissioned to create a representation of Tunare for Iva down at the Bakery.  I've always known that Iva was a bit odd. but that is just downright strange!");
	end
end