require("zirconium-recipe-final-stacking")
require("zirconium-recipe-final-rrr")

local util = require("data-util");

if mods["space-exploration"] then 
  -- core mining balancing
  util.add_to_product("se-core-fragment-omni", "zircon", -3)
end

if mods.bztitanium then
  if util.me.byproduct() then
    -- If furnaces are treated as furnaces, we need 2 outputs
    util.set_minimum_furnace_outputs("smelting", 2)
  end
end

-- Make sure these don't exist, just in case
util.remove_raw("recipe", "stone-recycling")
util.remove_raw("recipe", "zircon-recycling")
