return {
  -- {
  --   "williamboman/mason.nvim",
  --   dependencies = {
  --     {
  --       "jay-babu/mason-null-ls.nvim",
  --       opts = { ensure_installed = nil, automatic_installation = true, automatic_setup = false },
  --     },
  --   },
  --   opts = {
  --     ensure_installed = {
  --       "stylua",
  --       "shellcheck",
  --       "shfmt",
  --     },
  --   },
  -- },
  {
    "jose-elias-alvarez/null-ls.nvim",
    opts = function()
      local null_ls = require("null-ls")
      return {
        sources = {
          null_ls.builtins.formatting.stylua,
          null_ls.builtins.completion.spell,
          null_ls.builtins.formatting.black,
          null_ls.builtins.formatting.isort,
          null_ls.builtins.formatting.autoflake.with({
            args = { "--remove-all-unused-imports", "--stdin-display-name", "$FILENAME", "-" },
          }),
          -- null_ls.builtins.diagnostics.pylint,
        },
      }
    end,
  },
}
