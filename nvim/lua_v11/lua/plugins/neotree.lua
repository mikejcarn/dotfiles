return {
	"nvim-neo-tree/neo-tree.nvim",
	cond = true,
	version = "v2.*",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
	},
	opts = {
		close_if_last_window = false,
		follow_current_file = true,
		use_popups_for_input = true,
		popup_border_style = "rounded",
		hide_root_node = true,
		---
		window = {
			position = "right",
			width = 40,
			auto_expand_width = false,
			popup = {
				size = {
					height = "100%",
					width = "50%",
				},
			},
		},
		---
		source_selector = {
			winbar = false,
			statusline = true,
		},
		---
		filesystem = {
			window = {
				mappings = {
					["/"] = "filter_on_submit",
					["<ESC>"] = "clear_filter",
					["'"] = { "toggle_preview", config = { use_float = true } },
					-- ["<ESC>"] = "revert_preview",
					--
					["a"] = { "add", config = { show_path = "relative" } },
					["c"] = { "add", config = { show_path = "relative" } },
					["m"] = { "add", config = { show_path = "relative" } },
				},
			},
			filtered_items = {
				visible = false,
				hide_dotfiles = true,
			},
		},
		---
	},
}
