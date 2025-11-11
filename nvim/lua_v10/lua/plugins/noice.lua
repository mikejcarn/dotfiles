return {
	{
		"folke/noice.nvim",
		cond = true,
		dependencies = {
			"MunifTanjim/nui.nvim",
			{
				"rcarriga/nvim-notify",
				opts = {
					render = "compact", -- default, compact, minimal, simple
					stages = "fade", -- fade, fade_in_slide_out, slide, static
					background_colour = "#000000",
					timeout = 2500,
					top_down = true,
				},
			},
		},
		opts = {
			presets = {
				bottom_search = false,
				long_message_to_split = true,
				command_palette = false,
			},
			cmdline = {
				enabled = true,
				view = "cmdline_popup",
			},
		},
	},
}
