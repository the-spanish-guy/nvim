return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    { "williamboman/mason.nvim", config = true },
    "williamboman/mason-lspconfig.nvim",
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
    require("mason-lspconfig").setup({
      ensure_installed = vim.tbl_keys(require("plugins.lsp.servers")),
    })

    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
    local lspconfig = require("lspconfig")
    local mason_lspconfig = require("mason-lspconfig")
    local icons = require("utils.icons")

    mason_lspconfig.setup_handlers({
      function(server_name)
        lspconfig[server_name].setup({
          capabilities = capabilities,
          on_attach = require("plugins.lsp.on_attach").on_attach,
          settings = require("plugins.lsp.servers")[server_name],
          filetypes = (require("plugins.lsp.servers")[server_name] or {}).filetypes,
        })
      end,
    })

    vim.diagnostic.config({
      title = false,
      underline = true,
      virtual_text = true,
      signs = true,
      update_in_insert = true,
      severity_sort = true,
      float = {
        source = "always",
        style = "minimal",
        border = "rounded",
        header = "",
        prefix = "",
      },
    })

    local signs = {
      Hint = "" .. icons.diagnostics.Hint .. "",
      Error = "" .. icons.diagnostics.Error .. "",
      Warn = "" .. icons.diagnostics.Warning .. "",
      Info = "" .. icons.diagnostics.Information .. "",
    }

    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end

    -- vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
    -- vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
    vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
  end,
}
