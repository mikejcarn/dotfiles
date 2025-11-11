-- return {
-- 	{
-- 		"williamboman/mason.nvim",
-- 		opts = {
-- 			ui = {
-- 				border = "none",
-- 				width = 1.0,
-- 				height = 1.0,
-- 			},
-- 		},
-- 	},
-- 	{
-- 		"williamboman/mason-lspconfig.nvim",
-- 		opts = {
-- 			ensure_installed = { "lua_ls", "bashls", "pylsp", "cssls" },
-- 		},
-- 	},
-- 	{
-- 		"neovim/nvim-lspconfig",
-- 		lazy = false,
-- 		priority = 1000,
-- 		config = function()
-- 			local lspconfig = require("lspconfig")
--
-- 			local handlers = require("plugins.lsp.handlers")
-- 			require("plugins.lsp.handlers").setup()
--
-- 			local capabilities =
-- 				require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
--
-- 			local root_dir = function()
-- 				return vim.loop.cwd()
-- 			end
--
-- 			-- lua-language-server ------------------------------
-- 			lspconfig["lua_ls"].setup({
-- 				on_attach = handlers.on_attach,
-- 				capabilities = capabilities,
-- 				root_dir = root_dir,
-- 				settings = {
-- 					Lua = {
-- 						runtime = {
-- 							-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
-- 							version = "LuaJIT",
-- 						},
-- 						diagnostics = {
-- 							-- Get the language server to recognize the `vim` global
-- 							globals = { "vim" },
-- 						},
-- 						workspace = {
-- 							-- Make the server aware of Neovim runtime files
-- 							library = vim.api.nvim_get_runtime_file("", true),
-- 							checkThirdParty = false,
-- 						},
-- 						-- Do not send telemetry data containing a randomized but unique identifier
-- 						telemetry = {
-- 							enable = false,
-- 						},
-- 					},
-- 				},
-- 			})
--
-- 			-- -- typescript-language-server -----------------------
-- 			-- lspconfig["tsp-server"].setup({
-- 			-- 	on_attach = handlers.on_attach,
-- 			-- 	capabilities = capabilities,
-- 			-- })
--
-- 			-- css-language-server ------------------------------
-- 			lspconfig["cssls"].setup({
-- 				on_attach = handlers.on_attach,
-- 				capabilities = capabilities,
-- 			})
--
-- 			-- bash-language-server -----------------------------
-- 			lspconfig["bashls"].setup({
-- 				on_attach = handlers.on_attach,
-- 				capabilities = capabilities,
-- 			})
--
-- 			-- python-language-server ---------------------------
-- 			lspconfig["pylsp"].setup({
-- 				on_attach = handlers.on_attach,
-- 				capabilities = capabilities,
-- 				settings = {
-- 					pylsp = {
-- 						plugins = {
-- 							pycodestyle = {
-- 								ignore = { "W391", "E501" },
-- 							},
-- 						},
-- 					},
-- 				},
-- 			})
-- 		end,
-- 	},
-- }

return {
  {
    "williamboman/mason.nvim",
    opts = {
      ui = {
        border = "none",
        width = 1.0,
        height = 1.0,
      },
    },
  },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      ensure_installed = { "lua_ls", "bashls", "pylsp", "cssls" },
    },
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    priority = 1000,
    config = function()
      local handlers = require("plugins.lsp.handlers")
      require("plugins.lsp.handlers").setup()

      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      -- lua-language-server ------------------------------
      vim.lsp.enable("lua_ls", {
        on_attach = handlers.on_attach,
        capabilities = capabilities,
        settings = {
          Lua = {
            runtime = { version = "LuaJIT" },
            diagnostics = { globals = { "vim" } },
            workspace = {
              library = vim.api.nvim_get_runtime_file("", true),
              checkThirdParty = false,
            },
            telemetry = { enable = false },
          },
        },
      })

      -- css-language-server ------------------------------
      vim.lsp.enable("cssls", {
        on_attach = handlers.on_attach,
        capabilities = capabilities,
      })

      -- bash-language-server -----------------------------
      vim.lsp.enable("bashls", {
        on_attach = handlers.on_attach,
        capabilities = capabilities,
      })

      -- python-language-server ---------------------------
      vim.lsp.enable("pylsp", {
        on_attach = handlers.on_attach,
        capabilities = capabilities,
        settings = {
          pylsp = {
            plugins = {
              pycodestyle = {
                ignore = { "W391", "E501" },
              },
            },
          },
        },
      })
    end,
  },
}
