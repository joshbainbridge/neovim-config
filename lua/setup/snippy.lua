-- Local reference to plugins
local snippy = require('snippy')

-- Setup snippy as snippet engine
snippy.setup({
  mappings = {
    is = {
      ['<Tab>'] = 'expand_or_advance',
      ['<S-Tab>'] = 'previous',
    },
  },
})
