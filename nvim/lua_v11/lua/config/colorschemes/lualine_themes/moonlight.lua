local colors = {
	black = "#1B1E2B",
	white = "#D2E0E7",
	red = "#E76C77",
	green = "#2DF0BD",
	blue = "#04D1F9",
	yellow = "#ffff00",
	gray = "#596399",
	darkgray = "#3c3836",
	lightgray = "#777777",
	inactivegray = "#7c6f64",
	purple = "#B4A4F4",
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

