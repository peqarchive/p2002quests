function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Lo dere " .. e.other:GetName() .. "! I be Brenthalion Aleslammer Holy Defender of Brell! I can see that ye found my temple of Brell that I have resided over for many years. I have been appointed by da King Kazon himself to make sure dat all our young paladins get da [" .. eq.say_link("training") .. "] dey need before dey go out to explore da world. Aye.");
	elseif(e.message:findi("training")) then
		e.self:Say("Ye see " .. e.other:GetName() .. ", learning all the correct fighting tactics along with learning your way around your homeland can be no easy task for a young one new to Kaladim. That is why I have developed a series of training exercises that help me monitor our young ones as they progress through the ranks of the Paladin on their path to true enlightenment! If you are a young [" .. eq.say_link("paladin") .. "] of Brell I would be happy to explain to you how the exercises work and I would also recommend that you take part in them!");
	elseif(e.message:findi("paladin")) then
		e.self:Say("Well I would be lyin if`n hearing dose words didn't bring a smile to me face every time that I hear dem. First thing you will need a Magical Mail Assembly Kit that you will use to combine different magical items in that will create an armor material. Once you have created a armor material you can then take it to a forge along with a armor mold to fashion an armor piece. If you are able to collect all the items for them you will have the potential to make a full set of Underfoot Defenders Platemail! If`n ye are [" .. eq.say_link("ready to begin") .. "] collecting yer items I will be happy to give you your Magical Mail Assembly Kit and git you started!");
	elseif(e.message:findi("ready")) then
		e.self:Say("Excellent " .. e.other:GetName() .. "! Here is your Magical Mail Assembly Kit. Once you are ready to collect the items for a specific armor piece simply tell me what piece of Underfoot Defenders Platemail that you want to craft. I can provide you with the material recipe and enchanted armor molds for Underfoot Platemail [" .. eq.say_link("Helm") .. "], [" .. eq.say_link("Bracer") .. "], [" .. eq.say_link("Armguards") .. "], [" .. eq.say_link("Boots") .. "], [" .. eq.say_link("Greaves") .. "], [" .. eq.say_link("Gauntlets") .. "], and [" .. eq.say_link("Breastplate") .. "].");
		e.other:SummonItem(17249);
	elseif(e.message:findi("armguards")) then
		e.self:Say("To create yer armguards material you will need to combine 2 Bricks of Crude Bronze, 2 Scarab Legs, and 1 Spiderling Silk in yer assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion yer very own Underfoot Defenders Armguards.");
		e.other:SummonItem(19635);
	elseif(e.message:findi("boots")) then
		e.self:Say("To create yer boots material you will need to combine 3 Bricks of Crude Bronze, 1 Aqua Goblin Foot, 2 Ogre Jawbones in yer assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion yer very own Underfoot Defenders Boots.");
		e.other:SummonItem(19634);
	elseif(e.message:findi("bracer")) then
		e.self:Say("To create yer bracer material you will need to combine 1 Brick of Crude Bronze, 1 RunnyEye Warbeads, 1 Shattered Warbeads and 1 Gypsy Wine in yer assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion yer very own Underfoot Defenders Bracer.");
		e.other:SummonItem(19632);
	elseif(e.message:findi("breastplate")) then
		e.self:Say("To create yer breastplate material you will need to combine 5 Bricks of Crude Bronze, 1 Scarab Carapace, 1 Golden Bandit Tooth, 1 Pristine Forest Drakeling Scale, 1 Skunk Tail and 1 Enraged Goblin Beads in yer assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion yer very own Underfoot Defenders Breastplate. When you have finished completing your armor set I would like you to return to me for I have one [" .. eq.say_link("final task") .. "] for you to complete. Aye.");
		e.other:SummonItem(19637);
	elseif(e.message:findi("task")) then
		e.self:Say("Da final task is simply dere young " .. e.other:GetName() .. ". I myself likes to collect many trophies as well as beer steins ye see. Well sense my days have been occupied by trainin da newest up and coming lads and lasses I haven't gotten a chance to go prize hunting like I once did. So if`n yer up for da task I would like ye to collect me some [" .. eq.say_link("valuable trophies") .. "] fer my collection.");
	elseif(e.message:findi("valuable trophies")) then
		e.self:Say("There are 3 signifigant trophies I would love to have fer me trophy room. If ye can collect and bring me 1 Enraged Goblin Beads, 1 Green Goblin Head and 1 Aqua Goblin Head I will surely reward ye with a blade worthy of the finest defenders Brell has to offer. Aye.");
	elseif(e.message:findi("gauntlets")) then
		e.self:Say("To create yer gauntlets material you will need to combine 3 Bricks of Crude Bronze, 1 Margyls Tongue, 1 Insignia of Greenblood, and 2 Rock Spiderling Legs in yer assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion yer very own Underfoot Defenders Gauntlets.");
		e.other:SummonItem(19633);
	elseif(e.message:findi("greaves")) then
		e.self:Say("To create yer greaves material you will need to combine 4 Bricks of Crude Bronze, 1 Basilisk Tongue, 1 Orc Skull , and 1 Scarab Eye in yer assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion yer very own Underfoot Defenders Greaves.");
		e.other:SummonItem(19636);
	elseif(e.message:findi("helm")) then
		e.self:Say("To create yer helm material you will need to combine 2 Bricks of Crude Bronze, 1 Aviak Eye, 1 Goblin Skull and 1 Ration in yer assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion yer very own Underfoot Defenders Helm.");
		e.other:SummonItem(19631);
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 2396, item2 = 28065, item3 = 28066})) then
		e.self:Say("This text needs to be collected from live.");
		e.other:SummonItem(26077);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
