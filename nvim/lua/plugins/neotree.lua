return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    default_source = "git_status",
    opts = {
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
