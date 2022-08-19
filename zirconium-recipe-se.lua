-- Additional recipes if Space Exploration mod is enabled
local util = require("__bzzirconium__.data-util");

if mods["space-exploration"] then
  se_delivery_cannon_recipes["zircon"] = {name= "zircon"}
  se_delivery_cannon_recipes["zirconia"] = {name= "zirconia"}
  se_delivery_cannon_recipes["zirconium-plate"] = {name= "zirconium-plate"}
  util.se_landfill({ore="zircon"})

if string.sub(mods["space-exploration"], 1, 3) == "0.6" then
  util.se_matter({ore="zircon", energy_required=1.5, quant_out=10, stream_out=60})
  data:extend({
  {
    type = "item-subgroup",
    name = "zirconium",
    group = "resources",
    order = "a-h-z-z",
  }
  })
  util.set_item_subgroup("zirconia", "zirconium")
  util.set_item_subgroup("zirconium-plate", "zirconium")
  data:extend({
  {
    type = "item",
    name = "zirconium-ingot",
    icons = {{icon = "__bzzirconium__/graphics/icons/zirconium-ingot.png", icon_size = 128}},
    order = "b-b",
    stack_size = 50,
    subgroup = "zirconium",
  },
  {
    type = "fluid",
    name = "molten-zirconium",
    default_temperature = 1852,
    max_temperature = 1852,
    base_color = {r=121, g=80, b=80},
    flow_color = {r=121, g=80, b=80},
    icons = {{icon = "__bzzirconium__/graphics/icons/molten-zirconium.png", icon_size = 128}},
    order = "a[molten]-a",
    pressure_to_speed_ratio = 0.4,
    flow_to_energy_ratio = 0.59,
    auto_barrel = false,
    subgroup = "fluid",
  },
  {
    type = "recipe",
    category = "smelting",
    name = "molten-zirconium",
    main_product = "molten-zirconium",
    subgroup = "zirconium",
    results = {
      {type = "fluid", name = "molten-zirconium", amount = mods.Krastorio2 and 750 or 900},
    },
    energy_required = 60,
    ingredients = {
      {name = "zirconia", amount = 24},
      {type = "fluid", name = "se-pyroflux", amount = 10},
    },
    enabled = false,
    always_show_made_in = true,
    allow_as_intermediate = false,
    order = "a-a"
  },
  {
    type = "recipe",
    name = "zirconium-ingot",
    category = "casting",
    results = {{"zirconium-ingot", 1}},
    energy_required = 75,
    ingredients = {
      {type = "fluid", name = "molten-zirconium", amount = 750},
    },
    enabled = false,
    always_show_made_in = true,
    allow_as_intermediate = false,
  },
  {
    type = "recipe",
    category = "crafting",
    name = "zirconium-ingot-to-plate",

    icons = {
      {icon = "__bzzirconium__/graphics/icons/zirconium-plate.png", icon_size = 128, icon_mipmaps = 3},
      {icon = "__bzzirconium__/graphics/icons/zirconium-ingot.png", icon_size = 128, scale = 0.125, shift = {-8, -8}},
    },
    results = {
      {name = "zirconium-plate", amount = 10},
    },
    energy_required = 5,
    ingredients = {
      {name = "zirconium-ingot", amount = 1}
    },
    enabled = false,
    always_show_made_in = true,
    allow_decomposition = false,
    order = "a-c-b"
  },
  })
  util.add_effect("se-pyroflux-smelting", {type = "unlock-recipe", recipe= "molten-zirconium"})
  util.add_effect("se-pyroflux-smelting", {type = "unlock-recipe", recipe= "zirconium-ingot"})
  util.add_effect("se-pyroflux-smelting", {type = "unlock-recipe", recipe= "zirconium-ingot-to-plate"})
  util.add_effect("se-vulcanite-smelting", {type = "unlock-recipe", recipe= "molten-zirconium"})
  util.add_effect("se-vulcanite-smelting", {type = "unlock-recipe", recipe= "zirconium-ingot"})
  util.add_effect("se-vulcanite-smelting", {type = "unlock-recipe", recipe= "zirconium-ingot-to-plate"})
  if mods["Krastorio2"] then
    util.set_item_subgroup("enriched-zircon", "zirconium")
    se_delivery_cannon_recipes["enriched-zirconium"] = {name= "enriched-zirconium"}
  end

else
  -- Organization
  data.raw.item["zirconia"].subgroup = "plates"
  data.raw.recipe["zirconia"].subgroup = "plates"
  data.raw.item["zirconium-plate"].subgroup = "plates"
  data.raw.recipe["zirconium-plate"].subgroup = "plates"

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
        { icon = "__bzzirconium__/graphics/icons/zirconia.png", icon_size = 128},
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
end
