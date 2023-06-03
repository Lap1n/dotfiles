return {
  {
    dir = "~/nvim_plugins/launcher.nvim",
    name = "launcher.nvim",
    lazy = false,
    config = function()
      require("launcher")
    end,
  },
}
