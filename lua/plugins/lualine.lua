return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local lazy_status = require("lazy.status")
    local icons = require("utils.icons")

    local function setup()
      require("lualine").setup({
        options = {
          theme = require("utils.hl").get_lualine_theme(),
        icons_enabled = true,
        component_separators = { left = "", right = "" },
        section_separators = {
          left = icons.ui.RoundedRight,
          right = icons.ui.RoundedLeft,
        },
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
            separator = {
              left = icons.ui.RoundedLeft,
              right = icons.ui.RoundedRight,
            },
            right_padding = 2,
            icon = icons.misc.Corinthians,
          },
        },
        lualine_b = {
          {
            "branch",
            icon = icons.git.Branch,
            separator = {
              left = icons.ui.RoundedLeft,
              right = icons.ui.RoundedRight,
            },
            right_padding = 2,
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
            function()
              return "REC @" .. vim.fn.reg_recording()
            end,
            cond = function()
              return vim.fn.reg_recording() ~= ""
            end,
            color = { fg = "#ff9e64" },
          },
          { "searchcount" },
          {
            lazy_status.updates,
            cond = lazy_status.has_updates,
          },
          { "encoding" },
          { "fileformat" },
          { "filetype" },
        },
        lualine_y = {
          {
            function()
              local line = vim.fn.line(".")
              local total = vim.fn.line("$")
              return math.floor(line / total * 100) .. icons.misc.Percent
            end,
          },
        },
        lualine_z = {
          {
            "location",
            separator = {
              left = icons.ui.RoundedLeft,
              right = icons.ui.RoundedRight,
            },
            left_padding = 2,
          },
        },
      },
      extensions = { "neo-tree" },
      })
    end

    setup()
    vim.api.nvim_create_autocmd("ColorScheme", { callback = setup })
  end,
}
