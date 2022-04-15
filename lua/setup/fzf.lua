-- Change fzf layout to bottom of screen
vim.g.fzf_layout = { window = '15new' }

-- If fzf is found...
if vim.fn.executable('fzf') == 1 then
  -- Load some common functions
  local keymap = vim.api.nvim_set_keymap
  local mapopt = { noremap = true, silent = true }

  -- Mapping for fuzzy search with fzf
  keymap('n', '<C-P>', '<cmd>FZF<CR>', mapopt)
end
