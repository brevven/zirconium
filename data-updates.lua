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
  amfunc.addtype("zircon", {a = 0,r = 0.75,g = 0.4,b = 0.5})
end
