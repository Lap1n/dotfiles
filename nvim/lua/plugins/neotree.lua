return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      --  default_source = "git_status",
      use_libuv_file_watcher = true,
      filesystem = {
        follow_current_file = true,
      },
      window = {
        width = 25,
      },
    },
  },
}
