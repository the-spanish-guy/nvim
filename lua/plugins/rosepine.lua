local theme = require("themes")

return {
  "rose-pine/neovim",
  name = "rose-pine",
  lazy = false,
  priority = 1000,
  config = function()
    if theme.name == "rosepine" then
      theme.setup()
    end
  end,
}
