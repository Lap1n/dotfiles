return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "antoinemadec/FixCursorHold.nvim",
      "nvim-neotest/neotest-python",
      "nvim-neotest/neotest-plenary",
      "nvim-neotest/neotest-vim-test",
    },
    keys = function()
      local test_strategy = {}
      local function toggle_debug_test()
        if not next(test_strategy) then
          test_strategy = { strategy = "dap" }
          print("DAP Neotest enabled")
        else
          test_strategy = {}
          print("DAP Neotest disabled")
        end
      end
      local neotest = require("neotest")
      local function run_test_strategy()
        neotest.run.run(test_strategy)
      end
      return {
        { "<leader>a", ":lua require('neotest').run.run(vim.fn.expand('%'))<cr>", desc = "Run all test" },
        { "<leader>t", run_test_strategy, desc = "Run nearest test" },
        { "<leader>o", ":lua require('neotest').output_panel.toggle()<cr>", desc = "Output panel" },
        { "<leader>r", ":lua require('neotest').output.open()<cr>", desc = "Test result" },
        { "<leader>f", "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<cr>", desc = "Run nearest test" },
        { "<leader>d", toggle_debug_test, desc = "Toggle debug mode" },
      }
    end,
    config = function()
      return {
        adapters = {
          require("neotest-python")({
            dap = { justMyCode = false },
            runner = function()
              -- vim.env.PYTHONPATH = "PYTHONPATH=$PYTHONPATH:" .. vim.fn.getcwd() .. "/test"
              vim.env.PYTHONPATH = "PYTHONPATH=$PYTHONPATH:./test"
              return "unittest"
            end,
          }),
          require("neotest-plenary"),
          require("neotest-vim-test")({
            ignore_file_types = { "python", "vim", "lua" },
          }),
        },
      }
    end,
  },
}
