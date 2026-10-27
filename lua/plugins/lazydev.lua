return {
  "folke/lazydev.nvim",
  ft = "lua",
  opts = {
    library = {
      -- types do luv só quando o arquivo usa vim.uv
      { path = "${3rd}/luv/library", words = { "vim%.uv" } },
      -- snacks usa o global Snacks e anotações ---@type snacks.*, sem require
      { path = "snacks.nvim", words = { "Snacks", "snacks%." } },
    },
  },
}
