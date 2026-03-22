return {
  "mfussenegger/nvim-lint",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local lint = require("lint")
    local tools = require("plugins.lsp.tools")

    local eslint_configs = {
      ".eslintrc",
      ".eslintrc.js",
      ".eslintrc.cjs",
      ".eslintrc.json",
      ".eslintrc.yaml",
      ".eslintrc.yml",
      "eslint.config.js",
      "eslint.config.mjs",
    }

    local function has_eslint_config()
      for _, name in ipairs(eslint_configs) do
        if vim.fn.findfile(name, ".;") ~= "" then
          return true
        end
      end
      return false
    end

    -- Detecção yamllint: sistema ou Mason
    local yamllint_cmd = vim.fn.executable("yamllint") == 1
        and "yamllint"
      or vim.fn.expand("$HOME/.local/share/nvim/mason/bin/yamllint")

    lint.linters.yamllint = vim.tbl_deep_extend("force", lint.linters.yamllint, {
      cmd = yamllint_cmd,
    })

    -- Deriva linters_by_ft a partir de tools.lua
    local linters_by_ft = {}
    for name, tool in pairs(tools.linters) do
      for _, ft in ipairs(tool.filetypes) do
        if not linters_by_ft[ft] then
          linters_by_ft[ft] = {}
        end
        table.insert(linters_by_ft[ft], name)
      end
    end
    lint.linters_by_ft = linters_by_ft

    vim.api.nvim_create_autocmd({ "BufWritePost", "InsertLeave", "BufReadPost" }, {
      callback = function()
        local ft = vim.bo.filetype
        local linters = lint.linters_by_ft[ft]
        if not linters then
          return
        end

        -- Filtra eslint_d se não houver config no projeto
        if vim.tbl_contains(linters, "eslint_d") and not has_eslint_config() then
          linters = vim.tbl_filter(function(l)
            return l ~= "eslint_d"
          end, linters)
        end

        if #linters > 0 then
          lint.try_lint(linters)
        end
      end,
    })
  end,
}
