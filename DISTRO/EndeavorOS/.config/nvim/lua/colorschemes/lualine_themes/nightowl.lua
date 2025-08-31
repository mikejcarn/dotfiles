-- Marakai Lualine Theme >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

local colors = {
	black = "#000C15",
	white = "#C3CCDC",
	red = "#F68B6C",
	green = "#ADDA66",
	blue = "#7FDACA",
	yellow = "#FECA8A",
	gray = "#4B6479",
	darkgray = "#3c3836",
	lightgray = "#777777",
	inactivegray = "#7c6f64",
	purple = "#C691E9",
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
