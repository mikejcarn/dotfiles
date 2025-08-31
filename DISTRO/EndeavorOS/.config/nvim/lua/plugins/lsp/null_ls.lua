-- Null-ls >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

-- import null-ls
local status, null_ls = pcall(require, "null-ls")
if not status then
	return
end

-----------------------------------------------------------

local formatting = null_ls.builtins.formatting
-- local diagnostics = null_ls.builtins.diagnostics

-- config for format on save
local on_attach = function(client)
	if client.server_capabilities.documentFormattingProvider then
		vim.cmd("nnoremap <silent><buffer> <Leader>f :lua vim.lsp.buf.format()<CR>")
		vim.cmd("autocmd BufWritePost <buffer> lua vim.lsp.buf.format()")
	end
	if client.server_capabilities.documentRangeFormattingProvider then
		vim.cmd("xnoremap <silent><buffer> <Leader>f :lua vim.lsp.buf.range_formatting({})<CR>")
	end
end

-- Init Config
null_ls.setup({
	debug = false,
	sources = {
		formatting.stylua,
		formatting.prettierd,
	},
	-- on_attach = format_on_save,
	on_attach = on_attach,
})
