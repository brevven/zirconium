local futil = require("util");
local util = require("data-util");

if util.me.ammo() then
  local mag = {
    {"zirconium-plate", 1},
  }
  local ct = 1
  if mods.bztungsten then
    table.insert(mag, {"tungsten-carbide", 1})
    ct = ct + 1
  end
  -- add any other count-incrementing ingredients before silica, oil, and magazine
  if mods.bzsilicon then
    table.insert(mag, {"silica", ct})
  end
  table.insert(mag, {type="fluid", name="heavy-oil", amount=ct})

  if not mods.Krastorio2 or not util.get_setting("kr-more-realistic-weapon") then
    table.insert(mag, {"piercing-rounds-magazine", ct})

    data:extend({
      {
        type = "ammo",
        name = "explosive-rounds-magazine",
        icon = "__bzzirconium__/graphics/icons/magazine.png",
        icon_size = 64, icon_mipmaps = 4,
        ammo_type =
        {
          category = "bullet",
          action =
          {
            type = "direct",
            action_delivery =
            {
              type = "instant",
              source_effects =
              {
                type = "create-explosion",
                entity_name = "explosion-gunshot"
              },
              target_effects =
              {
                {
                  type = "create-entity",
                  entity_name = "explosion-hit",
                  offsets = {{0, 1}},
                  offset_deviation = {{-0.5, -0.5}, {0.5, 0.5}}
                },
                {
                  type = "damage",
                  damage = { amount = 5, type = "physical"}
                },
                {
                  type = "nested-result",
                  action =
                  {
                    type = "area",
                    radius = 1,
                    action_delivery =
                    {
                      type = "instant",
                      target_effects =
                      {
                        {
                          type = "damage",
                          damage = {amount = 4, type = "explosion"}
                        },
                        {
                          type = "create-entity",
                          entity_name = "explosion"
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        },
        magazine_size = 10,
        subgroup = "ammo",
        order = "a[basic-clips]-c[explosive-rounds-magazine]",
        stack_size = 200
      },
      {
        type = "recipe",
        name = "explosive-rounds-magazine",
        category = "crafting-with-fluid",
        enabled = false,
        energy_required = 6 * ct,
        ingredients = mag,
        result = "explosive-rounds-magazine",
        result_count = ct,
      },
    })

  else
    local k_target_type = "direction" -- "entity", "position" or "direction"
    local rifle_range = 30
    if util.get_setting("kr-more-realistic-weapon-auto-aim") then
      k_target_type = "entity" -- "entity", "position" or "direction"
      rifle_range = 25
    end

    rmag = futil.table.deepcopy(mag)
    table.insert(rmag, {"armor-piercing-rifle-magazine", ct})
    ammag = futil.table.deepcopy(mag)
    table.insert(ammag, {"armor-piercing-anti-material-rifle-magazine", ct})


    data:extend({
      {
        type = "ammo",
        name = "explosive-rounds-rifle-magazine",
        icon = "__bzzirconium__/graphics/icons/r-magazine.png",
        icon_size = 64,
        icon_mipmaps = 4,
        ammo_type = {
          category = "bullet",
          cooldown_modifier = 0.8,
          target_type = k_target_type,
          action = {
            {
              type = "direct",
              action_delivery = {
                {
                  type = "projectile",
                  projectile = "rifle-ammo-ex",
                  starting_speed = 1.5,
                  direction_deviation = 0.15,
                  range_deviation = 0.15,
                  max_range = rifle_range,
                  source_effects = {
                    {
                      type = "create-explosion",
                      entity_name = "explosion-gunshot",
                    },
                  },
                },
              },
            },
          },
        },
        magazine_size = 30,
        subgroup = "ammo",
        order = "a[basic-clips]-a04[rifle-magazine][ex]",
        stack_size = 200,
      },

      {
        type = "projectile",
        name = "rifle-ammo-ex",
        flags = { "not-on-map" },
        collision_box = bullets_collision_box,
        acceleration = -0.018,
        action = {
          type = "direct",
          action_delivery = {
            type = "instant",
            target_effects = {
              {
                type = "create-entity",
                entity_name = "explosion-hit",
              },
              {
                type = "damage",
                damage = { amount = 9, type = "physical" },
              },
              {
                type = "nested-result",
                action =
                {
                  type = "area",
                  radius = 1.5,
                  action_delivery =
                  {
                    type = "instant",
                    target_effects =
                    {
                      {
                        type = "damage",
                        damage = {amount = 7, type = "explosion"}
                      },
                      {
                        type = "create-entity",
                        entity_name = "explosion"
                      }
                    }
                  }
                }
              }
            },
          },
        },
        animation = {
          filename = util.k2assets() .. "/entities/bullets/rifle-bullet-1.png",
          frame_count = 1,
          width = 3,
          height = 50,
          priority = "high",
        },
        shadow = {
          filename = util.k2assets() .. "/entities/bullets/rifle-bullet-1.png",
          frame_count = 1,
          width = 3,
          height = 50,
          priority = "high",
          draw_as_shadow = true,
        },
        --hit_at_collision_position = true,
        force_condition = "not-same",
        light = { intensity = 0.45, size = 5, color = { r = 1.0, g = 1.0, b = 0.5 } },
      },

      {
        type = "recipe",
        name = "explosive-rounds-rifle-magazine",
        category = "crafting-with-fluid",
        energy_required = 2.5*ct,
        enabled = false,
        ingredients = rmag,
        result = "explosive-rounds-rifle-magazine",
        result_count = ct,
      },

      ------------------------
      {
        type = "ammo",
        name = "explosive-rounds-anti-material-rifle-magazine",
        icon = "__bzzirconium__/graphics/icons/am-magazine.png",
        icon_size = 64,
        icon_mipmaps = 4,
        ammo_type = {
          category = "anti-material-rifle-ammo",
          target_type = k_target_type,
          action = {
            {
              type = "direct",
              action_delivery = {
                {
                  type = "projectile",
                  projectile = "anti-material-rifle-ammo-ex",
                  starting_speed = 3,
                  direction_deviation = 0.02,
                  range_deviation = 0.02,
                  max_range = sniper_range,
                  source_effects = {
                    {
                      type = "create-explosion",
                      entity_name = "explosion-gunshot",
                    },
                  },
                },
              },
              force = "not-same",
            },
          },
        },
        magazine_size = 7,
        subgroup = "ammo",
        order = "a[basic-clips]-a08[anti-material-rifle-magazine][ex]",
        stack_size = 200,
      },

      {
        type = "projectile",
        name = "anti-material-rifle-ammo-ex",
        flags = { "not-on-map" },
        collision_box = bullets_collision_box,
        acceleration = -0.025,
        action = {
          type = "direct",
          action_delivery = {
            type = "instant",
            target_effects = {
              {
                type = "create-entity",
                entity_name = "explosion-hit-p",
              },
              {
                type = "damage",
                damage = { amount = 70, type = "physical" },
              },
              {
                type = "nested-result",
                action = {
                  type = "area",
                  radius = 1.5,
                  action_delivery = {
                    type = "instant",
                    target_effects = {
                      {
                        type = "damage",
                        damage = { amount = 70, type = "explosion" },
                      },
                    },
                  },
                  force = "not-same",
                },
              },
            },
          },
          force = "not-same",
        },
        animation = {
          filename = util.k2assets() .. "/entities/bullets/anti-material-rifle-bullet-2.png",
          frame_count = 1,
          width = 3,
          height = 50,
          priority = "high",
        },
        shadow = {
          filename = util.k2assets() .. "/entities/bullets/anti-material-rifle-bullet-2.png",
          frame_count = 1,
          width = 3,
          height = 50,
          priority = "high",
          draw_as_shadow = true,
        },
        --hit_at_collision_position = true,
        force_condition = "not-same",
        light = { intensity = 0.45, size = 8, color = { r = 1.0, g = 0.8, b = 0.5 } },
      },

      {
        type = "recipe",
        name = "explosive-rounds-anti-material-rifle-magazine",
        category = "crafting-with-fluid",
        energy_required = 6*ct,
        enabled = false,
        ingredients = ammag,
        result = "explosive-rounds-anti-material-rifle-magazine",
        result_count = ct,
      },
    })

  end
  util.add_unlock("military-3", "explosive-rounds-magazine")
  util.add_unlock("military-3", "explosive-rounds-rifle-magazine")
  util.add_unlock("military-3", "explosive-rounds-anti-material-rifle-magazine")
end
