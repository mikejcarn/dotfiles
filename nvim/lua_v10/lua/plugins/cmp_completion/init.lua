return {
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"hrsh7th/cmp-nvim-lsp-signature-help",
			"saadparwaiz1/cmp_luasnip",
			{ "tzachar/cmp-tabnine", build = "./install.sh" },
		},
		config = function()
			local cmp = require("cmp")
			local luasnip = require("luasnip")

			-- helper function
			local check_backspace = function()
				local col = vim.fn.col(".") - 1
				return col == 0 or vim.fn.getline("."):sub(col, col):match("%s")
			end

			-----------------------------------------------------------

			-- define icons
			local icons = {
				Text = "",
				Method = "m",
				Function = "",
				Constructor = "",
				Field = "",
				Variable = "",
				Class = "",
				Interface = "",
				Module = "",
				Property = "",
				Unit = "",
				Value = "",
				Enum = "",
				Keyword = "",
				Snippet = "",
				Color = "",
				File = "",
				Reference = "",
				Folder = "",
				EnumMember = "",
				Constant = "",
				Struct = "",
				Event = "",
				Operator = "",
				TypeParameter = "",
			}

			local aliases = {
				nvim_lsp = "lsp",
				luasnip = "snippet",
				cmp_tabnine = "tabnine",
			}

			-- Main Configuration -------------------------------------

			cmp.setup({
				mapping = cmp.mapping.preset.insert({
					["<A-Space>"] = cmp.mapping.complete(),
					["<C-c>"] = cmp.mapping.abort(),
					["<CR>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.confirm({ select = false }) -- bool -> select 1st option
							if cmp.visible() then
								cmp.abort()
								fallback()
							end
						else
							fallback()
						end
					end),
					["<S-CR>"] = cmp.mapping(function(fallback)
						if luasnip.expand_or_jumpable() then
							-- cmp.confirm()
							luasnip.jump(1)
						else
							fallback()
						end
					end),
					["<Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_next_item()
						elseif luasnip.expandable() then
							luasnip.expand()
						elseif check_backspace() then
							fallback()
						else
							fallback()
						end
					end, {
						"i",
						"s",
					}),
					["<S-Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_prev_item()
						elseif luasnip.jumpable(-1) then
							luasnip.jump(-1)
						else
							fallback()
						end
					end, {
						"i",
						"s",
					}),
				}),
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "nvim_lsp_signature_help" },
					{ name = "nvim_lua" },
					{ name = "luasnip" },
					{ name = "path" },
					{ name = "buffer" },
					{ name = "cmp_tabnine" },
				}),
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end,
				},
				formatting = {
					fields = { "kind", "abbr", "menu" },
					format = function(entry, item)
						-- Kind icons
						item.kind = string.format("%s", icons[item.kind])
						-- Source
						item.menu = string.format("[%s]", aliases[entry.source.name] or entry.source.name)
						return item
					end,
				},
			})
		end,
	},
}
