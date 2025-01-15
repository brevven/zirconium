local util = require("data-util");

util.add_hot_metals({
  {name="zirconium-plate", icons={
    { icon = "__bzzirconium__/graphics/icons/zirconium-plate.png", icon_size = 128},
    { icon = "__bzzirconium__/graphics/icons/zirconium-plate.png", icon_size = 128, tint={.9,.3,0, .5}},
  }},
  {name="zircaloy-4", icons={
    { icon = "__bzzirconium__/graphics/icons/zircaloy-4.png", icon_size = 128},
    { icon = "__bzzirconium__/graphics/icons/zircaloy-4.png", icon_size = 128, tint={.9,.3,0, .5}},
  }},

})

if HotMetals then
  table.insert(HotMetals.craftingCategories, "basic-metallurgy")
end
