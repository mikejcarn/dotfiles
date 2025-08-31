-- Colorschemes >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

local themes = {
	{ "Tokyonight", "tokyonight" },

	{ "Nightfox", "nightfox" },
	{ "Nordfox", "nordfox" },
	{ "Terafox", "terafox" },
	{ "DuskFox", "duskfox" },
	{ "Dayfox", "dayfox" },

	{ "Monokai", "monokai_pro" },
	{ "Boo", "boo" },
	{ "Jellybeans", "jellybeans-nvim" },
	{ "Sonokai", "sonokai" },
	{ "Melange", "melange" },
	{ "Synthwave84", "synthwave84" },
	{ "XCode", "xcode" },

	{ "Gruvbox", { theme = "gruvbox", lua_loc = "lualine.themes.gruvbox" } },
	{ "Dark", { theme = "vscode", lua_loc = "lualine.themes.vscode" } },
	{ "Blush", { theme = "everblush", lua_loc = "lualine.themes.everblush" } },
	{ "Onedark", { theme = "onedark", lua_loc = "lualine.themes.onedark" } },
	{ "Dracula", { theme = "dracula", lua_loc = "lualine.themes.dracula-nvim" } },
	{ "Nord", { theme = "nord", lua_loc = "lualine.themes.nord" } },
	{ "Everforest", { theme = "everforest", lua_loc = "lualine.themes.everforest" } },
	{ "Moonlight", { theme = "moonlight", lua_loc = "lualine.themes.moonlight" } },

	{ "Marakai", { theme = "marakai", lua_loc = "colorschemes.lualine_themes.marakai" } },
	{ "Solarized", { theme = "solarized", lua_loc = "colorschemes.lualine_themes.solarized" } },
	{ "Nightowl", { theme = "nightfly", lua_loc = "colorschemes.lualine_themes.nightowl" } },
}

-- create cmds from themes (colorscheme + lualine)
local colo_command = require("colorschemes.set_colo_cmd")

for _, theme in pairs(themes) do
	pcall(colo_command, theme[1], theme[2]) -- (name, {colorscheme, lualine_folder})
end

-- Colorscheme Configs ------------------------------------

-- Remove SignColumn background + carats in StatusLine
vim.cmd([[
  autocmd Colorscheme * highlight SignColumn guibg=NONE | highlight StatusLine gui=bold | highlight LineNr guibg=NONE | highlight StatusLineNC gui=italic | set background=dark
]])

-- vim.o.background = "dark"

-- Sonokai
vim.cmd([[
let g:sonokai_style = 'andromeda'
let g:sonokai_better_performance = 1
]])

-- Nightfly
vim.cmd([[
let g:nightflyWinSeparator = '2'
]])

-- Tokyonight
vim.g.tokyonight_style = "night"

-- VSCode Dark
local status, vscode = pcall(require, "vscode")
if status then
	vscode.setup({
		transparent = false,
	})
end

-- Startup Colorscheme ------------------------------------

pcall(vim.cmd, ":Marakai")
