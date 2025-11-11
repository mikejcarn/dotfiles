return {
	"jay-babu/mason-null-ls.nvim",
	cond = false,
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"williamboman/mason.nvim",
		"jose-elias-alvarez/null-ls.nvim",
	},
	config = function()
		-- mason-null-ls config
		require("mason-null-ls").setup({
			ensure_installed = { "stylua", "prettierd", "black", "shfmt", "djlint" },
		})

		-- null-ls config
		local on_attach = function(client)
			-- config for FORMAT on SAVE
			if client.server_capabilities.documentFormattingProvider then
				vim.cmd("nnoremap <silent><buffer> <Leader>f :lua vim.lsp.buf.format()<CR>")
				vim.cmd("autocmd BufWritePost <buffer> lua vim.lsp.buf.format()")
			end
			if client.server_capabilities.documentRangeFormattingProvider then
				vim.cmd("xnoremap <silent><buffer> <Leader>f :lua vim.lsp.buf.range_formatting({})<CR>")
			end
		end

		local null_ls = require("null-ls")
		local formatting = null_ls.builtins.formatting

		null_ls.setup({
			debug = false,
			sources = {
				formatting.stylua,
				formatting.prettierd,
				formatting.shfmt,
				formatting.black,
				formatting.djlint,
			},
			on_attach = on_attach, -- Format on SAVE
		})
	end,
}
