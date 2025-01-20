local futil = require("util")
local util = require("data-util");
local item_sounds = require("__base__.prototypes.item_sounds")
local sounds = require("__base__.prototypes.entity.sounds")
local hit_effects = require("__base__.prototypes.entity.hit-effects")

if mods["space-age"] then
util.add_new_crafting_category("basic-metallurgy")

if util.me.basic_foundry() and not data.raw.item["basic-foundry"] then
local graphics_set = require("__space-age__.prototypes.entity.foundry-pictures").graphics_set
graphics_set.animation.layers[1].tint = {.6, .8, .8}
data:extend({
  {
    type = "assembling-machine",
    name = "basic-foundry",
    icons = {{
    icon = "__space-age__/graphics/icons/foundry.png",
    tint = {.6, .8, .8},
    }},
    flags = {"placeable-neutral","player-creation"},
    minable = {mining_time = 0.2, result = "basic-foundry"},
    fast_replaceable_group = "foundry",
    max_health = 350,
    corpse = "foundry-remnants",
    dying_explosion = "foundry-explosion",
    -- circuit_wire_max_distance = assembling_machine_circuit_wire_max_distance,
    -- circuit_connector = circuit_connector_definitions["foundry"],
    collision_box = {{-2.2, -2.2}, {2.2, 2.2}},
    selection_box = {{-2.5, -2.5}, {2.5, 2.5}},
    heating_energy = "300kW",
    damaged_trigger_effect = hit_effects.entity(),
    drawing_box_vertical_extension = 1.3,
    -- effect_receiver = { base_effect = { productivity = 0.5 }},
    -- module_slots = 4,
    icon_draw_specification = {scale = 2, shift = {0, -0.3}},
    icons_positioning =
    {
      {inventory_index = defines.inventory.assembling_machine_modules, shift = {0, 1.25}}
    },
    allowed_effects = {"consumption", "speed", "productivity", "pollution", "quality"},
    crafting_categories = {"basic-metallurgy"},
    crafting_speed = 4,
    energy_source =
    {
      type = "burner",
      fuel_inventory_size = 3,
      usage_priority = "secondary-input",
      smoke = {
        {
          name = "smoke",
          frequency = 80,
          position = {1.5, -2.3},
          starting_vertical_speed = 0.1,
          starting_frame_deviation = 60,
        }
      }
    },
    energy_usage = "5000kW",
    perceived_performance = { minimum = 0.25, performance_to_activity_rate = 2.0, maximum = 20 },
    graphics_set = graphics_set,
    open_sound = sounds.metal_large_open,
    close_sound = sounds.metal_large_close,
    working_sound =
    {
      sound =
      {
        filename = "__space-age__/sound/entity/foundry/foundry.ogg", volume = 0.5
      },
      --idle_sound = { filename = "__base__/sound/idle1.ogg", volume = 0.3 },
      fade_in_ticks = 4,
      fade_out_ticks = 20,
      sound_accents =
      {
        { sound = { filename = "__space-age__/sound/entity/foundry/foundry-pipe-out.ogg", volume = 0.9 }, frame = 2, audible_distance_modifier = 0.4 },
        { sound = { filename = "__space-age__/sound/entity/foundry/foundry-slide-close.ogg", volume = 0.65 }, frame = 18, audible_distance_modifier = 0.3 },
        { sound = { filename = "__space-age__/sound/entity/foundry/foundry-clamp.ogg", volume = 0.45 }, frame = 39, audible_distance_modifier = 0.3 },
        { sound = { filename = "__space-age__/sound/entity/foundry/foundry-slide-stop.ogg", volume = 0.7 }, frame = 43, audible_distance_modifier = 0.4 },
        { sound = { variations = sound_variations("__space-age__/sound/entity/foundry/foundry-fire-whoosh", 3, 0.8 )}, frame = 64, audible_distance_modifier = 0.3 },
        { sound = { filename = "__space-age__/sound/entity/foundry/foundry-metal-clunk.ogg", volume = 0.65 }, frame = 64, audible_distance_modifier = 0.4 },
        { sound = { filename = "__space-age__/sound/entity/foundry/foundry-slide-open.ogg", volume = 0.65 }, frame = 74, audible_distance_modifier = 0.3 },
        { sound = { filename = "__space-age__/sound/entity/foundry/foundry-pipe-in.ogg", volume = 0.75 }, frame = 106, audible_distance_modifier = 0.4 },
        { sound = { filename = "__space-age__/sound/entity/foundry/foundry-smoke-puff.ogg", volume = 0.8 }, frame = 106, audible_distance_modifier = 0.3 },
        { sound = { variations = sound_variations("__space-age__/sound/entity/foundry/foundry-pour", 2, 0.7 )}, frame = 110 },
        { sound = { filename = "__space-age__/sound/entity/foundry/foundry-rocks.ogg", volume = 0.65 }, frame = 120, audible_distance_modifier = 0.3 },
        { sound = { filename = "__space-age__/sound/entity/foundry/foundry-blade.ogg", volume = 0.7 }, frame = 126 },
      },
      audible_distance_modifier = 0.6,
      max_sounds_per_type = 2
    },
    fluid_boxes_off_when_no_fluid_recipe = true,
    water_reflection =
    {
      pictures = futil.sprite_load("__space-age__/graphics/entity/foundry/foundry-reflection",
      {
          scale = 5,
          shift = {0,2}
      }),
      rotate = false
    }
  },
  {
    type = "item",
    name = "basic-foundry",
    icons = {{
    icon = "__space-age__/graphics/icons/foundry.png",
    tint = {.6, .8, .8},
    }},
    subgroup = "smelting-machine",
    order = "d[foundry-basic]",
    inventory_move_sound = item_sounds.steam_inventory_move,
    pick_sound = item_sounds.steam_inventory_pickup,
    drop_sound = item_sounds.steam_inventory_move,
    place_result = "basic-foundry",
    stack_size = 20,
    weight = 500 * kg
  },
  {
    type = "recipe",
    name = "basic-foundry",
    category = "crafting",
    enabled = false,
    ingredients =
    {
      {type = "item", name = "zirconia", amount = 50},
      {type = "item", name = "steel-plate", amount = 50},
      {type = "item", name = "electronic-circuit", amount = 30},
      {type = "item", name = "concrete", amount = 20},
    },
    energy_required = 10,
    results = {{type="item", name="basic-foundry", amount=1}}
  },
  {
    type = "recipe",
    name = "steel-basic",  -- another steel option
    localised_name = {"item-name.steel-plate"},
    category = "basic-metallurgy",
    order = "a[smelting]-c[steel-plate]-z",
    enabled = false,
    energy_required = 3.2,
    ingredients = {util.item("iron-plate", 3), util.item("coal", 1)},
    results = {util.item("steel-plate", 1)},
  },
})
util.add_unlock("advanced-material-processing-2", "basic-foundry")
util.add_unlock("advanced-material-processing-2", "steel-basic")
end
util.add_prerequisite("nuclear-power", "advanced-material-processing-2")
util.add_crafting_category("assembling-machine", "foundry", "basic-metallurgy")
end
