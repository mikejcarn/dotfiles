local M = {}

-- Setup function for global Diagnostic & UI Settings >>>>>
M.setup = function()
	-- Sign column signs
	local signs = {
		{ name = "DiagnosticSignError", text = "" },
		{ name = "DiagnosticSignWarn", text = "" },
		{ name = "DiagnosticSignInfo", text = "" },
		{ name = "DiagnosticSignHint", text = "" }, -- ""
	}

	for _, sign in ipairs(signs) do
		vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
	end

	-- Diagnostic settings
	vim.diagnostic.config({
		virtual_text = true,
		signs = {
			active = signs,
		},
		update_in_insert = true,
		underline = true,
		severity_sort = true,
		float = {
			focusable = false,
			style = "minimal",
			border = "rounded",
			source = "always",
			header = "",
			prefix = "",
		},
	})
end

-- Set rounded corners on pop-ups
for _, handler in ipairs({"textDocument/hover", "textDocument/signatureHelp"}) do
  vim.lsp.handlers[handler] = vim.lsp.with(vim.lsp.handlers[handler], {
    border = "rounded",
    width = 60,
  })
end

-- Vars for on_attach function for LSPs >>>>>>>>>>>>>>>>>>>

-- Highlight text on hover
local function lsp_highlight_document(client)
	-- Set autocommands conditional on server_capabilities
	local status, illuminate = pcall(require, "illuminate")
	if not status then
		return
	end
	illuminate.on_attach(client)
	-- end
end

-- LSP Mappings
local function lsp_keymaps(bufnr)
	local bufopts = { noremap = true, silent = true }
	-- vim.api.nvim_buf_set_keymap(bufnr, "n", "<C-Space>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
	-- vim.api.nvim_buf_set_keymap(bufnr, "i", "<C-Space>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
	-- vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
	-- vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>f", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
	-- vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>q", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)
	vim.keymap.set("n", "gf", vim.lsp.buf.definition, bufopts)
	vim.keymap.set("n", "gF", vim.lsp.buf.references, bufopts)
	vim.keymap.set("n", "gd", vim.lsp.buf.declaration, bufopts)
	vim.keymap.set("n", "gt", vim.lsp.buf.hover, bufopts)
	vim.keymap.set("n", "gr", vim.lsp.buf.rename, bufopts)
	vim.keymap.set("n", "gk", vim.diagnostic.goto_prev, bufopts)
	vim.keymap.set("n", "gj", vim.diagnostic.goto_next, bufopts)
	vim.keymap.set("n", "g;", vim.lsp.buf.implementation, bufopts)
	vim.keymap.set("n", "gi", vim.diagnostic.open_float, bufopts)
	vim.cmd([[ command! Format execute 'lua vim.lsp.buf.format{async=true}' ]])
end

-- Define on_attach function for handler export

M.on_attach = function(client, bufnr)
	if client.name == "ts_ls" then
		client.server_capabilities.documentFormattingProvider = false
	end
	lsp_keymaps(bufnr)
	lsp_highlight_document(client)
  client.server_capabilities.semanticTokensProvider = nil
end

-- Completions & unique server capabilities >>>>>>>>>>>>>>>

local capabilities = vim.lsp.protocol.make_client_capabilities()

-- Check completions setup status
local status, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status then
	return
end

-- Attach capabilities to handler export
M.capabilities = cmp_nvim_lsp.default_capabilities(capabilities)

-- Export handler module >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

return M
