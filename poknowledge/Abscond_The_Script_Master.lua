function event_spawn(e)
	e.self:GMMove(-167, 207, -156, 380);
	e.self:TempName("Daeron");
end

function event_say(e)
	local qglobals = eq.get_qglobals();
	local forumName = e.other:GetForumName(e.other:AccountID());
	local globalName = forumName .. "-Daeron19";
	local num = qglobals[globalName];

	if (e.message:findi("hail")) then
		if (num == nil) then
			e.other:Message(15,"Well hey there, are you here seeking my [" .. eq.say_link("approval") .. "]?");
		elseif (num == "1" and qglobals[forumName .. "-Cauldron19"] ~= nil and qglobals[forumName .. "-Orb19"] ~= nil and qglobals[forumName .. "-BookCase19"] ~= nil) then
			e.other:Message(15,"The Relics!  Thanks a lot for these, you have my approval.  Here is also something for your efforts.");
			eq.set_global(globalName ,"99",7,"F");
			e.other:SummonItem(100010, 1);
		elseif (num == "1") then
			e.other:Message(15,"Are you having problems finding the relics?  Just look closely at the locations I mentioned and I'm sure you will find them.");
		else
			e.other:Message(15,"While I appreciate your help, I already gave you something for your efforts.");
		end
	elseif (e.message:findi("approval")) then
		e.other:Message(15,"Oh yes, I have the perfect [" .. eq.say_link("job") .. "] for you if you want my approval.");
	elseif (e.message:findi("job")) then
		e.other:Message(15,"I have been researching the location of some [" .. eq.say_link("relics") .. "], but need someone to obtain them for me.");
	elseif (e.message:findi("relics")) then
		e.other:Message(15,"Oh yes, there are many relics hidden all over norrath, even in plain sight.  Will you [" .. eq.say_link("retrieve") .. "] some of them for me?");
	elseif (e.message:findi("retrieve")) then
		e.other:Message(15,"The first is located at the ruins on the island within Dagnors Cauldron.  For the next one, search the book cases in the far north ruins within the Dreadlands.  Lastly, inspect the orb that leads to Crystal Caverns in the Eastern Wastes, I suspect you will find another one there.");	
		eq.set_global(globalName ,"1",7,"F");
	end
end