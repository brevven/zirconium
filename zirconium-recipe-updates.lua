local util = require("__bzzirconium__.data-util");


util.replace_some_ingredient("stone-furnace", "stone", 1, "zircon", 1)
if not mods["Krastorio2"] then
  util.replace_some_ingredient("steel-furnace", "stone-brick", 4, "zircon", 6)
end

if mods["Krastorio2"] then
  util.replace_some_ingredient("low-density-structure", "copper-plate", 5, "zirconia", 5)
else
  util.replace_some_ingredient("low-density-structure", "copper-plate", 10, "zirconia", 10)
end
util.add_ingredient("electric-furnace", "zirconia", 5)

util.add_ingredient("explosives", "zirconium-plate", 1)
util.add_ingredient("nuclear-reactor", "zirconium-plate", 100)

local ufc_amt = mods["Krastorio2"] and 1 or 5
if mods.bzlead then
  util.replace_some_ingredient("uranium-fuel-cell", "lead-plate", 5, "zirconium-plate", ufc_amt) 
else
  util.replace_some_ingredient("uranium-fuel-cell", "iron-plate", 5, "zirconium-plate", ufc_amt) 
end

if not mods.bztungsten then
  util.add_ingredient("nuclear-fuel", "zirconium-plate", 1)
end


if util.use_cermet() then
  util.add_ingredient("rocket-control-unit", "cermet", 1)
  util.add_ingredient("speed-module-3", "cermet", 1)
  util.add_ingredient("productivity-module-3", "cermet", 1)
  util.add_ingredient("effectivity-module-3", "cermet", 1)
  util.add_ingredient("assembling-machine-3", "cermet", 2)
  util.add_ingredient("beacon", "cermet", 10)
  util.add_ingredient("spidertron", "cermet", 8)
end

-- Krastorio2
if mods["Krastorio2"] then

  util.replace_some_ingredient("matter-stabilizer", "imersium-plate", 1, "zirconium-plate", 5)
  util.add_ingredient("kr-advanced-furnace", "zirconia", 60)
  if util.use_cermet() then
    util.add_ingredient("ai-core", "cermet", 2)
    util.add_ingredient("kr-matter-assembler", "cermet", 4)
  end

  util.replace_some_ingredient("stone-brick", "stone", 2, "zircon", 2)
  if mods["space-exploration"] then
    util.replace_some_ingredient("se-stone-brick-vulcanite", "stone", 2, "zircon", 2)
  end

  if not mods.bztungsten then
    util.add_ingredient("matter-research-data", "zirconia", 5)
  end
end

-- Space Exploration
if mods["space-exploration"] then
  util.replace_some_ingredient("se-aeroframe-scaffold", "se-aeroframe-pole", 1, "zirconia", 2)
  util.replace_some_ingredient("se-heat-shielding", "stone-tablet", 10, "zirconia", 10)
  util.replace_ingredient("se-heat-shielding-iridium", "stone-tablet", "zirconia")
  util.add_ingredient("se-thruster-suit", "zirconium-plate", 10)
  util.add_ingredient("se-space-thermodynamics-laboratory", "zirconium-plate", 20)
  if util.use_cermet() then
    util.add_ingredient("se-quantum-processor", "cermet", 1)
    util.add_ingredient("se-space-mechanical-laboratory", "cermet", 40)
  end
  if not mods.bztungsten then
    util.add_ingredient("se-hot-thermodynamics-data", "zirconium-plate", 1)
    util.add_product("se-hot-thermodynamics-data", {name="zirconium-plate", amount=1, probability=0.50})
  end
end
-- AAI
util.add_ingredient("industrial-furnace", "zirconium-plate", 4)

-- Aircraft
util.add_ingredient("gunship", "zirconia", 10)
util.add_ingredient("cargo-plane", "zirconia", 20)
util.add_ingredient("jet", "zirconia", 50)
util.add_ingredient("flying-fortress", "zirconia", 80)
util.add_ingredient("aircraft-afterburner", "zirconia", 5)

util.add_ingredient("mega-furnace", "zirconia", 5)
if mods.bzlead then
  util.replace_some_ingredient("breeder-fuel-cell", "lead-plate", 5, "zirconium-plate", 5) 
  util.replace_some_ingredient("mox-fuel-cell", "lead-plate", 5, "zirconium-plate", 5) 
else
  util.replace_some_ingredient("breeder-fuel-cell", "iron-plate", 5, "zirconium-plate", 5) 
  util.replace_some_ingredient("mox-fuel-cell", "iron-plate", 5, "zirconium-plate", 5) 
end
util.add_ingredient("advanced-electric-furnace-rampant-industry", "zirconia", 50)
