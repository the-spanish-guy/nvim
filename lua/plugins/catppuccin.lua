return {
  "catppuccin/nvim",
  name = "catppuccin",
  lazy = true,
  config = function()
    require("catppuccin").setup({
      background = {
        light = "latte",
        dark = "mocha",
      },
      auto_integrations = true,
      transparent_background = false,
    })
  end,
}
