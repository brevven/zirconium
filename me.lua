local me = {}

me.name = "bzzirconium"
me.resources = {"zircon"}
me.recipes = {"zirconium-plate", "zirconia", "cermet",
           "enriched-zirconia-smelting",
           "enriched-zircon",
           "zirconia-smelting-vulcanite",
           "molten-zirconium",
           "enriched-zirconia-smelting-vulcanite",}

function me.byproduct()
  return me.get_setting("bzzirconium-byproduct") and not me.get_setting("bz-no-byproduct")
end

function me.early()
  return me.get_setting("bzzirconium-early")
end

function me.ammo()
  return true
  -- return me.get_setting("bzzirconium-ammo")
end


function me.use_cermet()
  if me.get_setting("bz-all-intermediates") then return true end
  return me.get_setting("bzzirconium-enable-intermediates") == "yes"
end

function me.enable_sorting()
  return me.get_setting("bzzirconium-enable-sorting")
end

function me.get_setting(name)
  if settings.startup[name] == nil then
    return nil
  end
  return settings.startup[name].value
end

me.bypass = {}
if me.get_setting(me.name.."-recipe-bypass") then 
  for recipe in string.gmatch(me.get_setting(me.name.."-recipe-bypass"), '[^",%s]+') do
    me.bypass[recipe] = true
  end
end

function me.add_modified(name) 
  if me.get_setting(me.name.."-list") then 
    table.insert(me.list, name)
  end
end

return me
