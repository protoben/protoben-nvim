-- vim: ts=2 sw=2 expandtab

vim.lsp.config('basedpyright', {
  capabilities = vim.lsp.protocol.make_client_capabilities(),
})
