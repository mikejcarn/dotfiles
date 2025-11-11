return {
	"nvim-telescope/telescope.nvim",
  cond = true,
	version = "0.1.x",
	dependencies = { { "nvim-lua/plenary.nvim" }, {
	"AckslD/nvim-neoclip.lua", -- requires xclip (clipboard)
	opts = {
		default_register = "+",
	},
} },
	config = function()
		local actions = require("telescope.actions")
		local telescope = require('telescope')
    telescope.setup({
			defaults = {
				mappings = {
					i = {
						["<ESC>"] = actions.close,
						["<Tab>"] = actions.move_selection_next,
						["<S-Tab>"] = actions.move_selection_previous,
					},
				},
				layout_config = { height = 0.99, width = 0.99 },
			},
		})
		pcall(telescope.load_extension, "neoclip")
		pcall(telescope.load_extension, "dap")
	end,
}
