local util = require("data-util");

if mods["space-age"] then
  -- Due to explosives changes, we have to make some changes to asteroid processing.
  --
  data:extend({
    {
      type = "recipe",
      name = "advanced-oxide-asteroid-crushing-zirc",
      localised_name = {"", {"recipe-name.advanced-oxide-asteroid-crushing"},": ", {"item-name.zirconia"}},
      icons = 
      {
        {icon="__space-age__/graphics/icons/advanced-oxide-asteroid-crushing.png", icon_size=64},
        {icon="__bzzirconium__/graphics/icons/zirconia.png", icon_size=128, scale=0.1875, shift={0,8}},
      },
      category = "crushing",
      subgroup="space-crushing",
      order = "f[advanced-oxide-asteroid-crushing]-z[zirconia]",
      auto_recycle = false,
      enabled = false,
      ingredients =
      {
        {type = "item", name = "oxide-asteroid-chunk", amount = 1}
      },
      energy_required = 5,
      results =
      {
        {type = "item", name = "ice", amount = 1},
        {type = "item", name = "calcite", amount = 1},
        {type = "item", name = "zirconia", amount = 3},
        {type = "item", name = "oxide-asteroid-chunk", amount = 1, probability = 0.05}
      },
      hide_from_signal_gui = false,
      allow_productivity = true,
      allow_decomposition = false
    },
  })
  util.add_unlock("advanced-asteroid-processing", "advanced-oxide-asteroid-crushing-zirc")
  util.add_to_productivity_research("asteroid-productivity", "advanced-oxide-asteroid-crushing-zirc")
end
