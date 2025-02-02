require("zirconium-recipe-final-stacking")
require("zirconium-recipe-final-rrr")

local util = require("data-util");

if mods["space-exploration"] then 
  -- core mining balancing
  util.add_to_product("se-core-fragment-omni", "zircon", -3)
end

if mods.bztitanium then
for i, entity in pairs(data.raw.furnace) do
  if entity.result_inventory_size ~= nil and entity.result_inventory_size < 2 and util.contains(entity.crafting_categories, "smelting") then
    entity.result_inventory_size = 2
  end
end
end

-- Make sure these don't exist, just in case
util.remove_raw("recipe", "stone-recycling")
util.remove_raw("recipe", "zircon-recycling")
