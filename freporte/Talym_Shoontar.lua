function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say(string.format("Hello %s, I hope your hunt is going well.",e.other:GetName()));
	end
end

function event_signal(e)
	if(e.signal == 1) then
		e.self:Say("What kind of girly song was tha? It stank as bas as a troll's breath.");
	elseif(e.signal == 3) then
		e.self:Say("I ain't clappin' for no man.");
	elseif(e.signal == 5) then
		e.self:Say("Get off the stage, lass! Can't ye see he left because ye can't carry a tune?!");
	elseif(e.signal == 4) then
		e.self:Say("Antonius Bayle is a blithering fool.");
	end
end