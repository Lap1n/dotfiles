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

vim.keymap.set("n", "<tab>", ":BufferLineCycleNext<cr>")
vim.keymap.set("n", "<s-tab>", ":BufferLineCyclePrev<cr>")

wk.register({
  -- f = {
  -- 	name = "file", -- optional group name
  -- 	f = { "<cmd>Telescope find_files<cr>", "Find File" }, -- create a binding with label
  -- 	--r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File", noremap=false, buffer = 123 }, -- additional options for creating the keymap
  -- 	n = { "New File" }, -- just a label. don't create any mapping
  -- 	e = "Edit File", -- same as above
  -- },
  -- d = {
  -- 	name = "debug",
  -- 	u = { "<cmd>lua require('dapui').toggle()<cr>", "Toggle UI" },
  -- 	b = {
  -- 		name = "Breakpoint",
  -- 		b = { "<cmd>lua require('persistent-breakpoints.api').toggle_breakpoint()<cr>", "Toggle breakpoint" },
  -- 		c = {
  -- 			"<cmd>lua require('persistent-breakpoints.api').set_conditional_breakpoint()<cr>",
  -- 			"Conditional breakpoint",
  -- 		},
  -- 		d = {
  -- 			"<cmd>lua require('persistent-breakpoints.api').clear_all_breakpoints()<cr>",
  -- 			"Clear all breakpoints",
  -- 		},
  -- 	},
  -- },
  t = {
    name = "Test",
    a = { ":lua require('neotest').run.run(vim.fn.expand('%'))<cr>", "Run all test" },
    t = { run_test_strategy, "Run nearest test" },
    o = { ":lua require('neotest').output_panel.toggle()<cr>", "Output panel" },
    r = { ":lua require('neotest').output.open()<cr>", "Test result" },
    f = { "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<cr>", "Run nearest test" },
    d = { toggle_debug_test, "Toggle debug mode" },
  },
  b = {
    -- d = { "<cmd>bdelete<cr>", "Close buffer" },
    a = { close_all_buffers, "Close all buffer" },
    c = { close_all_but_this_one_buffers, "Close all but this buffer" },
    -- l = { "<cmd>Telescope buffers<cr>", "Switch buffers" },
  },
  w = { "<cmd>HopWord<cr>", "Hop" },
  s = {
    name = "search",
    f = { "<cmd>Telescope find_files<cr>", "Search files" },
    p = { ":lua require'telescope'.extensions.projects.projects{}<cr>", "Search files" },
    s = { "<cmd>Telescope find_files<cr>", "Search files" },
    t = { "<cmd>Telescope live_grep<cr>", "Search text" },
    [";"] = { "<cmd>:Legendary<cr>", "Search commands" },
    b = { "<cmd>Telescope current_buffer_fuzzy_find<cr>", "Search current buffer" },
    h = { "<cmd>Telescope frecency workspace=CWD<cr>", "Search recent files" },
  },
  l = {
    name = "lsp",
    d = { "<cmd>Telescope diagnostics<cr>", "List diagnotics" },
  },
}, { prefix = "<leader>" })
