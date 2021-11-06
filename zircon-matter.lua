-- Matter recipes for Krastorio2
if mods["Krastorio2"] then
local util = require("__bzzirconium__.data-util");
local matter = require("__Krastorio2__/lib/public/data-stages/matter-util")

data:extend(
{
  {
    type = "technology",
    name = "zirconium-matter-processing",
    icons =
    {
      {
        icon = util.k2assets().."/technologies/matter-stone.png",
        icon_size = 256,
      },
      {
        icon = "__bzzirconium__/graphics/icons/zircon.png",
        icon_size = 64, icon_mipmaps = 3,
        scale = 1.25,
      }
    },
    prerequisites = {"kr-matter-processing"},
    unit =
  	{
      count = 350,
      ingredients =
      {
        {"production-science-pack", 1},
        {"utility-science-pack", 1},
        {"matter-tech-card", 1}
      },
      time = 45
    }
  },
})

local zircon_matter = 
	{
    item_name = "zircon",
    minimum_conversion_quantity = 10,
    matter_value = 6,
    energy_required = 1,
    need_stabilizer = false,
    unlocked_by_technology = "zirconium-matter-processing"
	}
matter.createMatterRecipe(zircon_matter)


local zirconia_matter = 
	{
    item_name = "zirconia",
    minimum_conversion_quantity = 20,
    matter_value = 10,
    energy_required = 2,
    only_deconversion = true,
    need_stabilizer = true,
    unlocked_by_technology = "zirconium-matter-processing"
	}
matter.createMatterRecipe(zirconia_matter)

local zirconium_plate_matter = 
	{
    item_name = "zirconium-plate",
    minimum_conversion_quantity = 10,
    matter_value = 17,
    energy_required = 2,
    only_deconversion = true,
    need_stabilizer = true,
    unlocked_by_technology = "zirconium-matter-processing"
	}
matter.createMatterRecipe(zirconium_plate_matter)

end
