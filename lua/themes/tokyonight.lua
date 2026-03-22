local flavor = "moon" -- night | storm | moon | day

return {
  name = "tokyonight",
  variants = { "night", "storm", "moon", "day" },
  lualine = "tokyonight",
  colors = function()
    local colors = require("tokyonight.colors").setup({ style = flavor })
    return {
      updates = colors.magenta,
    }
  end,
  setup = function()
    require("tokyonight").setup({
      style = flavor,
      light_style = "day",
    })
    vim.o.background = flavor == "day" and "light" or "dark"
    vim.cmd.colorscheme("tokyonight-" .. flavor)
  end,
}
