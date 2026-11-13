-- Inlay hints do ts_ls (aparecem com `<leader>ih`). Só o lua_ls, o ts_ls, o
-- gopls e o astro declaram suporte; os demais servidores não enviam hints
local ts_hints = {
  includeInlayParameterNameHints = "literals",
  includeInlayParameterNameHintsWhenArgumentMatchesName = false,
  includeInlayFunctionParameterTypeHints = true,
  includeInlayVariableTypeHints = false,
  includeInlayPropertyDeclarationTypeHints = true,
  includeInlayFunctionLikeReturnTypeHints = true,
  includeInlayEnumMemberValueHints = true,
}

return {
  jsonls = {
    settings = {
      json = {
        schema = require("schemastore").json.schemas(),
        validate = { enable = true },
      },
    },
  },
  lua_ls = {
    settings = {
      Lua = {
        telemetry = { enable = false },
        diagnostics = {
          -- variáveis iniciadas por `_` são descartes intencionais
          unusedLocalExclude = { "_*" },
          -- espaços no fim já são removidos pelo autocmd em autocmds.lua
          disable = { "trailing-space", "incomplete-signature-doc" },
        },
        -- só aparece com os inlay hints ligados (`<leader>ih`)
        hint = { enable = true, setType = false, paramType = true },
        -- runtime e libraries dos plugins são carregados sob demanda pelo
        -- lazydev.nvim (lua/plugins/lazydev.lua)
      },
    },
  },
  bashls = {
    filetypes = { "sh", "zsh" },
  },
  vimls = {
    filetypes = { "vim" },
  },
  ts_ls = {
    settings = {
      typescript = { inlayHints = ts_hints },
      javascript = { inlayHints = ts_hints },
    },
  },
  gopls = {
    settings = {
      gopls = {
        hints = {
          parameterNames = true, -- a:, b: nos argumentos
          compositeLiteralFields = true, -- Nome:, Idade: em P{...}
          constantValues = true,
          functionTypeParameters = true,
          -- tipos de variável (`x := ...` ganharia `int`) poluem demais
          assignVariableTypes = false,
          compositeLiteralTypes = false,
          rangeVariableTypes = false,
        },
      },
    },
  },
  cssls = {},
  tailwindcss = {},
  yamlls = {
    cmd = { "yaml-language-server", "--stdio" },
    filetypes = { "yaml" },
  },
  astro = {
    filetypes = { "astro" },
  },
  biome = {
    root_dir = function(bufnr, on_dir)
      local root = vim.fs.root(bufnr, { "biome.json", "biome.jsonc" })
      if root then
        on_dir(root)
      end
    end,
  },
}
