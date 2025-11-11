return {
	"nvim-lualine/lualine.nvim",
	cond = true,
	config = function()
		-- return "/" search query results
		function SearchCount()
			local search = vim.fn.searchcount({ maxcount = 0 }) -- maxcount = 0 makes the number not be capped at 99
			local searchCurrent = search.current
			local searchTotal = search.total
			if searchCurrent > 0 and vim.v.hlsearch ~= 0 then
				return "/" .. vim.fn.getreg("/") .. " [" .. searchCurrent .. "/" .. searchTotal .. "]"
			else
				return ""
			end
		end

		-- show if window is maximized
		function Is_Maximized()
			if vim.t.is_maximized == true then
				return "MAXIMIZED"
      else
        return ''
			end
		end

		local status, lualine = pcall(require, "lualine")
		if status then
			--
			lualine.setup({
				default_keymaps = true,
				extensions = { "nvim-tree" },
				options = {
					component_separators = { left = "", right = " " },
          global_status = true,
				},
				sections = {
					lualine_a = { "mode" },
					lualine_b = {
						{
							"filename",
							file_status = true,
							path = 1,
							shorting_target = 40,
							symbols = {
								modified = "[+]",
								readonly = "[-]",
								unnamed = "[No Name]",
							},
						},
					},
					lualine_c = {},
					lualine_x = { { Is_Maximized }, { SearchCount }, "diff", "diagnostics", "branch", "filetype" },
				},
				inactive_sections = {
					lualine_c = { "filename" },
					lualine_x = { "branch", "filetype", "location" },
				},
			})
			--
		end
	end,
}
