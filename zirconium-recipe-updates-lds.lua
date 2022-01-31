local util = require("data-util");

if util.me.cermet_lds() then
  util.add_prerequisite("low-density-structure", "cermet")

  if mods.Krastorio2 then
    util.add_ingredient("low-density-structure", "cermet", 5) 
  else
    util.add_ingredient("low-density-structure", "cermet", 10) 
  end

  if mods.bztitanium then
    util.remove_ingredient("low-density-structure", "copper-plate")
  elseif mods.bzaluminum then 
    -- do nothing, aluminum already added alloy
  elseif mods.Krastorio2 then
    util.set_ingredient("low-density-structure", "copper-plate", 5)
  else
    util.set_ingredient("low-density-structure", "copper-plate", 10)
  end

  util.remove_ingredient("low-density-structure", "steel-plate")
else
  if mods.Krastorio2 then
    util.replace_some_ingredient("low-density-structure", "copper-plate", 5, "zirconia", 5)
  else
    util.replace_some_ingredient("low-density-structure", "copper-plate", 10, "zirconia", 10)
  end
end

if mods["space-exploration"] then
  if util.me.cermet_lds() then
    util.replace_some_ingredient("se-aeroframe-scaffold", "se-aeroframe-pole", 1, "cermet", 2)
  else
    util.replace_some_ingredient("se-aeroframe-scaffold", "se-aeroframe-pole", 1, "zirconia", 2)
  end
end
