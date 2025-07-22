-- vim: ts=2 sw=2 expandtab

return {
  {
    'mfussenegger/nvim-dap',
    event = 'VeryLazy',
    dependencies = {
      'nvim-neotest/nvim-nio',
      {
        'igorlfs/nvim-dap-view',
        opts = {
          winbar = {
            -- Adds console to sections
            sections = { 'watches', 'scopes', 'exceptions', 'breakpoints', 'threads', 'repl', 'console' },
            default_section = 'scopes',
          },
        },
      },
      {
        'jay-babu/mason-nvim-dap.nvim',
        opts = {
          ensure_installed = {
            'python', -- debugpy
            'codelldb',
            'elixir', -- elixirls
            'js',
            'bash', -- bashdb
          },
          automatic_installation = true,
          handlers = {
            function(config)
              require('mason-nvim-dap').default_setup(config)
            end,
          },
        },
      },
      {
        'theHamsta/nvim-dap-virtual-text',
        opts = {
          enabled = true
        },
      },
    },
    init = function()
      require('protoben.plugins.nvim-dap.keybindings')
    end,
    config = function()
      local mason_dap = require('mason-nvim-dap')
      local dap = require('dap')
      local dap_view = require('dap-view')

      mason_dap.setup()

      -- Configurations
      dap.configurations.python = require('protoben.plugins.nvim-dap.debugpy').configurations
      dap.configurations.c = require('protoben.plugins.nvim-dap.codelldb').configurations
      dap.configurations.cpp = require('protoben.plugins.nvim-dap.codelldb').configurations
      dap.configurations.rust = require('protoben.plugins.nvim-dap.codelldb').configurations
      dap.configurations.zig = require('protoben.plugins.nvim-dap.codelldb').configurations
      dap.configurations.sh = require('protoben.plugins.nvim-dap.bashdb').configurations
      dap.configurations.elixir = require('protoben.plugins.nvim-dap.elixirls').configurations

      -- Adapters
      dap.adapters.bashdb = require('protoben.plugins.nvim-dap.bashdb').adapter
      dap.adapters.mix_task = require('protoben.plugins.nvim-dap.elixirls').adapter
      dap.adapters.python = require('protoben.plugins.nvim-dap.debugpy').adapter

      -- UI setup
      dap.listeners.before.attach["dap-view-config"] = function()
        dap_view.open()
      end
      dap.listeners.before.launch["dap-view-config"] = function()
        dap_view.open()
      end
    end,
  },
}
