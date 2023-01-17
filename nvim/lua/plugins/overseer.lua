return {
  {
    "stevearc/overseer.nvim",
    opts = {
      strategy = {
        "toggleterm",
        open_on_start = true, -- load your default shell before starting the task
        use_shell = false,
        -- overwrite the default toggleterm "direction" parameter
        -- direction = "float",
      },
    },
    event = "BufEnter",
    keys = function()
      local restart_last_task = function()
        local overseer = require("overseer")
        local tasks = overseer.list_tasks({ recent_first = true })
        if vim.tbl_isempty(tasks) then
          vim.notify("No tasks found", vim.log.levels.WARN)
        else
          overseer.run_action(tasks[1], "restart")
        end
      end
      local open_last_task = function()
        local overseer = require("overseer")
        local tasks = overseer.list_tasks({ recent_first = true })
        if vim.tbl_isempty(tasks) then
          vim.notify("No tasks found", vim.log.levels.WARN)
        else
          overseer.run_action(tasks[1], "open float")
        end
      end
      return {
        {
          "<leader>op",
          function()
            require("overseer").toggle()
          end,
          desc = "Open task list",
        },
        {
          "<leader>or",
          "<cmd>OverseerRun<cr>",
          desc = "Select and start task",
        },
        {
          "<leader>oR",
          restart_last_task,
          desc = "Restart last task",
        },
        {
          "<leader>oo",
          open_last_task,
          desc = "Open last task result",
        },
      }
    end,
  },
}
