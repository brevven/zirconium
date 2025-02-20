-- Zirconium smelting, etc

local util = require("data-util");

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
    weight = 1*kg,
    stack_size = util.get_stack_size(200)
  },
  {
    type = "recipe",
    name = "zirconia",
    subgroup = "raw-material",
    category = "smelting",
    allow_productivity = true,
    order = "z[zirconia]",
    icons = (mods["Krastorio2"] and
        {
          { icon = "__bzzirconium__/graphics/icons/zirconia.png", icon_size = 128 },
          { icon = "__bzzirconium__/graphics/icons/zircon.png", icon_size = 128,  scale=0.25, shift= {-8, -8}},
        } or {
          { icon = "__bzzirconium__/graphics/icons/zirconia.png", icon_size = 128,  },
        }
),
     -- (mods["Krastorio2"] and
     --    {
     --      main_product = "zirconia",
     --      enabled = false,
     --      energy_required = 8,
     --      ingredients = {util.item("zircon", 5)},
     --      results = mods.bztitanium and util.me.byproduct() and {
     --        {name="zirconia", amount_min=4, amount_max=5},
     --        {name="titanium-ore", amount=1, probability=.5}
     --      } or {util.item("zirconia", 5)}
     --    } or
    main_product = "zirconia",
    enabled = false,
    energy_required = 6.4,
    ingredients = {util.item("zircon", 1)},
    results = mods.bztitanium and util.me.byproduct() and {
      {type="item", name="zirconia", amount=2, probability=.95},
      {type="item", name="titanium-ore", amount=1, probability=.1}
    } or {util.item("zirconia", 2)}
    -- expensive =
    -- {
    --   main_product = "zirconia",
    --   enabled = false,
    --   energy_required = 3.2,
    --   ingredients = {util.item("zircon", 1)},
    --   results = mods.bztitanium and util.me.byproduct() and {
    --     util.item("zirconia", 1), {name="titanium-ore", amount=1, probability=.05}
    --     } or {util.item("zirconia", 2)}
    -- }
  },
  {
    type = "item",
    name = "zirconium-sponge",
    icon = "__bzzirconium__/graphics/icons/zirconium-sponge.png",
    icon_size = 128,
    pictures = {
      {filename = "__bzzirconium__/graphics/icons/zirconium-sponge.png",   size=128, scale=0.25},
      {filename = "__bzzirconium__/graphics/icons/zirconium-sponge-1.png", size=128, scale=0.25},
      {filename = "__bzzirconium__/graphics/icons/zirconium-sponge-2.png", size=128, scale=0.25},
    },
    subgroup = "raw-material",
    order = "z[zirconia]",
    weight = 1*kg,
    stack_size = util.get_stack_size(50)
  },
  {
    type = "recipe",
    name = "zirconium-sponge",
    main_product = "zirconium-sponge",
    subgroup = "raw-material",
    category = "chemistry",
    allow_productivity = true,
    order = "z[zirconia]",
    energy_required = 1.6,
    enabled = false,
    auto_recycle = false,
    ingredients = {util.item("zirconia", 1), util.fluid("sulfuric-acid", 5)},
    results = {util.item("zirconium-sponge", 1)},
  },
  {
    type = "item",
    name = "zirconium-plate",
    icon = "__bzzirconium__/graphics/icons/zirconium-plate.png",
    icon_size = 128,
    subgroup = "raw-material",
    order = "d[zirconium-plate]",
    weight = 1*kg,
    stack_size = util.get_stack_size(100)
  },
  {
    type = "recipe",
    name = "zirconium-plate",
    category = "smelting",
    allow_productivity = true,
    subgroup = "raw-material",
    auto_recycle = false,
    order = "d[zirconium-plate]",
    icons = (mods["Krastorio2"] and
        {
          { icon = "__bzzirconium__/graphics/icons/zirconium-plate.png", icon_size = 128 },
          { icon = "__bzzirconium__/graphics/icons/zirconia.png", icon_size = 128,  scale=0.125, shift= {-8, -8}},
        } or {
          { icon = "__bzzirconium__/graphics/icons/zirconium-plate.png", icon_size = 128,  },
        }
),
    -- (mods["Krastorio2"] and
    --    {
    --      enabled = false,
    --      energy_required = 8,
    --      ingredients = {util.item("zirconia", 15)},
    --      results = {util.item("zirconium-plate", 5)},
    --    } or
    enabled = false,
    energy_required = 3.2,
    ingredients = {util.item("zirconium-sponge", 1)},
    results = {util.item("zirconium-plate", 1)},
    -- expensive =
    -- {
    --   enabled = false,
    --   energy_required = 9.6,
    --   ingredients = {util.item("zirconia", 6)},
    --   result = "zirconium-plate",
    -- }
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
    },
    research_trigger = {type="mine-entity", entity="zircon"},
    order = "z"
  },
  {
    type = "technology",
    name = "zirconium-processing",
    icon_size = 128,
    icon = "__bzzirconium__/graphics/icons/zirconium-plate.png",
    effects =
    {
      {
        type =  "unlock-recipe",
        recipe = "zirconium-sponge",
      },
      {
        type =  "unlock-recipe",
        recipe = "zirconium-plate",
      },
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
    prerequisites = {"zirconia-processing", "sulfur-processing"},
    order = "z"
  },
})

