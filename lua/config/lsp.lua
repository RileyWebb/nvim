local lsp = require("lsp-zero").preset({})

lsp.on_attach(function(client, bufnr)
	lsp.default_keymaps({ buffer = bufnr })
end)

-- (Optional) Configure lua language server for neovim
require("lspconfig").lua_ls.setup(lsp.nvim_lua_ls())

lsp.setup()

vim.diagnostic.config({
	signs = true,
	underline = true,
	update_in_insert = false,
	severity_sort = false,
})

lsp.set_sign_icons({
	error = "",
	warn = "",
	hint = "",
	info = "",
})

local function format_diagnostic(diagnostic)
	local icon = ""
	if diagnostic.severity == vim.diagnostic.severity.WARN then
		icon = ""
	elseif diagnostic.severity == vim.diagnostic.severity.INFO then
		icon = ""
	elseif diagnostic.severity == vim.diagnostic.severity.HINT then
		icon = ""
	end

	local message = string.format("%s %s", icon, diagnostic.message)
	if diagnostic.code and diagnostic.source then
		message = string.format("%s [%s][%s] %s", icon, diagnostic.source, diagnostic.code, diagnostic.message)
	elseif diagnostic.code or diagnostic.source then
		message = string.format("%s [%s] %s", icon, diagnostic.code or diagnostic.source, diagnostic.message)
	end

	return message .. " "
end

vim.diagnostic.config({
	virtual_text = false,
	--virtual_text = {
	--	spacing = 2,
	--	prefix = "", -- Could be '●', '▎', 'x'
	--	format = format_diagnostic,
	--},
})

vim.o.updatetime = 500
-- vim.cmd([[autocmd CursorHold * lua if #vim.diagnostic.get(0, { lnum = vim.fn.line(".") - 1 }) == 0 then vim.lsp.buf.hover() else vim.diagnostic.open_float(nil, {focus=false}) end]])
