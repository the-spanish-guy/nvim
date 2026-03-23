return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "hrsh7th/cmp-calc",
    "kdheepak/cmp-latex-symbols",
    "ray-x/cmp-sql",

    -- Snippets Engine
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",

    -- Snippets
    "rafamadriz/friendly-snippets",

    -- Adds vscode-like pictograms
    "onsails/lspkind.nvim",

    -- Adds LSP completion capabilities
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-path",
  },

  config = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")

    local kind_icons = {
      Text = "",
      Method = "󰆧",
      Function = "󰊕",
      Constructor = "",
      Field = "󰇽",
      Variable = "󰂡",
      Class = "󰠱",
      Interface = "",
      Module = "",
      Property = "󰜢",
      Unit = "",
      Value = "󰎠",
      Enum = "",
      Keyword = "󰌋",
      Snippet = "",
      Color = "󰏘",
      File = "󰈙",
      Reference = "",
      Folder = "󰉋",
      EnumMember = "",
      Constant = "󰏿",
      Struct = "",
      Event = "",
      Operator = "󰆕",
      TypeParameter = "󰅲",
    }

    require("luasnip.loaders.from_vscode").lazy_load()
    luasnip.config.setup({})

    local base_sources = {
      { name = "nvim_lsp" },
      { name = "luasnip" },
      { name = "path" },
      { name = "calc" },
      { name = "buffer" },
    }

    local base_config = {
      snippet = {
        expand = function(args)
          require("luasnip").lsp_expand(args.body)
        end,
      },
      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },
      completion = {
        completeopt = "menu,menuone,noinsert",
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<CR>"] = cmp.mapping.confirm({
          behavior = cmp.ConfirmBehavior.Replace,
          select = true,
        }),
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expand_or_locally_jumpable() then
            luasnip.expand_or_jump()
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.locally_jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),
      }),
      formatting = {
        format = function(entry, vim_item)
          local lspkind_ok, lspkind = pcall(require, "lspkind")
          if not lspkind_ok then
            vim_item.kind =
              string.format("%s %s", kind_icons[vim_item.kind], vim_item.kind)
            vim_item.menu = ({
              nvim_lsp = "[LSP]",
              luasnip = "[LuaSnip]",
              buffer = "[Buffer]",
              latex_symbols = "[LaTeX]",
              calc = "[Calc]",
              sql = "[SQL]",
            })[entry.source.name]
            return vim_item
          else
            return lspkind.cmp_format()(entry, vim_item)
          end
        end,
      },
      sources = cmp.config.sources(base_sources),
    }

    cmp.setup(base_config)

    -- SQL: adiciona keywords SQL
    cmp.setup.filetype({ "sql", "mysql", "plsql" }, {
      sources = cmp.config.sources(vim.list_extend(
        vim.deepcopy(base_sources),
        { { name = "sql" } }
      )),
    })

    -- LaTeX: adiciona símbolos LaTeX
    cmp.setup.filetype({ "tex", "latex", "plaintex" }, {
      sources = cmp.config.sources(vim.list_extend(
        vim.deepcopy(base_sources),
        { { name = "latex_symbols", option = { strategy = 0 } } }
      )),
    })
  end,
}
