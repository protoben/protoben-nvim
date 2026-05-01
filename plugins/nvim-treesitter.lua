-- vim: ts=2 sw=2 expandtab

local langs = {
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
}

if vim.version().minor < 12 then
  return {
    {
      'nvim-treesitter/nvim-treesitter',
      branch = 'master',
      lazy = false,
      opts = {
        ensure_installed = langs,
      }
    },
  }
else
  return {
      'nvim-treesitter/nvim-treesitter',
      branch = 'main',
      lazy = false,
      setup = function()
        require('nvim-treesitter').install(langs)
      end
  }
end
