-- vim: ts=2 sw=2 expandtab

return {
  {
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    opts = {
      ensure_installed = {
        'c',
        'lua',
        'vim',
        'rust',
        'python',
        'bash',
        'elixir',
        'eex',
        'heex',
        'yaml',
        'lua',
        'zig',
        'javascript',
        'typescript',
        'markdown',
        'html',
      },
    }
  },
}
