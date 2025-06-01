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

      -- Função para verificar se um comando existe no sistema
      local function command_exists(command)
        local handle = io.popen("which " .. command .. " 2>/dev/null")
        if handle then
          local result = handle:read("*a")
          handle:close()
          return result and result:len() > 0
        end
        return false
      end

      -- Lista base de pacotes para instalar
      local ensure_installed = {
        "stylua",
        "prettier",
        "eslint_d",
        "yamlfmt",
        "gofumpt",
      }

      -- Verifica se precisa instalar yamllint
      local yamllint_system = command_exists("yamllint")
      if not yamllint_system then
        table.insert(ensure_installed, "yamllint")
      end

      mason_null_ls.setup({
        ensure_installed = ensure_installed,
        automatic_installation = true,
      })

      -- Configura o yamllint com base na disponibilidade
      local yamllint = null_ls.builtins.diagnostics.yamllint.with({
        -- Se existir no sistema, usa o comando global, senão usa o do Mason
        command = yamllint_system and "yamllint" or vim.fn.expand("$HOME/.local/share/nvim/mason/bin/yamllint"),
        -- Permite versão local apenas se não existir no sistema
        prefer_local = not yamllint_system,
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
          yamllint,
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
