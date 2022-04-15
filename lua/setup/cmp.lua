-- Create a local for the cmp module
local cmp = require('cmp')

-- Setup nvim-cmp for auto-completion
cmp.setup({
  snippet = {
    expand = function(args)
      require('snippy').expand_snippet(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  }),
  sources = {
    { name = 'nvim_lsp', group_index = 1, max_item_count = 5 },
    { name = 'buffer', group_index = 2, max_item_count = 5 },
  }
})
