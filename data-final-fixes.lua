require("modules")
require("zirconium-recipe-updates-lds")
require("zirconium-recipe-final-stacking")
require("zirconium-recipe-final-rrr")

local util = require("data-util");

if mods["space-exploration"] then 
  -- Organization
  data.raw.item["zirconia"].subgroup = "plates"
  data.raw.recipe["zirconia"].subgroup = "plates"
  data.raw.item["zirconium-plate"].subgroup = "plates"
  data.raw.recipe["zirconium-plate"].subgroup = "plates"

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
