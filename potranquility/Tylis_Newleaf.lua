--Tylis_Newleaf (203373)
--Plane of Torment Planar Progression
--potranquility

function event_say(e)
	local qglobals = eq.get_qglobals(e.self, e.other);
	if (e.message:findi("hail") and qglobals.pop_pot_shadyglade ~= nil and qglobals.pop_pot_newleaf ~= nil and qglobals.pop_pot_saryrn ~= nil) then
		e.self:Say("You took on and destroyed the Mistress of Torment? Truly impressive! Now that you have found the knowledge that is the cipher, I recall that there was one that I had met once in New Tanaan. He might be able to use it properly. I believe he is now the Grand Librarian of the city.  Good luck with all that you seek friends.");
	elseif e.message:findi("hail") then
		e.self:Emote("lies on the floor still quivering in pain.  You notice the concern that Fahlia is showing for him.");
	end
end

function event_trade(e)		--standard item return script
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end



  -- {
  -- $pop_pon_hedge_jezith=undef;
  -- $pop_pon_construct=undef;
  -- $pop_ponb_terris=undef;
  -- $pop_ponb_poxbourne=undef;
  -- $pop_poi_dragon=undef;
  -- $pop_poi_behometh_preflag=undef;
  -- $pop_poi_behometh_flag=undef;
  -- $pop_pod_alder_fuirstel=undef;
  -- $pop_pod_grimmus_planar_projection=undef;
  -- $pop_pod_elder_fuirstel=undef;
  -- $pop_poj_mavuin=undef;
  -- $pop_poj_tribunal=undef;
  -- $pop_poj_valor_storms=undef;
  -- $pop_poj_execution=undef;
  -- $pop_poj_flame=undef;
  -- $pop_poj_hanging=undef;
  -- $pop_poj_lashing=undef;
  -- $pop_poj_stoning=undef;
  -- $pop_poj_torture=undef;
  -- $pop_pov_aerin_dar=undef;
  -- $pop_pos_askr_the_lost=undef;
  -- $pop_pos_askr_the_lost_final=undef;
  -- $pop_cod_preflag =undef;
  -- $pop_cod_bertox=undef;
  -- $pop_cod_final=undef;
  -- $pop_pot_shadyglade=undef;
  -- $pop_pot_newleaf=undef;
  -- $pop_pot_saryrn=undef;
  -- $pop_pot_saryn_final=undef;
  -- $pop_hoh_faye=undef;
  -- $pop_hoh_trell=undef;
  -- $pop_hoh_garn=undef;
  -- $pop_hohb_marr=undef;
  -- $pop_bot_agnarr=undef;
  -- $pop_bot_karana=undef;
  -- $pop_tactics_tallon =undef;
  -- $pop_tactics_vallon=undef;
  -- $pop_tactics_ralloz=undef;
  -- $pop_elemental_grand_librarian=undef;
  -- $pop_sol_ro_arlyxir=undef;
  -- $pop_sol_ro_dresolik=undef;
  -- $pop_sol_ro_jiva=undef;
  -- $pop_sol_ro_rizlona=undef;
  -- $pop_sol_ro_xuzl=undef;
  -- $pop_sol_ro_solusk=undef;
  -- $pop_fire_fennin_projection=undef;
  -- $pop_wind_xegony_projection=undef;
  -- $pop_water_coirnav_projection=undef;
  -- $pop_eartha_arbitor_projection=undef;
  -- $pop_earthb_rathe=undef;
  -- $pop_time_maelin=undef;
  -- }

  -- }