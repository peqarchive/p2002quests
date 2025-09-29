--player.lua for 
--Bastion of Thunder

-- global script variables
local player_list = nil;
local player_list_count = nil;
local client_e = nil;
local entity_list = nil;

function event_click_door(e)
	-- populate the current entity list whenever someone clicks.
	entity_list = eq.get_entity_list();
	zone_id = eq.get_zone_id();
	instance_id = eq.get_zone_instance_id();
	-- drop the door information into some local variables
	local door_id = e.door:GetDoorID();
	local open_type = entity_list:FindDoor(door_id):GetOpenType();
	client_e = e;
	--e.self:Message(14,"Door ID is: [" .. door_id .. "] Open Type: [" .. e.door:GetOpenType() .. "] Lock Pick: [" .. e.door:GetLockPick() .. "] Key Item: [" .. e.door:GetKeyItem() .. "]");   --debug to easily check door IDs
	-- make sure the player_list is clear
	player_list = nil;
	player_list_count = nil;
	-- only time we will use the raid value is if they are clicking on the Agnarr door
	-- otherwise, it is a group only port up.
	local raid = e.self:GetRaid();
	if (raid.valid) then
		player_list = raid;
		player_list_count = raid:RaidCount();
	else
		-- if group is not valid, it is a single player click up
		local group = e.self:GetGroup();
		if (group.valid) then
			player_list = group;
			player_list_count = group:GroupCount();
		end
	end

	-- Agnarr Tower aka electric penis
	
	if (door_id == 51) then

		-- check if the person clicking has the Symbol of Torden item id:9433 or has GM status of 80+ with the GM flag on.
		-- the point of checking both status and GM flag is so a dev with status > 80 can still pretend to be a non-GM.
		-- by using the status, we ensure someone cannot bypass the check by another GM using "#gm on" on a player.
		if (e.self:GetGM()) then
			PortIntoTower(e.self:GetX(), e.self:GetY(), e.self:GetZ(), 100, -765, -1735, 1270, 385,true,e);
		elseif (e.self:HasItem(9433)) then
			PortIntoTower(e.self:GetX(), e.self:GetY(), e.self:GetZ(), 100, -765, -1735, 1270, 385,true,e);
		else
			local gargoyles = {360450,360451,360452,360453};
			for _,garg in pairs(gargoyles) do
				SendGargoyles(garg);
			end
		end
	-- the four corner towers all use the same key and it can be on the keyring
	elseif (door_id == 61 or door_id == 63 or door_id == 65 or door_id == 67) then
		-- check if the Ring of Torden item id: 9425 is on the keyring
		local key_found = false;
		if (e.self:KeyRingCheck(9425)) then
			key_found = true;
		-- if it is not on the keyring check for them to have the item.
		elseif (e.self:HasItem(9425)) then
			key_found = true;
			-- add it to the keyring
			e.self:KeyRingAdd(9425);
		-- check if item is on cursor
		elseif (e.self:GetItemIDAt(30) == 9425) then
			key_found = true;
			-- add it to the keyring
			e.self:KeyRingAdd(9425);			
		-- allow a GM to click up
		elseif (e.self:Admin() >= 80 and e.self:GetGM()) then
			key_found = true;
		end
		-- Southeast tower
		if (door_id == 61) then
			-- did the player have the key?
			if (key_found) then
				PortIntoTower(e.self:GetX(), e.self:GetY(), e.self:GetZ(), 50, 85, 145, 635, 128,false,e);
			else
				local gargoyles = {360486,360487};
				for _,garg in pairs(gargoyles) do
					SendGargoyles(garg);
				end
			end
		-- Southwest tower
		elseif (door_id == 63) then
			-- did the player have the key?
			if (key_found) then
				PortIntoTower(e.self:GetX(), e.self:GetY(), e.self:GetZ(), 50, -830, -865, 1375, 128,false,e);
			else
				local gargoyles = {360484,360485};
				for _,garg in pairs(gargoyles) do
					SendGargoyles(garg);
				end
			end
		-- Northwest tower
		elseif (door_id == 65) then
			-- did the player have the key?
			if (key_found) then
				PortIntoTower(e.self:GetX(), e.self:GetY(), e.self:GetZ(), 50, -350, -2200, 1955, 255,false,e);
			else
				local gargoyles = {360490,360491};
				for _,garg in pairs(gargoyles) do
					SendGargoyles(garg);
				end
			end
		-- Northeast tower
		elseif (door_id == 67) then
			-- did the player have the key?
			if (key_found) then
				PortIntoTower(e.self:GetX(), e.self:GetY(), e.self:GetZ(), 50, 150, -1220, 1120, 128,false,e);
			else
				local gargoyles = {360488,360489};
				for _,garg in pairs(gargoyles) do
					SendGargoyles(garg);
				end
			end
		end
	elseif (door_id == 60 or door_id == 62 or door_id == 64 or door_id == 66) then	--remove player from hatelist on click from courtyard back to BoT Entrance
		eq.get_entity_list():RemoveFromHateLists(e.self:CastToMob());
	end
end

function SendGargoyles(garg_spawnpoint)
	-- get all the npcs 
	local npc_list = entity_list:GetNPCList();
	if (npc_list ~= nil) then
		for npc in npc_list.entries do
			if (npc:GetSpawnPointID() == garg_spawnpoint) then
				-- set aggro on person who clicked
				npc:AddToHateList(client_e.self,1);
			end
		end
	end
end

function PortIntoTower(cur_x, cur_y, cur_z, distance, dest_x, dest_y, dest_z, dest_h,raid,e)
	-- player_list contains e.self:GetGroup or e.self:GetRaid or is nil for a single player
	-- if it is not nil then port up the group/raid as long as they are in range
	if (player_list ~= nil) then
		-- iterate through the player_list (it is 0 based)
		for i = 0, player_list_count - 1, 1 do
			
			-- MovePC and GetAggroCount are client functions and group:GetMember returns a mob (raid:GetMember returns client)
			local client_v = player_list:GetMember(i):CastToClient();
			
			-- make sure we actually have a valid client
			if (client_v.valid) then
				-- check the distance and port them up if close enough
				if (client_v:CalculateDistance(cur_x, cur_y, cur_z) <= distance) then
					if e.self:IsRaidGrouped() then
						--raid handling for porting up entire raid if argument is true
						if raid then 
							client_v:MovePCInstance(zone_id,instance_id, dest_x, dest_y, dest_z, dest_h);
							eq.get_entity_list():RemoveFromHateLists(client_v:CastToMob());
						--ports up group only if raid is false
						elseif not raid and player_list:GetGroup(client_v:GetName()) == player_list:GetGroup(e.self:GetName()) then
							client_v:MovePCInstance(zone_id,instance_id, dest_x, dest_y, dest_z, dest_h);
							eq.get_entity_list():RemoveFromHateLists(client_v:CastToMob());
						end
					else	--group handling
						client_v:MovePCInstance(zone_id,instance_id, dest_x, dest_y, dest_z, dest_h);
						eq.get_entity_list():RemoveFromHateLists(client_v:CastToMob());
					end	
				end
			end
		end
	else
		-- port the player up
		client_e.self:MovePCInstance(zone_id,instance_id, dest_x, dest_y, dest_z, dest_h);
		eq.get_entity_list():RemoveFromHateLists(client_e.self:CastToMob());
	end
end

function event_level_up(e)
	local discs = require('disciplines');
	discs:train_discs(e, e.self:GetLevel());
end

function event_enter_zone(e)
	local discs = require('disciplines');
	discs:update_discs(e, e.self:GetLevel());
end