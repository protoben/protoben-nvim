-- vim: ts=2 sw=2 expandtab

return {
  configurations = {
    {
      type = 'bashdb';
      request = 'launch';
      name = "Launch";
      showDebugOutput = true;
      pathBashdb = vim.fn.stdpath("data") .. '/mason/packages/bash-debug-adapter/extension/bashdb_dir/bashdb';
      pathBashdbLib = vim.fn.stdpath("data") .. '/mason/packages/bash-debug-adapter/extension/bashdb_dir';
      trace = true;
      file = "${file}";
      program = "${file}";
      cwd = '${workspaceFolder}';
      pathCat = "cat";
      pathBash = "/bin/bash";
      pathMkfifo = "mkfifo";
      pathPkill = "pkill";
      args = {};
      env = {};
      terminalKind = "integrated";
    },
    {
      type = 'bashdb';
      request = 'launch';
      name = 'Launch with arguments';
      showDebugOutput = true;
      pathBashdb = vim.fn.stdpath("data") .. '/mason/packages/bash-debug-adapter/extension/bashdb_dir/bashdb';
      pathBashdbLib = vim.fn.stdpath("data") .. '/mason/packages/bash-debug-adapter/extension/bashdb_dir';
      trace = true;
      file = "${file}";
      program = '${file}';
      cwd = '${workspaceFolder}';
      pathCat = "cat";
      pathBash = "/bin/bash";
      pathMkfifo = "mkfifo";
      pathPkill = "pkill";
      args = function()
        local args_string = vim.fn.input('Arguments: ')
        return vim.split(args_string, " +", {trimempty = true})
      end;
      env = {};
      terminalKind = "integrated";
    }
  },
  adapter = {
    type = 'executable';
    command = vim.fn.stdpath("data") .. '/mason/packages/bash-debug-adapter/bash-debug-adapter';
    name = 'bashdb';
  }
}