-- cermet only if setting enabled
if util.me.use_cermet() then
local cermet_i = {util.item("zirconia", 2), util.item("copper-plate", 1)}
if mods.bztitanium then
  local tme = require("__bztitanium__.me");
  table.insert(cermet_i, util.item(tme.titanium_plate, 1))
end
if mods.bzsilicon then
  table.insert(cermet_i, util.item("silica", 1))
end
if mods.bzaluminum then
  table.insert(cermet_i, util.item("alumina", 1))
end
data:extend({
  {
    type = "item",
    name = "cermet",
    icon = "__bzzirconium__/graphics/icons/cermet.png",
    icon_size = 128,
    pictures = {
      {filename = "__bzzirconium__/graphics/icons/cermet.png",   size=128, scale=0.125},
      {filename = "__bzzirconium__/graphics/icons/cermet-1.png", size=128, scale=0.125},
      {filename = "__bzzirconium__/graphics/icons/cermet-2.png", size=128, scale=0.125},
      {filename = "__bzzirconium__/graphics/icons/cermet-3.png", size=128, scale=0.125},
      {filename = "__bzzirconium__/graphics/icons/cermet-4.png", size=128, scale=0.125},
    },
    subgroup = "intermediate-product",
    order = "z[cermet]",
    weight = 0.5*kg,
    stack_size = util.get_stack_size(200)
  },
  {
    type = "recipe",
    name = "cermet",
    category = "crafting",
    subgroup = "intermediate-product",
    allow_productivity = true,
    auto_recycle = false,
    order = "z[zirconia]",
    icons = { { icon = "__bzzirconium__/graphics/icons/cermet.png", icon_size = 128,  } },
    enabled = false,
    energy_required = #cermet_i + 1,
    ingredients = cermet_i,
    results = {util.item("cermet", #cermet_i + 1)},
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
          },
      time = 30,
    },
    prerequisites = {"zirconia-processing"},
    order = "c"
  },
})
if mods.bztitanium then
  util.add_prerequisite("cermet", util.titanium_processing)
end
end

-- sorting
if util.me.enable_sorting() or mods.quality then
data:extend({
  {
    type = "recipe",
    name = "sort-stone-zircon",
    category = mods["quality"] and "recycling-or-hand-crafting" or "crafting",
    subgroup = "raw-resource",
    order = "bzz",
    icons = {
      { icon = "__bzzirconium__/graphics/icons/zircon.png", icon_size=128, scale=0.25, shift={4,4}},
      { icon = "__base__/graphics/icons/stone.png",         icon_size=64, scale=0.25, shift={-4,-4}},
    },
    enabled = not mods.quality,
    energy_required = 1,
    allow_decomposition = false,
    ingredients = {util.item("stone", 2)},
    results = {
      {type="item", name="zircon", amount=1},
      {type="item", name="stone", amount=1, probability=0.5},
    }
  },
  {
    type = "recipe",
    name = "sort-zircon-stone",
    category = mods["quality"] and "recycling-or-hand-crafting" or "crafting",
    subgroup = "raw-resource",
    order = "bzz",
    icons = {
      { icon = "__base__/graphics/icons/stone.png",         icon_size=64, scale=0.5, shift={4,4} },
      { icon = "__bzzirconium__/graphics/icons/zircon.png", icon_size=128, scale=0.125, shift={-4,-4}},
    },
    enabled = not mods.quality,
    energy_required = 1,
    allow_decomposition = false,
    ingredients = {util.item("zircon", 2)},
    results = {
      {type="item", name="stone", amount=1},
      {type="item", name="zircon", amount=1, probability=0.5},
    }
  }
})
util.add_unlock("recycling", "sort-zircon-stone")
util.add_unlock("recycling", "sort-stone-zircon")
if mods.lignumis then
  util.set_enabled("sort-zircon-stone", true)
  util.set_enabled("sort-stone-zircon", true)
end
end

if mods["space-age"] then
-- Gleba
local synth_i = "stone"
if mods.bzsilicon then
  synth_i = "silica"
elseif data.raw.item["sand"] then
  synth_i = "sand"
