-- Local reference to plugin
local cmp = require('cmp')

-- Setup nvim-cmp for auto-completion
cmp.setup({
  snippet = {
    expand = function(args)
      require('snippy').expand_snippet(args.body)
    end,
  },
  completion = {
    autocomplete = false,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-n>'] = function(fallback)
      if not cmp.visible() then
        cmp.complete()
      else
        cmp.select_next_item()
      end
    end,
    ['<C-p>'] = function(fallback)
      if not cmp.visible() then
        cmp.complete()
      else
        cmp.select_prev_item()
      end
    end,
    ['<CR>'] = cmp.mapping.confirm(),
  }),
  matching = {
    disallow_fuzzy_matching = true,
    disallow_partial_matching = true,
    disallow_prefix_unmatching = true,
  },
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
})
