return {
  -- create env in fish shell -> set -Ux OPENAI_API_KEY api-key-value
  "jackMort/ChatGPT.nvim",
  cond = false,
  event = "VeryLazy",
  dependencies = {
    "MunifTanjim/nui.nvim",
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
  },
  config = function()
    require("chatgpt").setup({
      ---
      popup_input = {
        prompt = "  ",
        submit = "<C-Enter>",
        submit_n = "<C-Enter>",
        max_visible_lines = 20,
      },
      ---
      chat = {
        welcome_message = "",
        keymaps = {
          close = { "<ESC>" },
        },
      },
			---
			popup_layout = {
				default = "center",
				center = {
					width = "100%",
					height = "100%",
				},
			},
			right = {
				width = "30%",
				width_settings_open = "50%",
			},
      ---
      edit_with_instructions = {
        diff = false,
        keymaps = {
          close = "<ESC>",
          accept = "<C-y>",
          toggle_diff = "<C-d>",
          toggle_settings = "<C-o>",
          cycle_windows = "<Tab>",
          use_output_as_input = "<C-i>",
        },
      },
      ---
    })
  end,
}
