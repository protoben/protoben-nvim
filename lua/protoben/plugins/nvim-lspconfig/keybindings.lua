-- vim: ts=2 sw=2 expandtab

return function(ev)
  require('which-key').add(
    {
      {
        -- Override keyword completion from protoben/init.lua
        '<C-tab>',
        '<C-x><C-o>',
        desc = 'Omnicomplete',
        mode = 'i',
      },
      {
        'gD',
        vim.lsp.buf.declaration,
        desc = 'Go to declaration',
        mode = 'n',
      },
      {
        'gd',
        vim.lsp.buf.definition,
        desc = 'Go to definition',
        mode = 'n',
      },
      {
        '<C-k>',
        vim.lsp.buf.hover,
        desc = 'Hover',
        mode = {'n', 'v', 'i'},
      },
      {
        'K',
        vim.lsp.buf.signature_help,
        desc = 'Signature help',
        mode = 'n',
      },
      {
        'gi',
        vim.lsp.buf.implementation,
        desc = 'Go to implementation',
        mode = 'n',
      },
      {
        '<leader>wa',
        vim.lsp.buf.add_workspace_folder,
        desc = 'Add directory to workspace',
        mode = 'n',
      },
      {
        '<leader>wr',
        vim.lsp.buf.remove_workspace_folder,
        desc = 'Remove directory from workspace',
        mode = 'n',
      },
      {
        '<leader>wl',
        function()
          print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end,
        desc = 'List workspace directories',
        mode = 'n',
      },
      {
        '<leader>D',
        vim.lsp.buf.type_definition,
        desc = 'Go to type definition',
        mode = 'n',
      },
      {
        '<leader>rn',
        vim.lsp.buf.rename,
        desc = 'Rename',
        mode = 'n',
      },
      {
        '<leader>ca',
        vim.lsp.buf.code_action,
        desc = 'Code action',
        mode = { 'n', 'v' },
      },
      {
        'gr',
        vim.lsp.buf.references,
        desc = 'References',
        mode = 'n',
      },
      {
        '<leader>F',
        function()
          vim.lsp.buf.format { async = true }
        end,
        desc = 'Format buffer',
        mode = 'n',
      },
    },
    {
      buffer = ev.buf
    }
  )
end
