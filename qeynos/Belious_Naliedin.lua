function event_signal(e)
	e.self:Say("Sure. Go Ahead and play it now, while the stage is clear.");
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Welcome, my name is Belious Naliedin of the League of Antonican Bards. A few years ago, I had finally saved up the money, and I bought this place. I settled in, and have been [" .. eq.say_link("working") .. "] here ever since.");
	elseif(e.message:findi("working")) then
		e.self:Say("Ah, this is my shop. I am a musician, well known for my ability both in tuning, and [" .. eq.say_link("building instruments.") .. "]");
	elseif(e.message:findi("building")) then
		e.self:Say("Young bards are often not the wealthiest people in Norrath, and oftentimes, they have nothing to accompany their beautiful voices when they sing. If young bards are able to locate, and bring to me the [" .. eq.say_link("various parts") .. "] to assemble a lute with, I provide the labor for free.");
	elseif(e.message:findi("parts")) then
		e.self:Say("If you are able to find an unfinished lute body, an unfinished lute neck, a box of lute strings, and a set of fine lute tuners I will be able to craft for you one of the best sounding lutes that you have ever heard in your young life, and it will be yours, free of charge. It has long been my desire to help out any young men and women who wish to explore the [" .. eq.say_link("bardic") .. "] arts.");
	elseif(e.message:findi("bard")) then
		e.self:Say("A famous bard, you say? Why you must be seeking none other than the great Baenar Swiftsong! He is not here as you can see. Mayhap you seek an [" .. eq.say_link("audience") .. "] with him? He is a busy man and has not the time to speak with everyone who wishes to preoccupy his time with useless prattle! You are many and he is but one! Leave him be, I beg of you, to continue his songwriting in peace.");
	elseif(e.message:findi("audience")) then
		e.self:Emote("laughs briefly. 'Ah! In order to gain an audience with him, you must have a letter of [" .. eq.say_link("introduction") .. "] from me, otherwise he will not give you the time of day.'");
	elseif(e.message:findi("introduction")) then
		e.self:Emote("looks around. 'Well, you want a letter of introduction, eh? I think that fifty shiny platinum pieces sounds like a good introduction to me, my friend.'");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 18717})) then -- Tattered Note
		e.self:Say("Good day friend, and welcome to the Wind Spirit's Song. Thank you for joining our cause. Go speak with Jusean Evanesque; I'm sure you'll fit in well.");
		e.other:SummonItem(13502); -- #Brown Tunic*
		e.other:Ding();
		e.other:Faction(192,100,0); -- League of Antonican Bards
		e.other:Faction(184,15,0); -- Knights of Truth
		e.other:Faction(135,15,0); -- Guards of Qeynos
		e.other:Faction(273,-5,0); -- Ring of Scale
		e.other:Faction(207,-5,0); -- Mayong Mistmoore
		e.other:AddEXP(100);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 20374})) then
		e.self:Say("A famous bard, you say? Why you must be seeking none other than the great Baenar Swiftsong! He is not here as you can see. Mayhap you seek an audience with him? He is a busy man and has not the time to speak with everyone who wishes to preoccupy his time with useless prattle! You are many and he is but one! Leave him be, I beg of you, to continue his songwriting in peace.");
		e.other:Ding();
		e.other:AddEXP(100);
	elseif(item_lib.check_turn_in(e.self, e.trade, {platinum = 50})) then
		e.self:Say("Ah! Here is that letter of introduction I was looking for! Baenar likes to frequent a serene fountain in the southern Karanas. He finds the peace there accommodating to his work. He may even sing a tale for you if the mood strikes him.");
		e.other:Ding();
		e.other:SummonItem(20373);
		e.other:AddEXP(100);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 13775, item2 = 13776, item3 = 13777, item4 = 13778})) then
		e.self:Say("Here is your custom lute, use it well " .. e.other:GetName() .. ".");
		e.other:Ding();
		e.other:SummonItem(13105);
		e.other:AddEXP(1000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end