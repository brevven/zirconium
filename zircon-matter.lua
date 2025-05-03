-- Matter recipes for Krastorio2
local util = require("__bzzirconium__.data-util");
if util.k2() then

  util.k2matter({
    k2matter = {
      material = {
        name = "zircon",
        type = "item",
        amount = 10,
      },
      matter_count = 6,
      energy_required = 1,
      needs_stabilizer = false,
      unlocked_by = "zirconium-matter-processing",
    },
    k2baseicon = "stone",
    icon = { icon = "__bzzirconium__/graphics/icons/zircon.png", icon_size = 128, scale = 0.5}
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
      only_deconversion = true,
      unlocked_by = "zirconium-matter-processing",
    },
  }, true)

  util.k2matter({
    k2matter = {
      material = {
        name = "zirconium-plate",
        type = "item",
        amount = 10,
      },
      matter_count = 17,
      energy_required = 2,
      needs_stabilizer = true,
      only_deconversion = true,
      unlocked_by = "zirconium-matter-processing",
    },
  })

end
