local flavor = "main" -- main | moon | dawn

local love_colors = { main = "#eb6f92", moon = "#eb6f92", dawn = "#b4637a" }

return {
  name = "rosepine",
  variants = { "main", "moon", "dawn" },
  lualine = "rose-pine",
  colors = function()
    return {
      updates = love_colors[flavor] or "#eb6f92",
    }
  end,
  setup = function()
    require("rose-pine").setup({
      variant = flavor,
      dark_variant = "main",
    })
    vim.o.background = flavor == "dawn" and "light" or "dark"
    vim.cmd.colorscheme("rose-pine-" .. flavor)
  end,
}
