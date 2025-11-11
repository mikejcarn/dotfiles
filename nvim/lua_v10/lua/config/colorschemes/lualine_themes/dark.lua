local colors = {
	black = "#252526",
	white = "#D4D4D4",
	red = "#C586C0",
	green = "#4EC9B0",
	blue = "#569CD6",
	yellow = "#CE9178",
	gray = "#5A5A5A",
	darkgray = "#3c3836",
	lightgray = "#777777",
	inactivegray = "#7c6f64",
	purple = "#7272CF",
}

return {
	normal = {
		a = { bg = colors.blue, fg = colors.black, gui = "bold" },
		b = { bg = colors.black, fg = colors.blue },
		c = { bg = colors.black, fg = colors.blue },
	},
	insert = {
		a = { bg = colors.green, fg = colors.black, gui = "bold" },
		b = { bg = colors.black, fg = colors.green },
		c = { bg = colors.black, fg = colors.green },
	},
	visual = {
		a = { bg = colors.red, fg = colors.black, gui = "bold" },
		b = { bg = colors.black, fg = colors.red },
		c = { bg = colors.black, fg = colors.red },
	},
	replace = {
		a = { bg = colors.yellow, fg = colors.black, gui = "bold" },
		b = { bg = colors.black, fg = colors.yellow },
		c = { bg = colors.black, fg = colors.yellow },
	},
	command = {
		a = { bg = colors.purple, fg = colors.black, gui = "bold" },
		b = { bg = colors.black, fg = colors.purple },
		c = { bg = colors.black, fg = colors.purple },
	},
	inactive = {
		a = { bg = colors.black, fg = colors.lightgray, gui = "bold" },
		b = { bg = colors.black, fg = colors.lightgray },
		c = { bg = colors.black, fg = colors.lightgray },
	},
}
