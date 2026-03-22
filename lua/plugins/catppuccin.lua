local theme = require("themes")

return {
  "catppuccin/nvim",
  name = "catppuccin",
  lazy = false,
  priority = 1000,
  config = function()
    if theme.name == "catppuccin" then
      theme.setup()
    end
  end,
}
