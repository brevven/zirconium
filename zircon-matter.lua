-- Matter recipes for Krastorio2
if mods["Krastorio2"] then
  local util = require("__bzzirconium__.data-util");

  util.k2matter({
    k2matter = {
      material = {
        name = "zircon",
        type = "item"
      },
      matter_count = 6,
      energy_required = 1,
      needs_stabilizer = false,
      unlocked_by = "zirconium-matter-processing",
    },
    k2baseicon = "stone",
    icon = { icon = "__bzzirconium__/graphics/icons/zircon.png", icon_size = 64, scale = 1.25}
  }, false)

  util.k2matter({
    k2matter = {
      material = {
        name = "zirconia",
        type = "item",
        amount = 20,
      },
      matter_count = 10,
      energy_required = 2,
      needs_stabilizer = true,
      unlocked_by = "zirconium-matter-processing",
    },
  }, true)

  util.k2matter({
    k2matter = {
      material = {
        name = "zirconium-plate",
        type = "item",
      },
      matter_count = 17,
      energy_required = 2,
      needs_stabilizer = true,
      unlocked_by = "zirconium-matter-processing",
    },
  }, true)

end
