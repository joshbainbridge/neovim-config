-- General key bindings for diagnostics
vim.keymap.set('n', '<leader>d', '<cmd>lua vim.diagnostic.open_float()<CR>')
vim.keymap.set('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>')
vim.keymap.set('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>')

-- Configuration for diagnostics
vim.diagnostic.config({
  virtual_text = false,
  severity_sort = true,
})
