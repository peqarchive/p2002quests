--an_irmin_fannsk (210038) & an_irmin_fannsk (210411)
--Forest Giant Fort
--Notifies #Neffiken,_Lord_of_Kelek`Vor (210470) that npc was killed in the camp.
--postorms

function event_death_complete(e)
	eq.signal(210470,0);	--#Neffiken,_Lord_of_Kelek`Vor (210470)
end