return {
  formatters = {
    stylua = { filetypes = { "lua" } },
    sql_formatter = { filetypes = { "sql", "mysql", "plsql" }, mason_name = "sql-formatter" },
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
