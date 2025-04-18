return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "leoluz/nvim-dap-go",
      "nvim-neotest/nvim-nio"
    },
    config = function()
      local dap, dapui = require("dap"), require("dapui")

      -- Setup dap-ui
      dapui.setup()

      -- Setup dap-go (optional)
      require("dap-go").setup()

      -- Open dap-ui automatically on session start
      dap.listeners.before.attach.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated.dapui_config = function()
        dapui.close()
      end
      dap.listeners.before.event_exited.dapui_config = function()
        dapui.close()
      end

      -- Create a proper Neovim command for toggling dap-ui
      vim.api.nvim_create_user_command("DapUiToggle", function()
        dapui.toggle()
      end, { desc = "Toggle DAP UI" })

      -- Keymaps for Debugging
      vim.keymap.set("n", "<Leader>dt", function() dapui.toggle() end, { desc = "Toggle DAP UI" })
      vim.keymap.set("n", "<Leader>db", function() dap.toggle_breakpoint() end, { desc = "Toggle Breakpoint" })
      vim.keymap.set("n", "<Leader>dc", function() dap.continue() end, { desc = "Continue Debugging" })
      vim.keymap.set("n", "<Leader>dr", function() dapui.open({ reset = true }) end, { desc = "Restart DAP UI" })

      -- Define breakpoint sign
      vim.fn.sign_define("DapBreakpoint", { text = "⏺", texthl = "DapBreakpoint", linehl = "", numhl = "" })
    end,
  },

  {
    "mfussenegger/nvim-dap-python",
    ft = "python",
    dependencies = { "mfussenegger/nvim-dap" },
    config = function(_, opts)
      local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python3"
      require("dap-python").setup(path)
    end,
  },
}
