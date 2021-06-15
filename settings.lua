data:extend({
  {
		type = "string-setting",
		name = "bzzirconium-recipe-bypass",
		setting_type = "startup",
		default_value = "",
    allow_blank = true,
	},
  {
		type = "string-setting",
		name = "bzzirconium-enable-intermediates",
		setting_type = "startup",
		default_value = "yes",
    allowed_values = {"yes", "no"},
	},
})
