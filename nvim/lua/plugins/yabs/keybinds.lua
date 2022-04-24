local mapping = {
	f = {
		name = "tasks", -- optional group name
		b = { ":lua require('yabs'):run_task('build')<CR>", "Build" },
		r = { ":lua require('yabs'):run_task('run')<CR>", "Run" },
		f = { ":lua require('yabs'):run_task('build_and_run')<CR>", "Build & Run" },
		-- f = { "AsyncTask build && AsyncTask run", "Build & Run" },
	},
}

-- Keybind.g({
-- 	-- take from left
-- 	{ "n", "<tab>", "<cmd>:BufferNext<CR>", { noremap = false, silent = true } },
-- 	{ "n", "<s-tab>", "<cmd>:BufferPrevious<CR>", { noremap = false, silent = true } },
-- })
Keybind.register_which_key_keybinds(mapping, { prefix = "<leader>" })
