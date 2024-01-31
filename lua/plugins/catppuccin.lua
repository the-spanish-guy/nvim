return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  config = function()
    require("catppuccin").setup({
      flavour = "mocha",
      background = { -- :h background
        light = "latte",
        dark = "mocha",
      },
      integrations = {
        cmp = true,
        treesitter = true,
        neotree = true,
        navic = {
          enabled = true,
          custom_bg = "NONE", -- "lualine" will set background to mantle
        },
        fidget = true,
        mason = true,
      },
      transparent_background = false,
      -- for OLED monitors
      -- ref: https://github.com/catppuccin/vscode?tab=readme-ov-file#override-palette-colors
      --[[color_overrides = {
        mocha = {
          base = "#000000",
          mantle = "#010101",
          crust = "#020202",
        },
      },]]
    })
    vim.cmd.colorscheme("catppuccin")
    vim.o.background = "dark"
  end,
}
