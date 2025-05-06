-- vim: ts=2 sw=2 expandtab

return {
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.3',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope-dap.nvim',
    },
    init = function()
      require('telescope').load_extension('dap')

      local builtin = require('telescope.builtin')
      require('which-key').add({
        {
          '<leader>f',
          group = 'Fuzzy find',
        },
        {
          '<leader>ff',
          builtin.find_files,
          desc = 'Find files',
          mode = 'n',
        },
        {
          '<leader>fg',
          builtin.live_grep,
          desc = 'Live grep (needs rg)',
          mode = 'n',
        },
        {
          '<leader>fb',
          builtin.buffers,
          desc = 'Find buffer',
          mode = 'n',
        },
        {
          '<leader>fh',
          builtin.current_buffer_fuzzy_find,
          desc = 'Find in current buffer',
          mode = 'n',
        },
        {
          '<leader>fd',
          builtin.diagnostics,
          desc = 'Diagnostics',
          mode = 'n',
        },
        {
          '<leader>fR',
          builtin.lsp_references,
          desc = 'Diagnostics',
          mode = 'n',
        },
        {
          '<leader>fv',
          require('telescope').extensions.dap.variables,
          desc = 'Debugger variables',
          mode = 'n',
        },
        {
          '<leader>fr',
          require('telescope').extensions.dap.frames,
          desc = 'Debugger frames',
          mode = 'n',
        },
      })
    end
  },
}
