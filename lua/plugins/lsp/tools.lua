return {
  formatters = {
    stylua = { filetypes = { "lua" } },
    gofumpt = { filetypes = { "go" } },
    yamlfmt = { filetypes = { "yaml" } },
    prettier = {
      filetypes = {
        "javascript",
        "typescript",
        "javascriptreact",
        "typescriptreact",
        "json",
        "jsonc",
        "html",
        "css",
        "markdown",
        "astro",
      },
    },
  },
  linters = {
    eslint_d = {
      filetypes = {
        "javascript",
        "typescript",
        "javascriptreact",
        "typescriptreact",
      },
    },
    yamllint = { filetypes = { "yaml" } },
    biome = { filetypes = {} }, -- roda como LSP, listado apenas para o Mason instalar
  },
}
