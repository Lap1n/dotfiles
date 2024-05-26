-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
local map = LazyVim.safe_keymap_set
map("n", "<leader>dd", function()
  -- require("dap-python").resolve_python = function()
  --   return vim.fn.getcwd() + "/.venv/bin/python"
  -- end
  -- (Re-)reads launch.json if present
  if vim.fn.filereadable(".vscode/launch.json") then
    -- require("dap.ext.vscode").load_launchjs(nil)
    local dap = require("dap")
    dap.configurations = {}
    require("dap.ext.vscode").load_launchjs()
  end
  require("dap").continue()
end, { desc = "Launch debug" })
