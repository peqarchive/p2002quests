function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Good day t'ye. " .. e.other:GetName() .. "!  'Tis sure good t'see ye here.  I've been doin' a bit of thinkin' about the past.  Ah yes. me past t'would surprise even ye.  Alas. I cannae dwell on it now.  I am Barrith the Brave.  I must be searchin' for a hero worthy of havin' the eyes of the gods upon them.");
	end
end
