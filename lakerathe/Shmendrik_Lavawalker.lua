-- EPIC CLERIC
local player;

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hail, good " .. e.other:GetName() .. "!! Be wary near the waters of Lake Rathe! The Riptide goblin king, Lord Bergurgle, has been commanding his minions to murder and rob all who come near it! I am here seeking his death but I am afraid I am no match for all of his subjects. I shall reward you greatly for the death of Lord Bergurgle. I simply ask that you bring me his crown as proof.");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(e.other:GetClass() == 2) then
		if(item_lib.check_turn_in(e.self, e.trade, {item1 = 28044})) then -- 28044 :  Lord Bergurgle's Crown
			e.self:Emote("shoves the crown into a scorch marked leather satchel and cackles uncontrollably as madness twists his features and flames dance in his eyes. 'You, " .. e.other:GetName() .. ", have reduced the Riptides into chaos! Without a king to keep them in control they will ravage the settlements surrounding this lake! After the slaughter I shall return and easily burn the remainder of the villages and fishing shanties to the ground! None shall escape the fires of the Tyrant!!'");
			e.other:QuestReward(e.self,0,0,0,0,28045); -- Oil of Fennin Ro
			eq.unique_spawn(51138,32,0,160,3630.3,51,384.8);
			player = e.other;
		end
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

function event_signal(e)
	if(e.signal == 1) then
		e.self:Shout("I'll slay you like I slaughtered your fellow missionaries! The Triumvirate can not decide the fate of a follower of the Tyrant!!");
		e.self:CastToNPC():AddToHateList(player,1);
	end
end

function event_death_complete(e)
	eq.spawn2(51145,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading());
end
