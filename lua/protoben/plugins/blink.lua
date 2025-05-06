-- vim: ts=2 sw=2 expandtab

return {
  {
    'saghen/blink.cmp',
    version = '1.*',
    opts = {
      keymap = {
        preset = 'none',

        -- Emacs-like tab completion; see https://cmp.saghen.dev/recipes.html#emacs-behavior
        -- If completion hasn't been triggered yet, insert the first suggestion; if it has, cycle to the next suggestion.
        ['<Tab>'] = {
          function(cmp)
            local has_words_before = function()
              local col = vim.api.nvim_win_get_cursor(0)[2]
              if col == 0 then
                return false
              end
              local line = vim.api.nvim_get_current_line()
              return line:sub(col, col):match("%s") == nil
            end
            if has_words_before() then
              return cmp.insert_next()
            end
          end,
          'fallback',
        },
        -- Navigate to the previous suggestion or cancel completion if currently on the first one.
        ['<S-Tab>'] = {
          'insert_prev',
        },
      },
      cmdline = { enabled = false },

      completion = {
        menu = { enabled = false },
        list = { selection = { preselect = false }, cycle = { from_top = false } },
        documentation = { auto_show = false },
      },

      appearance = {
        -- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
        -- Adjusts spacing to ensure icons are aligned
        nerd_font_variant = 'mono'
      },

      -- Default list of enabled providers defined so that you can extend it
      -- elsewhere in your config, without redefining it, due to `opts_extend`
      sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
      },

      -- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
      -- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
      -- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
      --
      -- See the fuzzy documentation for more information
      fuzzy = { implementation = "prefer_rust" }
    },
    opts_extend = { "sources.default" }
  }
}
