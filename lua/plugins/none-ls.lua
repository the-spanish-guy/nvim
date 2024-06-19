return {
  {
    "nvimtools/none-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "jay-babu/mason-null-ls.nvim",
      "nvim-lua/plenary.nvim",
      "nvimtools/none-ls-extras.nvim",
    },
    config = function()
      local mason_null_ls = require("mason-null-ls")
      local null_ls = require("null-ls")

      local null_ls_utils = require("null-ls.utils")

      mason_null_ls.setup({
        ensure_installed = {
          "stylua",
          "prettier",
          "eslint_d",
          "yamllint",
          "yamlfmt",
          "gofumpt",
        },
        automatic_installation = true,
      })

      null_ls.setup({
        root_dir = null_ls_utils.root_pattern(
          ".null-ls-root",
          "Makefile",
          ".git",
          "package.json"
        ),
        sources = {
          null_ls.builtins.formatting.stylua,
          null_ls.builtins.formatting.prettier,
          null_ls.builtins.formatting.yamlfmt,
          null_ls.builtins.formatting.gofumpt,
          null_ls.builtins.diagnostics.yamllint,
          require("none-ls.diagnostics.eslint_d"),
          null_ls.builtins.code_actions.gitsigns,
          require("none-ls.code_actions.eslint"),
        },
        debug = true,
        temp_dir = "/tmp",
        update_in_insert = true,
      })

      vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})

      -- move config to lsp-config.lua
      -- vim.diagnostic.config({ update_in_insert = true })
    end,
  },
}
