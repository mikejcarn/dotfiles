return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = function()
      require("nvim-treesitter.install").update({ with_sync = true })
    end,
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = {
        },
        auto_install = true, -- FIX: Disable auto-install for now
        highlight = {
          enable = true,
          disable = { "" },
        },
      })
    end,
  },
  "nvim-treesitter/playground",
  { 
    "windwp/nvim-ts-autotag", 
    config = true 
  },
  {
    "HiPhish/rainbow-delimiters.nvim",
    config = function()
      local rainbow_delimiters = require("rainbow-delimiters")
      vim.g.rainbow_delimiters = {
        strategy = {
          [""] = rainbow_delimiters.strategy["global"],
          vim = rainbow_delimiters.strategy["local"],
          html = rainbow_delimiters.strategy["local"],
        },
        query = {
          [""] = "rainbow-delimiters",
        },
        highlight = {
          "RainbowDelimiterYellow",
          "RainbowDelimiterBlue",
          "RainbowDelimiterOrange",
          "RainbowDelimiterGreen",
          "RainbowDelimiterCyan",
          "RainbowDelimiterViolet",
          "RainbowDelimiterRed",
        },
      }
    end,
  },
}
