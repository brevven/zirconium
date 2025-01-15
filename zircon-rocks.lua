local util = require("data-util");


-- Add zircon to rocks
local min = 1
local max = 5
if util.me.early() then
  min = 7
  max = 15
end
for _, e in pairs(data.raw["simple-entity"]) do
  if (e.subgroup == "grass" or e.subgroup == "wrecks") and e.name:match("rock") then
    local adjusted_max = e.name:match("huge") and max * 2 or max
    local adjusted_min = e.name:match("huge") and min * 2 or min
    util.add_minable_result("simple-entity", e.name, {type="item", name="zircon", amount_min=adjusted_min, amount_max=adjusted_max})
  end
end

-- Add zirconia to stomper shells
min = 1
max = 10
for _, e in pairs(data.raw["simple-entity"]) do
  if (e.subgroup == "grass") and e.name:match("shell") then
    util.add_minable_result("simple-entity", e.name, {type="item", name="zirconia", amount_min=min, amount_max=max})
  end
end

-- Add zircon to ploppable rock recipes

-- K2
util.add_ingredient("rock-big", "zircon", 15)
util.add_ingredient("rock-huge", "zircon", 30)

-- Dectorio
util.add_ingredient("dect-base-rock-big", "zircon", 15)
util.add_ingredient("dect-base-sand-rock-big", "zircon", 15)
util.add_ingredient("dect-base-rock-huge", "zircon", 30)

-- Do this last so we don't further modify it with the above
util.add_gleba_rock("zircon")
