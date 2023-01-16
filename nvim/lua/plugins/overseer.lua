return {
  {
    "stevearc/overseer.nvim",
    opts = {},
    event = "BufEnter",
    keys = {
      {
        "<leader>op",
        function()
          require("overseer").toggle()
        end,
        desc = "Open task list",
      },
      {
        "<leader>or",
        "<cmd>OverseerRun",
        desc = "Select and start task",
      },
    },
  },
}
