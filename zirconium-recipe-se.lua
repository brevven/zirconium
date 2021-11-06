-- Additional recipes if Space Exploration mod is enabled
local util = require("__bzzirconium__.data-util");

if mods["space-exploration"] then
  se_delivery_cannon_recipes["zircon"] = {name= "zircon"}
  se_delivery_cannon_recipes["zirconia"] = {name= "zirconia"}
  se_delivery_cannon_recipes["zirconium-plate"] = {name= "zirconium-plate"}

  data:extend({
  {
    type = "recipe",
    icons = {
      { icon = "__base__/graphics/icons/landfill.png", icon_size = 64, icon_mipmaps = 3 },
      { icon = "__bzzirconium__/graphics/icons/zircon.png", icon_size = 64, scale = 0.25},
    },
    name = "landfill-zircon",
    category = "hard-recycling",
    order = "z-b-zircon",
    subgroup = "terrain",
    result = "landfill",
    ingredients = {{"zircon", 50}},
  }
  })

  if mods["Krastorio2"] then
    data:extend({
    {
      type = "recipe",
      name = "enriched-zirconia-smelting-vulcanite",
      category = "smelting",
      order = "z[zirconium-plate]",
      energy_required = 24,
      enabled = false,
      always_show_made_in = true,
      allow_as_intermediate = false,
      ingredients = {
        {name = "enriched-zircon", amount = 8},
        {name = "se-vulcanite-block", amount = 1},
      },
      results = {
        {name = "zirconia", amount = 24},
      },
      icons =
      {
        { icon = "__bzzirconium__/graphics/icons/zirconia.png", icon_size = 128, icon_mipmaps = 3 },
        { icon = "__space-exploration-graphics__/graphics/icons/vulcanite-block.png", icon_size = 64, scale=0.25, shift= {-10, -10}},
      },
    },
    })
    table.insert(data.raw.technology["se-processing-vulcanite"].effects, 
        {type = "unlock-recipe", recipe= "enriched-zirconia-smelting-vulcanite"})
    data.raw.recipe["enriched-zircon"].order= "d[zircon]"
    se_delivery_cannon_recipes["enriched-zircon"] = {name= "enriched-zircon"}
  else
    data:extend({
    {
      type = "recipe",
      name = "zircon-smelting-vulcanite",
      category = "smelting",
      order = "z[zirconium-plate]",
      energy_required = 16,
      enabled = false,
      always_show_made_in = true,
      allow_as_intermediate = false,
      ingredients = {
        {name = "zircon", amount = 8},
        {name = "se-vulcanite-block", amount = 1},
      },
      results = {
        {name = "zirconia", amount = 24},
      },
      icons =
      {
        { icon = "__bzzirconium__/graphics/icons/zirconia.png", icon_size = 128, icon_mipmaps = 3,},
        { icon = "__space-exploration-graphics__/graphics/icons/vulcanite-block.png", icon_size = 64, scale=0.25, shift= {-10, -10}},
      },
    }})
    util.add_effect("se-processing-vulcanite", {type = "unlock-recipe", recipe= "zircon-smelting-vulcanite"})
  end
  data:extend({
    {
      type = "recipe",
      name = "zirconia-smelting-vulcanite",
      category = "smelting",
      order = "z[zirconium-plate]",
      energy_required = 16,
      enabled = false,
      always_show_made_in = true,
      allow_as_intermediate = false,
      ingredients = {
        {name = "zirconia", amount = 24},
        {name = "se-vulcanite-block", amount = 1},
      },
      results = {
        {name = "zirconium-plate", amount = 12},
      },
      icons =
      {
        { icon = "__bzzirconium__/graphics/icons/zirconium-plate.png", icon_size = 128, icon_mipmaps = 3,},
        { icon = "__space-exploration-graphics__/graphics/icons/vulcanite-block.png", icon_size = 64, scale=0.25, shift= {-10, -10}},
      },
    },
    })
  util.add_effect("se-processing-vulcanite", {type = "unlock-recipe", recipe= "zirconia-smelting-vulcanite"})
end
