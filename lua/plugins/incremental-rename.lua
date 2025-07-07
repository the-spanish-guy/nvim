return {
  "smjonas/inc-rename.nvim",
  keys = {
    {
      -- "<leader>rn",
      "<F2>",
      function()
        return ":IncRename " .. vim.fn.expand("<cword>")
      end,
      desc = "Incremental rename",
      mode = "n",
      noremap = true,
      expr = true,
    },
  },
  config = true,
  opts = {},
}
