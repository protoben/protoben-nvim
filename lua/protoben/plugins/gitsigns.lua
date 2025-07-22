-- vim: ts=2 sw=2 expandtab

return {
  {
    'lewis6991/gitsigns.nvim',
    dependencies = {
      'folke/which-key.nvim',
    },
    init = function()
      require('which-key').add({
        {
          '<leader>g',
          group = 'Git',
        },
        {
          '<leader>gR',
          function()
            require('gitsigns').reset_hunk()
          end,
          desc = 'Reset hunk',
        },
        {
          '<leader>gb',
          function()
            require('gitsigns').blame_line()
          end,
          desc = 'Blame line',
        },
        {
          '<leader>gB',
          function()
            require('gitsigns').blame()
          end,
          desc = 'Open blame window',
        },
        {
          '<leader>gd',
          function()
            require('gitsigns').preview_hunk()
          end,
          desc = 'Preview hunk',
        },
        {
          ']g',
          function()
            require('gitsigns').nav_hunk('next')
          end,
          desc = 'Next git hunk',
        },
        {
          '[g',
          function()
            require('gitsigns').nav_hunk('prev')
          end,
          desc = 'Previous git hunk',
        },
      })
    end,
    opts = {
      signs = {
        add          = { text = '┃' },
        change       = { text = '┃' },
        delete       = { text = '_' },
        topdelete    = { text = '‾' },
        changedelete = { text = '~' },
        untracked    = { text = '┆' },
      },
      signs_staged = {
        add          = { text = '┃' },
        change       = { text = '┃' },
        delete       = { text = '_' },
        topdelete    = { text = '‾' },
        changedelete = { text = '~' },
        untracked    = { text = '┆' },
      },
      signs_staged_enable = true,
      signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
      numhl      = false, -- Toggle with `:Gitsigns toggle_numhl`
      linehl     = false, -- Toggle with `:Gitsigns toggle_linehl`
      word_diff  = false, -- Toggle with `:Gitsigns toggle_word_diff`
      watch_gitdir = {
        follow_files = true
      },
      auto_attach = true,
      attach_to_untracked = false,
      current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
      current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
        delay = 1000,
        ignore_whitespace = false,
        virt_text_priority = 100,
        use_focus = true,
      },
      current_line_blame_formatter = '<author>, <author_time:%R> - <summary>',
      sign_priority = 6,
      update_debounce = 100,
      status_formatter = nil, -- Use default
      max_file_length = 40000, -- Disable if file is longer than this (in lines)
      preview_config = {
        -- Options passed to nvim_open_win
        style = 'minimal',
        relative = 'cursor',
        row = 0,
        col = 1
      },
    }
  }
}
