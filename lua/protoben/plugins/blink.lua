-- vim: ts=2 sw=2 expandtab

-- Check if there are non-whitespace characters before the cursor
local has_words_before = function()
  local col = vim.api.nvim_win_get_cursor(0)[2]
  if col == 0 then
    return false
  end
  local line = vim.api.nvim_get_current_line()
  return line:sub(col, col):match('%s') == nil
end

return {
  {
    'saghen/blink.cmp',
    dependencies = {
      'mikavilpas/blink-ripgrep.nvim',
    },
    version = '1.*',
    opts = {
      keymap = {
        preset = 'none',

        -- Emacs-like tab completion; see https://cmp.saghen.dev/recipes.html#emacs-behavior
        -- If completion hasn't been triggered yet, insert the first suggestion; if it has, cycle to the next suggestion.
        ['<Tab>'] = {
          function(cmp)
            if has_words_before() then
              return cmp.show_and_insert()
            end
          end,
          function(cmp)
            if has_words_before() then
              return cmp.insert_next()
            end
          end,
          'fallback',
        },
        ['<S-Tab>'] = { 'insert_prev', 'fallback' },
        ['<Esc>'] = { 'cancel', 'fallback' },
        ['<CR>'] = { 'accept', 'select_and_accept', 'fallback' },
        ['<C-Space>'] = { 'show', 'show_documentation', 'hide_documentation', 'fallback' },
        ['<C-n>'] = { 'select_next', 'fallback' },
        ['<C-p>'] = { 'select_prev', 'fallback' },
        ['<C-y>'] = { 'select_and_accept', 'fallback' },
        ['<C-e>'] = { 'hide', 'fallback' },
        ['<C-k>'] = { 'show_signature', 'hide_signature', 'fallback' },
        ['<C-f>'] = { 'scroll_documentation_down', 'fallback' },
        ['<C-b>'] = { 'scroll_documentation_up', 'fallback' },
        ['<Up>'] = { 'select_prev', 'fallback' },
        ['<Down>'] = { 'select_next', 'fallback' },
      },
      cmdline = {
        enabled = true,
        keymap = {
          preset = 'inherit',

          -- The above emacs-like completion doesn't seem to work for cmdline
          ['<Tab>'] = { 'show_and_insert', 'insert_next', 'fallback' },
          ['<CR>'] = { 'accept', 'select_and_accept', 'fallback' },
          ['<Esc>'] = {
            'cancel',
            function(cmp)
              vim.api.nvim_input('<C-c>')
            end,
            --'fallback', -- Fallback uses vi compatibility mode of accepting cmdline
          },
        },
      },

      completion = {
        menu = {
          enabled = true,
          auto_show = false,
        },
        list = { selection = { preselect = false }, cycle = { from_top = false } },
        documentation = { auto_show = false },
      },
      appearance = { nerd_font_variant = 'mono' },
      sources = {
        default = { 'lsp', 'buffer', 'ripgrep' },
        providers = {
          ripgrep = {
            module = 'blink-ripgrep',
            name = 'Ripgrep',
          }
        }
      },
      fuzzy = {
        implementation = 'prefer_rust',
        sorts = {
          --'exact',
          -- defaults
          'score',
          'sort_text',
        },
      },
    },
    opts_extend = { 'sources.default' },
  }
}
