--Shaman Skull Quest 6
function event_say(e)
	local qglobals = eq.get_qglobals(e.self,e.other);
	if(e.message:findi("Sisters of Scale") and tonumber(qglobals.shmskullquest) >= 9 and e.other:GetFaction(e.self) <= 5) then
		e.self:Say("Looking for the skull I had for sale? I am afraid I sold it to a staunch lizard champion. I would gladly give you his name if you would do me a [" .. eq.say_link("slight favor") .. "].");
	elseif(e.message:findi("slight favor") and tonumber(qglobals.shmskullquest) >= 9 and e.other:GetFaction(e.self) <= 5) then
		e.self:Say("The lake garrison has requested that I work on a helm similar to the ones worn by sarnak dragoons. The problem is.. I need one to examine. You go get me one and I will tell you who purchased the skull.");
	end
end

function event_trade(e)
	local qglobals = eq.get_qglobals(e.self,e.other);
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 12761}) and tonumber(qglobals.shmskullquest) >= 9 and e.other:GetFaction(e.self) < 6) then -- Sarnak Dragoon Helm
		e.self:Say("Uhh. Thanks. I sort of told the lizard who bought the skull that you were asking for him, and, well, he was kinda mad, and... Cradossk, meet Bruiser.");
		eq.unique_spawn(85401,0,0,e.self:GetX() + 5,e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- Bruiser Noz
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

function event_signal(e)
	e.self:Say("Ye.. Ye.. Yes.. Yes, Bruiser.");
	eq.signal(85401,51);
end