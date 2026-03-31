return {
  "saghen/blink.cmp",
  dependencies = {
    "rafamadriz/friendly-snippets",
    { "saghen/blink.compat", opts = {} },
    "hrsh7th/cmp-calc",
    "kdheepak/cmp-latex-symbols",
    "ray-x/cmp-sql",
  },
  version = "*",
  opts = {
    keymap = {
      preset = "default",
      ["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
      ["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
      ["<CR>"] = { "accept", "fallback" },
      ["<C-Space>"] = { "show", "fallback" },
      ["<C-e>"] = { "hide", "fallback" },
      ["<C-b>"] = { "scroll_documentation_up", "fallback" },
      ["<C-f>"] = { "scroll_documentation_down", "fallback" },
    },
    appearance = {
      nerd_font_variant = "mono",
    },
    snippets = {
      preset = "default",
    },
    sources = {
      default = { "lsp", "path", "snippets", "buffer", "calc" },
      per_filetype = {
        sql = { "lsp", "path", "snippets", "buffer", "sql" },
        mysql = { "lsp", "path", "snippets", "buffer", "sql" },
        plsql = { "lsp", "path", "snippets", "buffer", "sql" },
        tex = { "lsp", "path", "snippets", "buffer", "latex_symbols" },
        latex = { "lsp", "path", "snippets", "buffer", "latex_symbols" },
        plaintex = { "lsp", "path", "snippets", "buffer", "latex_symbols" },
      },
      providers = {
        -- Para remover sugestões do buffer, delete "buffer" em `default` acima
        buffer = {
          score_offset = -5, -- empurra buffer abaixo do LSP na lista
          min_keyword_length = 4, -- só sugere palavras com 4+ caracteres digitados
        },
        calc = {
          name = "calc",
          module = "blink.compat.source",
        },
        sql = {
          name = "sql",
          module = "blink.compat.source",
        },
        latex_symbols = {
          name = "latex_symbols",
          module = "blink.compat.source",
          opts = { strategy = 0 },
        },
      },
    },
    completion = {
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 200,
        window = { border = "rounded" },
      },
      menu = {
        border = "rounded",
      },
    },
    signature = {
      enabled = true,
      window = { border = "rounded" },
    },
  },
}
