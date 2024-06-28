return {
  "mistweaverco/kulala.nvim",
  config = function()
    vim.filetype.add({
      extension = {
        ["http"] = "http",
      },
    })
  end,
}
