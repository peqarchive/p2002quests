function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hail, " .. e.other:GetName() .. "! I hope the trek into our shrine has not scarred you in any way. Our defenses have been increased lately. Many of the citizens have heard rumors about our shrine. I say it is all due to that [" .. eq.say_link("soldier") .. "].");
	elseif(e.message:findi("soldier")) then
		e.self:Say("The soldier I refer to is Commander Kane Bayle. The supreme officer himself. Don't get me wrong. I trust Kane. He has quite a black heart. I just don't trust that girl, [" .. eq.say_link("Nerissa") .. "].");
	elseif(e.message:findi("nerissa")) then
		e.self:Say("Nerissa Clothspinner. Her sister was a good friend of Kane's. When she left Qeynos to venture into the world, she asked Kane to watch over the girl. Now Kane tries to hide from this child the fact that he is allied with our church. I do not think he has hidden it well. I have told the others. but they do not believe me. I do not care. I have my own [" .. eq.say_link("plans") .. "].");
	elseif(e.message:findi("plan")) then
		e.self:Say("Nerissa is well protected by Kane. She will no doubt attempt to inform someone of her suspicions, most likely her sister, Milea. You must find Milea Clothspinner and kill her. No word of our operations must leak out. Return with proof of Milea's death and we shall see to a reward.");
	end
end