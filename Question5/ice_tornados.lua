--[[Preface: When finding aid for this questions through solutions and forums, I cam across
this forum (https://otland.net/threads/advanced-ice-storm-spell.288740/) that was able to help
me create a foundation for the solution. I wanted to put this preface here to give credit to the
author of the forum for asking the question as well as the other authors who helped give suggestions.]]--

--[[ ICE TORNADO SEQUENCE ]]--

--[[Big Tornado Sequence: The following array has a sequence of areas to allow for the
bigger tornados in the effect to appear as needed. The big tornados graphic lasts for
approximately one second, and this was used to calculate the time needed for the sequence
to appear and dissapate correctly.]]--
local areasBigTornadosAffected = {
	{
		{0, 0, 0, 0, 0, 0, 0},
		{0, 0, 0, 0, 0, 0, 0},
		{0, 0, 0, 0, 0, 0, 0},
		{1, 0, 0, 2, 0, 0, 1},
		{0, 0, 0, 0, 0, 0, 0},
		{0, 0, 1, 0, 0, 0, 0},
		{0, 0, 0, 0, 0, 0, 0},
	},
	{
		{0, 0, 0, 0, 0, 0, 0},
		{0, 0, 1, 0, 1, 0, 0},
		{0, 0, 0, 0, 0, 0, 0},
		{1, 0, 0, 2, 0, 0, 1},
		{0, 0, 0, 0, 0, 0, 0},
		{0, 0, 1, 0, 0, 0, 0},
		{0, 0, 0, 0, 0, 0, 0},
	},
	{
		{0, 0, 0, 0, 0, 0, 0},
		{0, 0, 1, 0, 1, 0, 0},
		{0, 0, 0, 0, 0, 0, 0},
		{1, 0, 1, 2, 1, 0, 1},
		{0, 0, 0, 0, 0, 0, 0},
		{0, 0, 1, 0, 1, 0, 0},
		{0, 0, 0, 0, 0, 0, 0},
	},
    {
		{0, 0, 0, 0, 0, 0, 0},
		{0, 0, 1, 0, 1, 0, 0},
		{0, 0, 0, 0, 0, 0, 0},
		{1, 0, 1, 2, 1, 0, 1},
		{0, 0, 0, 0, 0, 0, 0},
		{0, 0, 1, 0, 1, 0, 0},
		{0, 0, 0, 0, 0, 0, 0},
	},
    {
		{0, 0, 0, 0, 0, 0, 0},
		{0, 0, 1, 0, 1, 0, 0},
		{0, 0, 0, 0, 0, 0, 0},
		{1, 0, 1, 2, 1, 0, 1},
		{0, 0, 0, 0, 0, 0, 0},
		{0, 0, 1, 0, 1, 0, 0},
		{0, 0, 0, 0, 0, 0, 0},
	},
    {
		{0, 0, 0, 0, 0, 0, 0},
		{0, 0, 1, 0, 1, 0, 0},
		{0, 0, 0, 0, 0, 0, 0},
		{1, 0, 1, 2, 1, 0, 1},
		{0, 0, 0, 0, 0, 0, 0},
		{0, 0, 1, 0, 1, 0, 0},
		{0, 0, 0, 0, 0, 0, 0},
	},
    {
		{0, 0, 0, 0, 0, 0, 0},
		{0, 0, 1, 0, 1, 0, 0},
		{0, 0, 0, 0, 0, 0, 0},
		{0, 0, 1, 2, 1, 0, 0},
		{0, 0, 0, 0, 0, 0, 0},
		{0, 0, 1, 0, 1, 0, 0},
		{0, 0, 0, 0, 0, 0, 0},
	},
    {
		{0, 0, 0, 0, 0, 0, 0},
		{0, 0, 0, 0, 0, 0, 0},
		{0, 0, 0, 0, 0, 0, 0},
		{0, 0, 1, 2, 1, 0, 0},
		{0, 0, 0, 0, 0, 0, 0},
		{0, 0, 1, 0, 1, 0, 0},
		{0, 0, 0, 0, 0, 0, 0},
	},
    {
		{0, 0, 0, 0, 0, 0, 0},
		{0, 0, 0, 0, 0, 0, 0},
		{0, 0, 0, 0, 0, 0, 0},
		{0, 0, 0, 2, 0, 0, 0},
		{0, 0, 0, 0, 0, 0, 0},
		{0, 0, 0, 0, 0, 0, 0},
		{0, 0, 0, 0, 0, 0, 0},
	},

}


--[[Small Tornado Sequence: The following array has a sequence of areas to allow for the
smaller tornados in the effect to appear as needed. The small tornados graphic lasts for
approximately half of a second, and this was used to calculate the time needed for the
sequence to appear and dissapate correctly.]]--
local areasSmallTornadosAffected = {
    {
		{0, 0, 0, 0, 0, 0, 0},
		{0, 0, 0, 0, 0, 0, 0},
		{0, 1, 0, 0, 0, 0, 0},
		{0, 0, 0, 2, 0, 0, 0},
		{0, 1, 0, 0, 0, 0, 0},
		{0, 0, 0, 0, 0, 0, 0},
		{0, 0, 0, 1, 0, 0, 0},
	},
    {
		{0, 0, 0, 0, 0, 0, 0},
		{0, 0, 0, 0, 0, 0, 0},
		{0, 0, 0, 0, 0, 1, 0},
		{0, 0, 0, 2, 0, 0, 0},
		{0, 0, 0, 1, 0, 1, 0},
		{0, 0, 0, 0, 0, 0, 0},
		{0, 0, 0, 0, 0, 0, 0},
	},
    {
		{0, 0, 0, 1, 0, 0, 0},
		{0, 0, 0, 0, 0, 0, 0},
		{0, 0, 0, 1, 0, 0, 0},
		{0, 0, 0, 2, 0, 0, 0},
		{0, 0, 0, 0, 0, 0, 0},
		{0, 0, 0, 0, 0, 0, 0},
		{0, 0, 0, 0, 0, 0, 0},
	},
    {
		{0, 0, 0, 0, 0, 0, 0},
		{0, 0, 0, 0, 0, 0, 0},
		{0, 1, 0, 0, 0, 0, 0},
		{0, 0, 0, 2, 0, 0, 0},
		{0, 1, 0, 0, 0, 0, 0},
		{0, 0, 0, 0, 0, 0, 0},
		{0, 0, 0, 1, 0, 0, 0},
	},
    {
		{0, 0, 0, 0, 0, 0, 0},
		{0, 0, 0, 0, 0, 0, 0},
		{0, 0, 0, 0, 0, 1, 0},
		{0, 0, 0, 2, 0, 0, 0},
		{0, 0, 0, 1, 0, 1, 0},
		{0, 0, 0, 0, 0, 0, 0},
		{0, 0, 0, 0, 0, 0, 0},
	},
    {
		{0, 0, 0, 1, 0, 0, 0},
		{0, 0, 0, 0, 0, 0, 0},
		{0, 0, 0, 1, 0, 0, 0},
		{0, 0, 0, 2, 0, 0, 0},
		{0, 0, 0, 0, 0, 0, 0},
		{0, 0, 0, 0, 0, 0, 0},
		{0, 0, 0, 0, 0, 0, 0},
	},
    {
		{0, 0, 0, 0, 0, 0, 0},
		{0, 0, 0, 0, 0, 0, 0},
		{0, 1, 0, 0, 0, 0, 0},
		{0, 0, 0, 2, 0, 0, 0},
		{0, 1, 0, 0, 0, 0, 0},
		{0, 0, 0, 0, 0, 0, 0},
		{0, 0, 0, 1, 0, 0, 0},
	},
    {
		{0, 0, 0, 0, 0, 0, 0},
		{0, 0, 0, 0, 0, 0, 0},
		{0, 0, 0, 0, 0, 1, 0},
		{0, 0, 0, 2, 0, 0, 0},
		{0, 0, 0, 1, 0, 1, 0},
		{0, 0, 0, 0, 0, 0, 0},
		{0, 0, 0, 0, 0, 0, 0},
	},
    {
		{0, 0, 0, 1, 0, 0, 0},
		{0, 0, 0, 0, 0, 0, 0},
		{0, 0, 0, 1, 0, 0, 0},
		{0, 0, 0, 2, 0, 0, 0},
		{0, 0, 0, 0, 0, 0, 0},
		{0, 0, 0, 0, 0, 0, 0},
		{0, 0, 0, 0, 0, 0, 0},
	},
}


-- First we create two tables that hold our big and small tornado combat protocols
local combatBigProtocol = {}
local combatSmallProtocol = {}

-- We then loop over the protocols for the length of the arrays (since both are the
-- same size, we can instansiate both protocols within one loop.).
for i = 1, #areasBigTornadosAffected do
	
	-- Create a combat object at this index, and then fill it with similar data to the
	-- eternal winter spell that was used for the graphic
	combatBigProtocol[i] = Combat()
	combatBigProtocol[i]:setParameter(COMBAT_PARAM_TYPE, COMBAT_ICEDAMAGE)
	combatBigProtocol[i]:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_ICETORNADO)
	
	-- When we set the area for the combat protocol, we need to make sure we are indexing
	-- from the big tornado array
	combatBigProtocol[i]:setArea(createCombatArea(areasBigTornadosAffected[i]))

	
	-- Create a combat object at this index, and then fill it with similar data to the
	-- eternal winter spell that was used for the graphic
    combatSmallProtocol[i] = Combat()
	combatSmallProtocol[i]:setParameter(COMBAT_PARAM_TYPE, COMBAT_ICEDAMAGE)
	combatSmallProtocol[i]:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_ICETORNADO)

	-- When we set the area for the combat protocol, we need to make sure we are indexing
	-- from the small tornado array
	combatSmallProtocol[i]:setArea(createCombatArea(areasSmallTornadosAffected[i]))
end


--[[ Multiple Spells Method: We create a local method that will allow for us to enter either
combat protocol and execute the spell with the appropriate parameters]]--
local function castMultipleSpells(creatureID, variant, combatIndex, combatProtocol)
	combatProtocol[combatIndex]:execute(creatureID, variant)
end


--[[ Casting Spells Method: We utilize the created method onCastSpell to cast tornado spells
in the manner that is a replication of the question.]]
function onCastSpell(creature, variant)

	-- We begin by loping through each of the protocols to cast each spell with the varying areas.
	for i = 1, #areasSmallTornadosAffected do

		-- For each protocol, we add the event to the multiple spells method, where we pass the delay
		-- of 340 * i (to get the right timing for the sequence), the creatures UID, as well as the
		-- variant, index, and which protocol is being called (big or small)
		addEvent(castMultipleSpells, 340 * i, creature.uid, variant, i, combatSmallProtocol)
        addEvent(castMultipleSpells, 340 * i, creature.uid, variant, i, combatBigProtocol)
	end

	-- Finally, we return the final protocol for the big tornados to ensure that the final graphic
	-- is visualized appropriately.
	return combatBigProtocol[9]:execute(creature, variant)
end
