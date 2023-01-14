require("mason").setup()
local null_ls = require("null-ls")
null_ls.setup({
	sources = {
		null_ls.builtins.diagnostics.pylint.with({
			diagnostics_postprocess = function(diagnostic)
				diagnostic.code = diagnostic.message_id
			end,
		}),
		null_ls.builtins.formatting.black,
		null_ls.builtins.formatting.stylua
	}
}
)
require("mason-null-ls").setup({
	ensure_installed = nil,
	automatic_installation = true,
	automatic_setup = false,
})
