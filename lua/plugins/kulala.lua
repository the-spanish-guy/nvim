return {
  "mistweaverco/kulala.nvim",
  config = function()
    vim.opt.splitright = true
    vim.filetype.add({
      extension = {
        ["http"] = "http",
      },
    })
  end,
}
