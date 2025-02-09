require("tech-updates")
require("zirconium-recipe-updates")
require("zirconium-asteroid-updates")
require("zircon-matter")
require("map-gen-preset-updates")
require("omni")
require("strange-matter")
require("zircon-rocks")
require("compatibility/crafting-efficiency")


local util = require("data-util");

if mods.Asteroid_Mining and not data.raw.item["asteroid-zircon"] then
  util.addtype("zircon", {a = 0,r = 110, g = 40, b =70})
end

if mods["any-planet-start"] then
  util.set_tech_recipe("zirconia-processing", {
    {"automation-science-pack", 1},
    {"logistic-science-pack", 1},
  })
  util.set_prerequisite("zirconia-processing", {"logistic-science-pack"})
end
util.redo_recycling()

util.add_shiftite_recipe("zirconia", {"gamma"}, 1)
