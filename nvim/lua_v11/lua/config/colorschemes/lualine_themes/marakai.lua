local colors = {
	black = "#000001",
	white = "#ebdbb2",
	red = "#fd015d",
	green = "#00ff00",
	blue = "#00ffff",
	yellow = "#fe8019",
	gray = "#585858",
	darkgray = "#3c3836",
	lightgray = "#777777",
	inactivegray = "#7c6f64",
	purple = "#7272CF",
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
		c = { bg = colors.black, fg = colors.gray, gui = 'underline' },
	},
}
