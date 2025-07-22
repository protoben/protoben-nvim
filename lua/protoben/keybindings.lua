-- vim: ts=2 sw=2 expandtab

require('which-key').add({
  {
    '<leader>e',
    vim.diagnostic.open_float,
    desc = 'View diagnostic',
  },
  {
    '[d',
    function()
      vim.diagnostic.jump({count = -1, float = true})
    end,
    desc = 'Goto previous diagnostic',
  },
  {
    ']d',
    function()
      vim.diagnostic.jump({count = 1, float = true})
    end,
    desc = 'Goto next diagnostic',
  },
  {
    '<leader>q',
    vim.diagnostic.setloclist,
    desc = 'View diagnostics in loclist',
  },
  {
    '<C-l>',
    function()
      vim.cmd('cclose')
      vim.cmd('lclose')
      vim.cmd('nohlsearch')
    end,
    desc = 'Clear everything',
  },
  {
    '<S-tab>',
    '<C-x><C-n>',
    desc = 'Keyword completion',
    mode = 'i',
  }
})
