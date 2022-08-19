require("tech-updates")
require("zirconium-recipe-updates")
require("zircon-matter")
require("map-gen-preset-updates")
require("omni")
require("strange-matter")
require("zircon-rocks")


local util = require("data-util");

if mods.Asteroid_Mining then
  require("__Asteroid_Mining__.scripts.addmodule")
  if not data.raw.item["asteroid-titanium-ore"] then
    -- For Titanium we only add if it's not already added by Asteroid_Mining
    amfunc.addtype("titanium-ore", {a = 0,r = 40, g = 70, b =110})
  end
end
