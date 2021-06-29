local util = require("__bzzirconium__.data-util");

util.add_prerequisite("advanced-material-processing-2", "zirconia-processing")
util.add_prerequisite("low-density-structure", "zirconia-processing")
util.add_prerequisite("nuclear-power", "zirconia-processing")
util.add_prerequisite("explosives", "zirconia-processing")
util.add_prerequisite("chemical-science-pack", "zirconia-processing")

if util.use_cermet() then
  -- production science techs behind cermet
  util.add_prerequisite("effect-transmission", "cermet")
  if not util.fe_plus("Machines") then
    util.add_prerequisite("automation-3", "cermet")
  else
    util.add_prerequisite("mechanical-engineer", "cermet")
    util.add_prerequisite("advanced-oil-processing-3", "cermet")
  end
  util.add_prerequisite("productivity-module-3", "cermet")
  util.add_prerequisite("speed-module-3", "cermet")
  util.add_prerequisite("effectivity-module-3", "cermet")

  -- utility science techs behind cermet
  util.add_prerequisite("rocket-control-unit", "cermet")
  util.set_tech_recipe("rocket-control-unit", 
    {
      {"automation-science-pack", 1},
      {"logistic-science-pack", 1},
      {"chemical-science-pack", 1},
      {"production-science-pack", 1},
      {"utility-science-pack", 1},
    })

  -- Bob's
  util.add_prerequisite("chemical-plant-3", "cermet")
  util.add_prerequisite("oil-processing-3", "cermet")
  util.add_prerequisite("bob-drills-4", "cermet")
  util.add_prerequisite("bob-area-drills-4", "cermet")

end
