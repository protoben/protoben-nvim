-- vim: ts=2 sw=2 expandtab

require('which-key').add({
  {
    '<leader>e',
    vim.diagnostic.open_float,
    desc = 'View diagnostic',
    mode = 'n',
  },
  {
    '[d',
    function()
      vim.diagnostic.jump({count = -1, float = true})
    end,
    desc = 'Goto previous diagnostic',
    mode = 'n',
  },
  {
    ']d',
    function()
      vim.diagnostic.jump({count = 1, float = true})
    end,
    desc = 'Goto next diagnostic',
    mode = 'n',
  },
  {
    '<leader>q',
    vim.diagnostic.setloclist,
    desc = 'View diagnostics in loclist',
    mode = 'n',
  },
  {
    '<S-tab>',
    '<C-x><C-n>',
    desc = 'Keyword completion',
    mode = 'i',
  }
})
