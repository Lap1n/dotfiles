return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "antoinemadec/FixCursorHold.nvim",
      "nvim-neotest/neotest-python",
      "nvim-neotest/neotest-plenary",
      "nvim-neotest/neotest-vim-test",
    },
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
