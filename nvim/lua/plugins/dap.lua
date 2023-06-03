return {
  {
    "mfussenegger/nvim-dap",
    event = "BufEnter",
    keys = {
      { "<leader>du", "<cmd>lua require('dapui').toggle()<cr>", desc = "Toggle UI" },
      {
        "<leader>db",
        "<cmd>lua require('persistent-breakpoints.api').toggle_breakpoint()<cr>",
        desc = "Toggle breakpoint",
      },
      {
        "<leader>dn",
        "<cmd>lua require('persistent-breakpoints.api').set_conditional_breakpoint()<cr>",
        desc = "Conditional breakpoint",
      },
      {
        "<leader>dc",
        "<cmd>lua require('persistent-breakpoints.api').clear_all_breakpoints()<cr>",
        desc = "Clear all breakpoints",
      },
      {
        "<F9>",
        "<cmd>lua require('dap').continue()<cr>",
        desc = "Resume",
      },
      {
        "<F8>",
        "<cmd>lua require('dap').step_over()<cr>",
        desc = "Step over",
      },
      {
        "<F7>",
        "<cmd>lua require('dap').step_into()<cr>",
        desc = "Step into",
      },
      {
        "<F5>",
        "<cmd>lua require('dap').toggle_breakpoint()<cr>",
        desc = "Toggle line breakpoint",
      },
      {
        "<F10>",
        "<cmd>lua require('dap').restart()<cr>",
        desc = "Restart current session",
      },
    },

    dependencies = {
      {
        "rcarriga/nvim-dap-ui",
        dependencies = { "mfussenegger/nvim-dap" },
        opts = {},
        -- keys = function()
        --   local hover = function()
        --     -- vim.lsp.buf.hover()
        --   end
        --   -- vim.keymap.del("n", "K")
        --   -- vim.keymap.del("n", "K""
        --   -- vim.api.nvim_set_keymap(mode, lhs, rhs, options)
        --   return {
        --     -- { "K", "<Cmd>lua require('dapui').eval()<CR>", desc = "Eval expression" },
        --     { "K", hover, desc = "Eval expression" },
        --   }
        -- end,
        init = function()
          local dap = require("dap")
          local dapui = require("dapui")
          dap.listeners.after.event_initialized["dapui_config"] = function()
            dapui.open({})
          end
          dap.listeners.before.event_terminated["dapui_config"] = function()
            -- dapui.close({})
          end
          dap.listeners.before.event_exited["dapui_config"] = function()
            -- dapui.close({})
          end
        end,
      },
      { "theHamsta/nvim-dap-virtual-text", opts = {} },
      { "Weissle/persistent-breakpoints.nvim", opts = {
        load_breakpoints_event = { "BufReadPost" },
      } },
    },
    {
      "jay-babu/mason-nvim-dap.nvim",
      opts = {
        ensure_installed = { "python" },
        automatic_setup = true,
        init = function()
          --require("mason-nvim-dap").setup_handlers()
        end,
      },
    },
  },
}

--require 'mason-nvim-dap'.setup_handlers {}
-- require 'mason-nvim-dap'.setup_handlers {
--     function(source_name)
--       -- all sources with no handler get passed here
--
--
--       -- Keep original functionality of `automatic_setup = true`
--       require('mason-nvim-dap.automatic_setup')(source_name)
--     end,
--     python = function(source_name)
--         dap.adapters.python = {
-- 	        type = "executable",
-- 	        command = "/usr/bin/python3",
-- 	        args = {
-- 		        "-m",
-- 		        "debugpy.adapter",
-- 	        },
--         }
--
--         dap.configurations.python = {
-- 	        {
-- 		        type = "python",
-- 		        request = "launch",
-- 		        name = "Launch file",
-- 		        program = "${file}", -- This configuration will launch the current file if used.
-- 	        },
--         }
--     end,
-- }
--
--
