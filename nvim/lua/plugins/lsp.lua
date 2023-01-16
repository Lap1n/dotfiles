return {
  {
    "neovim/nvim-lspconfig",
    keys = {
      { "<leader>ld", "<cmd>Telescope diagnostics<cr>", desc = "List diagnotics" },
      { "<leader>lq", "<cmd>lua vim.lsp.buf.code_action()<CR>", desc = "Quickfix" },
    },
    ---@class PluginLspOpts
    opts = {
      ---@type lspconfig.options
      servers = {
        -- LSPs will be automatically installed with mason and loaded with lspconfig
        pyright = {},
        jsonls = {},
      },
    },
  },
}
