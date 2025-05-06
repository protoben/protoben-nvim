-- vim: ts=2 sw=2 expandtab

return {
  {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      vim.opt.list = true
      vim.opt.listchars:append 'space:⋅'
      vim.opt.listchars:append 'eol:↴'

      require("ibl").setup { }
    end,
  },
}
