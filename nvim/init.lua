-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
vim.filetype.add({
  extension = {
    hx = "haxe",
  },
})
local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
parser_config.haxe = {
  install_info = {
    url = "https://github.com/vantreeseba/tree-sitter-haxe",
    files = { "src/parser.c" },
    -- optional entries:
    branch = "main",
  },
  filetype = "haxe",
}
