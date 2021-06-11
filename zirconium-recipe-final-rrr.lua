local util = require("__bzzirconium__.data-util");

if mods["Rich-Rocks-Requiem"] then
  if data.raw.recipe["rrr-stone-processing"] then
    table.insert(data.raw.recipe["rrr-stone-processing"].results,
      {name = "zircon", probability = 0.50, amount = 10}
    )
  end

  if data.raw.recipe["rrr-raw-ores-processing"] then
    table.insert(data.raw.recipe["rrr-raw-ores-processing"].results,
      {name = "zircon", probability = 0.50, amount = 10}
    )
  end
end
