-- vim: ts=2 sw=2 expandtab

return function(ev)
  require('which-key').add(
    {
      {
        '<leader>rn',
        vim.lsp.buf.rename,
        desc = 'Rename',
      },
      {
        '<leader>ca',
        vim.lsp.buf.code_action,
        desc = 'Code action',
        mode = { 'n', 'v' },
      },
      {
        '<leader>F',
        function()
          vim.lsp.buf.format { async = true }
        end,
        desc = 'Format buffer',
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
      },
      -- LSP gotos
      {
        'gr',
        group = 'LSP gotos',
      },
      {
        'grd',
        vim.lsp.buf.definition,
        desc = 'Go to definition',
      },
      {
        'grD',
        vim.lsp.buf.declaration,
        desc = 'Go to declaration',
      },
      {
        'grr',
        vim.lsp.buf.references,
        desc = 'References',
      },
      {
        'gri',
        vim.lsp.buf.implementation,
        desc = 'Go to implementation',
        mode = 'n',
      },
      {
        'grt',
        vim.lsp.buf.type_definition,
        desc = 'Go to type definition',
      },
      {
        'grc',
        vim.lsp.buf.incoming_calls,
        desc = 'Incoming calls',
      },
      {
        'grC',
        vim.lsp.buf.outgoing_calls,
        desc = 'Outgoing calls',
      },
      {
        'grh',
        vim.lsp.buf.typehierarchy,
        desc = 'Type hierarchy',
      },
      {
        'grH',
        vim.lsp.buf.document_highlight,
        desc = 'Document highlight',
      },
      {
        'grs',
        vim.lsp.buf.document_symbol,
        desc = 'Document symbol',
      },
      -- Workspace
      {
        '<leader>w',
        group = 'LSP workspace',
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
    },
    {
      buffer = ev.buf
    }
  )
end
