return {
	{
		"L3MON4D3/LuaSnip",
		cond = true,
		dependencies = {
			"rafamadriz/friendly-snippets",
			config = function()
				require("luasnip/loaders/from_vscode").lazy_load()
				--	require("luasnip/loaders/from_vscode").load({
				--		paths = { "~/.local/share/nvim/site/lazy/start/friendly-snippets" },
				--	})
			end,
		},
		opts = {
			history = false,
			update_events = "TextChanged,TextChangedI",
			delete_check_events = "TextChanged",
			ext_base_prio = 300,
			ext_prio_increase = 1,
			enable_autosnippets = true,
			store_selection_keys = "<Tab>",
			ft_func = function()
				return vim.split(vim.bo.filetype, ".", true)
			end,
		},
		config = function()
			-- load snippets from directory ---------------------------
			local snippet_dir = "~/.config/nvim/lua/plugins/luasnip/snippets/"
			require("luasnip.loaders.from_lua").load({ paths = snippet_dir })
		end,
	},
}
