-- vim: ts=2 sw=2 expandtab

return {
  {
    'nvim-treesitter/nvim-treesitter-context',
    init = function()
      local plugin = require('treesitter-context')
      vim.keymap.set("n", "[c", function() plugin.go_to_context(vim.v.count1) end)
    end,
    opts = {
      enable = true,
      highlight = { enable = true },
      incremental_selection = { enable = true },
    },
  },
}
