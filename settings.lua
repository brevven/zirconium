data:extend({
  {
		type = "string-setting",
		name = "bzzirconium-recipe-bypass",
		setting_type = "startup",
		default_value = "",
    allow_blank = true,
    order = "a-a-a",
	},
  {
		type = "bool-setting",
		name = "bzzirconium-byproduct",
		setting_type = "startup",
    default_value = true,
    order = "a-b-a",
	},
  {
		type = "string-setting",
		name = "bzzirconium-enable-intermediates",
		setting_type = "startup",
		default_value = "lds",
    allowed_values = {"lds", "yes", "no"},
    order = "b-a-a",
	},
  {
    type = "bool-setting",
		name = "bzzirconium-early",
		setting_type = "startup",
		default_value = true,
    order = "c-a-a",
  },
  {
		type = "bool-setting",
		name = "bzzirconium-enable-sorting",
		setting_type = "startup",
		default_value = false,
    order = "m-a-a",
	},
})
