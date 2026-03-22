local M = {}

M.apply = function(theme)
  local lazy_status = require("lazy.status")
  local colors = theme.colors()
  local icons = require("utils.icons")

  require("lualine").setup({
    options = {
      theme = theme.lualine,
      icons_enabled = true,
      refresh = {
        statusline = 100,
        tabline = 100,
        winbar = 100,
      },
    },
    sections = {
      lualine_a = {
        {
          "mode",
          color = { gui = "bold" },
          icon = icons.misc.Corinthians,
        },
      },
      lualine_b = {
        {
          "branch",
          icon = icons.git.Branch,
          fmt = function(str)
            if str and #str > 8 then
              return string.sub(str, 1, 8) .. "…"
            end
            return str
          end,
        },
      },
      lualine_c = {
        {
          "filename",
          path = 0,
          symbols = {
            modified = icons.ui.Pencil,
            readonly = icons.ui.Lock,
            unnamed = "[Sem Nome]",
          },
        },
        {
          "diagnostics",
          sources = { "nvim_diagnostic" },
          symbols = {
            error = icons.diagnostics.Error .. " ",
            warn = icons.diagnostics.Warning .. " ",
            info = icons.diagnostics.Information .. " ",
            hint = icons.diagnostics.Hint .. " ",
          },
        },
        {
          "diff",
          symbols = {
            added = icons.git.LineAdded .. " ",
            modified = icons.git.LineModified .. " ",
            removed = icons.git.LineRemoved .. " ",
          },
        },
      },
      lualine_x = {
        {
          require("noice").api.status.command.get,
          cond = require("noice").api.status.command.has,
          color = { fg = "#ff9e64" },
        },
        {
          lazy_status.updates,
          cond = lazy_status.has_updates,
          color = { fg = colors.updates },
        },
        { "encoding" },
        { "fileformat" },
        { "filetype" },
      },
      lualine_y = {
        { "progress" },
      },
      lualine_z = {
        { "location" },
      },
    },
    extensions = { "neo-tree" },
  })
end

return M
