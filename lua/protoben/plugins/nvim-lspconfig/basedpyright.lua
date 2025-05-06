-- vim: ts=2 sw=2 expandtab

local capabilities = vim.lsp.protocol.make_client_capabilities()
require('lspconfig').basedpyright.setup({ capabilities = capabilities })
