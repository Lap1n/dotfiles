local lspconfig = require "lspconfig"

lspconfig.clangd.setup {
    cmd = {"clangd-10", "--background-index"}
}
--lspconfig.ccls.setup {
--    init_options = {
--        compilationDatabaseDirectory = "./build",
--        index = {
--            threads = 0
--        },
--        clang = {
--            excludeArgs = {"-frounding-math"}
--        }
--    }
--}
