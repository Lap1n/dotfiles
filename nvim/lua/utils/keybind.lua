local wk = require("which-key")

local Keybind = {}

Keybind.add_global_keybinds = function (keybinds)
  for _, keybind in pairs(keybinds) do
    if(keybind[4] == nil)  then
      keybind[4] = {}
    end

    vim.api.nvim_set_keymap(
        keybind[1],
        keybind[2],
        keybind[3],
        keybind[4]
    )
  end
end

Keybind.add_buffer_keybinds = function (keybinds)
  for _, keybind in pairs(keybinds) do
    if(keybind[5] == nil)  then
      keybind[5] = {}
    end

    vim.api.nvim_buf_set_keymap(
        keybind[1],
        keybind[2],
        keybind[3],
        keybind[4],
        keybind[5]
    )
  end
end

-- opts : 
-- {
--  mode = "n", -- NORMAL mode
--  prefix: use "<leader>f" for example for mapping everything related to finding files
--  the prefix is prepended to every mapping part of `mappings`
--  prefix = "", 
--  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
--  silent = true, -- use `silent` when creating keymaps
--  noremap = true, -- use `noremap` when creating keymaps
--  nowait = false, -- use `nowait` when creating keymaps
--}
Keybind.register_which_key_keybinds = function(mappings,opts)
  wk.register(mappings,opts)
end

Keybind.g = Keybind.add_global_keybinds
Keybind.b = Keybind.add_buffer_keybinds

return Keybind


