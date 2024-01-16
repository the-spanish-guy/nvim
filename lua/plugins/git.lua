return {
  "lewis6991/gitsigns.nvim",
  config = function()
    require("gitsigns").setup({
      auto_attach = true,
    })
  end,
}
