local nvim_lsp = require "lspconfig"

local pid = vim.fn.getpid()
-- On linux/darwin if using a release build, otherwise under scripts/OmniSharp(.Core)(.cmd)
local omnisharp_bin = os.getenv("HOME") .. "/Softwares/omnisharp-linux-x64/run"
-- on Windows
-- local omnisharp_bin = "/path/to/omnisharp/OmniSharp.exe"
nvim_lsp.omnisharp.setup {
    cmd = {omnisharp_bin, "--languageserver", "--hostPID", tostring(pid)}
}
