-- Lspconfig + Nvim-lsp-installer Init >>>>>>>>>>>>>>>>>>>>

local lspconfig = require("lspconfig")

local lsp_installer = require("nvim-lsp-installer")

-- Setup Configurations -----------------------------------

local servers = { "sumneko_lua", "emmet_ls", "tsserver" }

-- nvim-lsp-installer config
lsp_installer.setup({
	ensure_installed = servers,
	automatic_installation = true,
})

-- lspconfig
for _, server in pairs(servers) do
	local opts = {
		on_attach = require("plugins.lsp.handlers").on_attach,
		capabilities = require("plugins.lsp.handlers").capabilities,
		root_dir = function()
			return vim.loop.cwd()
		end,
	}
	local has_custom_opts, server_custom_opts = pcall(require, "plugins.lsp.server_configs." .. server)
	if has_custom_opts then
		opts = vim.tbl_deep_extend("force", opts, server_custom_opts)
	end
	lspconfig[server].setup(opts)
end
