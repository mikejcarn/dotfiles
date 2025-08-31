local status_ok, toggleterm = pcall(require, "toggleterm")
if not status_ok then
	return
end

toggleterm.setup({
	size = 20,
	open_mapping = [[<c-\>]],
	hide_numbers = true,
	shade_filetypes = {},
	shade_terminals = true,
	shading_factor = 2,
	start_in_insert = true,
	insert_mappings = true,
	persist_size = true,
	direction = "float",
	-- direction = "horizontal",
	close_on_exit = true,
	shell = vim.o.shell,
	float_opts = {
		border = "curved",
		winblend = 0,
		highlights = {
			border = "Normal",
			background = "Normal",
		},
	},
})

-- Mappings
function _G.set_terminal_keymaps()
	local opts = { noremap = true }
	-- vim.api.nvim_buf_set_keymap(0, "t", "<ESC>", [[<C-\><C-n>]], opts)
	vim.api.nvim_buf_set_keymap(0, "t", "<C-h>", [[<C-\><C-n><C-W>h]], opts)
	vim.api.nvim_buf_set_keymap(0, "t", "<C-j>", [[<C-\><C-n><C-W>j]], opts)
	vim.api.nvim_buf_set_keymap(0, "t", "<C-k>", [[<C-\><C-n><C-W>k]], opts)
	vim.api.nvim_buf_set_keymap(0, "t", "<C-l>", [[<C-\><C-n><C-W>l]], opts)
end

vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")

-- Terminal Apps >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

local Terminal = require("toggleterm.terminal").Terminal
local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })
local ranger = Terminal:new({ cmd = "ranger", hidden = true })

-- lazygit ------------------------------------------------

function _LAZYGIT_TOGGLE()
	lazygit:toggle()
end

vim.keymap.set("n", "sg", ":lua _LAZYGIT_TOGGLE()<CR>", { noremap = true, silent = true })
pcall(
	vim.cmd,
	[[
  call arpeggio#map('n','','0','sg',':lua _LAZYGIT_TOGGLE()<CR>')
  call arpeggio#map('n','','0','gs',':lua _LAZYGIT_TOGGLE()<CR>')
  ]]
)

-- ranger -------------------------------------------------

function _RANGER_TOGGLE()
	ranger:toggle()
end

vim.keymap.set("n", "sr", ":lua _RANGER_TOGGLE()<CR>", { noremap = true, silent = true })
pcall(
	vim.cmd,
	[[
  call arpeggio#map('n','','0','sr',':lua _RANGER_TOGGLE()<CR>')
  call arpeggio#map('n','','0','rs',':lua _RANGER_TOGGLE()<CR>')
  ]]
)
