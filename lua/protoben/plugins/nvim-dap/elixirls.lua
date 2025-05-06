-- vim: ts=2 sw=2 expandtab

return {
  configurations = {
    {
      type = "mix_task",
      name = "mix test",
      task = 'test',
      taskArgs = {"--trace"},
      request = "launch",
      startApps = true, -- for Phoenix projects
      projectDir = "${workspaceFolder}",
      requireFiles = {
        "test/**/test_helper.exs",
        "test/**/*_test.exs"
      }
    },
  },
  adapters = {
    type = 'executable',
    command = vim.fn.stdpath("data") .. '/mason/packages/elixir-ls/debug_adapter.sh',
    args = {}
  },
}
