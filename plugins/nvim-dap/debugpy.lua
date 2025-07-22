-- vim: ts=2 sw=2 expandtab

return {
  configurations = {
    {
      name = "Launch",
      type = "python",
      request = "launch",
      program = '${file}';
      cwd = '${workspaceFolder}',
      stopOnEntry = true,
    },
    {
      type = 'python';
      request = 'launch';
      name = 'Launch with arguments';
      program = '${file}';
      args = function()
        local args_string = vim.fn.input('Arguments: ')
        return vim.split(args_string, " +")
      end;
      stopOnEntry = true,
    },
    {
      name = "Launch file",
      type = "python",
      request = "launch",
      program = function()
        return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
      end,
      args = function()
        local args_string = vim.fn.input('Arguments: ')
        return vim.split(args_string, " +")
      end;
      cwd = '${workspaceFolder}',
      stopOnEntry = true,
    },
  },
  adapter = function(cb, config)
    if config.request == 'attach' then
      ---@diagnostic disable-next-line: undefined-field
      local port = (config.connect or config).port
      ---@diagnostic disable-next-line: undefined-field
      local host = (config.connect or config).host or '127.0.0.1'
      cb({
        type = 'server',
        port = assert(port, '`connect.port` is required for a python `attach` configuration'),
        host = host,
        options = {
          source_filetype = 'python',
        },
      })
    else
      cb({
        type = 'executable',
        command = vim.fn.stdpath("data") .. '/mason/packages/debugpy/venv/bin/python',
        args = { '-m', 'debugpy.adapter' },
        options = {
          source_filetype = 'python',
        },
      })
    end
  end
}
