local resource_autoplace = require('resource-autoplace');
local noise = require('noise');

local util = require("data-util");

data:extend({
	{
    type = "autoplace-control",
    category = "resource",
    name = "zircon",
    richness = true,
    order = "b-e"
	},
	{
    type = "noise-layer",
    name = "zircon"
	},
	{
    type = "resource",
    icon_size = 64, icon_mipmaps = 3,
    name = "zircon",
    icon = "__bzzirconium__/graphics/icons/zircon.png",
    flags = {"placeable-neutral"},
    order="a-b-a",
    map_color = {r=0.90, g=0.70, b=0.70},
    tree_removal_probability = 0.7,
    tree_removal_max_distance = 32 * 32,
    minable =
    {
      hardness = 1,
      mining_particle = "zircon-particle",
      mining_time = 1.5,
      result = "zircon"
    },
    collision_box = {{ -0.1, -0.1}, {0.1, 0.1}},
    selection_box = {{ -0.5, -0.5}, {0.5, 0.5}},

    autoplace = resource_autoplace.resource_autoplace_settings{
      name = "zircon",
      order = "b-z",
      base_density = 4,
      has_starting_area_placement = true,
      regular_rq_factor_multiplier = 1.2,
      starting_rq_factor_multiplier = 1.2,
    },

    stage_counts = {15000, 9500, 5500, 2900, 1300, 400, 150, 80},
        stages =
        {
          sheet =
          {
      filename = "__bzzirconium__/graphics/entity/ores/hr-zircon.png",
      priority = "extra-high",
      size = 128,
      frame_count = 8,
      variation_count = 8,
      scale = 0.5
          }
    },
  },
  {
      type = "item",
      name = "zircon",
      icon_size = 64, icon_mipmaps = 3,
      icon = "__bzzirconium__/graphics/icons/zircon.png",
      pictures = {
        {filename="__bzzirconium__/graphics/icons/zircon.png", size=64, scale=0.25},
        {filename="__bzzirconium__/graphics/icons/zircon-2.png", size=64, scale=0.25},
        {filename="__bzzirconium__/graphics/icons/zircon-3.png", size=64, scale=0.25},
        {filename="__bzzirconium__/graphics/icons/zircon-4.png", size=64, scale=0.25},
      },
      subgroup = "raw-resource",
      order = "t-c-a",
      stack_size = util.get_stack_size(50)
  },
})

local richness = data.raw.resource["zircon"].autoplace.richness_expression  

-- Modify zircon autoplace richness: 
-- After 500 tiles it's standard
-- Up to 500 tiles, it scales up
data.raw.resource["zircon"].autoplace.richness_expression = 
  richness * noise.if_else_chain(
      noise.less_than(noise.distance_from(noise.var("x"), noise.var("y"), noise.var("starting_positions")), noise.to_noise_expression(500)),
      (noise.distance_from(noise.var("x"), noise.var("y"), noise.var("starting_positions")) + 25)/525,
      1)
