----------------------------------------------------------------------
-- Arc: Justice Flagging - Trial of Lashing
-- Zone: Plane of Justice
-- NPC: #a_stinging_nemesis (201460)
-- Controller: #Event_Lashing_Control (201449)
----------------------------------------------------------------------

function event_spawn(e)
    -- Aggro the closest prisoner (201495) a tormented prisoner
    local npc = eq.get_entity_list():GetMobByNpcTypeID(201455);
    if (npc.valid) then
        if ( npc:CalculateDistance(e.self:GetX(), e.self:GetY(), e.self:GetZ()) < 50) then
            e.self:AddToHateList(npc,1);
        end
    end
end
