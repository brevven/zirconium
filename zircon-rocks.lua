local util = require("data-util");

-- Add zircon to rocks
local min = 9
local max = 11
if mods["alien-biomes"] then
  min = 5
  max = 7
end
for _, e in pairs(data.raw["simple-entity"]) do
  if (e.subgroup == "grass" or e.subgroup == "wrecks") and e.name:match("rock%-") then
    local adjusted_max = e.name:match("huge") and max * 2 or max
    local adjusted_min = e.name:match("huge") and min * 2 or min
    util.add_minable_result("simple-entity", e.name, {name="zircon", amount_min=adjusted_min, amount_max=adjusted_max})
  end
end

-- Add zircon to poppable rock recipes

-- K2
util.add_ingredient("rock-big", "zircon", 15)
util.add_ingredient("rock-huge", "zircon", 30)

-- Dectorio
util.add_ingredient("dect-base-rock-big", "zircon", 15)
util.add_ingredient("dect-base-sand-rock-big", "zircon", 15)
util.add_ingredient("dect-base-rock-huge", "zircon", 30)
