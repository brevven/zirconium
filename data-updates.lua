require("tech-updates")
require("zirconium-recipe-updates")
require("zircon-matter")
require("map-gen-preset-updates")
require("omni")
require("strange-matter")

local util = require("data-util");

util.add_minable_result("simple-entity", "rock-huge", {name="zircon", amount_min = 15, amount_max=25})
util.add_minable_result("simple-entity", "sand-rock-big", {name="zircon", amount_min = 15, amount_max=25})
util.add_minable_result("simple-entity", "rock-big", {name="zircon", amount_min = 15, amount_max=25})
