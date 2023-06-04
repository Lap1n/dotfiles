return {
  {
    "akinsho/bufferline.nvim",
    keys = function()
      local function close_all_buffers()
        for _, e in ipairs(require("bufferline").get_elements().elements) do
          vim.schedule(function()
            vim.cmd("bd " .. e.id)
          end)
        end
      end

      local function close_all_but_this_one_buffers()
        require("bufferline").close_in_direction("right")
        require("bufferline").close_in_direction("left")
      end
      return {
        { "<tab>", "<cmd>BufferLineCycleNext<cr>", "n" },
        { "<s-tab>", "<cmd>BufferLineCyclePrev<cr>", "n" },
        { "<leader>bd", "<cmd>bdelete<cr>", desc = "Close Buffer" },
        { "<leader>ba", close_all_buffers, desc = "Close all buffer" },
        { "<leader>bc", close_all_but_this_one_buffers, desc = "Close all but this buffer" },
      }
    end,
  },
  -- {
  --   "utilyre/barbecue.nvim",
  --   name = "barbecue",
  --   version = "*",
  --   event = "BufEnter",
  --   dependencies = {
  --     "SmiteshP/nvim-navic",
  --     "nvim-tree/nvim-web-devicons", -- optional dependency
  --   },
  --   opts = {
  --     -- configurations go here
  --   },
  -- },
  -- {
  --   "echasnovski/mini.starter",
  --   opts = function()
  --     local logo = table.concat({
  --       "██╗      █████╗ ███████╗██╗   ██╗██╗   ██╗██╗███╗   ███╗          Z",
  --       "██║     ██╔══██╗╚══███╔╝╚██╗ ██╔╝██║   ██║██║████╗ ████║      Z",
  --       "██║     ███████║  ███╔╝  ╚████╔╝ ██║   ██║██║██╔████╔██║   z",
  --       "██║     ██╔══██║ ███╔╝    ╚██╔╝  ╚██╗ ██╔╝██║██║╚██╔╝██║ z",
  --       "███████╗██║  ██║███████╗   ██║    ╚████╔╝ ██║██║ ╚═╝ ██║",
  --       "╚══════╝╚═╝  ╚═╝╚══════╝   ╚═╝     ╚═══╝  ╚═╝╚═╝     ╚═╝",
  --     }, "\n")
  --     return {
  --       header = logo,
  --     }
  --   end,
  -- },
}
