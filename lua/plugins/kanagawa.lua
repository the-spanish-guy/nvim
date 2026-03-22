local theme = require("themes")

return {
  "rebelot/kanagawa.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    if theme.name == "kanagawa" then
      theme.setup()
    end
  end,
}
