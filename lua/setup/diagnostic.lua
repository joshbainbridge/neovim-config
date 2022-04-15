-- Load some common functions
local keymap = vim.api.nvim_set_keymap
local mapopt = { noremap = true, silent = true }

-- General key bindings for diagnostics
keymap('n', '<leader>d', '<cmd>lua vim.diagnostic.open_float()<CR>', mapopt)
keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', mapopt)
keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', mapopt)

vim.diagnostic.config({virtual_text = false})
