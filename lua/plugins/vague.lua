local theme = require("themes")

return {
  "vague-theme/vague.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    if theme.name == "vague" then
      theme.setup()
    end
  end,
}
