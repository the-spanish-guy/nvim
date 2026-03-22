return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    { "williamboman/mason.nvim", config = true },
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    "b0o/schemastore.nvim",
  },
  config = function()
    require("mason").setup({
      ui = {
        border = "rounded",
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })

    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

    vim.lsp.config("*", {
      capabilities = capabilities,
      on_attach = require("plugins.lsp.on_attach").on_attach,
    })

    for name, config in pairs(require("plugins.lsp.servers")) do
      vim.lsp.config(name, config)
    end

    require("mason-lspconfig").setup({
      ensure_installed = vim.tbl_keys(require("plugins.lsp.servers")),
      automatic_enable = true,
    })

    local tools = require("plugins.lsp.tools")
    local tools_to_install = {}
    for name, _ in pairs(tools.formatters) do
      table.insert(tools_to_install, name)
    end
    for name, _ in pairs(tools.linters) do
      table.insert(tools_to_install, name)
    end

    require("mason-tool-installer").setup({
      ensure_installed = tools_to_install,
      auto_update = false,
      run_on_start = true,
    })

    local icons = require("utils.icons")

    vim.diagnostic.config({
      title = false,
      underline = true,
      virtual_text = true,
      update_in_insert = true,
      severity_sort = true,
      float = {
        source = "always",
        style = "minimal",
        border = "rounded",
        header = "",
        prefix = "",
      },
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = icons.diagnostics.Error,
          [vim.diagnostic.severity.WARN] = icons.diagnostics.Warning,
          [vim.diagnostic.severity.HINT] = icons.diagnostics.Hint,
          [vim.diagnostic.severity.INFO] = icons.diagnostics.Information,
        },
        linehl = {
          [vim.diagnostic.severity.ERROR] = "ErrorMsg",
          [vim.diagnostic.severity.WARN] = "WarningMsg",
          [vim.diagnostic.severity.HINT] = "HintMsg",
          [vim.diagnostic.severity.INFO] = "InformationMsg",
        },
        numhl = {
          [vim.diagnostic.severity.ERROR] = "ErrorMsg",
          [vim.diagnostic.severity.WARN] = "WarningMsg",
          [vim.diagnostic.severity.HINT] = "HintMsg",
          [vim.diagnostic.severity.INFO] = "InformationMsg",
        },
      },
    })

    vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
  end,
}
