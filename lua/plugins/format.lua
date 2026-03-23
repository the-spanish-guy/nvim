return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  keys = { { "<leader>gf", mode = { "n", "v" } } },
  config = function()
    local tools = require("plugins.lsp.tools")

    local formatters_by_ft = {}
    for name, tool in pairs(tools.formatters) do
      for _, ft in ipairs(tool.filetypes) do
        if not formatters_by_ft[ft] then
          formatters_by_ft[ft] = {}
        end
        table.insert(formatters_by_ft[ft], name)
      end
    end

    require("conform").setup({ formatters_by_ft = formatters_by_ft })

    vim.keymap.set({ "n", "v" }, "<leader>gf", function()
      require("conform").format({ async = true })
    end, {})
  end,
}
