function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hail, " .. e.other:GetName() .. ", I am Aderius Rhenar, priest of Quellious and assistant to Lady Laraena. I have been fortunate to be imprisoned here with these Kejekan cat men, they are a very wise people. Are you planning on returning to [" .. eq.say_link("Erudin") .. "] soon my friend?");
	elseif(e.message:findi("erudin")) then
		e.self:Say("I have managed to prepare a message on this scrap of cloth for the priestess Laraena. It is a matter of great importance to the High Council of Erudin. Please deliver this message to her promptly. I must stay here for a while longer and converse further with my Kejekan friends.");
	end
end