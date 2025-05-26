return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local lazy_status = require("lazy.status")
    -- comentando a linha abaixo por não estar usando catppuccin omo theme
    -- local themeName = require("utils.split") -- retorna o nome do tema catppuccin-mocha -> mocha
    local theme = require("catppuccin.palettes").get_palette(themeName) -- retorna o colorscheme

    require("lualine").setup({
      options = {
        theme = "vague", -- catppuccin
        icons_enabled = true,
        refresh = {
          statusline = 100,
          tabline = 100,
          winbar = 100,
        },
      },
      sections = {
        lualine_x = {
          {
            lazy_status.updates, -- mostra os updates
            cond = lazy_status.has_updates, -- mostra os updates caso hajam updates
            color = { fg = theme.flamingo }, --pega a cor a partir da paleta de cores do tema
          },
          { "encoding" },
          { "fileformat" },
          { "filetype" },
        },
      },
      extensions = { "neo-tree" },
    })
  end,
}
