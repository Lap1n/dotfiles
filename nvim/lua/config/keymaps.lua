-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local wk = require("which-key")

local test_strategy = {}
local function toggle_debug_test()
  if not next(test_strategy) then
    test_strategy = { strategy = "dap" }
    print("DAP Neotest enabled")
  else
    test_strategy = {}
    print("DAP Neotest disabled")
  end
end
local neotest = require("neotest")
local function run_test_strategy()
  neotest.run.run(test_strategy)
end

-- wk.reset()
-- wk.register({
--   -- f = {
--   -- 	name = "file", -- optional group name
--   -- 	f = { "<cmd>Telescope find_files<cr>", "Find File" }, -- create a binding with label
--   -- 	--r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File", noremap=false, buffer = 123 }, -- additional options for creating the keymap
--   -- 	n = { "New File" }, -- just a label. don't create any mapping
--   -- 	e = "Edit File", -- same as above
--   -- },
--   -- d = {
--   -- 	name = "debug",
--   -- 	u = { "<cmd>lua require('dapui').toggle()<cr>", "Toggle UI" },
--   -- 	b = {
--   -- 		name = "Breakpoint",
--   -- 		b = { "<cmd>lua require('persistent-breakpoints.api').toggle_breakpoint()<cr>", "Toggle breakpoint" },
--   -- 		c = {
--   -- 			"<cmd>lua require('persistent-breakpoints.api').set_conditional_breakpoint()<cr>",
--   -- 			"Conditional breakpoint",
--   -- 		},
--   -- 		d = {
--   -- 			"<cmd>lua require('persistent-breakpoints.api').clear_all_breakpoints()<cr>",
--   -- 			"Clear all breakpoints",
--   -- 		},
--   -- 	},
--   -- },
--   t = {
--     name = "Test",
--     a = { ":lua require('neotest').run.run(vim.fn.expand('%'))<cr>", "Run all test" },
--     t = { run_test_strategy, "Run nearest test" },
--     o = { ":lua require('neotest').output_panel.toggle()<cr>", "Output panel" },
--     r = { ":lua require('neotest').output.open()<cr>", "Test result" },
--     f = { "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<cr>", "Run nearest test" },
--     d = { toggle_debug_test, "Toggle debug mode" },
--   },
--   l = {
--     name = "lsp",
--     d = { "<cmd>Telescope diagnostics<cr>", "List diagnotics" },
--     q = { "<cmd>lua vim.lsp.buf.code_action()<CR>", "Quickfix" },
--   },
-- }, { prefix = "<leader>" })
