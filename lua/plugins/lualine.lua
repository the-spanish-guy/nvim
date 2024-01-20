
return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local lazy_status = require("lazy.status")
    local themeName = require("utils.split")
    local theme = require("catppuccin.palettes").get_palette(themeName)

    require("lualine").setup({
      options = {
        theme = "catppuccin",
        icons_enabled = true,
      },
      sections = {
        lualine_x = {
          {
            lazy_status.updates,
            cond = lazy_status.has_updates,
            color = { fg = theme.flamingo },
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
