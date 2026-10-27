return {
  "rebelot/kanagawa.nvim",
  lazy = true,
  config = function()
    require("kanagawa").setup({
      background = {
        dark = "wave",
        light = "lotus",
      },
    })
  end,
}
