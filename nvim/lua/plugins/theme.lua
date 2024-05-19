return {
  { "m-demare/hlargs.nvim" },
  "catppuccin/nvim",
  name = "catppuccin",
  opts = {
    styles = {
      comments = { "italic" },
      conditionals = { "italic" },
      loops = {},
      functions = {},
      keywords = {},
      strings = {},
      variables = {},
      numbers = {},
      booleans = {},
      properties = {},
      types = {},
      operators = {},
    },
    integrations = {
      cmp = true,
      gitsigns = true,
      nvimtree = true,
      telescope = true,
      notify = true,
      mini = true,
      -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
      treesitter = true,
      treesitter_context = true,
    },
    custom_highlights = function(colors)
      return {
        ["@parameter"] = { style = {} },
        ["@variable"] = { style = {} },
        Hlargs = { fg = "#FFFFFF", style = { "italic" } },
      }
    end,
  },
}
