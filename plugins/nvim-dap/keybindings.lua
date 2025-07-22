-- vim: ts=2 sw=2 expandtab

require('which-key').add({
  -- Debugger
  {
    '<leader>t',
    group = 'Debugger',
  },
  {
    '<leader>tb',
    function()
      require('dap').toggle_breakpoint()
    end,
    desc = 'Toggle breakpoint',
  },
  {
    '<leader>tD',
    function()
        --vim.cmd('DapClearBreakpoints')
        require('dap').clear_breakpoints()
    end,
    desc = 'Clear breakpoints',
  },
  {
    '<leader>tc',
    function()
      require('dap').continue()
    end,
    desc = 'Continue',
  },
  {
    '<leader>tv',
    function()
      require('dap').reverse_continue()
    end,
    desc = 'Reverse continue',
  },
  {
    '<leader>ti',
    function()
      require('dap').step_into()
    end,
    desc = 'Step Into',
  },
  {
    '<leader>to',
    function()
      require('dap').step_over()
    end,
    desc = 'Step Over',
  },
  {
    '<leader>tO',
    function()
      require('dap').step_out()
    end,
    desc = 'Step Out',
  },
  {
    '<leader>tI',
    function()
      require('dap').step_back()
    end,
    desc = 'Step back',
  },
  {
    '<leader>tw',
    function()
      require('dap-view').add_expr()
    end,
    desc = 'Watch variable',
  },
  {
    '<leader>th',
    function()
      require('dap').run_to_cursor()
    end,
    desc = 'Run to cursor',
  },
  {
    '<leader>t[',
    function()
      require('dap').up()
    end,
    desc = 'Stack frame up',
  },
  {
    '<leader>t]',
    function()
      require('dap').down()
    end,
    desc = 'Stack frame down',
  },
  {
    '<leader>tt',
    function()
      require('dap-view').toggle(true)
    end,
    desc = 'Toggle view UI',
  },
  {
    '<leader>tr',
    function()
      require('dap-view').restart()
    end,
    desc = 'Restart',
  },
  {
    '<leader>tq',
    function()
      require('dap').terminate()
      require('nvim-dap-virtual-text').disable()
      require('dap-view').close(true)
    end,
    desc = 'Terminate',
  },
  -- DAP View
  {
    '<leader>tB',
    function()
      require('dap-view').show_view('breakpoints')
    end,
    desc = 'View breakpoints',
  },
  {
    '<leader>tR',
    function()
      require('dap-view').jump_to_view('repl')
      vim.cmd('i')
    end,
    desc = 'View REPL',
  },
  {
    '<leader>tW',
    function()
      require('dap-view').show_view('watches')
    end,
    desc = 'View watches',
  },
  {
    '<leader>tS',
    function()
      require('dap-view').show_view('scopes')
    end,
    desc = 'View scopes',
  },
  {
    '<leader>tT',
    function()
      require('dap-view').show_view('threads')
    end,
    desc = 'View threads',
  },
  {
    '<leader>tE',
    function()
      require('dap-view').show_view('exceptions')
    end,
    desc = 'View exceptions',
  },
  {
    '<leader>tC',
    function()
      require('dap-view').show_view('console')
    end,
    desc = 'View console',
  },
})
