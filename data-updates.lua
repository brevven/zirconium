require("tech-updates")
require("zirconium-recipe-updates")
require("zircon-matter")
require("map-gen-preset-updates")
require("omni")
require("strange-matter")

local util = require("data-util");


-- Add zircon to rocks
local min = 15
local max = 23
if mods["space-exploration"] then
  min = 6
  max = 10
end
for _, e in pairs(data.raw["simple-entity"]) do
  if (e.subgroup == "grass" or e.subgroup == "wrecks") and e.name:match("rock%-") then
    util.add_minable_result("simple-entity", e.name, {name="zircon", amount_min = min, amount_max=max})
  end
end
