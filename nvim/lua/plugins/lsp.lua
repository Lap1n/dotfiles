return {
  {
    "neovim/nvim-lspconfig",
    keys = {
      { "<leader>ld", "<cmd>Telescope diagnostics<cr>", desc = "List diagnotics" },
      { "<leader>lq", "<cmd>lua vim.lsp.buf.code_action()<CR>", desc = "Quickfix" },
      { "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<CR>", desc = "Rename" },
      { "gi", "<cmd>lua require('telescope.builtin').lsp_implementations()<CR>", desc = "Rename" },
    },
    ---@class PluginLspOpts
    opts = {
      --   ---@type lspconfig.options
      servers = {
        -- LSPs will be automatically installed with mason and loaded with lspconfig
        -- pylsp = {},
        pyright = {},
        gopls = {},
        jsonls = {},
        sumneko_lua = {},
        dockerls = {},
        -- lua_ls = {},
      },
      format = {
        formatting_options = {
          tabSize = 4,
          insertSpaces = true,
        },
      },
    },
  },
  {
    "folke/trouble.nvim",
    -- opts will be merged with the parent spec
    keys = { {
      "<leader>lt",
      "<cmd>TroubleToggle<cr>",
      desc = "Trouble",
    } },
    opts = { use_diagnostic_signs = true },
  },
  {
    "simrat39/symbols-outline.nvim",
    -- opts will be merged with the parent spec
    keys = { {
      "<leader>lv",
      "<cmd>SymbolsOutline<cr>",
      desc = "Symbol Outline",
    } },
    opts = {},
    cmd = "SymbolsOutline",
  },
}
