require("tech-updates")
require("zirconium-recipe-updates")
require("zircon-matter")
require("map-gen-preset-updates")
require("omni")
require("strange-matter")
require("zircon-rocks")
require("compatibility/crafting-efficiency")


local util = require("data-util");

if mods.Asteroid_Mining then
  require("__Asteroid_Mining__.scripts.addmodule")
  if not data.raw.item["asteroid-zircon"] then
    -- For Zirconium we only add if it's not already added by Asteroid_Mining
    amfunc.addtype("zircon", {a = 0,r = 110, g = 40, b =70})
  end
end
