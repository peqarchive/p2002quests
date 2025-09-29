function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Salutations " .. e.other:GetName() .. ". If you are here to make use of the forges then feel free to pursue your crafts within this chamber. If you are a new Fell Blade in need of a suit of armor and weapon then I will assist you in crafting [" .. eq.say_link("armaments") .. "] fitting of a young Shadow Knight.");
	elseif(e.message:findi("armament")) then
		e.self:Say("You will require this specially prepared Mail Assembly Kit in order to construct a suit of Fell Blade Armor. The materials required vary depending on the piece of armor you desire to craft. Once you have been outfitted in the Fell Blade Armor. return to me and I will present you with a somewhat important [" .. eq.say_link("task") .. "]. Do you desire to craft a [" .. eq.say_link("fell blade helm") .. "], a [" .. eq.say_link("fell blade bracer") .. "], [" .. eq.say_link("fell blade gauntlets") .. "], [" .. eq.say_link("fell blade boots") .. "], [" .. eq.say_link("fell blade vambraces") .. "], [" .. eq.say_link("fell blade greaves") .. "], or a [" .. eq.say_link("fell blade breastplate") .. "]?");
		e.other:SummonItem(17124);
	elseif(e.message:findi("task")) then
		e.self:Say("The blacksmiths of [" .. eq.say_link("Clan Kolbok") .. "] craft weapons using an ancient Kobold tradition that has been long forgotten by most of the kobold clans. I believe there is something to be learned from their traditions should we discover their intricacies. Go into the Warrens and locate the chambers of the kobold blacksmiths. There you should be able to find some record of their traditional techniques to return to me here in Paineel where they can be translated and studied.");
	elseif(e.message:findi("greaves")) then
		e.self:Say("To assemble Fell blade Greaves you will need to obtain two bricks of crude bronze and smelt them in a forge with a Water Flask and this Crude Greaves Mold. Once that is done combine the Crude Bronze Greaves with two Intact Kobold Pelts and two Calcified Tibia in the Mail Assembly Kit.");
		e.other:SummonItem(19636);
	elseif(e.message:findi("helm")) then
		e.self:Say("To assemble a Fell blade Helm you will need to obtain two bricks of crude bronze and smelt them in a forge with a Water Flask and this Crude Helm Mold. Once that is done combine the Crude Bronze Helm with a Ruined Kobold Pelt and a Calcified Skull in the Mail Assembly Kit.");
		e.other:SummonItem(19631);
	elseif(e.message:findi("boot")) then
		e.self:Say("To assemble Fell blade Boots you will need to obtain two bricks of crude bronze and smelt them in a forge with a Water Flask and this crude Boot Mold. Once that is done combine the Crude Bronze Boots with two Ruined Kobold Pelts. and two Calcified Foot Bones in the Mail Assembly Kit.");
		e.other:SummonItem(19634);
	elseif(e.message:findi("bracer")) then
		e.self:Say("To assemble a Fell blade Bracer you will need to obtain a brick of crude bronze and smelt it in a forge with a Water Flask and this Crude Bracer Mold. Once that is done, combine the Crude Bronze Bracer with a Ruined Kobold Pelt and a Calcified Ulna Bone in the Mail Assembly Kit.");
		e.other:SummonItem(19632);
	elseif(e.message:findi("breastplate")) then
		e.self:Say("To assemble a Fell blade Breastplate you will need to obtain four bricks of crude bronze and smelt them in a forge with a Water Flask and this Crude Breastplate Mold. Once that is done combine the Crude Bronze Breastplate with a Pristine Kobold Pelt, a calcified sternum, and a calcified ribcage in the Mail Assembly Kit.");
		e.other:SummonItem(19637);
	elseif(e.message:findi("gauntlet")) then
		e.self:Say("To assemble Fell blade Gauntlets you will need to obtain two bricks of crude bronze and smelt them in a forge with a Water Flask and this crude Gauntlet Mold. Once that is done combine the Crude Bronze Gauntlets with a Ruined Kobold Pelt and two Calcified Finger Bones in the Mail Assembly Kit.");
		e.other:SummonItem(19633);
	elseif(e.message:findi("vambrace")) then
		e.self:Say("To assemble Fell blade Vambraces you will need to obtain two bricks of crude bronze and smelt them in a forge with a Water Flask and this Crude Vambrace Mold. Once that is done combine the Crude Bronze Vambraces with an Intact Kobold Pelt and two Calcified Humerus Bones in the Mail Assembly Kit.");
		e.other:SummonItem(19635);
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 20421})) then
		e.self:Say("Well done " .. e.other:GetName() .. ". I will have this translated immediately so that it may be studied. Take this Dull Fell Blade Cutlass and sharpen it in a forge with a sharpening stone. It may take you several attempts if you are unfamiliar with the process. Once that is done bring me the Sharp Fell Blade Cutlass, a Large Briar Snake Skin, and a Petrified Eyeball and I will put the finishing touches on the weapon.");
		e.other:QuestReward(e.self,0,0,0,0,20403);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 20404, item2 = 20355, item3 = 20402})) then
		e.self:Emote("Faratain fashions a grip from the large briar snake skin, fastens the petrified eyeball to the pommel of the hilt, and polishes the blade with a shimmering black substance. I present you with your Fell Blade Cutlass. May it serve you well in the name of Cazic Thule.");
		e.other:QuestReward(e.self,0,0,0,0,20416);
	end
end