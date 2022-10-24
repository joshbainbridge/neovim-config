-- Enabled cursor line
vim.opt.cursorline = true

-- Setting these according to h: tabstop
vim.opt.tabstop = 4

-- Setting these according to h: tabstop
vim.opt.shiftwidth = 4

-- More natural split opening
vim.opt.splitbelow = true

-- More natural split opening
vim.opt.splitright = true

-- Make special characters visible
vim.opt.list = true

-- Prevent text from wrapping
vim.opt.wrap = false

-- Prevent the preview window
vim.opt.completeopt = 'menuone,noselect'

-- Always enable the number column
vim.opt.number = true

-- Always enable the sign column
vim.opt.signcolumn = 'number'

-- Disable mouse selection
vim.opt.mouse = ''

-- If ripgrep is found...
if vim.fn.executable('rg') == 1 then
  -- Set grep command to use ripgrep
  vim.opt.grepprg = 'rg --vimgrep'

  -- Configure the format to match ripgrep
  vim.opt.grepformat = '%f:%l:%c:%m'
end

-- Set up the autocmds
vim.api.nvim_create_autocmd('FileType', {
  pattern = {'cpp', 'c'},
  callback = function(args)
    -- Disable spell checker
    vim.opt.spell = false

    -- Disable text wrap
    vim.opt.wrap = false

    -- Setting these according to h: tabstop
    vim.opt.cindent = true
  end,
})

vim.api.nvim_create_autocmd('FileType', {
  pattern = {'text', 'markdown'},
  callback = function(args)
    -- Enable spell checker
    vim.opt.spell = true

    -- Enable text wrap
    vim.opt.wrap = true

    -- Setting these according to h: tabstop
    vim.opt.cindent = false
  end,
})
