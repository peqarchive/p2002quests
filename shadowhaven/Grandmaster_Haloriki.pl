sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Greetings. $name. I am Grandmaster Haloriki of House Midst. I am the resident guildmaster of this quarter in charge of training all new recruits that wish to serve the Midst."); }
}

sub EVENT_ITEM {
  #do all other handins first with plugin, then let it do disciplines
  
  plugin::return_items(\%itemcount);
}
#END of FILE Zone:shadowhaven  ID:150130 -- Grandmaster_Haloriki 
