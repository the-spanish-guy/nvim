return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local lazy_status = require("lazy.status")
    -- comentando a linha abaixo por não estar usando catppuccin omo theme
    -- local themeName = require("utils.split") -- retorna o nome do tema catppuccin-mocha -> mocha
    local theme = require("catppuccin.palettes").get_palette(themeName) -- retorna o colorscheme
    local icons = require("utils.icons")

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
        lualine_a = {
          {
            "mode",
            color = { gui = "bold" },
            icon = icons.files.neovim,
          },
        },
        -- Adicionando a seção b com a branch limitada
        lualine_b = {
          {
            'branch',
            icon = icons.git.Branch,
            fmt = function(str)
              -- Limita o nome da branch para 8 caracteres
              if str and #str > 8 then
                return string.sub(str, 1, 8) .. '…'
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
            }
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
            require("noice").api.status.command.get, -- mostra o comando que está sendo executado
            cond = require("noice").api.status.command.has, -- mostra o comando que está sendo executado caso haja um comando sendo executado
            color = { fg = "#ff9e64" }, -- cor do comando que está sendo executado
          },
          {
            lazy_status.updates, -- mostra os updates
            cond = lazy_status.has_updates, -- mostra os updates caso hajam updates
            color = { fg = theme.flamingo }, --pega a cor a partir da paleta de cores do tema
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
  end,
}
