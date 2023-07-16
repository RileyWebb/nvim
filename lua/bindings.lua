local map = vim.api.nvim_set_keymap

--map('n', '<C-d>', ':t.<CR>', {noremap = true, silent = true}) -- Duplicate Line

-- Telescope
map('n', '<C-p>', ':Telescope find_files<CR>', {noremap = true, silent = true})
map('x', '<C-p>', ':Telescope find_files<CR>', {noremap = true, silent = true})

-- NVimTree
map('n', '<C-n>', ':NeoTreeFocusToggle<CR>', {noremap = true, silent = true})

-- Trouble
map('n', '<C-,>', ':TroubleToggle<CR>', {noremap = true, silent = true})

--map('n', '<M-S-c>', '"+yi', {noremap = true, silent = true})
--map('x', '<M-S-c>', '"+yi', {noremap = true, silent = true})
--map('n', '<M-S-v>', '"+p', {noremap = true, silent = true})

--map('n', '<M-S-c>', '"*y', {noremap = true, silent = true})

--TODO: GIT MODE - BLAME LINE CHNAGES SHIT LIKE THAT

-- Leap
vim.keymap.set('n', '<C-f>', function ()
    local current_window = vim.fn.win_getid()
    require('leap').leap { target_windows = { current_window } }
  end) -- Find In Page

-- Wilder
vim.cmd([[set wildcharm=<C-Z>]])

-- CMP
local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()

cmp.setup({
  mapping = {
    -- Confirm Completion
    ['<CR>'] = cmp.mapping.confirm({select = false}),

    ["<Tab>"] = cmp.mapping(function(fallback)
      -- This little snippet will confirm with tab, and if no entry is selected, will confirm the first item
      if cmp.visible() then
        local entry = cmp.get_selected_entry()
	if not entry then
	  cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
	else
	  cmp.confirm()
	end
      else
        fallback()
      end
    end, {"i","s","c",}),

    -- Hover
    ['<C-?>'] = cmp_action.luasnip_jump_forward(),
    ['<C-b>'] = cmp_action.luasnip_jump_backward(),
  }
})

vim.keymap.set('n', '`', '<cmd>lua if #vim.diagnostic.get(0, { lnum = vim.fn.line(".") - 1 }) == 0 then vim.lsp.buf.hover() else vim.diagnostic.open_float(nil, {focus=false}) end<cr>')

vim.api.nvim_create_autocmd('LspAttach', {
    desc = 'LSP actions',
    callback = function(event)
      local opts = {buffer = event.buf}

      vim.keymap.set('n', '<C-d>', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
      --vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
      --vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
      --vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
      --vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
      --vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
      vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
      vim.keymap.set({'n', 'x'}, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
      --vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)

      --vim.keymap.set('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>', opts)
      --vim.keymap.set('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>', opts)
      --vim.keymap.set('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>', opts) 
    end
  })
