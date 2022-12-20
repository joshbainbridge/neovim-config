-- Mapping for fuzzy search with fzf
vim.keymap.set('n', '<C-P>', '<cmd>Files<CR>')
vim.keymap.set('n', '<C-F>', '<cmd>Rg<CR>')

-- Change fzf layout to bottom of screen
vim.g.fzf_layout = { window = '15new' }
