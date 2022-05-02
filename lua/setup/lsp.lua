-- Local reference to plugins
local cmp_nvim_lsp = require('cmp_nvim_lsp')
local lspconfig = require('lspconfig')

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Set up key bindings for the language server
  vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>')
  vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
  vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>')
  vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>')
  vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>')

  -- Set up key bindings for the language server with leader
  vim.keymap.set('n', '<leader>f', '<cmd>lua vim.lsp.buf.formatting()<CR>')
  vim.keymap.set('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>')
  vim.keymap.set('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>')
end

-- Update the capabilities for cmp
local old_capabilities = vim.lsp.protocol.make_client_capabilities()
local new_capabilities = cmp_nvim_lsp.update_capabilities(old_capabilities)

-- Add setup for clangd server
lspconfig.clangd.setup({
  cmd = {
    "clangd",
    "--clang-tidy",
    "--completion-style=bundled",
    "--header-insertion=never",
    "--header-insertion-decorators=0",
    "--limit-results=10",
  },
  on_attach = on_attach,
  capabilities = new_capabilities,
  flags = {
    debounce_text_changes = 150,
  }
})
