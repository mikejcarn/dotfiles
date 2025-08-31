local colors = {
	black = "#0F0F10",
	white = "#FFFFFF",
	red = "#EB6060",
	green = "#A9CCA4",
	blue = "#6196A1",
	yellow = "#FFD7AF",
	gray = "#333E40",
	darkgray = "#262E2C",
	lightgray = "#777777",
	inactivegray = "#7c6f64",
	purple = "#684C9A",
}

return {
	normal = {
		a = { bg = colors.gray, fg = colors.black, gui = "bold" },
		b = { bg = colors.black, fg = colors.gray },
		c = { bg = colors.black, fg = colors.gray },
	},
	insert = {
		a = { bg = colors.blue, fg = colors.black, gui = "bold" },
		b = { bg = colors.black, fg = colors.blue },
		c = { bg = colors.black, fg = colors.blue },
	},
	visual = {
		a = { bg = colors.red, fg = colors.black, gui = "bold" },
		b = { bg = colors.black, fg = colors.red },
		c = { bg = colors.black, fg = colors.red },
	},
	replace = {
		a = { bg = colors.green, fg = colors.black, gui = "bold" },
		b = { bg = colors.black, fg = colors.green },
		c = { bg = colors.black, fg = colors.green },
	},
	command = {
		a = { bg = colors.purple, fg = colors.black, gui = "bold" },
		b = { bg = colors.black, fg = colors.purple },
		c = { bg = colors.black, fg = colors.purple },
	},
	inactive = {
		a = { bg = colors.black, fg = colors.gray, gui = "bold" },
		b = { bg = colors.darkgray, fg = colors.gray },
		c = { bg = colors.black, fg = colors.gray },
	},
}
