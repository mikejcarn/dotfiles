return {
	"ibhagwan/fzf-lua", -- requires fzf
	config = function()
		local opts = { noremap = true, silent = true }
		require("fzf-lua").setup({
			winopts = {
				height = 0.99,
				width = 0.99,
				on_create = function()
					vim.api.nvim_buf_set_keymap(0, "t", "<Tab>", "<Down>", opts)
					vim.api.nvim_buf_set_keymap(0, "t", "<S-Tab>", "<Up>", opts)
				end,
				preview = {
					vertical = "down:51%",
				},
			},
			grep = {
				input_prompt = "GREP => ",
			},
			previewers = {
				builtin = {
					treesitter = { enable = false },
				},
			},
		})
	end,
}
