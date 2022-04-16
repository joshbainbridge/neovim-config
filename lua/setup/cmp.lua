-- Setup nvim-cmp for auto-completion
require('cmp').setup({
  snippet = {
    expand = function(args)
      require('snippy').expand_snippet(args.body)
    end,
  },
  mapping = require('cmp').mapping.preset.insert({
    ['<CR>'] = require('cmp').mapping.confirm({
	  select = true
    }),
  }),
  sources = {
    { name = 'nvim_lsp', group_index = 1 },
    { name = 'buffer', group_index = 2 },
  },
  formatting = {
    format = require('lspkind').cmp_format({
      mode = 'symbol',
      maxwidth = 60,
    })
  },
  experimental = {
    ghost_text = true,
  },
})
