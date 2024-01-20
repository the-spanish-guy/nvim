return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  config = function()
    require("catppuccin").setup({
      flavour = "mocha",
      integrations = {
        cmp = true,
        treesitter = true,
        neotree = true,
      },
      transparent_background = false,
      navic = {
        enabled = true,
        custom_bg = "NONE", -- "lualine" will set background to mantle
      },
      fidget = true,
      mason = true
    })
    vim.cmd.colorscheme("catppuccin")
  end,
}
