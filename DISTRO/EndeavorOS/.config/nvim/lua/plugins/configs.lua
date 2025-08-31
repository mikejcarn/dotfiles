-- PLUGIN SETTINGS >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

-- hop.nvim (easymotion) ----------------------------------

local status, hop = pcall(require, "hop")
if status then
	hop.setup()
end

-- indent-blankline.nvim ----------------------------------

local status, indent_blankline = pcall(require, "indent_blankline")
if status then
	indent_blankline.setup()
end

-- autopairs ----------------------------------------------

local status, autopairs = pcall(require, "nvim-autopairs")
if status then
	autopairs.setup()
end

-- marks.nvim ---------------------------------------------

local status, marks = pcall(require, "marks")
if status then
	marks.setup()
end

-- nvim-colorizer -----------------------------------------

local status, colorizer = pcall(require, "colorizer")
if status then
	colorizer.setup()
end

-- nvim-scrollbar -----------------------------------------

local status, scrollbar = pcall(require, "scrollbar")
if status then
	scrollbar.setup()
end

-- nvim-comment -------------------------------------------

local status, nvim_comment = pcall(require, "nvim_comment")
if status then
	--
	nvim_comment.setup({
		line_mapping = "<C-_>", -- <C-_> stands in for <C-/>
	})
	--
end

-- surround -----------------------------------------------

local status, surround = pcall(require, "surround")
if status then
	--
	surround.setup({
		mappings_style = "sandwich",
		prefix = "sd",
	})
	--
end

-- nvim-tree ----------------------------------------------

local status, nvim_tree = pcall(require, "nvim-tree")
if status then
	nvim_tree.setup({
		--
		disable_netrw = true,
		diagnostics = {
			enable = true,
		},
		view = {
			side = "right",
			hide_root_folder = true,
		},
		filters = {
			dotfiles = true,
		},
		actions = {
			open_file = {
				window_picker = {
					enable = false,
				},
			},
		},
	})
	--
end

-- lualine ------------------------------------------------

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

local status, lualine = pcall(require, "lualine")
if status then
	--
	lualine.setup({
		default_keymaps = true,
		extensions = { "nvim-tree" },
		options = {
			component_separators = { left = "", right = " " },
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
			lualine_c = { "branch", "diff", "diagnostics" },
			lualine_x = { { SearchCount }, "filetype" },
		},
    inactive_sections = {
      lualine_c = {'filename'},
      lualine_x = {"filetype",'location'},
    }
	})
	--
end

-- windex (maximizer) -------------------------------------

local status = pcall(require, "windex")
if status then
	--
	local function maximize_status()
		return vim.t.maximized and " " or ""
	end
	pcall(
		require("lualine").setup({
			sections = { lualine_a = { "mode", maximize_status } },
		}),
		maximize_status
	)
	--
end

-- bufferline.nvim ----------------------------------------

local status, bufferline = pcall(require, "bufferline")
if status then
	--
	bufferline.setup({
		options = {
			separator_style = { "" },
			indicator = {
				icon = " ",
				style = "icon",
			},
			offsets = {
				{
					filetype = "NvimTree",
					text = "",
					highlight = "Directory",
					text_align = "left",
				},
			},
		},
	})
	--
end

-- fzf-lua ------------------------------------------------

local opts = { noremap = true, silent = true }

local status, fzf_lua = pcall(require, "fzf-lua")
if status then
	--
	fzf_lua.setup({
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
			input_prompt = "GREP: ",
		},
	})
	--
end

-- telescope.nvim -----------------------------------------

local status, telescope = pcall(require, "telescope")
if status then
	--
	local actions = require("telescope.actions")
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
	--
end

-- neoscroll ----------------------------------------------

local status, neoscroll = pcall(require, "neoscroll")
if status then
	--
	neoscroll.setup({
		hide_cursor = true,
		stop_eof = true, -- Stop at <EOF>
		respect_scrolloff = false, -- Stop when cursor reaches scrolloff margin
		cursor_scrolls_alone = true, -- Scroll even if window cannot scroll further
	})
	local t = {}
	-- Syntax: t[keys] = {function, {function arguments}}
	t["+"] = { "scroll", { "-vim.wo.scroll", "true", "350" } }
	t["_"] = { "scroll", { "vim.wo.scroll", "true", "350" } }
	t["<Leader>o"] = { "scroll", { "-0.25", "true", "250" } }
	t["<Leader>n"] = { "scroll", { "0.25", "true", "250" } }
	t["zt"] = { "zt", { "150" } }
	t["zz"] = { "zz", { "150" } }
	t["zb"] = { "zb", { "150" } }
	t["<Leader>k"] = { "zt", { "150" } }
	t["<Leader>j"] = { "zz", { "150" } }
	t["<Leader>h"] = { "zb", { "150" } }
	require("neoscroll.config").set_mappings(t)
	--
end

-- vim-extended-ft ----------------------------------------

pcall(vim.cmd, "let g:ExtendedFTUseDefaults = 0")

-- arpeggio -----------------------------------------------

pcall(vim.cmd, "let g:arpeggio_timeoutlen = 100")

-- vim-visual-multi ---------------------------------------

pcall(
	vim.cmd,
	[[
    let g:VM_leader = '<SPACE>'
    let g:VM_maps = {}
    let g:VM_maps['Reselect Last'] = '' "remove conflicting map
    let g:VM_maps['Add Cursor At Pos'] = '' "remove conflicting map
    let g:VM_custom_noremaps = {'`':'~'}
    let g:VM_mouse_mappings = 1
  ]]
)
