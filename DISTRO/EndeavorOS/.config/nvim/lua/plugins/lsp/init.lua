local status = pcall(require, "lspconfig")
if not status then
	return
end

local status = pcall(require, "nvim-lsp-installer")
if not status then
	return
end

require("plugins.lsp.lspconfig")
require("plugins.lsp.handlers").setup()
require("plugins.lsp.null_ls")
-- require("plugins.lsp.lspsaga")
