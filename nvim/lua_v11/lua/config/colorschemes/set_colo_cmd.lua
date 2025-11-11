local command = function(name, cmd, lua_table)
	lua_table = lua_table or { nargs = 0 }

	if type(cmd) == "string" then
		-- Colorscheme
		local colorscheme = cmd

		vim.api.nvim_create_user_command(name, function()
			require("lualine").setup({
				options = {
					theme = "auto",
				},
			})
			vim.cmd("colo " .. colorscheme) -- set colorscheme
		end, lua_table)
	else
		-- Colorscheme + Lualine
		local colorscheme = cmd.theme
		local lua_theme = require(cmd.lua_loc)

		vim.api.nvim_create_user_command(name, function()
			require("lualine").setup({
				options = {
					theme = lua_theme,
				},
			})
			vim.cmd("colo " .. colorscheme) -- set colorscheme
		end, lua_table)
	end
end

return command
