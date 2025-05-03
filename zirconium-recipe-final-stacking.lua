-- Deadlock stacking recipes

local util = require("__bzzirconium__.data-util");

if deadlock and deadlock["add_stack"] then
  deadlock.add_stack("zircon",  "__bzzirconium__/graphics/icons/stacked/zircon-stacked.png", "deadlock-stacking-1", 64)
  deadlock.add_stack("zirconia",  "__bzzirconium__/graphics/icons/stacked/zirconia-stacked.png", "deadlock-stacking-2", 128)
  deadlock.add_stack("zirconium-plate", "__bzzirconium__/graphics/icons/stacked/zirconium-plate-stacked.png" , "deadlock-stacking-2", 128)
  if util.me.use_cermet() then
    deadlock.add_stack("cermet",  "__bzzirconium__/graphics/icons/stacked/cermet-stacked.png", "deadlock-stacking-2", 128)
  end
  if util.k2() then
    deadlock.add_stack("enriched-zircon", "__bzzirconium__/graphics/icons/stacked/enriched-zircon-stacked.png" , "deadlock-stacking-2", 128)
  end
  if util.k2() or mods["space-exploration"] then
    deadlock.add_stack("zirconium-tungstate", nil, "deadlock-stacking-2", 64)
  end
  if mods["space-exploration"] then
    deadlock.add_stack("zirconium-ingot", nil, "deadlock-stacking-2", nil)
  end
end

-- Deadlock crating recipes
if deadlock_crating then
  deadlock_crating.add_crate("zircon", "deadlock-crating-1")
  deadlock_crating.add_crate("zirconia", "deadlock-crating-2")
  deadlock_crating.add_crate("zirconium-plate", "deadlock-crating-2")
  if util.me.use_cermet() then
    deadlock_crating.add_crate("cermet", "deadlock-crating-2")
  end
  if util.k2() then
    deadlock_crating.add_crate("enriched-zircon", "deadlock-crating-2")
  end
  if util.k2() or mods["space-exploration"] then
    deadlock_crating.add_crate("zirconium-tungstate", "deadlock-crating-2")
  end
  if mods["space-exploration"] then
    deadlock_crating.add_crate("zirconium-ingot", "deadlock-crating-2")
  end
end

