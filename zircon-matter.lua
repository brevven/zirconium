-- Matter recipes for Krastorio2
if mods["Krastorio2"] then
local util = require("__bzzirconium__.data-util");

  util.k2matter({
    k2matter = {
      item_name = "zircon",
      matter_value = 6,
      energy_required = 1,
      need_stabilizer = false,
      unlocked_by_technology = "zirconium-matter-processing",
    },
    k2baseicon = "stone",
    icon = { icon = "__bzzirconium__/graphics/icons/zircon.png", icon_size = 64, scale = 1.25}
  })

  util.k2matter({
    k2matter = {
      item_name = "zirconia",
      minimum_conversion_quantity = 20,
      matter_value = 10,
      energy_required = 2,
      only_deconversion = true,
      need_stabilizer = true,
      unlocked_by_technology = "zirconium-matter-processing",
    },
  })

  util.k2matter({
    k2matter = {
      item_name = "zirconium-plate",
      matter_value = 17,
      energy_required = 2,
    only_deconversion = true,
      need_stabilizer = true,
      unlocked_by_technology = "zirconium-matter-processing",
    },
  })

end
