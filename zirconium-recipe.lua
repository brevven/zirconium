-- Zirconium smelting, etc

local util = require("__bzzirconium__.data-util");

-- data:extend({
--   
-- })

data:extend({
  {
    type = "item",
    name = "zirconia",
    icon = "__bzzirconium__/graphics/icons/zirconia.png",
    icon_size = 128,
    subgroup = "raw-material",
    order = "z[zirconia]",
    stack_size = util.get_stack_size(200)
  },
  {
    type = "recipe",
    name = "zirconia",
    category = "smelting",
    subgroup = "raw-material",
    order = "z[zirconia]",
    icons = (mods["Krastorio2"] and
        {
          { icon = "__bzzirconium__/graphics/icons/zirconia.png", icon_size = 128 },
          { icon = "__bzzirconium__/graphics/icons/zircon.png", icon_size = 64,  scale=0.25, shift= {-8, -8}},
        } or {
          { icon = "__bzzirconium__/graphics/icons/zirconia.png", icon_size = 128,  },
        }
),
    normal = (mods["Krastorio2"] and
        {
          enabled = false,
          energy_required = 8,
          ingredients = {{"zircon", 5}},
          results = mods.bztitanium and  {
            {name="zirconia", amount_min=4, amount_max=5},
            {name="titanium-ore", amount=1, probability=.5}
          } or {{"zirconia", 5}}
        } or
        {
          enabled = false,
          energy_required = 3.2,
          ingredients = {{"zircon", 1}},
          results = mods.bztitanium and  {
            {name="zirconia", amount=2, probability=.95},
            {name="titanium-ore", amount=1, probability=.1}
          } or {{"zirconia", 2}}
        }),
    expensive =
    {
      enabled = false,
      energy_required = 3.2,
      ingredients = {{"zircon", 1}},
      results = mods.bztitanium and  {
        {"zirconia", 1}, {name="titanium-ore", amount=1, probability=.05}
        } or {{"zirconia", 2}}
    }
  },
  {
    type = "item",
    name = "zirconium-plate",
    icon = "__bzzirconium__/graphics/icons/zirconium-plate.png",
    icon_size = 128,
    subgroup = "raw-material",
    order = "d[zirconium-plate]",
    stack_size = util.get_stack_size(100)
  },
  {
    type = "recipe",
    name = "zirconium-plate",
    category = "smelting",
    subgroup = "raw-material",
    order = "d[zirconium-plate]",
    icons = (mods["Krastorio2"] and
        {
          { icon = "__bzzirconium__/graphics/icons/zirconium-plate.png", icon_size = 128 },
          { icon = "__bzzirconium__/graphics/icons/zirconia.png", icon_size = 128,  scale=0.125, shift= {-8, -8}},
        } or {
          { icon = "__bzzirconium__/graphics/icons/zirconium-plate.png", icon_size = 128,  },
        }
),
    normal = (mods["Krastorio2"] and
        {
          enabled = false,
          energy_required = 8,
          ingredients = {{"zirconia", 15}},
          result = "zirconium-plate",
          result_count = 5,
        } or
        {
          enabled = false,
          energy_required = 9.6,
          ingredients = {{"zirconia", 3}},
          result = "zirconium-plate",
          result_count = 1,
        }),
    expensive =
    {
      enabled = false,
      energy_required = 9.6,
      ingredients = {{"zirconia", 6}},
      result = "zirconium-plate",
    }
  },
  {
    type = "technology",
    name = "zirconia-processing",
    icon_size = 340,
    icon = "__bzzirconium__/graphics/technology/zirconia-processing.png",
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "zirconia"
      },
      {
        type =  "unlock-recipe",
        recipe = "zirconium-plate",
      },
    --   mods["TheBigFurnace"] and {
    --     type = "unlock-recipe",
    --     recipe = "big-zirconium-plate",
    --   } or nil,
    --   mods["TheBigFurnace"] and {
    --     type = "unlock-recipe",
    --     recipe = "big-zirconia",
    --   } or nil,
    },
    unit =
    {
      count = 75,
      ingredients = 
          {
            {"automation-science-pack", 1},
            {"logistic-science-pack", 1},
          },
      time = 30,
    },
    prerequisites = {"automation-2", (not mods.bzzirconium and "advanced-material-processing") or nil },
    order = "z"
  },
})

