return {
  {
    "jackMort/ChatGPT.nvim",
    -- opts = {},
    config = function()
      require("chatgpt").setup({
        -- optional configuration
      })
    end,
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
    -- cmd = "ChatGPT",
    lazy = false,
    keys = {
      { "n", "<leader>cg", "<cmd>ChatGPT<CR>" },
    },
  },
  {
    "dpayne/CodeGPT.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
    },
    cmd = "CodeGPT",
    config = function()
      require("codegpt.config")
    end,
  },
}
