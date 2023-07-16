local util = require("formatter.util")

require("formatter").setup({
	logging = true,
	log_level = vim.log.levels.WARN,

	filetype = {
		c = {
			require("formatter.filetypes.c").clangformat,
		},
		cmake = {
			require("formatter.filetypes.cmake").cmakeformat,
		},
		cs = {
			require("formatter.filetypes.cs").dotnetformat,
		},
		lua = {
			require("formatter.filetypes.lua").stylua,
		},
		json = {
			require("formatter.filetypes.json").prettier,
		},
		sh = {
			require("formatter.filetypes.sh").shfmt,
		},
		yaml = {
			require("formatter.filetypes.yaml").prettier,
		},
		["*"] = {
			require("formatter.filetypes.any").remove_trailing_whitespace,
		},
	},
})

-- Format On Save
--vim.cmd([[
--augroup FormatAutogroup
--  autocmd!
--  autocmd BufWritePost * FormatWrite
--augroup END
--]])