end
data:extend({
  {
    type = "recipe",
    name = "zircon-synthesis",
    category = "organic",
    subgroup = "raw-material",
    order = "z[zircon]",
    icons = {
      { icon = "__bzzirconium__/graphics/icons/zircon.png", icon_size=128},
      { icon = "__bzzirconium__/graphics/icons/zirconium-sponge.png", icon_size=128, scale=0.25, shift={-8,-8}},
    },
    enabled = false,
    energy_required = 10,
    allow_decomposition = false,
    ingredients = {
      util.item("zirconium-sponge", 1),
      util.item(synth_i, 1),
    },
    results = {util.item("zircon", 1)},
  },
  {
    type = "recipe",
    name = "zirconia-from-egg",
    localised_name = {"item-name.zirconia"},
    category = "organic",
    subgroup = "raw-material",
    order = "z[zircon]",
    icons = {
      { icon = "__bzzirconium__/graphics/icons/zirconia.png", icon_size=128},
      { icon = "__space-age__/graphics/icons/pentapod-egg.png", icon_size=64, scale=0.25, shift={-4,-4}},
    },
    enabled = false,
    energy_required = 6,
    allow_decomposition = false,
    ingredients = {
      util.item("pentapod-egg", 1),
    },
    results = {util.item("zirconia", 3)},
  },
})
util.add_unlock("biochamber", "zircon-synthesis")
util.add_unlock("biochamber", "zirconia-from-egg")

-- Vulcanus
util.add_vacuum()
data:extend({
  {
    type = "recipe",
    name = "zirconium-in-foundry",
    localised_name = {"item-name.zirconium-plate"},
    category = "metallurgy",
    allow_productivity = true,
    subgroup = "vulcanus-processes",
    order = "d[zirconium-plate]",
    icons ={{ icon = "__bzzirconium__/graphics/icons/zirconium-plate.png", icon_size = 128}},
    enabled = false,
    energy_required = 3.2,
    ingredients = {util.item("zirconium-sponge", 1), util.fluid("vacuum")},
    results = {util.item("zirconium-plate", 1)},
  },
  {
    type = "recipe",
    name = "zirconium-gettering",
    main_product = "vacuum",
    category = "chemistry",
    subgroup = "vulcanus-processes",
    order = "d[zirconium-gettering]",
    icons = {
          util.vacuum_icon,
          { icon = "__bzzirconium__/graphics/icons/zirconium-sponge.png", icon_size = 128, scale=0.125, shift = {-8, -8}},
        },
    enabled = false,
    allow_productivity = true,
    energy_required = 5, 
    ingredients = {util.item("zirconium-sponge")},
    results = {
      util.fluid("vacuum", 100),
      util.item("stone", 1),
    },
    show_amount_in_title = false,
  },
})
util.add_unlock("foundry", "zirconium-in-foundry")
util.add_unlock("foundry", "zirconium-gettering")
end

-- Zirconium Tungstate, only if needed
if mods["space-age"] or (mods.bztungsten and (mods["Krastorio2"] or mods["space-exploration"])) then
data:extend({
  {
    type = "item",
    name = "zirconium-tungstate",
    icons = {{icon = "__bzzirconium__/graphics/icons/zircon-powder.png",
              icon_size = 64, tint = {a=1, r=.95, g=.75, b=0}}},
    subgroup = "intermediate-product",
    order = "z[zz]",
    weight = 2*kg,
    stack_size = util.get_stack_size(100)
  },
  {
    type = "recipe",
    name = "zirconium-tungstate",
    category = "chemistry",
    subgroup = "intermediate-product",
    allow_productivity = true,
    order = "z[zz]",
    enabled = false,
    energy_required = 2,
    ingredients = {util.item("zirconium-plate", 1), util.item("tungsten-plate", 1),},
    results = {util.item("zirconium-tungstate", 2)},
  },
})
if mods["space-age"] then
  util.add_effect("tungsten-steel", { type = "unlock-recipe", recipe = "zirconium-tungstate" })
else
  util.add_effect("zirconia-processing", { type = "unlock-recipe", recipe = "zirconium-tungstate" })
end
end

-- Zircaloy-4 only if needed
if mods.bztin then
require("basic-foundry")
local zircaloyi = {
  util.item("zirconium-sponge", 17),
  util.item("tin-plate", 2),
  util.item("iron-plate", 1),
}
data:extend({
  {
    type = "item",
    name = "zircaloy-4",
    icons = {{icon = "__bzzirconium__/graphics/icons/zircaloy-4.png", icon_size = 128}},
    subgroup = "intermediate-product",
    order = "z[zz]",
    weight = 5*kg,
    stack_size = util.get_stack_size(100),
  },
  {
    type = "recipe",
    name = "zircaloy-4",
    category = mods["space-age"] and "basic-metallurgy" or "advanced-crafting",
    allow_productivity = true,
    auto_recycle = false,
    order = "z[zz]",
    enabled = false,
    energy_required = 60,
    ingredients = zircaloyi,
    results = {util.item("zircaloy-4", 20)},
  },
})
util.add_effect("advanced-material-processing-2", { type = "unlock-recipe", recipe = "zircaloy-4" })
end
