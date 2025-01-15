local util = require("data-util");

if mods.Krastorio2 then
  util.replace_some_ingredient("low-density-structure", "copper-plate", 5, "zirconia", 5)
else
  util.replace_some_ingredient("low-density-structure", "copper-plate", 10, "zirconia", 10)
end

if mods["space-exploration"] then
  util.replace_some_ingredient("se-aeroframe-scaffold", "se-aeroframe-pole", 1, "zirconia", 2)
end
