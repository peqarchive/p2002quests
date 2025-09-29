function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Greetings, " .. e.other:GetName() .. "! I have the finest Skyiron Ores for sale! Feel free to examine the quality of my ores! I am also charged with teaching members of the Legion techniques to work Skyiron, craft [" .. eq.say_link("Skyiron Targ Shields") .. "], and [" .. eq.say_link("Cabilis Scale Mail") .. "].");
	elseif(e.message:findi("cabilis scale mail")) then
		e.self:Say("Cabilis Scale Mail is a customized armor worn by the Legion of Cabilis. The mail can only be forged in the unique Cabilis Forge here in East Cabilis. All pieces of the mail require the appropriate section Mold and a Flask of Blood Water, Coifs, Masks, Gorgets, Mantles, Belts, and Bracelets require one Skyiron Sheet, and one set of Skyiron Scales. Gloves and Boots require Two Skyiron Sheets and one set of Skyiron Scales. Sleeves require two Skyiron Sheets and two sets of Skyiron Scales. Coats, Cloaks, and Leggings require three Skyiron Sheets, and two sets of Skyiron Scales. Once you have mastered these techniques you may want to try [" .. eq.say_link("imbued mail") .. "].");
	elseif(e.message:findi("imbued mail")) then
		e.self:Say("Imbued Cabilis Scale Mail is crafted in the same fashion as standard Cabilis Scale Mail with  two exceptions. Scale Temper must be used instead of Blood Water, and a piece of amber imbued by a powerful shaman must be crafted into each piece. Speak with brewers about obtaining scale temper if you have none available.");
	elseif(e.message:findi("skyiron targ shields")) then
		e.self:Say("Skyiron Targ Shields are customized shields perfect for members of the Legion of Cabilis. Such shields can only be crafted in our unique Cabilis Forge. The supplies needed for a shield are a Targ Shield Mold, a Folded Skyiron Sheet, a Forging Hammer, and Scale Temper.");
	end
end