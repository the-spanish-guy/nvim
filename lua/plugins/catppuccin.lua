return {
  "catppuccin/nvim",
  name = "catppuccin",
  lazy = false,
  priority = 1000,
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
