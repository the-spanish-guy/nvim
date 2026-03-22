local flavor = "lotus" -- mocha | latte | frappe | macchiato

return {
  name = "kanagawa",
  variants = { "wave", "dragon", "lotus" },
  lualine = "kanagawa",
  colors = function()
    local colors = require("kanagawa.colors").setup({ theme = flavor })
    return {
      updates = colors.palette.sakuraPink,
    }
  end,
  setup = function()
    require("kanagawa").setup({
      theme = flavor,
      background = {
        dark = "wave",
        light = "lotus",
      },
    })
    vim.o.background = flavor == "lotus" and "light" or "dark"
    vim.cmd.colorscheme("kanagawa-" .. flavor)
  end,
}
