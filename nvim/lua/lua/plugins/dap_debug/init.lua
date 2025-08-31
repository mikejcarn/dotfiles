return {
  "mfussenegger/nvim-dap",
  cond = false,
  dependencies = {
    { "theHamsta/nvim-dap-virtual-text", opts = { commented = false } },
    { "rcarriga/nvim-dap-ui",            config = true },
    "nvim-telescope/telescope-dap.nvim",
  },
  config = function()
    local dap = require("dap")
    local dap_ui = require("dapui")

    -- Symbols ------------------------------------------------

    vim.fn.sign_define("DapBreakpoint", { text = "■", texthl = "CodewindowError", linehl = "", numhl = "" })
    vim.fn.sign_define(
      "DapBreakpointRejected",
      { text = "✖", texthl = "CodewindowError", linehl = "", numhl = "" }
    )
    vim.fn.sign_define("DapStopped", { text = "●", texthl = "Constant", linehl = "", numhl = "" })

    -- DAP Mappings -------------------------------------------

    -- set keymap function
    local map = function(mode, key, result, options)
      options = options or { noremap = true, silent = true }
      vim.keymap.set(mode, key, result, options)
    end

    -- start/stop dap
    vim.api.nvim_create_user_command("Debug", function()
      dap.continue()
    end, { nargs = 0 })

    map("n", "<leader>dd", function()
      dap.continue()
    end)
    map("n", "<leader>dq", function()
      dap.terminate()
    end)
    map("n", "<leader>dr", function()
      dap.repl.toggle({}, "vsplit")
    end)

    -- breakpoints
    map("n", "<leader>db", function()
      dap.toggle_breakpoint()
    end)
    map("n", "<leader>dB", function()
      dap.clear_breakpoints()
    end)

    -- stepping & navigation
    map("n", "<leader>dj", function()
      dap.step_over()
    end)
    map("n", "<leader>dk", function()
      dap.step_back()
    end)
    map("n", "<leader>dJ", function()
      dap.down()
    end)
    map("n", "<leader>dK", function()
      dap.up()
    end)
    map("n", "<leader>dh", function()
      dap.step_out()
    end)
    map("n", "<leader>dl", function()
      dap.step_into()
    end)
    map("n", "<leader>dn", function()
      dap.run_to_cursor()
    end)

    -- dap_ui
    map("n", "<leader>di", function()
      dap.ui.widgets.hover()
    end)
    map("n", "<A-\\>", function()
      dap_ui.toggle()
    end)

    -- Adapters & Config --------------------------------------

    local adapter_configs = { "javascript_dap" }

    for _, adapter_config in pairs(adapter_configs) do
      require("plugins.dap_debug.adapter_configs." .. adapter_config)
    end
  end,
}
