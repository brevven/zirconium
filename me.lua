local me = {}

me.name = "bzzirconium"

function me.byproduct()
  return me.get_setting("bzzirconium-byproduct")
end

function me.use_cermet()
  return me.get_setting("bzzirconium-enable-intermediates") == "yes" or me.cermet_lds()
end

function me.cermet_lds()
  return me.get_setting("bzzirconium-enable-intermediates") == "lds"
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
