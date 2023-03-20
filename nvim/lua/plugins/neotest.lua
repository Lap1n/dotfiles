return {
  {
    "nvim-neotest/neotest",
    -- event = "BufEnter",
    lazy = false,
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
      local function run_test_strategy()
        test_strategy.env = vim.env
        print(test_strategy.env.PYTHONPATH)
        require("neotest").run.run(test_strategy)
      end
      return {
        { "<leader>ta", ":lua require('neotest').run.run(vim.fn.expand('%'))<cr>", desc = "Run all test" },
        { "<leader>tt", run_test_strategy, desc = "Run nearest test" },
        { "<leader>to", ":lua require('neotest').output_panel.toggle()<cr>", desc = "Output panel" },
        { "<leader>tr", ":lua require('neotest').output.open()<cr>", desc = "Test result" },
        { "<leader>tf", "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<cr>", desc = "Run nearest test" },
        { "<leader>td", toggle_debug_test, desc = "Toggle debug mode" },
      }
    end,
    opts = function()
      return {
        adapters = {
          require("neotest-python")({
            dap = { justMyCode = false },
            runner = function()
              -- vim.env.PYTHONPATH = "PYTHONPATH=$PYTHONPATH:" .. vim.fn.getcwd() .. "/test"
              -- vim.env.PYTHONPATH = "PYTHONPATH=$PYTHONPATH:./test"
              vim.env.PYTHONPATH = "PYTHONPATH=$PYTHONPATH:./tests"
              return "pytest"
            end,
            python = "python3",
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
