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
  ts_ls = {},
  gopls = {},
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
