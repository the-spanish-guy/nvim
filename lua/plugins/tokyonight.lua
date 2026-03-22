local theme = require("themes")

return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    if theme.name == "tokyonight" then
      theme.setup()
    end
  end,
}
