vim.api.nvim_exec(
    [[
  nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
  nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
  nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
  nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
]],
    true
)
local actions = require("telescope.actions")
-- Global remapping
------------------------------
require("telescope").setup {
    defaults = {
        mappings = {
            i = {
                -- To disable a keymap, put [map] = false
                -- So, to not map "<C-n>", just put
                ["<C-k>"] = actions.move_selection_previous,
                ["<C-j>"] = actions.move_selection_next
            }
        }
    },
    extensions = {
        fzf_writer = {
            minimum_grep_characters = 2,
            minimum_files_characters = 2,
            -- Disabled by default.
            -- Will probably slow down some aspects of the sorter, but can make color highlights.
            -- I will work on this more later.
            use_highlighter = true
        }
    }
}

require("telescope").load_extension("fzy_native")
