-- Local reference to plugins
local treesitter = require('nvim-treesitter.configs')

-- Enabled treesitter for syntax highlighting
treesitter.setup({
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
})
