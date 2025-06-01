return {
  "goolord/alpha-nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },

  config = function()
    local alpha = require("alpha")
    local startify = require("alpha.themes.startify")
    local headers = require("utils.headers").headers
    local icons = require("utils.icons")

    -- Configuração dos ícones
    startify.file_icons = {
      enabled = true,
      provider = "devicons"
    }

    -- Escolhe o header do Hollow Knight
    startify.section.header.val = headers.knight

    -- Configuração do header
    startify.section.header.opts = {
      position = "center",
      hl = "Type",
    }

    -- Configuração dos botões
    startify.section.top_buttons = {
      type = "group",
      val = {
        startify.button("e", "" .. icons.ui.FilledFile .. "  New file", ":ene <BAR> startinsert <CR>"),
        startify.button("f", "󰈞  Find file", ":Telescope find_files<CR>"),
        startify.button("r", "  Recent files", ":Telescope oldfiles<CR>"),
        startify.button("s", "  Settings", ":e $MYVIMRC<CR>"),
        startify.button("q", "" .. icons.ui.BoldClose .. "  Quit", ":qa<CR>"),
      },
    }

    -- Configuração do footer
    startify.section.footer = {
      type = "text",
      val = {
        "🦋 No will to break",
        "🗡️ No mind to think",
        "🎭 Born of God and Void",
        "🪲 No voice to cry suffering",
      },
      opts = {
        position = "center",
        hl = "Comment",
      },
    }

    -- Ordem das seções
    startify.config.layout = {
      { type = "padding", val = 2 },
      startify.section.header,
      { type = "padding", val = 2 },
      startify.section.top_buttons,
      startify.section.mru,
      { type = "padding", val = 1 },
      startify.section.footer,
    }

    alpha.setup(startify.config)
  end,
}
