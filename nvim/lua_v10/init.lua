-- NEOVIM Initializer >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

require("config.options") -- (vim.opt) settings
---
vim.g.colorscheme = "Marakai" -- global colorscheme
---
require("config.lazy") --  plugin loader (lazy.nvim)
---
require("config.keymappings")
---
require("config.colorschemes")
