return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      plugins = { spelling = true, presets = { windows = false } },
      key_labels = { ["<leader>"] = "SPC" },
    },
    config = function(_, opts)
      local wk = require("which-key")
      wk.setup(opts)

      wk.register({
        mode = { "n", "v" },
        ["g"] = { name = "+goto" },
        ["]"] = { name = "+next" },
        ["["] = { name = "+prev" },
        ["<leader><tab>"] = { name = "+tabs" },
        ["<leader>b"] = { name = "+buffer" },
        ["<leader>c"] = { name = "+code" },
        ["<leader>f"] = { name = "+file/find" },
        ["<leader>g"] = { name = "+git" },
        ["<leader>gh"] = { name = "+hunks" },
        ["<leader>q"] = { name = "+quit/session" },
        ["<leader>s"] = { name = "+search" },
        ["<leader>sn"] = { name = "+noice" },
        ["<leader>u"] = { name = "+ui" },
        ["<leader>l"] = { name = "+lsp" },
        ["<leader>d"] = { name = "+debug" },
        ["<leader>o"] = { name = "+overseer" },
        ["<leader>t"] = { name = "+test" },
        ["<leader>x"] = { name = "+diagnostics/quickfix" },
      })
    end,
  },
}
