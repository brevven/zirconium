local util = require("data-util")

if mods["space-age"] then
if not data.raw.recipe["stone-from-lava"] then
  data:extend({
  {
    type = "recipe",
    name = "stone-from-lava",
    icons = {
     {icon = "__space-age__/graphics/icons/fluid/lava.png", icon_size=64, shift={0,-8}},
     {icon = "__base__/graphics/icons/stone.png", icon_size=64, scale = 0.333, shift={0,8}},
    },
    category = "metallurgy",
    subgroup = "vulcanus-processes",
    order = "a[melting]-a[lava-a]",
    auto_recycle = false,
    enabled = false,
    ingredients =
    {
      {type = "item", name = "calcite", amount = 1},
      {type = "fluid", name = "lava", amount = 500},
      {type = "fluid", name = "water", amount = 250},
    },
    energy_required = 16,
    results =
    {
      {type = "item", name = "stone", amount = 25},
    },
    allow_productivity = true
  },
  })
  util.add_unlock("foundry", "stone-from-lava")
end

-- Any stone byproduct from lava is part stone, part zircon
for _, recipe in pairs(data.raw.recipe) do
  if recipe.category == "metallurgy" and recipe.name:find("from.lava") then
    local amount = util.get_amount(recipe.name, "stone")
    if amount then
      util.replace_some_product(recipe.name, "stone", amount / 2, "zircon", amount / 2) 
      log(amount.." Did "..recipe.name)
    end
  end
end

end
