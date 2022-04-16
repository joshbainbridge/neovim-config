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

-- If ripgrep is found...
if vim.fn.executable('rg') == 1 then
  -- Set grep command to use ripgrep
  vim.opt.grepprg = 'rg --vimgrep'

  -- Configure the format to match ripgrep
  vim.opt.grepformat = '%f:%l:%c:%m'
end
