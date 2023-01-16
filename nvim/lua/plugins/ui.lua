return {
  {
    "akinsho/bufferline.nvim",
    keys = function()
      local bufferline = require("bufferline")
      local function close_all_buffers()
        for _, e in ipairs(bufferline.get_elements().elements) do
          vim.schedule(function()
            vim.cmd("bd " .. e.id)
          end)
        end
      end

      local function close_all_but_this_one_buffers()
        bufferline.close_in_direction("right")
        bufferline.close_in_direction("left")
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
}
--   b = {
--   },
