--Gozer_The_Gatekeeper (206210)
--ZONE IN/GRAVEYARD VERSION
--poinnovation


local player_list = true;
local player_list_count = nil;
local entity_list = nil;
local client_e = nil;
local group = nil;
local raid = nil;

function event_say(e)
    local instance_id = eq.get_zone_instance_id();
    if(instance_id ~= 0) then
		e.self:Say("Hail Traveler!  I am pleased to see you made it through the rift unharmed. You must return to the original plane if you wish to access the deeper areas of the instance.");
		return;
    end

    local instanceId = nil;  -- from the global
    if(e.message:findi('hail')) then
        e.self:Say("Greetings Traveler, recently there has been talk of rifts in space and time. These rifts have been allowing well established groups of adventurers to explore identical instances of Norrath.");
        e.self:Say("Unfortunately, the planar instance is segmented to where travel is only possible to this location. You must journey in further to access a rift to a deeper instance. If you desire to travel through the portal to this location then tell me when you are [" .. eq.say_link("ready") .. "].");
    elseif(e.message:findi('ready')) then
        local qglobals = eq.get_qglobals(e.other);
        local zoneGlobal = "POINNOVATION-" .. tostring(e.other:GuildID());
        instanceId = qglobals[zoneGlobal];
        if (instanceId ~= nil) then
            entity_list = eq.get_entity_list(); --get current entity list of zone
            client_e = e;
            raid = e.other:GetRaid();
            group = e.other:GetGroup();
            if (raid ~= nil and check_raid_guild(raid,e.other:GuildID())) then
                eq.assign_raid_to_instance(tonumber(instanceId));
            elseif (group ~= nil and check_group_guild(group,e.other:GuildID())) then
                eq.assign_group_to_instance(tonumber(instanceId));
            else
                eq.assign_to_instance(tonumber(instanceId));
            end
            e.other:MovePCInstance(206, tonumber(instanceId), 270, 525, -45, 211); 
        else
            e.other:Message(13,"There is no instance available in this zone for your guild,");
        end
    end
end

function check_raid_guild(cur_raid, guildId)
    local same_guild = 0;
    player_list = nil;
    player_list_count = nil;
    if (cur_raid.valid == true) then
        player_list = cur_raid;
        player_list_count = cur_raid:RaidCount();
    end
    if (player_list ~= nil) then
        for i = 0, player_list_count - 1, 1 do --Uses a 0-n group memembers
            local client_v = player_list:GetMember(i):CastToClient();
            if (client_v.valid and client_v:GuildID() == guildId) then --valid client
                same_guild = same_guild + 1;
            end
        end
    end
    if (player_list ~= nil and same_guild == player_list_count) then
        return true;
    else
        return false;
    end
end

function check_group_guild(cur_group, guildId)
    local same_guild = 0;
    player_list = nil;
    player_list_count = nil;
    if (cur_group.valid == true) then
        player_list = cur_group;
        player_list_count = cur_group:GroupCount();
    end
    if (player_list ~= nil) then
        for i = 0, player_list_count - 1, 1 do --Uses a 0-n group memembers
            local client_v = player_list:GetMember(i):CastToClient();
            if (client_v.valid and client_v:GuildID() == guildId) then --valid client
                same_guild = same_guild + 1;
            end
        end
    end
    if (player_list ~= nil and same_guild == player_list_count) then
        return true;
    else
        return false;
    end
end
