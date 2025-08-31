-- Settings
require("settings")
require("mappings")
require("colorschemes")

-- General Plugins
require("plugins.packer") -- installer
require("plugins.configs")
require("plugins.toggleterm")
require("plugins.gitsigns")

-- Diagnostics + Completion Plugins
require("plugins.lsp")
require("plugins.cmp")
require("plugins.luasnip")
require("plugins.treesitter")
