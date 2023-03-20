return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      --  default_source = "git_status",
      use_libuv_file_watcher = true,
      filesystem = {
        follow_current_file = true,
        filtered_items = {
          visible = true,
          hide_gitignored = false,
        },
      },
      window = {
        width = 25,
      },
    },
  },
}
