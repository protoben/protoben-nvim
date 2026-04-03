-- vim: ts=2 sw=2 expandtab

return {
  {
    'neovim/nvim-lspconfig',
    lazy = false,
    dependencies = {
      {
        'williamboman/mason-lspconfig.nvim',
        opts = {
          ensure_installed = {
            "lua_ls",
            "rust_analyzer",
            "clangd",
            "basedpyright",
            "elixirls",
            "ts_ls",
            "zls",
            "bashls",
          },
          automatic_installation = true,
        },
      }
    },
    init = function()
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('UserLspConfig', {}),
        callback = function(ev)
          -- Enable completion triggered by <c-x><c-o>
          vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

          require('protoben.plugins.nvim-lspconfig.keybindings')(ev)
        end,
      })
    end,
    config = function()
      vim.lsp.enable('lua_ls')
      vim.lsp.enable('rust-analyzer')
      vim.lsp.enable('clangd')
      vim.lsp.enable('basedpyright')
      vim.lsp.enable('elixirls')
      vim.lsp.enable('ts_ls')
      vim.lsp.enable('zls')
      vim.lsp.enable('bashls')

      require('protoben.plugins.nvim-lspconfig.lua_ls')
      require('protoben.plugins.nvim-lspconfig.basedpyright')
      require('protoben.plugins.nvim-lspconfig.elixirls')
    end,
  },
}
