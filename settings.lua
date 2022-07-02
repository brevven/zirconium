data:extend({
  {
		type = "string-setting",
		name = "bzzirconium-recipe-bypass",
		setting_type = "startup",
		default_value = "",
    allow_blank = true,
	},
  {
		type = "bool-setting",
		name = "bzzirconium-byproduct",
		setting_type = "startup",
    default_value = true,
	},
  {
		type = "string-setting",
		name = "bzzirconium-enable-intermediates",
		setting_type = "startup",
		default_value = "lds",
    allowed_values = {"lds", "yes", "no"},
	},
  {
		type = "bool-setting",
		name = "bzzirconium-enable-sorting",
		setting_type = "startup",
		default_value = false,
	},
})
