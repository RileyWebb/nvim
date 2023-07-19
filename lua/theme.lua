if (vim.fn.filereadable('$HOME/.cache/wal/colors-wal.vim') ~= 0) then
    
require("pywal").setup({})

vim.cmd([[colorscheme pywal]])

require("lualine").setup({
	options = {
		theme = "pywal-nvim",
    }
})

vim.cmd([[
function ReloadPywal()
colorscheme pywal

highlight VertSplit guibg=bg guifg=fg
highlight StatusLine cterm=none ctermfg=white ctermbg=black guibg=none
highlight DiagnosticUnderlineError gui=undercurl
highlight DiagnosticUnderlineWarn gui=undercurl
highlight DiagnosticUnderlineInfo gui=undercurl
highlight DiagnosticUnderlineHint gui=undercurl
highlight DiagnosticUnderlineOk gui=undercurl

lua << EOF

    local function clamp(component)
        return math.min(math.max(component, 0), 255)
    end
    function LightenDarkenColor(col, amt)
        local num = tonumber(col:sub(2), 16)
        local r = math.floor(num / 0x10000) + amt
        local g = (math.floor(num / 0x100) % 0x100) + amt
        local b = (num % 0x100) + amt
        return string.format("#%06X", clamp(r) * 0x10000 + clamp(g) * 0x100 + clamp(b))
    end

    vim.api.nvim_set_hl(0, "CursorLine", { bg=LightenDarkenColor(vim.g.background, 16) })
    vim.api.nvim_set_hl(0, "StatusLine", { ctermbg=LightenDarkenColor(vim.g.background, 16) })
    vim.api.nvim_set_hl(0, "StatusLineNC", { ctermbg=LightenDarkenColor(vim.g.background, 16) })
EOF

endfunction
]])

--vim.cmd([[highlight StatusLine   cterm=none ctermfg=white ctermbg=black guibg=red]])
--vim.cmd([[highlight StatusLineNC cterm=none ctermfg=white ctermbg=black guibg=green]])

vim.cmd([[call ReloadPywal()]])
else
    vim.cmd([[colorscheme catppuccin]])
end