return {
  "zaldih/themery.nvim",
  lazy = false,
  priority = 900,
  config = function()
    require("themery").setup({
      livePreview = true,
      themeConfigFile = vim.fn.stdpath("config") .. "/lua/theme.lua",
      themes = {
        -- Abyss
        { name = "Abyss · Void", colorscheme = "abyss-void" },
        { name = "Abyss · Dusk", colorscheme = "abyss-dusk" },
        {
          name = "Abyss · Dawn",
          colorscheme = "abyss-dawn",
          before = [[ vim.o.background = "light" ]],
          after = [[ vim.o.background = "dark" ]],
        },
        { name = "Abyss · Ember", colorscheme = "abyss-ember" },
        -- Catppuccin
        { name = "Catppuccin · Mocha", colorscheme = "catppuccin-mocha" },
        { name = "Catppuccin · Macchiato", colorscheme = "catppuccin-macchiato" },
        { name = "Catppuccin · Frappe", colorscheme = "catppuccin-frappe" },
        {
          name = "Catppuccin · Latte",
          colorscheme = "catppuccin-latte",
          before = [[ vim.o.background = "light" ]],
          after = [[ vim.o.background = "dark" ]],
        },
        -- Rose Pine
        { name = "Rose Pine · Main", colorscheme = "rose-pine-main" },
        { name = "Rose Pine · Moon", colorscheme = "rose-pine-moon" },
        {
          name = "Rose Pine · Dawn",
          colorscheme = "rose-pine-dawn",
          before = [[ vim.o.background = "light" ]],
          after = [[ vim.o.background = "dark" ]],
        },
        -- Tokyo Night
        { name = "Tokyo Night", colorscheme = "tokyonight-night" },
        { name = "Tokyo Night · Storm", colorscheme = "tokyonight-storm" },
        { name = "Tokyo Night · Moon", colorscheme = "tokyonight-moon" },
        {
          name = "Tokyo Night · Day",
          colorscheme = "tokyonight-day",
          before = [[ vim.o.background = "light" ]],
          after = [[ vim.o.background = "dark" ]],
        },
        -- Kanagawa
        { name = "Kanagawa · Wave", colorscheme = "kanagawa-wave" },
        { name = "Kanagawa · Dragon", colorscheme = "kanagawa-dragon" },
        {
          name = "Kanagawa · Lotus",
          colorscheme = "kanagawa-lotus",
          before = [[ vim.o.background = "light" ]],
          after = [[ vim.o.background = "dark" ]],
        },
        -- Vague
        { name = "Vague", colorscheme = "vague" },
        -- Visual GCode
        { name = "Visual GCode", colorscheme = "visualgcode" },
      },
    })
  end,
}
