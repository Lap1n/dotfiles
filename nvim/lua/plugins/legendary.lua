return {
  {
    "mrjones2014/legendary.nvim",
    cmd = "Legendary",
    dependencies = { { "kkharji/sqlite.lua" } },
    keys = {
      { "<leader>s;", "<cmd>:Legendary<cr>", desc = "Legendary" },
    },

    opts = {
      which_key = {
        -- Automatically add which-key tables to legendary
        -- see ./doc/WHICH_KEY.md for more details
        auto_register = true,
        -- you can put which-key.nvim tables here,
        -- or alternatively have them auto-register,
        -- see ./doc/WHICH_KEY.md
        mappings = {},
        opts = {},
        -- controls whether legendary.nvim actually binds they keymaps,
        -- or if you want to let which-key.nvim handle the bindings.
        -- if not passed, true by default
        do_binding = true,
      },
    },
  },
}
