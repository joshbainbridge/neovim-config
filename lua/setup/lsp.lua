-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Setting these according to h: tabstop
  vim.opt.cindent = true

  -- Always enable the number column
  vim.opt.number = true

  -- Always enable the sign column
  vim.opt.signcolumn = 'number'

  -- Prevent the preview window
  vim.opt.completeopt = 'menuone'

  -- Load buffer local functions
  local function keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local mapopt = { noremap = true, silent = true }

  -- Set up key bindings for the language server
  keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', mapopt)
  keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', mapopt)
  keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', mapopt)
  keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', mapopt)
  keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', mapopt)

  -- Set up key bindings for the language server with leader
  keymap('n', '<leader>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', mapopt)
  keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', mapopt)
  keymap('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', mapopt)
end

-- Update the capabilities for cmp
local old_capabilities = vim.lsp.protocol.make_client_capabilities()
local new_capabilities = require('cmp_nvim_lsp').update_capabilities(old_capabilities)

-- Add setup for clangd server
require('lspconfig').clangd.setup({
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
