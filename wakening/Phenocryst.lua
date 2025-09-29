function event_say(e)
	local qglobals = eq.get_qglobals();
	
	if(e.message:findi("hail")) then
		e.self:emote("speaks with a soundless voice, as if you are hearing your own thoughts. 'We sense you are attempting communication with us but do not understand what it is you are trying to convey. We are eager to know more. Perhaps there is one who knows the language of the stone and will speak with us");
	elseif(e.message:findi("help you")) then
		e.self:emote("speaks from within your mind as well as conveys a sense of joy empathically. It is said that the harbringer will find all of our people and unite them. When we join we will know all of our experiences and perhaps then be aware of how to proceed with the next step in our asscention. We implore you to find others like us and make them aware of us. You know the language of the stone and can tell them. We await your return with proof that you have spoken to them.");
	elseif(qglobals["veliumfocus"] == "1" and e.message:findi("find what")) then
		e.self:emote("says in the form of thoughts, We must call to it. We must make ourselves heard past these rocks though. A menhir must be constructed to amplify our voice. The stones we will need are not found in this area though. We hear whispers of stones far away that have the ability to channel and amplify our thoughts. We ask you to [" .. eq.say_link("gather these stones") .. "] for us harbinger.");
	elseif(qglobals["veliumfocus"] == "1" and e.message:findi("gather these stones")) then
		e.self:emote("thoughts flood your mind, 'Thank you Harbinger. We need 3 crystals. One of Beryl, one of Stibnite, and one of the purest Iron. These minerals will only be found deep within the earth where the geology is relatively stable. This Focus will aid you in finding the right crystals. Return it to me with the 3 crystals and we will construct our Menhir. Please hurry Harbinger, our prophecy awaits.");
	    e.other:SummonItem(1694);
	end
end

function event_trade(e)
    local qglobals = eq.get_qglobals();
    
    if(item_lib.check_turn_in(e.self, e.trade, {item1 = 1692})) then
            e.self:emote("sends it's thoughts to you, a feeling of disappointment washes over you, It seems the others are not aware of themselves yet. We are alone..So many questions yet we can find no answers. We have been given a very special gift but without direction we are lost. We must find who has made us aware of ourselves and why it has done so.");
            e.other:Faction(116,15);
            e.other:SummonItem(1701);
    elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 1694,item2 = 1695,item3 = 1697, item4 = 1696})) then -- Elbaite Focus, The Reddish Crystal, Heavy Metal Crystal, Bent Metallic Crystal
            e.self:emote("speaks to you from within your mind, You know the stone! This is wonderful! The fullfillment of the prophecy is now one step closer. The most ancient of the stone tells us that one not of stone will come forth and act as our harbringer of asscention. We believe you to be our harbringer. Please [" .. eq.say_link("help you",false,"help us") .. "]!");
            e.other:Faction(116,15);
            eq.set_global("veliumfocus","1",5,"F");
    elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 1693})) then
            e.self:emote("makes no sound but it's voice fills your mind. We have always held our memories within the earth and stone but only recently have we become aware of them. We do not know what happened or who gave us this wonderful gift but we can now access those memories and are aware of it's storage. With that knowledge has come questions and desires. When the prophecy comes to be then we will have our answers and fulfill our desires.");
            e.self:emote("familiar thoughts flood into your mind again, You truly are the Harbinger, take this Focus as a mark of your friendship with us. Now we can construct the Menhir, we need .. the stones speak.. , There is a problem. Ones of flesh are coming, the large ones, 3 of them. They must not disturb us while we construct the Menhir! Please stop them Harbinger! bring us proof of their distruction along with your Focus and then we will begin the calling. Our asscention is at hand!");
            e.other:Faction(116,15);
            e.other:SummonItem(1698);
            eq.spawn2(119158,0,0,408.10, -690.21, -201.55,374); --# accolyte of Zek  A
            eq.spawn2(119158,0,0,-564.04, -985.80, -191.31,374); --# accolyte of Zek  B
            eq.spawn2(119164,0,0,303.02, 254.44, -201.54,374); --# Bloodpriest Ioukond  C
            eq.set_timer("5", 360000);
    end
    
	item_lib.return_items(e.self, e.other, e.trade)
end
function event_timer(e)
    if(e.timer == "5") then
        eq.stop_timer(e.timer)
        eq.signal(119158, 1);
        eq.signal(119164, 1);
    end
end
