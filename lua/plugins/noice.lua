return -- lazy.nvim
{
  "folke/noice.nvim",
  event = "VeryLazy", -- Carrega o plugin de forma lazy quando o Neovim estiver pronto
  dependencies = {
    -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
    "MunifTanjim/nui.nvim",      -- Framework UI usado pelo Noice
    -- OPTIONAL:
    --   `nvim-notify` is only needed, if you want to use the notification view.
    --   If not available, we use `mini` as the fallback
    "rcarriga/nvim-notify",      -- Sistema de notificações
  },
  opts = {
    -- add any options here
    lsp = {
      -- Configurações relacionadas ao LSP
      override = {
        -- Substitui as funções padrão do LSP para usar Treesitter na renderização de markdown
        -- Isso melhora a formatação de documentação e hover
        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
        ["vim.lsp.util.stylize_markdown"] = true,
      },
      -- hover = { enabled = false },
      signature = {
        enabled = true,
        auto_open = {
          enabled = true,
          trigger = true,     -- Mostra automaticamente a ajuda de assinatura ao digitar parênteses ou vírgula
          luasnip = true,     -- Mostra assinatura ao pular entre snippets do LuaSnip
          throttle = 50,      -- Delay de 50ms para evitar muitas atualizações
        },
      },
    },
    -- you can enable a preset for easier configuration
    presets = {
      -- Presets são conjuntos de configurações pré-definidas para facilitar o setup
      bottom_search = true,         -- Usa a linha de comando clássica na parte inferior para busca
      command_palette = true,       -- Posiciona a linha de comando e o menu popup juntos
      long_message_to_split = true, -- Mensagens longas são enviadas para um split
      inc_rename = true,           -- Habilita diálogo de input para renomeação incremental
      lsp_doc_border = true,       -- Adiciona borda à documentação flutuante e ajuda de assinatura
    },
    cmdline = {
      -- Configuração da linha de comando
      enabled = true,              -- Habilita a UI personalizada da linha de comando
      view = "cmdline_popup",      -- Usa um popup para a linha de comando ao invés da posição tradicional
    },
    messages = {
      -- NOTE: If you enable messages, then the cmdline is enabled automatically.
      -- This is a current Neovim limitation.
      -- Configuração de como as mensagens são mostradas
      enabled = true,              -- Habilita a UI personalizada de mensagens
      view = "notify",             -- Usa notificações para mensagens padrão
      view_error = "notify",       -- Usa notificações para erros
      view_warn = "notify",        -- Usa notificações para avisos
      view_history = "messages",   -- Visualização para o comando :messages
      view_search = "virtualtext", -- Mostra contagem de busca como texto virtual
    },
    views = {
      -- Personalização da aparência das diferentes views
      cmdline_popup = {
        position = {
          row = "50%",             -- Centralizado verticalmente
          col = "50%",             -- Centralizado horizontalmente
        },
        size = {
          width = 60,              -- Largura fixa do popup
          height = "auto",         -- Altura automática baseada no conteúdo
        },
        border = {
          style = "rounded",       -- Bordas arredondadas
          padding = { 0, 1 },      -- Padding interno
        },
      },
      popupmenu = {
        relative = "editor",       -- Posicionamento relativo ao editor
        position = {
          row = "50%",            -- Centralizado verticalmente
          col = "50%",            -- Centralizado horizontalmente
        },
        size = {
          width = 60,             -- Largura fixa do menu
          height = 10,            -- Altura máxima do menu
        },
        border = {
          style = "rounded",      -- Bordas arredondadas para um visual mais moderno
          padding = { 0, 1 },     -- Padding interno do menu
        },
        win_options = {
          winhighlight = {        -- Cores personalizadas para o menu
            Normal = "Normal",
            FloatBorder = "DiagnosticInfo"
          },
        },
      },
    },
  },
}
