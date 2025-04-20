require("tech-updates")
require("zirconium-recipe-updates")
require("zirconium-asteroid-updates")
require("zircon-matter")
require("map-gen-preset-updates")
require("omni")
require("strange-matter")
require("zircon-rocks")


local util = require("data-util");

if mods.Asteroid_Mining and not data.raw.item["asteroid-zircon"] then
  util.addtype("zircon", {a = 0,r = 110, g = 40, b =70})
end

if mods["any-planet-start"] then
  if util.me.get_setting("aps-planet") == "vulcanus" then
    util.set_tech_trigger("zirconia-processing", {type="craft-item", item="stone-furnace"})
    util.add_unlock("zirconia-processing", "zirconium-sponge")
    util.remove_recipe_effect("zirconium-processing", "zirconium-sponge")
    util.add_prerequisite("foundry", "zirconia-processing")
  else
    util.set_tech_recipe("zirconia-processing", {
      {"automation-science-pack", 1},
      {"logistic-science-pack", 1},
    })
    util.set_prerequisite("zirconia-processing", {"logistic-science-pack"})
  end
end
util.redo_recycling()

util.add_shiftite_recipe("zirconia", {"gamma"}, 1)