-- cermet only if setting enabled
if util.use_cermet() then
local cermet_i = {{"zirconia", 1}, {"copper-plate", 1}}
if mods.bztitanium then
  local tutil = require("__bztitanium__.data-util");
  table.insert(cermet_i, {tutil.titanium_plate, 1})
end
if mods.bzsilicon then
  table.insert(cermet_i, {"silica", 1})
end
data:extend({
  {
    type = "item",
    name = "cermet",
    icon = "__bzzirconium__/graphics/icons/cermet.png",
    icon_size = 128,
    subgroup = "intermediate-product",
    order = "z[cermet]",
    stack_size = util.get_stack_size(200)
  },
  {
    type = "recipe",
    name = "cermet",
    category = "crafting",
    subgroup = "intermediate-product",
    order = "z[zirconia]",
    icons = { { icon = "__bzzirconium__/graphics/icons/cermet.png", icon_size = 128,  } },
    enabled = false,
    energy_required = #cermet_i,
    ingredients = cermet_i,
    result = "cermet",
    result_count = #cermet_i,
  },
  {
    type = "technology",
    name = "cermet",
    icon_size = 512,
    icon = "__bzzirconium__/graphics/technology/cermet.png",
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "cermet"
      },
    },
    unit =
    {
      count = 100,
      ingredients = 
          {
            {"automation-science-pack", 1},
            {"logistic-science-pack", 1},
            {"chemical-science-pack", 1},
            {"production-science-pack", 1},
          },
      time = 30,
    },
    prerequisites = {"production-science-pack"},
    order = "c"
  },
})
end

-- sorting
data:extend({
  {
    type = "recipe",
    name = "sort-stone-zircon",
    category = "crafting",
    subgroup = "raw-resource",
    order = "bzz",
    icons = {
      { icon = "__bzzirconium__/graphics/icons/zircon.png", icon_size = 64 },
      { icon = "__base__/graphics/icons/stone.png", icon_size = 64,  scale=0.25, shift= {-8, -8}},
    },
    enabled = true,
    energy_required = 1,
    ingredients = {{"stone", 2}},
    results = {
      {type="item", name="zircon", amount=1, probability=.999999},
      {type="item", name="stone", amount=1, probability=0.5},
    }
  },
  {
    type = "recipe",
    name = "sort-zircon-stone",
    category = "crafting",
    subgroup = "raw-resource",
    order = "bzz",
    icons = {
      { icon = "__base__/graphics/icons/stone.png", icon_size = 64 },
      { icon = "__bzzirconium__/graphics/icons/zircon.png", icon_size = 64,  scale=0.25, shift= {-8, -8}},
    },
    enabled = true,
    energy_required = 1,
    ingredients = {{"zircon", 2}},
    results = {
      {type="item", name="stone", amount=1, probability=.999999},
      {type="item", name="zircon", amount=1, probability=0.5},
    }
  }
})

-- Zirconium Tungstate, only if needed
if mods.bztungsten and (mods["Krastorio2"] or mods["space-exploration"]) then
data:extend({
  {
    type = "item",
    name = "zirconium-tungstate",
    icons = {{icon = "__bzzirconium__/graphics/icons/zircon-powder.png",
              icon_size = 64, tint = {a=1, r=.95, g=.75, b=0}}},
    subgroup = "intermediate-product",
    order = "z[zz]",
    stack_size = util.get_stack_size(100)
  },
  {
    type = "recipe",
    name = "zirconium-tungstate",
    category = "crafting",
    subgroup = "intermediate-product",
    order = "z[zz]",
    enabled = false,
    energy_required = 2,
    ingredients = {{"zirconium-plate", 1}, {"tungsten-plate", 1},},
    result = "zirconium-tungstate",
    result_count = 2,
  },
})
util.add_effect("zirconia-processing", {
        type = "unlock-recipe",
        recipe = "zirconium-tungstate"
      })
end
