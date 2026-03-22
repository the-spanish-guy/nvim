local flavor = "mocha" -- mocha | latte | frappe | macchiato

return {
  name = "catppuccin",
  variants = { "mocha", "latte", "frappe", "macchiato" },
  lualine = "catppuccin-" .. flavor,
  colors = function()
    local p = require("catppuccin.palettes").get_palette(flavor)
    return {
      updates = p.flamingo,
    }
  end,
  setup = function()
    require("catppuccin").setup({
      flavour = flavor,
      background = {
        light = "latte",
        dark = "mocha",
      },
      auto_integrations = true,
      --[[integrations = {
        cmp = true,
        treesitter = true,
        neotree = true,
        fidget = true,
        mason = true,

      },]]
      transparent_background = false,
    })
    local light_flavors = { latte = true, frappe = true }
    vim.o.background = light_flavors[flavor] and "light" or "dark"
    vim.cmd.colorscheme("catppuccin-" .. flavor)
  end,
}
